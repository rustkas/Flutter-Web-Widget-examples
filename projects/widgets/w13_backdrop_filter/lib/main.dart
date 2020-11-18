import 'dart:ui';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title:
          'BackdropFilter, ImageFilter |ClipRRect,ConstrainedBox,NetworkImage',
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
  String title = "BackDrop Filter";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          // background
          ConstrainedBox(
            constraints: BoxConstraints.expand(),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      'https://homepages.cae.wisc.edu/~ece533/images/sails.png'),
                ),
              ),
            ),
          ),
          // Text in the middle
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: _infoCard(context, "Salis"),
              ),
            ],
          ),
          // Round button in the bottom
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: _bottomIconButton(
                  IconButton(
                    tooltip: 'Bottom icon',
                    icon: Icon(
                      Icons.navigate_next,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

Widget _infoCard(BuildContext context, String title) {
  return _cardEdge(
    Container(
      key: ValueKey<String>(title),
      height: MediaQuery.of(context).size.height / 4,
      width: MediaQuery.of(context).size.height / 1.2,
      color: Colors.white.withOpacity(0.3),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Sails',
                style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              'Archaeological studies of the Cucuteni-Trypillian culture ceramics show use of sailing boats from the sixth millennium BCE onwards.',
              style: TextStyle(fontSize: 18.0, color: Colors.white),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _bottomIconButton(Widget child) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(50.0),
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
      child: Container(
        width: 50.0,
        height: 50.0,
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.3), shape: BoxShape.circle),
        child: child,
      ),
    ),
  );
}

Widget _cardEdge(Widget child) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(15.0),
    child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0), child: child),
  );
}
