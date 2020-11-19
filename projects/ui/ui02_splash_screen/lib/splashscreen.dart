import 'dart:async';

import 'package:flutter/material.dart';
import 'shimmer.dart';
import 'home_page.dart';
import 'images.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
        Duration(seconds: 5),
        () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => MyHomePage(),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Opacity(
                // With Background Color
                alwaysIncludeSemantics: true,
                opacity: 0.4,
                child: Container(
                  color: Colors.red,
                ),
              ),
              ShaderMask(
                shaderCallback: (rect) {
                  return RadialGradient(
                    radius: 1.0,
                    colors: [
                      Colors.yellow,
                      Colors.deepOrange,
                    ],
                    tileMode: TileMode.mirror,
                  ).createShader(rect);
                },
                blendMode: BlendMode.srcIn,
                child: Text(
                  'The Tech Designer',
                  style: TextStyle(
                    fontSize: 42.0,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    shadows: <Shadow>[
                      Shadow(
                        color: Colors.black87,
                        blurRadius: 20.0,
                        offset: Offset.fromDirection(125.15),
                      ),
                    ],
                  ),
                ),
              ),
              // Shimmer.fromColors(
              //   period: Duration(seconds: 2),
              //   baseColor: Color(0xFF832685),
              //   highlightColor: Color(0xFFC81379),
              //   child: Text(
              //     'The Tech Designer',
              //     style: TextStyle(
              //       fontSize: 42.0,
              //       fontWeight: FontWeight.bold,
              //       fontStyle: FontStyle.italic,
              //       shadows: <Shadow>[
              //         Shadow(
              //           color: Colors.black87,
              //           blurRadius: 20.0,
              //           offset: Offset.fromDirection(125.15),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
