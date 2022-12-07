import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kiu/sources/helpers/user_helper.dart';

import '../providers/user_provider.dart';

class AuthServise {
  final FirebaseAuth _fAuth = FirebaseAuth.instance;
  Future<void> singInWithEmailAndPassword(UserProvider userProvider, String email, String password) async {
    try {
      UserCredential result = await _fAuth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      if(user != null) {
        userProvider.addUserData(currentUser: user);
        UserHelper.PrintInfoMessage("Вход выполнен успешно");
      }
    } catch(ex) {
      UserHelper.PrintInfoMessage("Не удалось авторизоваться неверный Логин/Пароль");
      print(ex);
    }
  }

  Future<User?> registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _fAuth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return user;
    } catch(ex) {
      print('Auth failed whith exception');
      print(ex);
      return null;
    }
  }

  Future logOut() async {
    await _fAuth.signOut();
    UserHelper.PrintInfoMessage("Выход из профиля");
  }

  Stream<User?> get currentUser  {
    return _fAuth.authStateChanges().map((user) => user);
  }

  bool emailIsValid(String email) {
    var exceptionMessage = "";
    if(email.isEmpty) {
      exceptionMessage = "Поле логин пусто!";
    }

    if(exceptionMessage.isNotEmpty) {
      UserHelper.PrintInfoMessage(exceptionMessage);
      return false;
    } else {
      return true;
    }
  }

  bool passwordIsValid(String password) {
    var exceptionMessage = "";
    if(password.isEmpty) {
      exceptionMessage = "Поле пароль пусто!";
    }

    if(exceptionMessage.isNotEmpty) {
      UserHelper.PrintInfoMessage(exceptionMessage);
      return false;
    } else {
      return true;
    }
  }
}