import 'package:flutter/material.dart';
import 'package:kiu/sources/style_constants.dart';
import 'package:kiu/pages/profile.dart';
import 'package:kiu/pages/wardrobe.dart';
import 'package:kiu/pages/collect_image.dart';
import 'package:kiu/pages/support.dart';
import 'package:kiu/sources/helpers/image_helper.dart';

class DrawerComponent {
  static Drawer Get(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
        topRight: Radius.circular(StyleConstants.BORDER_RADIUS_VALUE),
        bottomRight: Radius.circular(StyleConstants.BORDER_RADIUS_VALUE)),
      ),
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader( // <-- SEE HERE
            decoration: BoxDecoration(color: StyleConstants.MENU_COLOR),
            accountName: Text(
              "Akhmetova Bota",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            accountEmail: Text(
              "bota.abk@gmail.com",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            currentAccountPicture: CircleAvatar(
              radius: 60.0,
              backgroundColor: const Color(0xFF778899),
              backgroundImage: AssetImage(ImageHelper.BOTA_AVATAR_PATH) as ImageProvider,
            ),
          ),
          ListTile(
            title: const Text('Мой профиль'),
            trailing: Icon(Icons.account_circle_outlined),
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Profile()));
            },
          ),
          ListTile(
            trailing: Icon(Icons.accessibility_new_outlined),
            title: const Text('Мой гардероб'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => Wardrobe()));
            },
          ),
          ListTile(
            title: const Text('Собрать образ'),
            trailing: Icon(Icons.collections_bookmark_outlined),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => CollectImage()));
            },
          ),
          ListTile(
            title: const Text('Поддержка'),
            trailing: Icon(Icons.rowing_outlined),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => Support()));
            },
          ),
        ],
      ),
    );
  }
}