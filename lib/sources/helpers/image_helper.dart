import 'package:flutter/material.dart';
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
}