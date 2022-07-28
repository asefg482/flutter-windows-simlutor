import 'package:flutter/material.dart';
import 'package:flutter_windows_simlutor/Screen/Screen_Splash.dart';
import 'package:flutter_windows_simlutor/Screen/Screen_Desktop.dart';


void main() {
  runApp(Application());
}

class Application extends StatefulWidget {
  const Application({Key? key}) : super(key: key);

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/splash':(_)=>Screen_Splash(),
        '/desktop':(_)=>Screen_Desktop(),
      },
      title: 'Flutter Windows',
      home: Screen_Desktop(),
    );
  }
}
