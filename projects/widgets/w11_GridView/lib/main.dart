import 'package:flutter/material.dart';
import 'package:w11_GridView/images.dart';

void main() => runApp(MyApp());

final title = 'GridView (Scrollable)';

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

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: GridView.count(
        crossAxisCount: 3,
        children: List.generate(50, (index) {
          return Container(
            margin: EdgeInsets.all(32),
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              child: Center(
                child:
                    // Image(
                    //   image: AssetImage(captainAmerica),
                    //   height: 100,
                    //   width: 100,
                    //   fit: BoxFit.cover,
                    // )
                    Text(
                  "$index",
                  style: TextStyle(fontSize: 32),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
