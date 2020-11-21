import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dismissible | How to add Swipe to Dismiss',
      theme: ThemeData(
        primaryColor: Color(0xFFC41A3B),
        primaryColorLight: Color(0xFFFBE0E6),
        accentColor: Color(0xFF1B1F32),
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
  String title = 'Dismissible';
  final _items = List<String>.generate(35, (index) => "Item ${index + 1}");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          if (index >= _items.length) {
            // debugPrint(
            //     'Index = $index is out of range. Array length is ${_items.length}');
            return null;
          }
          final _item = _items[index];

          return Dismissible(
            key: UniqueKey(),
            direction: DismissDirection.horizontal,
            resizeDuration: Duration(seconds: 1),
            movementDuration: Duration(seconds: 1),
            background: Container(
              color: Colors.green,
              child: Icon(Icons.edit),
              // child: Text('Edit'),
            ),
            secondaryBackground: Container(
              color: Colors.red,
              child: Icon(Icons.delete),
              // child: Text('Delete'),
            ),
            onDismissed: (_direction) {
              if (_direction == DismissDirection.endToStart) {
                if (index < _items.length) {
                  _items.removeAt(index);
                }

                ScaffoldMessenger.of(context).showSnackBar(
                  // Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text('$_item dismissed'),
                    duration: Duration(seconds: 1),
                  ),
                );
              } else if (_direction == DismissDirection.startToEnd) {
                ScaffoldMessenger.of(context).showSnackBar(
                  // Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text('$_item edited'),
                    duration: Duration(seconds: 1),
                  ),
                );
              }
            },
            child: Container(
              padding: EdgeInsets.all(8.0),
              child: ListTile(
                title: Text(
                  '${_items[index]}',
                  style: TextStyle(fontSize: 22.0),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
