import 'package:flutter/material.dart';
import 'images.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AnimatedAlign | AlignmentGeometry, Alignment, SizedBox',
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
  String title = 'AnimatedAlign';

  static const _alignments = [
    Alignment.topLeft,
    Alignment.topRight,
    Alignment.bottomRight,
    Alignment.bottomLeft,
  ];

  var _index = 0;
  AlignmentGeometry get _alignment => _alignments[_index % _alignments.length];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.grey, style: BorderStyle.solid, width: 1.0),
                  borderRadius: BorderRadius.zero,
                  shape: BoxShape.rectangle,
                ),
                child: Stack(
                  children: [
                    Center(
                      child: FloatingActionButton(
                        onPressed: () {
                          setState(() {
                            _index++;
                          });
                        },
                        elevation: 0.0,
                        backgroundColor: Colors.purple,
                        tooltip: 'Play',
                        heroTag: 'Align',
                        child: Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                          size: 36.0,
                        ),
                      ),
                    ),
                    AnimatedAlign(
                      alignment: _alignment,
                      duration: Duration(seconds: 2),
                      curve: Curves.easeIn,
                      child: Stack(
                        children: [
                          SizedBox(
                            width: 200.0,
                            height: 200.0,
                            child: Image(
                              image: AssetImage(nickFury),
                            ),
                          ),
                          SizedBox(
                            width: 100.0,
                            height: 100.0,
                            child: Image(
                              image: AssetImage(nickFury),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
