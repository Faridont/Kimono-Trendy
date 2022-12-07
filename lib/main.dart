import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kiu/pages/authorization.dart';
import 'package:kiu/pages/profile.dart';
import 'package:kiu/providers/user_provider.dart';
import 'package:kiu/sources/helpers/image_helper.dart';
import 'package:kiu/sources/style_constants.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<UserProvider>(
            create: (_) => UserProvider(),
          ),
        ],
        builder: (context, child) {
          return MyApp();
          //return MyApp(context.watch<UserProvider>().toString());
        }
      )
  );
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapShot) {
            if (snapShot.hasData) {
              return Profile();
            }
            return Authorization();
          },
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



