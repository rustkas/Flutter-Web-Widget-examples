import 'package:flutter/material.dart';
import 'images.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ClipOval, ClipRRect, ClipRect, ClipPath',
      theme: ThemeData(
        primaryColor: Color(0xFF832685),
        primaryColorLight: Color(0xFFC81379),
        accentColor: Color(0xFFFAF2FB),
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
  String title = 'ClipOval';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ClipOval(
                  child: Image(
                    image: AssetImage(antMan),
                    height: 150.0,
                    width: 150.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              ClipRRect(
                clipper: RRectangleClip(),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(70.0),
                  topLeft: Radius.circular(170.0),
                  bottomRight: Radius.circular(270.0),
                  bottomLeft: Radius.circular(370.0),
                ),
                child: Image(
                  image: AssetImage(captainAmerica),
                  height: 150.0,
                  width: 150.0,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ClipRect(
                  clipper: RectangleClip(),
                  clipBehavior: Clip.hardEdge,
                  child: Image(
                    image: AssetImage(thor),
                    height: 200.0,
                    width: 150.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ClipPath(
                  clipper: TriangleClip(),
                  child: Image(
                    image: AssetImage(vision),
                    height: 150.0,
                    width: 150.0,
                    fit: BoxFit.cover,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class RectangleClip extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2), radius: 150);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) => false;
}

class RRectangleClip extends CustomClipper<RRect> {
  @override
  RRect getClip(Size size) {
    return RRect.fromRectAndRadius(
        Rect.fromPoints(Offset(0, 0), Offset(150, 150)), Radius.circular(50));
  }

  @override
  bool shouldReclip(covariant CustomClipper<RRect> oldClipper) => false;
}

class TriangleClip extends CustomClipper<Path> {
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.close();

    return path;
  }

  bool shouldReclip(TriangleClip oldClipper) => false;
}
