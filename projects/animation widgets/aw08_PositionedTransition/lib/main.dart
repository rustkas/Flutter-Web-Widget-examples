import 'package:aw08_PositionedTransition/images.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

final title = 'Positioned Transition';

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

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  Animation<RelativeRect> _animation;
  AnimationController _controller;
  Animation _curve;
  RelativeRect _animationValue;
  AnimationStatus _state;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _curve = CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn);

    _animation = RelativeRectTween(
            begin: RelativeRect.fromLTRB(200.0, 200.0, 200.0, 200.0),
            end: RelativeRect.fromLTRB(20.0, 20.0, 20.0, 20.0))
        .animate(_curve)
          ..addListener(() {
            setState(() {
              _animationValue = _animation.value;
            });
          })
          ..addStatusListener((AnimationStatus state) {
            if (state == AnimationStatus.completed) {
              _controller.reverse();
            } else if (state == AnimationStatus.dismissed) {
              _controller.forward();
            }

            setState(() {
              _state = state;
            });
          });
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          AnimatorTransition(
            animation: _animation,
            child: Image(
              height: 300,
              width: 300,
              image: AssetImage(spiderMan),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Animation Value : ' + _animationValue.toString(),
              style: TextStyle(fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 75, bottom: 16, left: 16, right: 16),
            child: Text(
              'Animation Status : ' + _state.toString(),
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}

class AnimatorTransition extends StatelessWidget {
  final Widget child;
  final Animation<RelativeRect> animation;

  AnimatorTransition({this.child, this.animation});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PositionedTransition(rect: animation, child: this.child),
      ],
    );
  }
}
