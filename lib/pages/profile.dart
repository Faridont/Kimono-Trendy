import 'package:flutter/material.dart';
import 'package:kiu/sources/components/app_bar.dart';
import 'package:kiu/sources/components/drawer.dart';
import 'package:kiu/sources/helpers/image_helper.dart';
import 'package:kiu/sources/style_constants.dart';
import 'package:input_form_field/input_form_field.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _controllerFam = TextEditingController(text: "Ахметова");
  final _controllerName = TextEditingController(text: "Ботагоз");
  final _controllerFirstName = TextEditingController(text: "Куатовна");
  final _controllerHeight = TextEditingController(text: "167 см");
  final _controllerWeight = TextEditingController(text: "53 кг");


  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    _controllerFam.dispose();
    _controllerName.dispose();
    _controllerFirstName.dispose();
    _controllerHeight.dispose();
    _controllerWeight.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                child: CircleAvatar(
                  radius: 100.0,
                  backgroundColor: const Color(0xFF778899),
                  backgroundImage: AssetImage(ImageHelper.BOTA_AVATAR_PATH) as ImageProvider,
                ),
                margin: StyleConstants.GetMarginBottom(),
              ),
              Container(
                padding: StyleConstants.CONTAINER_PADDING,
                child: Center(
                  child: Column(
                    children: [
                      InputFormField(
                        bottomMargin: StyleConstants.MARGIN_BOTTOM,
                        textEditingController: _controllerFam,
                        style: StyleConstants.GetInputTextStyle(),
                        labelTextStyle: StyleConstants.GetInputTextStyle(),
                        labelText: "Фамилия",
                        borderRadius: StyleConstants.GetInputBorderRadius(),
                        borderColor: StyleConstants.ELEMENT_COLOR,
                        errorPadding: EdgeInsets.only(left: 10, top: 10),
                        validator: (v) {
                          if(v != null && v.isEmpty) {
                            return "Required";
                          }
                        },
                      ),
                      InputFormField(
                        bottomMargin: StyleConstants.MARGIN_BOTTOM,
                        textEditingController: _controllerName,
                        style: StyleConstants.GetInputTextStyle(),
                        labelTextStyle: StyleConstants.GetInputTextStyle(),
                        labelText: "Имя",
                        borderRadius: StyleConstants.GetInputBorderRadius(),
                        borderColor: StyleConstants.ELEMENT_COLOR,
                        errorPadding: EdgeInsets.only(left: 10, top: 10),
                        validator: (v) {
                          if(v != null && v.isEmpty) {
                            return "Required";
                          }
                        },
                      ),
                      InputFormField(
                        bottomMargin: StyleConstants.MARGIN_BOTTOM,
                        textEditingController: _controllerFirstName,
                        style: StyleConstants.GetInputTextStyle(),
                        labelTextStyle: StyleConstants.GetInputTextStyle(),
                        labelText: "Фамилия",

                        borderRadius: StyleConstants.GetInputBorderRadius(),
                        borderColor: StyleConstants.ELEMENT_COLOR,
                        errorPadding: EdgeInsets.only(left: 10, top: 10),
                        validator: (v) {
                          if(v != null && v.isEmpty) {
                            return "Required";
                          }
                        },
                      ),
                      InputFormField(
                        bottomMargin: StyleConstants.MARGIN_BOTTOM,
                        textEditingController: _controllerHeight,
                        style: StyleConstants.GetInputTextStyle(),
                        labelTextStyle: StyleConstants.GetInputTextStyle(),
                        labelText: "Рост",

                        borderRadius: StyleConstants.GetInputBorderRadius(),
                        borderColor: StyleConstants.ELEMENT_COLOR,
                        errorPadding: EdgeInsets.only(left: 10, top: 10),
                        validator: (v) {
                          if(v != null && v.isEmpty) {
                            return "Required";
                          }
                        },
                      ),
                      InputFormField(
                        bottomMargin: StyleConstants.MARGIN_BOTTOM,
                        textEditingController: _controllerWeight,
                        style: StyleConstants.GetInputTextStyle(),
                        labelTextStyle: StyleConstants.GetInputTextStyle(),
                        labelText: "Вес",

                        borderRadius: StyleConstants.GetInputBorderRadius(),
                        borderColor: StyleConstants.ELEMENT_COLOR,
                        errorPadding: EdgeInsets.only(left: 10, top: 10),
                        validator: (v) {
                          if(v != null && v.isEmpty) {
                            return "Required";
                          }
                        },
                      ),
                      Container(
                        margin: StyleConstants.GetMarginBottom(),
                        child: ElevatedButton(
                          style: StyleConstants.GetButtonStyle(),
                          child: Text('Изменить', style: StyleConstants.GetButtonTextStyle()),
                          onPressed: () {},
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
