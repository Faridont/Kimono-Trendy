import 'dart:math';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kiu/main.dart';
import 'package:kiu/pages/registration.dart';
import 'package:kiu/services/auth.dart';
import 'package:kiu/sources/helpers/user_helper.dart';
import 'package:kiu/sources/style_constants.dart';
import 'package:input_form_field/input_form_field.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../providers/user_provider.dart';

class Authorization extends StatefulWidget {
  const Authorization({Key? key}) : super(key: key);

  @override
  State<Authorization> createState() => _AuthorizationState();
}

class _AuthorizationState extends State<Authorization> {
  late UserProvider userProvider;
  AuthServise _authServise = AuthServise();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void signInButtonClick() async {
    var email = emailController.text.trim();
    var password = passwordController.text.trim();

    if(!_authServise.emailIsValid(email) || !_authServise.passwordIsValid(password)) {
      return;
    }

    await _authServise.singInWithEmailAndPassword(userProvider, email, password);
    emailController.clear();
    passwordController.clear();
    UserHelper.PrintInfoMessage("Вход выполнен успешно");
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => FirstPage()));
  }

  @override
  Widget build(BuildContext context) {
    userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      backgroundColor: StyleConstants.PAGE_COLOR,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: StyleConstants.GetMarginBottom(),
                child: Text('Авторизация',style: StyleConstants.GetInputTextStyle())
              ),
              Container(
                margin: StyleConstants.GetContainerMargin(),
                padding: StyleConstants.CONTAINER_PADDING,
                decoration: StyleConstants.GetContainerBoxDecoration(),
                child: Center(
                  child: Column(
                      children: [
                        InputFormField(
                          bottomMargin: StyleConstants.MARGIN_BOTTOM,
                          textEditingController: emailController,
                          style: StyleConstants.GetInputTextStyle(),
                          labelTextStyle: StyleConstants.GetInputTextStyle(),
                          labelText: "Логин",
                          borderRadius: StyleConstants.GetInputBorderRadius(),
                          borderColor: StyleConstants.ELEMENT_COLOR,
                          errorPadding: EdgeInsets.only(left: 10, top: 10)
                        ),
                        InputFormField(
                          bottomMargin: StyleConstants.MARGIN_BOTTOM,
                          textEditingController: passwordController,
                          style: StyleConstants.GetInputTextStyle(),
                          labelTextStyle: StyleConstants.GetInputTextStyle(),
                          borderRadius: StyleConstants.GetInputBorderRadius(),
                          borderColor: StyleConstants.ELEMENT_COLOR,
                          labelText: "Пароль",
                          hintText: "*****",
                          password: EnabledPassword(),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                style: StyleConstants.GetButtonStyle(),
                                child: Text('Регистрация', style: StyleConstants.GetButtonTextStyle()),
                                onPressed: (){
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Registration()));
                                },
                              ),
                              ElevatedButton(
                                style: StyleConstants.GetButtonStyle(),
                                child: Text('Войти', style: StyleConstants.GetButtonTextStyle()),
                                onPressed: signInButtonClick,
                              )
                            ],
                          ),
                        ),
                      ]
                  )
                ),
              ),
              Text('KiU', style: StyleConstants.GetMainTextSyle())
            ],
          ),
        ),
      )
    );
  }
}
