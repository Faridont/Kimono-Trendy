import 'package:flutter/material.dart';
import 'package:kiu/sources/components/app_bar.dart';
import 'package:kiu/sources/components/drawer.dart';
import 'package:kiu/sources/style_constants.dart';

class CollectImage extends StatelessWidget {
  const CollectImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent.Get('Собрать образ'),
      drawer: DrawerComponent.Get(context),
      backgroundColor: StyleConstants.PAGE_COLOR,
      body: Container(
        padding: StyleConstants.CONTAINER_PADDING,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    margin: StyleConstants.GetMarginBottom(),
                    width: 180,
                    child: ElevatedButton(
                      style: StyleConstants.GetButtonStyle(),
                      child: Text('День', style: StyleConstants.GetButtonTextStyle()),
                      onPressed: () {},
                    ),
                  ),
                  Spacer(),
                  Container(
                    margin: StyleConstants.GetMarginBottom(),
                    width: 180,
                    child: ElevatedButton(
                      style: StyleConstants.GetButtonStyle(),
                      child: Text('Вечер', style: StyleConstants.GetButtonTextStyle()),
                      onPressed: () {},
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: StyleConstants.GetMarginBottom(),
                    width: 180,
                    child: ElevatedButton(
                      style: StyleConstants.GetButtonStyle(),
                      child: Text('Мой гардероб', style: StyleConstants.GetButtonTextStyle()),
                      onPressed: () {},
                    ),
                  ),
                  Spacer(),
                  Container(
                    margin: StyleConstants.GetMarginBottom(),
                    width: 180,
                    child: ElevatedButton(
                      style: StyleConstants.GetButtonStyle(),
                      child: Text('Онлайн образ', style: StyleConstants.GetButtonTextStyle()),
                      onPressed: () {},
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: StyleConstants.GetMarginBottom(),
                    decoration: StyleConstants.GetContainerBoxDecoration(),
                    height: 180,
                    width: 180,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Лето", style: StyleConstants.GetInputTextStyle()),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    margin: StyleConstants.GetMarginBottom(),
                    decoration: StyleConstants.GetContainerBoxDecoration(),
                    height: 180,
                    width: 180,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Весна", style: StyleConstants.GetInputTextStyle()),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: StyleConstants.GetMarginBottom(),
                    decoration: StyleConstants.GetContainerBoxDecoration(),
                    height: 180,
                    width: 180,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Зима", style: StyleConstants.GetInputTextStyle()),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    margin: StyleConstants.GetMarginBottom(),
                    decoration: StyleConstants.GetContainerBoxDecoration(),
                    height: 180,
                    width: 180,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Осень", style: StyleConstants.GetInputTextStyle()),
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
