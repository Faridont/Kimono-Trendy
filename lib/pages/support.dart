import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kiu/providers/user_provider.dart';
import 'package:kiu/sources/components/app_bar.dart';
import 'package:kiu/sources/components/drawer.dart';
import 'package:kiu/sources/style_constants.dart';
import 'package:provider/provider.dart';

class Support extends StatelessWidget {
  const Support({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBarComponent.Get('Поддержка'),
      drawer: DrawerComponent.Get(context),
      backgroundColor: StyleConstants.MAIN_COLOR,
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Container(
                      padding: StyleConstants.CONTAINER_PADDING,
                      child: Text("Сегодня", style: StyleConstants.GetInputTextStyle())
                    ),
                    Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                            padding: StyleConstants.CONTAINER_PADDING,
                            margin: EdgeInsets.only(bottom: 10, right: 10),
                            decoration: StyleConstants.GetContainerBoxDecoration(),
                            width: 300,
                            child: Text("Добрый день! Я Анатолий, сотрудник поддержки команды Kimono Trendy. Чем могу быть полезен?", style: StyleConstants.GetInputTextStyle())
                        )
                    ),
                    Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                            padding: StyleConstants.CONTAINER_PADDING,
                            margin: EdgeInsets.only(bottom: 10, right: 10),
                            child: Text("02:35", style: StyleConstants.GetInputTextStyle())
                        )
                    )
                  ],
                )
              ),
              Expanded(
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                          padding: StyleConstants.CONTAINER_PADDING,
                          margin: EdgeInsets.only(bottom: 10, right: 10, left: 10),
                          decoration: StyleConstants.GetContainerBoxDecoration(),
                          width: 500,
                          child: Text("Сообщение", style: StyleConstants.GetInputTextStyle())
                      )
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
