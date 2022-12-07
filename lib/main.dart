import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kiu/pages/authorization.dart';
import 'package:kiu/pages/profile.dart';
import 'package:kiu/pages/test.dart';
import 'package:kiu/pages/wardrobe.dart';
import 'package:kiu/services/auth.dart';
import 'package:kiu/sources/style_constants.dart';
import 'package:kiu/sources/helpers/image_helper.dart';
import 'package:kiu/pages/loading.dart';
import 'package:kiu/pages/splash_screen.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User?>.value(
      initialData: null,
      value: AuthServise().currentUser,
      child: MaterialApp(
        title: 'KiU Demo',
        home: FirstPage(),
      ),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final User? user = Provider.of<User?>(context);
    return user != null ? Profile() : Authorization();
  }
}



