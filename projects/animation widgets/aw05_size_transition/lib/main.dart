import 'package:aw05_SizeTransition/images.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

final title = 'SizeTransition';

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

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{

AnimationController _controller;
Animation<double> _animation;

@override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _controller.forward();

    _animation = Tween(begin: 0.0, end:1.0,).animate(_controller);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
		centerTitle: true,
      ),
      body: SizeTransition(
        sizeFactor: _animation,
        axis: Axis.vertical,
        axisAlignment: -1,
        child: Center(
          child: Image(
            color: Colors.green,
            image: AssetImage(thor),
           // fit: BoxFit.contain,
            width: 300,
            height: 250,
          ),
        ),
      ),
    );
  }
}
