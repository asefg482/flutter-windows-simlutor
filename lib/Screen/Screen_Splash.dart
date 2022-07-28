import 'dart:math';

import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class Screen_Splash extends StatefulWidget {
  const Screen_Splash({Key? key}) : super(key: key);

  @override
  State<Screen_Splash> createState() => _Screen_SplashState();
}

class _Screen_SplashState extends State<Screen_Splash> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Load_Windows_Page();
  }

  void Load_Windows_Page() {
    Future.delayed(
      Duration(seconds: (Random().nextInt(3)+2)),
      (){
        Navigator.popAndPushNamed(context, '/desktop');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Image.asset('Assets/Images/Windows_Icon.png'),
              SizedBox(
                height: 80,
              ),
              SizedBox(
                height: 60,
                width: 60,
                child: LoadingIndicator(
                  indicatorType: Indicator.ballRotateChase,
                  colors: [Colors.white],
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Text(
                'Loading Windows . . .',
                style: TextStyle(color: Colors.white, fontSize: 26),
              ),
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Text(
                    'Created By Asef Ghorbani',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
