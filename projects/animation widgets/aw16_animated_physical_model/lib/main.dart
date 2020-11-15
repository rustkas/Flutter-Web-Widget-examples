import 'package:flutter/material.dart';
import 'images.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AnimatedPhysicalModel | BorderRadius, shadowColor, shape',
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
  String title = 'AnimatedPhysicalModel';

  bool _elev = true;
  double initSize = 200;
  bool isAnimationEnd = false;
  Color iconBackgroundColor = Colors.purple;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedPhysicalModel(
              curve: _elev ? Curves.fastOutSlowIn : Curves.elasticOut,
              shadowColor: _elev ? Colors.black : Colors.green,
              shape: BoxShape.rectangle,
              elevation: _elev ? 0 : 70,
              clipBehavior: Clip.antiAlias,
              onEnd: () {
                isAnimationEnd = false;
                setState(() {
                  iconBackgroundColor = Colors.purple;
                });
              },
              color: Colors.white,
              duration: Duration(seconds: 2),
              borderRadius: _elev
                  ? const BorderRadius.all(Radius.circular(0.0))
                  : const BorderRadius.all(Radius.circular(30.0)),
              child: Container(
                height: initSize,
                width: initSize,
                child: Image(
                  image: AssetImage(wanda),
                  height: 200.0,
                  width: 200.0,
                ),
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  if (!isAnimationEnd) {
                    _elev = !_elev;
                    isAnimationEnd = true;
                    iconBackgroundColor = Colors.grey;
                  }
                });
              },
              child: Icon(
                Icons.play_arrow,
                color: Colors.white,
                size: 36.0,
              ),
              backgroundColor: iconBackgroundColor,
              tooltip: 'Play',
              heroTag: 'Model',
            ),
          ],
        ),
      ),
    );
  }
}
