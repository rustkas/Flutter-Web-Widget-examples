import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() => runApp(MyApp());

final title = 'Transform Widget';

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
 
  double sliderValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Slider(
            min: 0,
            max: MediaQuery.of(context).size.width,
            activeColor: Colors.purple,
            inactiveColor: Colors.green,
            value: sliderValue,
            onChanged: (newValue) {
              setState(() {
                sliderValue = newValue;
              });
            },
          ),
          Flexible(
            child: Column(
              children: [
                SizedBox(
                  height: 80,
                ),
                Center(
                  child: Transform.rotate(
                    angle: sliderValue * math.pi / 160,
                    child: Container(
                      color: Colors.grey,
                      height: 75,
                      width: 75,
                      child: Center(
                          child: Text(
                        'Rotate',
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 80,
                ),
                Center(
                  child: Transform.scale(
                    scale: sliderValue / MediaQuery.of(context).size.width,
                    child: Container(
                      color: Colors.cyan,
                      height: 75,
                      width: 75,
                      child: Center(
                          child: Text(
                        'Scale',
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 80,
                ),
                Row(
                  children: [
                    Transform.translate(
                      offset: Offset(sliderValue * 1, 0),

                      child: Container(
                        color: Colors.black,
                        height: 75,
                        width: 75,
                        child: Center(
                          child: Text(
                            'Translate',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
