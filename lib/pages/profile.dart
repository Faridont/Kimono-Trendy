import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kiu/main.dart';
import 'package:kiu/services/auth.dart';
import 'package:kiu/sources/components/app_bar.dart';
import 'package:kiu/sources/components/drawer.dart';
import 'package:kiu/sources/helpers/image_helper.dart';
import 'package:kiu/sources/helpers/user_helper.dart';
import 'package:kiu/sources/models/user_info.dart';
import 'package:kiu/sources/style_constants.dart';
import 'package:input_form_field/input_form_field.dart';
import 'package:provider/provider.dart';

import 'package:kiu/providers/user_provider.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  final _controllerLastName = TextEditingController();
  final _controllerMiddleName = TextEditingController();
  final _controllerFirstName = TextEditingController();
  final _controllerGrowth = TextEditingController();
  final _controllerWeight = TextEditingController();


  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    _controllerLastName.dispose();
    _controllerMiddleName.dispose();
    _controllerFirstName.dispose();
    _controllerGrowth.dispose();
    _controllerWeight.dispose();
    super.dispose();
  }

  void pickUploadImage() async {
    final image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 512,
      maxHeight: 512,
      imageQuality: 75
    );

    Reference ref = FirebaseStorage.instance.ref().child("profile_pic.jpg");
    await ref.putFile(File(image!.path));
    ref.getDownloadURL().then((value) => {
    });
  }

  InputFormField getInput(String labelText, TextEditingController controller){
    return InputFormField(
      bottomMargin: StyleConstants.MARGIN_BOTTOM,
      textEditingController: controller,
      style: StyleConstants.GetInputTextStyle(),
      labelTextStyle: StyleConstants.GetInputTextStyle(),
      labelText: labelText,
      borderRadius: StyleConstants.GetInputBorderRadius(),
      borderColor: StyleConstants.ELEMENT_COLOR,
      errorPadding: EdgeInsets.only(left: 10, top: 10),
    );
  }

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    userProvider.getUserData();

    if(userProvider.currentUserData == null){
      return Center(child: CircularProgressIndicator());
    }

    String avatarImageUrl = "";
    avatarImageUrl = userProvider.currentUserData.flAvatarSrc;
    _controllerFirstName.text = userProvider.currentUserData.flFirstName;
    _controllerLastName.text = userProvider.currentUserData.flLastName;
    _controllerMiddleName.text = userProvider.currentUserData.flMiddleName;
    _controllerGrowth.text = userProvider.currentUserData.flGrowth.toString();
    _controllerWeight.text = userProvider.currentUserData.flWeight.toString();

    return Scaffold(
      appBar: AppBarComponent.Get('Мой профиль'),
      drawer: DrawerComponent.Get(context),
      backgroundColor: StyleConstants.PAGE_COLOR,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: StyleConstants.CONTAINER_PADDING,
                child: CircleAvatar(
                  radius: 80.0,
                  backgroundColor: const Color(0xFF778899),
                  backgroundImage: avatarImageUrl.isEmpty
                      ? AssetImage(ImageHelper.AVATAR_PATH) as ImageProvider
                      : Image.network(avatarImageUrl).image,
                ),
              ),
              Container(
                  child: ElevatedButton(
                    style: StyleConstants.GetButtonStyle(),
                    child: Text('Изменить', style: StyleConstants.GetButtonTextStyle()),
                    onPressed: () async {
                      ImagePicker imagePicker = ImagePicker();
                      XFile? file = await imagePicker.pickImage(source: ImageSource.camera);
                      var filePath = file!.path;
                      if(file == null) return;
                      var uniqueFileName = DateTime.now().microsecondsSinceEpoch.toString();
                      Reference ref = FirebaseStorage.instance.ref();
                      Reference refDir = ref.child('avatars');
                      Reference refImageToUpload = refDir.child(uniqueFileName);

                      try {
                        await refImageToUpload.putFile(File(file!.path));
                        avatarImageUrl = await refImageToUpload.getDownloadURL();
                        final user = KUserInfo(
                            flUserId: userProvider.currentUserData!.flUserId,
                            flAvatarSrc: avatarImageUrl,
                            flFirstName: _controllerFirstName.text.trim(),
                            flLastName: _controllerLastName.text.trim(),
                            flMiddleName: _controllerMiddleName.text.trim(),
                            flGrowth: int.parse(_controllerGrowth.text.trim()),
                            flWeight: int.parse(_controllerWeight.text.trim())
                        );

                        userProvider.updateUserData(userInfo: user);
                      } catch(ex) {
                        UserHelper.PrintInfoMessage("При добавлении файла произошла ошибка!");
                      }
                    },
                  )
              ),
              Container(
                padding: StyleConstants.CONTAINER_PADDING,
                child: Center(
                  child: Column(
                    children: [
                      getInput("Фамилия", _controllerLastName),
                      getInput("Имя", _controllerFirstName),
                      getInput("Отчество", _controllerMiddleName),
                      getInput("Рост", _controllerGrowth),
                      getInput("Вес", _controllerWeight),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                              style: StyleConstants.GetButtonStyle(),
                              child: Text('Сохранить', style: StyleConstants.GetButtonTextStyle()),
                              onPressed: () async {
                                final user = KUserInfo(
                                    flUserId: userProvider.currentUserData!.flUserId,
                                    flAvatarSrc: avatarImageUrl,
                                    flFirstName: _controllerFirstName.text.trim(),
                                    flLastName: _controllerLastName.text.trim(),
                                    flMiddleName: _controllerMiddleName.text.trim(),
                                    flGrowth: int.parse(_controllerGrowth.text.trim()),
                                    flWeight: int.parse(_controllerWeight.text.trim())
                                );

                                userProvider.updateUserData(userInfo: user);
                              },
                            ),
                            ElevatedButton(
                              style: StyleConstants.GetButtonStyle(),
                              child: Text('Выйти из профиля', style: StyleConstants.GetButtonTextStyle()),
                              onPressed: (){
                                AuthServise().logOut();
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => FirstPage()));
                              },
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
