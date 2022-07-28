import 'dart:ffi';
import 'dart:ui' show Color, Offset;
import 'package:flutter/material.dart';
import 'package:flutter_windows_simlutor/Widget/Start_Menu.dart';
import 'package:flutter_windows_simlutor/Widget/TaskBar_Icon.dart';
import 'package:phlox_animations/phlox_animations.dart';
import 'package:flutter_windows_simlutor/Widget/Windows_Form.dart';

class Screen_Desktop extends StatefulWidget {
  const Screen_Desktop({Key? key}) : super(key: key);

  @override
  State<Screen_Desktop> createState() => _Screen_DesktopState();
}

class _Screen_DesktopState extends State<Screen_Desktop> {
  bool Windows_Start_Show = false;

  PhloxAnimationsController Start_Menu_Animation_Controller =
      PhloxAnimationsController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            InkWell(
              mouseCursor: MouseCursor.defer,
              onTap: () {
                setState(() {
                  Start_Menu_Animation_Controller.forward();
                });
              },
              child: Container(
                child: Stack(
                  alignment: Alignment.topLeft,
                  children: [
                  ],
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('Assets/Images/Windows.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            //Windows(),

            Start_Menu(
              Start_Menu_Animation_Controller: Start_Menu_Animation_Controller,
            ),

            Positioned(
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xff1F2223),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(0.0, 0.1), //(x,y)
                      blurRadius: 10.1,
                    ),
                  ],
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TaskBar_Icon(
                        ToolTip_Message: 'Start',
                        onTap: () {
                          setState(() {
                            if (Start_Menu_Animation_Controller
                                        .animationStatus ==
                                    AnimationStatus.dismissed ||
                                Start_Menu_Animation_Controller
                                        .animationStatus ==
                                    AnimationStatus.reverse) {
                              Start_Menu_Animation_Controller.forward();
                            } else if (Start_Menu_Animation_Controller
                                        .animationStatus ==
                                    AnimationStatus.completed ||
                                Start_Menu_Animation_Controller
                                        .animationStatus ==
                                    AnimationStatus.forward) {
                              Start_Menu_Animation_Controller.reverse();
                            }
                          });
                        },
                        Image_Path: 'Assets/Images/Windows_Icon.png',
                      ),
                      TaskBar_Icon(
                        ToolTip_Message: 'Hello',
                        onTap: () {},
                        Image_Path: 'Assets/Images/Windows_Search_Bar.png',
                      ),
                    ],
                  ),
                ),
                width: double.infinity,
                height: 50,
              ),
            )
          ],
        ),
      ),
    );
  }
}
