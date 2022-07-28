import 'package:flutter/material.dart';
import 'dart:ui';

class TaskBar_Icon extends StatefulWidget {
  TaskBar_Icon({
    Key? key,
    this.ToolTip_Message,
    this.onTap,
    this.Image_Padding = const EdgeInsets.all(8.0),
    this.Image_Path = '',
  }) : super(key: key);


  String? ToolTip_Message = null;
  GestureTapCallback? onTap;
  EdgeInsetsGeometry Image_Padding = EdgeInsets.all(8.0);
  String Image_Path = '';



  @override
  State<TaskBar_Icon> createState() => _TaskBar_IconState();
}

class _TaskBar_IconState extends State<TaskBar_Icon> {

  String? ToolTip_Message = null;
  GestureTapCallback? onTap;
  EdgeInsetsGeometry Image_Padding = EdgeInsets.all(8.0);
  String Image_Path = '';


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ToolTip_Message = widget.ToolTip_Message;
    onTap = widget.onTap;
    Image_Padding = widget.Image_Padding;
    Image_Path = widget.Image_Path;
  }

  bool Windows_Icons_Hover = false;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: (ToolTip_Message==null) ? '' : ToolTip_Message,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Color(0xff283237)),
      height: 20,
      padding: const EdgeInsets.all(8.0),
      preferBelow: false,
      textStyle: const TextStyle(
          fontSize: 12, color: Colors.white,
      ),
      showDuration: const Duration(seconds: 0),
      waitDuration: const Duration(seconds: 1),
      child: InkWell(
        mouseCursor: MouseCursor.defer,
        onTapDown: (Value){
          setState(() {
            Image_Padding = EdgeInsets.all(10);
          });
        },
        onTapUp: (Value){
          setState(() {
            Image_Padding = EdgeInsets.all(8);
          });
        },
        onTap: onTap,
        onHover: (Value) {
          setState(() {
            Windows_Icons_Hover = Value;
          });
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1, sigmaY: 4),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 70),
                decoration: Windows_Icons_Hover
                    ? BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromRGBO(
                          255, 255, 255, 0.09),
                      Color.fromRGBO(
                          255, 255, 255, 0.05),
                    ],
                  ),
                )
                    : BoxDecoration(),
                child: Padding(
                  padding: Image_Padding,
                  child: Image(
                    image: AssetImage(Image_Path),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
