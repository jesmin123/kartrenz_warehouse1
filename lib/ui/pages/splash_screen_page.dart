import 'package:flutter/material.dart';
import 'package:kartenz/constants/colors.dart';
import 'package:kartenz/constants/strings.dart';


class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {

  @override
  void initState() {
    initData();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                    "assets/images/111.png",),
                SizedBox(height: 8,),
                CircularProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation<Color>(PRIMARY_COLOR),
                ),
              ],
            ),
          ),
        )
    );
  }


  void initData() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.pushNamed(context, LOGIN_PAGE);
  }
}
