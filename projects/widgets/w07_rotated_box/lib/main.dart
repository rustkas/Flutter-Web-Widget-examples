import 'package:flutter/material.dart';

import 'images.dart';

void main() => runApp(MyApp());

final title = 'Rotated Box';
  
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(
        primaryColor: Color(0xFF832685),
        primaryColorLight: Color(0xFFC81379),
        accentColor: Colors.black,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Center(
        child: RotatedBox(

          quarterTurns: 0,
          child: ClipPath(
            child: Image(image: AssetImage(captainAmerica),
              height: 200,
              width: 150,
              fit: BoxFit.cover,
            ),


          ),
        ),
      ),
    );
  }
}
