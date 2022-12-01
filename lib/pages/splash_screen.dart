import 'package:flutter/material.dart';
import 'package:kiu/pages/authorization.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }
  
  _navigatetohome() async {
    await Future.delayed(Duration(milliseconds: 3000), (){});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Authorization()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(height: 100, width: 100, color: Colors.blue),
            Container(
              child: Text(
                'Splash screen',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold
                )
              ),
            ),
          ],
        ),
      )
    );
  }
}
