import 'package:flutter/material.dart';

import 'images.dart';

void main() => runApp(MyApp());

final title = 'BoxDecoration';

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
        child: Container(
          height: 300,
          width: 300,
          decoration: BoxDecoration(
            color: Colors.orangeAccent,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.redAccent, width: 15),
            image: DecorationImage(
              image: AssetImage(placeHolder),
            )

          ),

        ),
      ),
    );
  }
}
