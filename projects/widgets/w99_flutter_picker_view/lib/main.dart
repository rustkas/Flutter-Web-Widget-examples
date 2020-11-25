import 'package:flutter/material.dart';
import 'package:flutter_picker_view/flutter_picker_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Picker View (BottomSheetPicker)',
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
  String title = 'Flutter Picker View (BottomSheetPicker)';
  PickerController _pickerController =
      PickerController(count: 4, selectedItems: [5, 1, 9, 0]);

  @override
  void dispose() {
    _pickerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Center(
        child: Builder(
          builder: (context) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                color: Color(0xFFC41A3B),
                padding: EdgeInsets.all(16),
                child: Text(
                  'BottomSheetPicker',
                  style: TextStyle(color: Color(0xFFFBE0E6)),
                ),
                onPressed: () {
                  PickerViewPopup.showMode(PickerShowMode.BottomSheet,
                      context: context,
                      builder: (BuildContext context, PickerViewPopup popup) {
                        return Container(
                          height: 300,
                          child: popup,
                        );
                      },
                      title: Text(
                        'BottomSheetPicker',
                        style: TextStyle(
                            color: Color(0xFFC41A3B),
                            fontWeight: FontWeight.bold),
                      ),
                      cancel: Text(
                        'Cancel',
                        style: TextStyle(
                            color: Color(0xFF1B1F32),
                            fontWeight: FontWeight.bold),
                      ),
                      confirm: Text(
                        'Confirm',
                        style: TextStyle(
                            color: Color(0xFF1B1F32),
                            fontWeight: FontWeight.bold),
                      ),
                      onCancel: () {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Cancel'),
                        ));
                      },
                      onConfirm: (_controller) {
                        List<int> selectedItems = [];
                        selectedItems
                            .add(_controller.selectedRowAt(section: 0));
                        selectedItems
                            .add(_controller.selectedRowAt(section: 1));
                        selectedItems
                            .add(_controller.selectedRowAt(section: 2));
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Selected $selectedItems'),
                        ));
                      },
                      itemExtent: 48,
                      controller: _pickerController,
                      numberofRowsAtSection: (section) {
                        return 10;
                      },
                      itemBuilder: (section, _row) {
                        return Text(
                          '$_row',
                          style: TextStyle(fontSize: 24),
                        );
                      });
                },
              ),
              SizedBox(
                height: 16,
              ),
              RaisedButton(
                padding: EdgeInsets.all(16),
                color: Color(0xFFC41A3B),
                child: Text(
                  'BottomSheetPicker',
                  style: TextStyle(color: Color(0xFFFBE0E6)),
                ),
                onPressed: () {
                  PickerViewPopup.showMode(PickerShowMode.AlertDialog,
                      context: context,
                      builder: (BuildContext context, PickerViewPopup popup) {
                        return Container(
                          height: 300,
                          child: popup,
                        );
                      },
                      title: Text(
                        'AlertsDialogPicker',
                        style: TextStyle(
                            color: Color(0xFFC41A3B),
                            fontWeight: FontWeight.bold),
                      ),
                      cancel: Text(
                        'Cancel',
                        style: TextStyle(
                            color: Color(0xFF1B1F32),
                            fontWeight: FontWeight.bold),
                      ),
                      confirm: Text(
                        'Confirm',
                        style: TextStyle(
                            color: Color(0xFF1B1F32),
                            fontWeight: FontWeight.bold),
                      ),
                      onCancel: () {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Cancel'),
                        ));
                      },
                      onConfirm: (_controller) {
                        List<int> selectedItems = [];
                        selectedItems
                            .add(_controller.selectedRowAt(section: 0));
                        selectedItems
                            .add(_controller.selectedRowAt(section: 1));
                        selectedItems
                            .add(_controller.selectedRowAt(section: 2));
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Selected $selectedItems'),
                        ));
                      },
                      itemExtent: 48,
                      controller: _pickerController,
                      numberofRowsAtSection: (section) {
                        return 10;
                      },
                      itemBuilder: (section, _row) {
                        return Text(
                          '$_row',
                          style: TextStyle(fontSize: 24),
                        );
                      });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
