import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:kiu/pages/authorization.dart';
import 'package:kiu/pages/test.dart';
import 'package:kiu/sources/style_constants.dart';
import 'package:kiu/sources/helpers/image_helper.dart';
import 'package:kiu/pages/loading.dart';
import 'package:kiu/pages/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _fbApp = Firebase.initializeApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KiU Demo',
      home: FutureBuilder(
        future: _fbApp,
        builder: (context, snapshot) {
          if(snapshot.hasError){
            print('You have an error! ${snapshot.error.toString()}');
            return Center(child: Text('Something went wrong'));
          } else if(snapshot.hasData){
            return AnimatedSplashScreen(
              duration: 50,
              splash: ImageHelper.MAIN_LOGO_PATH,
              splashTransition: SplashTransition.sizeTransition,
              backgroundColor: StyleConstants.PAGE_COLOR,
              nextScreen: Authorization()//MyCustomForm()//Authorization()//MyHomePage(title: 'Test'),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      //initialRoute: '/',
      //routes: {
      //  '/': (context) => AnimatedSplashScreen(
      //    duration: 50,
      //    splash: ImageHelper.MAIN_LOGO_PATH,
      //    splashTransition: SplashTransition.sizeTransition,
      //    backgroundColor: StyleConstants.PAGE_COLOR,
      //    nextScreen: Authorization()//MyCustomForm()//Authorization()//MyHomePage(title: 'Test'),
      //  ),//Loading(),
      //},
    );
  }
}


