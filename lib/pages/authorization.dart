import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:kiu/sources/style_constants.dart';
import 'package:kiu/sources/components/drawer.dart';
import 'package:kiu/sources/components/app_bar.dart';
import 'package:input_form_field/input_form_field.dart';

class Authorization extends StatefulWidget {
  const Authorization({Key? key}) : super(key: key);

  @override
  State<Authorization> createState() => _AuthorizationState();
}

class _AuthorizationState extends State<Authorization> {
  final _controller = TextEditingController();
  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    _controller.addListener(_printLatestValue);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    _controller.dispose();
    super.dispose();
  }

  void _printLatestValue() {
    print('Second text field: ${_controller.text}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent.Get('Авторизация'),
      backgroundColor: StyleConstants.PAGE_COLOR,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 300,
              margin: StyleConstants.GetContainerMargin(),
              padding: StyleConstants.CONTAINER_PADDING,
              decoration: StyleConstants.GetContainerBoxDecoration(),
              child: Center(
                child: Column(
                  children: [
                    InputFormField(
                      bottomMargin: StyleConstants.MARGIN_BOTTOM,
                      textEditingController: _controller,
                      style: StyleConstants.GetInputTextStyle(),
                      labelTextStyle: StyleConstants.GetInputTextStyle(),
                      labelText: "Логин",
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
                      textEditingController: _controller,
                      style: StyleConstants.GetInputTextStyle(),
                      labelTextStyle: StyleConstants.GetInputTextStyle(),
                      borderRadius: StyleConstants.GetInputBorderRadius(),
                      borderColor: StyleConstants.ELEMENT_COLOR,
                      labelText: "Пароль",
                      hintText: "*****",
                      password: EnabledPassword(),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      margin: StyleConstants.GetMarginBottom(),
                      child: ElevatedButton(
                        style: StyleConstants.GetButtonStyle(),
                        child: Text('Войти', style: StyleConstants.GetButtonTextStyle()),
                        onPressed: (){
                          DatabaseReference _testRef = FirebaseDatabase.instance.ref().child('test');
                          _testRef.set("Hello world ${Random().nextInt(1000)}");
                        },
                      ),
                    ),
                  ]
                ),
              )
            ),
            Text('KiU', style: StyleConstants.GetMainTextSyle())
          ],
        ),
      ),
      drawer: DrawerComponent.Get(context)
    );
  }
}
