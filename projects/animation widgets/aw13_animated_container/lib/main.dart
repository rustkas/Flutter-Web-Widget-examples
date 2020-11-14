import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: ' AnimatedContainer | Container, FloatingActionButton',
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
  String title = 'Animated Container';

  var _color = Colors.purple;
  var _height = 200.0;
  var _width = 200.0;

  _animatedContainer() {
    setState(() {
      _color = _color == Colors.purple ? Colors.orange : Colors.purple;
      _height = _height == 200.0 ? 350.0 : 200.0;
      _width = _width == 200.0 ? 350.0 : 200.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Animated Container',
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: FloatingActionButton(
                child: Icon(Icons.play_arrow, size: 36.0),
                onPressed: () {
                  _animatedContainer();
                },
                tooltip: 'Play',
                heroTag: 'Container',
                backgroundColor: Color(0xFF832685),
              ),
            ),
            AnimatedContainer(
              duration: Duration(seconds: 1),
              curve: Curves.bounceIn,
              color: _color,
              height: _height,
              width: _width,
            ),
          ],
        ),
      ),
    );
  }
}
