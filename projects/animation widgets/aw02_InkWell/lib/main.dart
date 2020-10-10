import 'package:aw02_InkWell/images.dart';
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

class _MyHomePageState extends State<MyHomePage> {
  String title = 'InkWell Widget';
  double _size = 100;
  double _imgSize = 100;
  double _containerSize = 100;


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
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: AnimatedContainer(
                  height: _size,
                  width: _size,
                  curve: Curves.elasticInOut,
                  duration: Duration(seconds: 1),
                  child: Material(
                    color: Colors.purple,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _size == 100 ? _size = 200 : _size = 100;
                        });
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _imgSize == 100 ? _imgSize = 200 : _imgSize = 100;
                    });
                  },
                  child: Image(
                    image: AssetImage(deadPool),
                    height: _imgSize,
                    width: _imgSize,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  height: _containerSize,
                  width: _containerSize,
                  child: Material(
                    color: Colors.redAccent,
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          _containerSize == 100 ? _containerSize = 200 : _containerSize = 100;
                        });
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
