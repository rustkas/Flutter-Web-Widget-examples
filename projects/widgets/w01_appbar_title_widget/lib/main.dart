import 'package:flutter/material.dart';

void main() => runApp(MyApp());

final title = 'AppBar Title Widget';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
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

  Icon searchBtn = Icon(Icons.search);
  Widget appBarTitle = Text(title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: false,
        title: appBarTitle,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              colors: [
                Color(0xFF832685),
                Color(0xFFC81379),
              ],
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(
              icon: searchBtn,
              onPressed: () {
                setState(() {
                  if (this.searchBtn.icon == Icons.search) {
                    searchBtn = Icon(Icons.close);
                    this.appBarTitle = TextField(
                      autofocus: true,
                      cursorColor: Color(0xFFFAF2FB),
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        filled: true,
                        prefixIcon: Icon(Icons.search, color: Colors.white),
                        hintText: 'Search...',
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                    );
                  }
                  else {
                    this.searchBtn = Icon(Icons.search);
                    this.appBarTitle=Text('Home');
                  }
                });
              })
        ],
      ),
      body: Center(
        child: Text('HomePage'),
      ),
    );
  }
}
