import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kiu/sources/helpers/user_helper.dart';
import 'package:kiu/sources/style_constants.dart';

class ImageHelper {
  static const String imagesPath = 'assets/images/';
  static const String MAIN_LOGO_PATH = imagesPath + 'logo_kiu.png';
  static const String AVATAR_PATH = imagesPath + 'default_avatar.png';
  static const String BOTA_AVATAR_PATH = imagesPath + 'Bota_avatar.jpeg';
  static const String TEST_PATH = imagesPath + 'me.jpg';
  static Image GetAvatarImage(){
    return Image.asset(TEST_PATH, width: 200, height: 150);
  }

  static Future<String> UploadAndGetUrl(String source) async {
    ImagePicker imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);
    var uniqueFileName = DateTime.now().microsecondsSinceEpoch.toString();
    Reference ref = FirebaseStorage.instance.ref();
    Reference refDir = ref.child(source);
    Reference refImageToUpload = refDir.child(uniqueFileName);
    try {
      await refImageToUpload.putFile(File(file!.path));
      return await refImageToUpload.getDownloadURL();
    } catch(ex) {
      UserHelper.PrintInfoMessage("При добавлении файла произошла ошибка!");
      throw ex;
    }
  }
}