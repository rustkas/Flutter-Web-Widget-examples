import 'package:flutter/material.dart';
import 'images.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
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
  String title = 'Fade Transition';

  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));

    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);

    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });

    _controller.forward();
    image = AssetImage(getImageLink());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  final list = [venom, spiderMan, drStrange];
  int imageIndex = 0;
  String getImageLink() {
    String imageLink;
    imageLink = list[imageIndex];

    return imageLink;
  }

  AssetImage image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: FlatButton(
        onPressed: () {
          setState(() {
            imageIndex++;
            if (imageIndex == list.length) {
              imageIndex = 0;
            }
            image = AssetImage(getImageLink());
          });
        },
        child: FadeTransition(
          opacity: _animation,
          child: Center(
            child: Image(image: image, width: 300.0),
          ),
        ),
      ),
    );
  }
}
