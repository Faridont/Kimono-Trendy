import 'package:flutter/material.dart';
import 'package:kiu/pages/wardrobe_child.dart';
import 'package:kiu/providers/user_provider.dart';
import 'package:kiu/sources/components/app_bar.dart';
import 'package:kiu/sources/components/drawer.dart';
import 'package:kiu/sources/style_constants.dart';
import 'package:provider/provider.dart';

class Wardrobe extends StatelessWidget {
  const Wardrobe({Key? key}) : super(key: key);
  final String hatsStringCategory = "Головные уборы";
  final String hatsCategory = "Hats";

  final String tshirtsStringCategory = "Футболки";
  final String tshirtsCategory = "T-Shirts";

  final String pantsStringCategory = "Брюки";
  final String pantsCategory = "Pants";

  final String shoesStringCategory = "Обувь";
  final String shoesCategory = "Shoes";

  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBarComponent.Get('Мой гардероб'),
      drawer: DrawerComponent.Get(context),
      backgroundColor: StyleConstants.MAIN_COLOR,
      body: Container(
        padding: StyleConstants.CONTAINER_PADDING,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) => WardrobeChild(
                        category: hatsCategory,
                        stringCategory: hatsStringCategory,
                      ))
                  );
                },
                child: Container(
                  height: 70,
                  width: 500,
                  decoration: StyleConstants.GetContainerBoxDecoration(),
                  margin: StyleConstants.GetMarginBottom(),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(hatsStringCategory, style: StyleConstants.GetInputTextStyle()),
                      ],
                    )
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) => WardrobeChild(
                        category: tshirtsCategory,
                        stringCategory: tshirtsStringCategory,
                      ))
                  );
                },
                child: Container(
                  height: 70,
                  width: 500,
                  decoration: StyleConstants.GetContainerBoxDecoration(),
                  margin: StyleConstants.GetMarginBottom(),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(tshirtsStringCategory, style: StyleConstants.GetInputTextStyle()),
                      ],
                    )
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) => WardrobeChild(
                        category: pantsCategory,
                        stringCategory: pantsStringCategory,
                      ))
                  );
                },
                child: Container(
                  height: 70,
                  width: 500,
                  decoration: StyleConstants.GetContainerBoxDecoration(),
                  margin: StyleConstants.GetMarginBottom(),
                  child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(pantsStringCategory, style: StyleConstants.GetInputTextStyle()),
                        ],
                      )
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) => WardrobeChild(
                        category: shoesCategory,
                        stringCategory: shoesStringCategory,
                      ))
                  );
                },
                child: Container(
                  height: 70,
                  width: 500,
                  decoration: StyleConstants.GetContainerBoxDecoration(),
                  margin: StyleConstants.GetMarginBottom(),
                  child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(shoesStringCategory, style: StyleConstants.GetInputTextStyle()),
                        ],
                      )
                  ),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
