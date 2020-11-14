import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AnimatedDefaultTextStyle |TextStyle, FloatingActionButton',
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
  String title = 'AnimatedDefaultTextStyle';

  bool _isSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Material(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 22.0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: AnimatedDefaultTextStyle(
                    // textWidthBasis: TextWidthBasis.longestLine,
                    // textHeightBehavior: TextHeightBehavior(
                    //   applyHeightToFirstAscent: false,
                    //   applyHeightToLastDescent: true,
                    // ),
                    // maxLines: 2,
                    style: _isSelected
                        ? TextStyle(
                            // height: 2,
                            fontSize: 24.0,
                            color: Colors.purple,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'GalleryIcons',
                          )
                        : TextStyle(
                            // height: 1,
                            fontSize: 24.0,
                            color: Colors.black,
                            decoration: TextDecoration.overline,
                            fontWeight: FontWeight.w300,
                            // fontWeight: FontWeight.bold,
                            // fontFamily: 'Montserrat',
                            fontFamily: 'GalleryIcons',
                          ),
                    duration: Duration(seconds: 1),
                    child: Text('Text Animate. First line\n'
                        'Text Animate. Second line\n'
                        'Text Animate. Third line\n'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: FloatingActionButton(
                    child: Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                      size: 36.0,
                    ),
                    onPressed: () {
                      setState(() {
                        _isSelected = !_isSelected;
                      });
                    },
                    tooltip: 'Play',
                    backgroundColor: Colors.purple,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
