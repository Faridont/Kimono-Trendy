import 'package:flutter/material.dart';
import 'package:kiu/providers/wardrobe_provider.dart';
import 'package:kiu/sources/components/app_bar.dart';
import 'package:kiu/sources/components/drawer.dart';
import 'package:kiu/sources/helpers/image_helper.dart';
import 'package:kiu/sources/models/cloth_info.dart';
import 'package:kiu/sources/style_constants.dart';
import 'package:kiu/providers/user_provider.dart';
import 'package:provider/provider.dart';

class WardrobeChild extends StatefulWidget {
  const WardrobeChild({Key? key, required this.category, required this.stringCategory}) : super(key: key);

  final String category;
  final String stringCategory;

  @override
  State<WardrobeChild> createState() => _WardrobeChildState();
}

class _WardrobeChildState extends State<WardrobeChild> {

  void initState() {
    WardrobeProvider initWardrobeProvider = Provider.of(context, listen: false);
    UserProvider initUserProvider = Provider.of(context, listen: false);
    initUserProvider
        .getUserData()
        .whenComplete(() => initWardrobeProvider.getClothesData(initUserProvider.currentUserData.flUserId, widget.category));

    super.initState();
  }

  List<Widget> renderImages(List<ClothInfo> clothInfoList, double screenWidth){
    WardrobeProvider wardrobeProvider = Provider.of<WardrobeProvider>(context);
    List<Widget> imageWidgetList = <Widget>[];
    if(clothInfoList.isNotEmpty) {
      clothInfoList.forEach((cloth) {
        imageWidgetList.add(
            Container(
              margin: StyleConstants.GetMarginBottom(),
              width: screenWidth,
              height: screenWidth,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(cloth.flImageUrl),
                      fit: BoxFit.cover
                  )
              ),
              child: Column(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: StyleConstants.MAIN_COLOR,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(StyleConstants.BORDER_RADIUS_VALUE),
                        )
                    ),
                    child: Text('Удалить', style: StyleConstants.GetContrastButtonTextStyle()),
                    onPressed: () async {
                      await wardrobeProvider.removeCloth(clothInfo: cloth);
                      Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) => WardrobeChild(
                            category: widget.category,
                            stringCategory: widget.stringCategory,
                          ))
                      );
                    },
                  )
                ],
              ),
            )

        );
      });
    } else {
      imageWidgetList.add(
          Container(
            width: double.infinity,
            height: 500,
            alignment: Alignment.center,
            child: Icon(Icons.rowing_outlined,
                color: StyleConstants.CONTRAST_COLOR,
                size: 100,
            ),
          )
      );
    }

    return imageWidgetList;
  }

  @override
  Widget build(BuildContext context) {
    WardrobeProvider wardrobeProvider = Provider.of<WardrobeProvider>(context);
    var clothes = wardrobeProvider.currentClothesData;
    UserProvider userProvider = Provider.of<UserProvider>(context);
    double screenWidth = MediaQuery.of(context).size.width - 10;
    return Scaffold(
        appBar: AppBarComponent.Get(widget.stringCategory),
        drawer: DrawerComponent.Get(context),
        backgroundColor: StyleConstants.MAIN_COLOR,
        body: SingleChildScrollView(
          child: Container(
            padding: StyleConstants.CONTAINER_PADDING,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: renderImages(clothes, screenWidth),
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.large(
          backgroundColor: StyleConstants.CONTRAST_COLOR,
          child: Icon(Icons.add, color: StyleConstants.MAIN_COLOR),
          onPressed: () async {
            var imageUrl = await ImageHelper.UploadAndGetUrl(widget.category);
            await wardrobeProvider.addCloth(
                flUserId: userProvider.currentUserData.flUserId,
                flCategory: widget.category,
                flImageUrl: imageUrl,
                flCreateDate: DateTime.now()
            );
            Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context) => WardrobeChild(
                  category: widget.category,
                  stringCategory: widget.stringCategory,
                ))
            );
          },
        )
    );
  }
}