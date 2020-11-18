import 'package:fa_stepper/fa_stepper.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
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
  String title = 'Stepper (Custom)';

  int _currentStep = 0;

  FAStepperType _stepperType = FAStepperType.vertical;

  _switchStepType() {
    setState(() => _stepperType == FAStepperType.vertical 
    ? _stepperType = FAStepperType.horizontal 
    : _stepperType = FAStepperType.vertical);
  }

  List<FAStep> _stepper = [
    FAStep(
      title: Text('Name'),
      // Column(
      //   children: <Widget>[
      //     Icon(
      //       Icons.person,
      //       color: Colors.red,
      //       size: 24.0,
      //     ),
      //     Text('Name'),
      //   ],
      // ),
      // subtitle: Text('Full Name'),
      isActive: true,
      state: FAStepstate.complete,
      content: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: 'First Name'),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Last Name'),
          ),
        ],
      ),
    ),
    FAStep(
      title: Text('Email'), 
      // Column(
      //   children: <Widget>[
      //     Icon(
      //       Icons.mail,
      //       color: Colors.red,
      //       size: 24.0,
      //     ),
      //     Text('Email'),
      //   ],
      // ),
      isActive: true,
      state: FAStepstate.disabled,
      content: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: 'Email Address'),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Recovery Email'),
          ),
        ],
      ),
    ),
    FAStep(
      title: Text('Mobile No.'),
      isActive: true,
      state: FAStepstate.editing,
      content: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: 'Mobile No.'),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Alternative Mobile No.'),
          ),
        ],
      ),
    ),
    FAStep(
      title: Text('Address'),
      isActive: true,
      state: FAStepstate.error,
      content: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: 'Address 1'),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Address 2'),
          ),
        ],
      ),
    ),
    FAStep(
      title: Text('Password'),
      isActive: true,
      state: FAStepstate.indexed,
      content: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: 'Password'),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Confirm Password'),
          ),
        ],
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Container(
        child: FAStepper(
          // titleHeight: 120.0,
          stepNumberColor: Colors.grey,
          // titleIconArrange: FAStepperTitleIconArrange.column,
          physics: ClampingScrollPhysics(),
          steps: _stepper,
          type: _stepperType,
          currentStep: this._currentStep,
          onStepTapped: (step) {
            setState(() {
              this._currentStep = step;
            });
            print('onStepTapped :' + step.toString());
          },
          onStepContinue: () {
            setState(() {
              if(this._currentStep < this._stepper.length - 1) {
                this._currentStep = this._currentStep + 1;
              } else {
                _currentStep = 0;
              }
            });
            print('onStepContinue :' + _currentStep.toString());
          },
          onStepCancel: () {
            setState(() {
              if(this._currentStep > 0) {
                this._currentStep = this._currentStep - 1;
              } else {
                this._currentStep = 0;
              }
            });
            print('onStepCancel :' + _currentStep.toString());
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _switchStepType,
        backgroundColor: Color(0xFFC41A3B),
        child: Icon(Icons.swap_horizontal_circle),
      ),
    );
  }
}