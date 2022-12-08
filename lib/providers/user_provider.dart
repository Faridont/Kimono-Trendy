import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:kiu/sources/helpers/user_helper.dart';
import '../sources/models/user_info.dart';

class UserProvider with ChangeNotifier {
  void addUserData({
    required User currentUser,
    String? flAvatarSrc,
    String? flFirstName,
    String? flLastName,
    String? flMiddleName,
    int? flGrowth,
    int? flWeight
  }) async {
    await FirebaseFirestore.instance
        .collection("tbUsers")
        .doc(currentUser.uid)
        .set({
          "flUserId" : currentUser!.uid,
          "flAvatarSrc" : flAvatarSrc ?? "",
          "flFirstName" : flFirstName ?? "",
          "flLastName" : flLastName ?? "",
          "flMiddleName" : flMiddleName ?? "",
          "flGrowth" : flGrowth ?? 0,
          "flWeight" : flWeight ?? 0
        });
  }

  Future<void> updateUserData({required KUserInfo userInfo}) async {
    await FirebaseFirestore.instance
        .collection("tbUsers")
        .doc(userInfo.flUserId)
        .set({
          "flUserId" : userInfo.flUserId,
          "flAvatarSrc" : userInfo.flAvatarSrc,
          "flFirstName" : userInfo.flFirstName,
          "flLastName" : userInfo.flLastName,
          "flMiddleName" : userInfo.flMiddleName,
          "flGrowth" : userInfo.flGrowth,
          "flWeight" : userInfo.flWeight
        });
  }

  late KUserInfo currentData;

  Future<void> getUserData() async {
    KUserInfo userModel;
    var value = await FirebaseFirestore.instance
        .collection("tbUsers")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    if (value.exists) {
      userModel = KUserInfo(
        flUserId: value.get("flUserId"),
        flAvatarSrc: value.get("flAvatarSrc"),
        flFirstName: value.get("flFirstName"),
        flLastName: value.get("flLastName"),
        flMiddleName: value.get("flMiddleName"),
        flGrowth: value.get("flGrowth"),
        flWeight: value.get("flWeight")
      );
      currentData = userModel;
      notifyListeners();
    }
  }

  KUserInfo get currentUserData {
    return currentData;
  }
}
