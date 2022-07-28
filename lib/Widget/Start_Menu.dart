import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:phlox_animations/phlox_animations.dart';

class Start_Menu extends StatefulWidget {
  Start_Menu({
    Key? key,
    this.Start_Menu_Animation_Controller,
  }) : super(key: key);

  PhloxAnimationsController? Start_Menu_Animation_Controller =
      PhloxAnimationsController();

  @override
  State<Start_Menu> createState() => _Start_MenuState();
}

class _Start_MenuState extends State<Start_Menu> {
  PhloxAnimationsController? Start_Menu_Animation_Controller =
      PhloxAnimationsController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Start_Menu_Animation_Controller = widget.Start_Menu_Animation_Controller;
  }

  void Change_Start() {
    setState(() {
      if (Start_Menu_Animation_Controller!.animationStatus ==
              AnimationStatus.dismissed ||
          Start_Menu_Animation_Controller!.animationStatus ==
              AnimationStatus.reverse) {
        Start_Menu_Animation_Controller!.forward();
      } else if (Start_Menu_Animation_Controller!.animationStatus ==
              AnimationStatus.completed ||
          Start_Menu_Animation_Controller!.animationStatus ==
              AnimationStatus.forward) {
        Start_Menu_Animation_Controller!.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return PhloxAnimations(
      controller: Start_Menu_Animation_Controller,
      duration: Duration(milliseconds: 100),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaY: 10, sigmaX: 10),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10
            ),
            width: 640,
            height: 700,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              border: Border.all(color: Colors.white, width: 0.1),
              color: Color.fromRGBO(39, 44, 47, 0.910),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 30,
                    right: 30,
                    left: 30,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(6),
                      topLeft: Radius.circular(6),
                    ),
                    child: Container(
                      height: 35,
                      decoration: BoxDecoration(
                        border: Border.fromBorderSide(
                          BorderSide(width: 0.1, color: Colors.grey),
                        ),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          // labelStyle: TextStyle(
                          //   height: 100,
                          //   ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blue,
                              width: 1,
                            ),
                          ),
                          prefixIcon: Icon(
                            Icons.search,
                          ),
                          hintText: 'Type here to search',
                          hintStyle: TextStyle(color: Colors.grey, height: 0.1),
                          prefixIconColor: Colors.red,
                        ),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          height: 0.6,
                        ),

                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      fromY: -60,
      toY: 800,
      fromOpacity: 1,
      toOpacity: 0.99999,
    );
  }
}
