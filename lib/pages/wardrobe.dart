import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kiu/sources/components/app_bar.dart';
import 'package:kiu/sources/components/drawer.dart';
import 'package:kiu/sources/style_constants.dart';
import 'package:provider/provider.dart';

class Wardrobe extends StatelessWidget {
  const Wardrobe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final User currentUser = Provider.of<User>(context);
    return Scaffold(
      appBar: AppBarComponent.Get('Мой гардероб'),
      drawer: DrawerComponent.Get(context),
      backgroundColor: StyleConstants.PAGE_COLOR,
      body: Container(
        padding: StyleConstants.CONTAINER_PADDING,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 70,
                width: 500,
                decoration: StyleConstants.GetContainerBoxDecoration(),
                margin: StyleConstants.GetMarginBottom(),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Головные уборы", style: StyleConstants.GetInputTextStyle()),
                    ],
                  )
                ),
              ),
              Container(
                height: 70,
                width: 500,
                decoration: StyleConstants.GetContainerBoxDecoration(),
                margin: StyleConstants.GetMarginBottom(),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Футболки", style: StyleConstants.GetInputTextStyle()),
                    ],
                  )
                ),
              ),
              Container(
                height: 70,
                width: 500,
                decoration: StyleConstants.GetContainerBoxDecoration(),
                margin: StyleConstants.GetMarginBottom(),
                child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Брюки", style: StyleConstants.GetInputTextStyle()),
                      ],
                    )
                ),
              ),
              Container(
                height: 70,
                width: 500,
                decoration: StyleConstants.GetContainerBoxDecoration(),
                margin: StyleConstants.GetMarginBottom(),
                child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Обувь", style: StyleConstants.GetInputTextStyle()),
                      ],
                    )
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.large(
        backgroundColor: StyleConstants.PAGE_COLOR,
        child: Icon(Icons.add),
        onPressed: () { },
      ),
    );
  }
}
