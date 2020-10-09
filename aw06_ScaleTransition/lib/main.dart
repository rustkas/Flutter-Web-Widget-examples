import 'package:flutter/material.dart';

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
  String title = 'Scale Transition';
  AnimationController _animationController;
  Animation<double> _animation;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    _animation = Tween<double>(begin: 1.5, end: 2.5).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.elasticOut));

    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _animationController.forward();
      }
    });
  }

  void animate() {
    if (_isPlaying) {
      _animationController.stop();
    } else {
      _animationController.forward();
    }

    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Material(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Text(
                  'Press Play Button',
                  style: TextStyle(fontSize: 22),
                ),
              ),
              ScaleTransition(
                scale: _animation,
                child: Container(
                  child: Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: FloatingActionButton(
                    child: _isPlaying
                        ? Icon(
                            Icons.pause,
                            color: Colors.white,
                            size: 32,
                          )
                        : Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                            size: 32,
                          ),
                    tooltip: 'Play',
                    backgroundColor: Color(0xFF832685),
                    onPressed: animate),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
