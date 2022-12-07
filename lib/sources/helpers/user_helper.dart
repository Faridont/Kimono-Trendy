import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../pages/profile.dart';
import '../models/user_info.dart';

class UserHelper {
  static void PrintInfoMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  static Future<KUserInfo> GetUserInfo(String userUid) async {
    DocumentReference tbUser = FirebaseFirestore.instance.collection('tbUsers').doc(userUid);
    var snapshot = await tbUser.get();
    if(snapshot.exists) {
      return KUserInfo.fromJson(snapshot.data() as Map<String, dynamic>);
    } else {
      return KUserInfo(
          flUserId: userUid,
          flAvatarSrc: "",
          flFirstName: "",
          flLastName: "",
          flMiddleName: "",
          flGrowth: 0,
          flWeight: 0
      );
    }
  }

  static Future CreateOrUpdateUserData(KUserInfo user, BuildContext context) async {
    final tbUser = FirebaseFirestore.instance.collection('tbUsers').doc(user.flUserId);
    final json = user.toJson();
    await tbUser.set(json);
    UserHelper.PrintInfoMessage("Данные успешно сохранены");
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Profile()));
  }
}