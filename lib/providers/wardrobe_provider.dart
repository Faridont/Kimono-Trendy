import 'package:kiu/sources/models/cloth_info.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';


class WardrobeProvider with ChangeNotifier {
  Future<void> addCloth ({
    required String flUserId,
    required String flCategory,
    required String flImageUrl,
    required DateTime flCreateDate
  }) async {
    var clothData = ClothInfo(
        flUserId: flUserId,
        flCategory: flCategory ?? "",
        flImageUrl: flImageUrl ?? "",
        flCreateDate: flCreateDate
    );

    var tbWardrobe = FirebaseFirestore.instance.collection("tbWardrobe");
    await tbWardrobe.add({
      "flUserId" : clothData.flUserId,
      "flCategory" : clothData.flCategory,
      "flImageUrl" : clothData.flImageUrl,
      "flCreateDate" : clothData.flCreateDate
    });

    clothesData.add(clothData);
  }

  Future<void> removeCloth({required ClothInfo clothInfo}) async {
    var tbWardrobe = FirebaseFirestore.instance.collection("tbWardrobe");
    var wardrobeRowsForRemove = await tbWardrobe
        .where("flUserId", isEqualTo: clothInfo.flUserId)
        .where("flCategory", isEqualTo: clothInfo.flCategory)
        .where("flImageUrl", isEqualTo: clothInfo.flImageUrl)
        .where("flCreateDate", isEqualTo: clothInfo.flCreateDate)
        .get();

    wardrobeRowsForRemove.docs.forEach((value) async {
      await tbWardrobe.doc(value.id).delete();
    });

    clothesData.removeWhere((cloth) =>
      cloth.flUserId == clothInfo.flUserId
      && cloth.flCategory == clothInfo.flCategory
      && cloth.flImageUrl == clothInfo.flImageUrl
      && cloth.flCreateDate == clothInfo.flCreateDate
    );
  }

  List<ClothInfo> clothesData = [];

  Future<void> getClothesData(String flUserId, String flCategory) async {
    List<ClothInfo> newList = [];
    var tbWardrobe = FirebaseFirestore.instance.collection("tbWardrobe");
    var wardrobeRows = await tbWardrobe
      .where("flUserId", isEqualTo: flUserId)
      .where("flCategory", isEqualTo: flCategory)
      .get();

    wardrobeRows.docs.forEach((value) {
      newList.add(ClothInfo(
          flUserId: value.get("flUserId"),
          flCategory: value.get("flCategory"),
          flImageUrl: value.get("flImageUrl"),
          flCreateDate: (value.get("flCreateDate") as Timestamp).toDate()
      ));
    });

    clothesData = newList;
    notifyListeners();
  }

  List<ClothInfo> get currentClothesData {
    return clothesData;
  }
}