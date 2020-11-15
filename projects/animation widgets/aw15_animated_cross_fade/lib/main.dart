import 'package:flutter/material.dart';
import 'images.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AnimatedCrossFade | CrossFadeState, firstChild, secondChild',
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
  String title = 'AnimatedCrossFade';

  var _isFirstCrossFadeEnabled = false;

  _animatedCrossFade() {
    setState(() {
      _isFirstCrossFadeEnabled = !_isFirstCrossFadeEnabled;
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  title,
                  style: TextStyle(fontSize: 22.0),
                ),
              ),
              AnimatedCrossFade(
                firstCurve: Curves.elasticInOut,
                duration: Duration(seconds: 5),
                crossFadeState: _isFirstCrossFadeEnabled
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                firstChild: Container(
                  child: Image(
                    image: AssetImage(ironMan),
                    height: 400.0,
                    width: 400.0,
                  ),
                ),
                secondChild: Container(
                  child: Image(
                    image: AssetImage(thanos),
                    height: 400.0,
                    width: 400.0,
                  ),
                ),
              ),
              FloatingActionButton(
                onPressed: () {
                  _animatedCrossFade();
                },
                tooltip: 'Play',
                backgroundColor: Colors.purple,
                child: Icon(
                  Icons.play_arrow,
                  size: 36.0,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
