import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AnimatedSize | GestureDetector',
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

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  String title = 'AnimatedSize';
  static const double min_value = 100;
  static const double max_value = 300;

  double _height = min_value;
  double _width = min_value;
  var _color = Colors.purple;
  bool _shrink = true;

  Curve curve = Curves.elasticInOut;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Center(
        child: AnimatedSize(
          curve: curve,
          vsync: this,
          duration: Duration(seconds: 2),
          child: GestureDetector(
            onTap: () {
              setState(() {
                if (_shrink) {
                  _shrink = false;
                  _color = Colors.orange;
                  _height = max_value;
                  _width = max_value;
                  curve = Curves.elasticInOut;
                } else {
                  _shrink = true;
                  _color = Colors.purple;
                  _height = min_value;
                  _width = min_value;
                  curve = Curves.linear;
                }
              });
            },
            child: Container(
              width: _width,
              height: _height,
              color: _color,
            ),
          ),
        ),
      ),
    );
  }
}
