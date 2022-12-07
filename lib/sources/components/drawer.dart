import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kiu/providers/user_provider.dart';
import 'package:kiu/sources/style_constants.dart';
import 'package:kiu/pages/profile.dart';
import 'package:kiu/pages/wardrobe.dart';
import 'package:kiu/pages/collect_image.dart';
import 'package:kiu/pages/support.dart';
import 'package:kiu/sources/helpers/image_helper.dart';
import 'package:provider/provider.dart';

class DrawerComponent {
  static Drawer Get(BuildContext context) {
    final UserProvider currentUser = Provider.of<UserProvider>(context);
    final avatarImageUrl = "";
    return Drawer(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
        topRight: Radius.circular(StyleConstants.BORDER_RADIUS_VALUE),
        bottomRight: Radius.circular(StyleConstants.BORDER_RADIUS_VALUE)),
      ),
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader( // <-- SEE HERE
            decoration: BoxDecoration(color: StyleConstants.MENU_COLOR),
            currentAccountPicture: CircleAvatar(
              radius: 60.0,
              backgroundColor: Color(0xFF778899),
              backgroundImage: avatarImageUrl.isEmpty
                  ? AssetImage(ImageHelper.AVATAR_PATH) as ImageProvider
                  : Image.network(avatarImageUrl).image,
            ),
            accountName: Text("Akhmetova Bota", style: StyleConstants.GetBoldTextStyle()),
            accountEmail: Text("bota.abk@gmail.com", style: StyleConstants.GetBoldTextStyle())
          ),
          ListTile(
            title: Text('Мой профиль'),
            trailing: Icon(Icons.account_circle_outlined),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Profile()));
            },
          ),
          ListTile(
            trailing: Icon(Icons.accessibility_new_outlined),
            title: Text('Мой гардероб'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => Wardrobe()));
            },
          ),
          ListTile(
            title: Text('Собрать образ'),
            trailing: Icon(Icons.collections_bookmark_outlined),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => CollectImage()));
            },
          ),
          ListTile(
            title: Text('Поддержка'),
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