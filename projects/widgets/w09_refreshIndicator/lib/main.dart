import 'package:flutter/material.dart';

void main() => runApp(MyApp());

final title = 'Refresh Indicator';

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

  Future<Null> refreshList() async {
    await Future.delayed(Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: refreshList,
        backgroundColor: Colors.purple,
        color: Colors.red,
        child: ListView.builder(
            itemCount: 50,
            itemBuilder: (context, i) {
              return Container(
                padding: EdgeInsets.all((16)),
                child: Text("Number $i"),
              );
            }),
      ),
    );
  }
}
