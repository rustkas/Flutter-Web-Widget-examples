import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: AnimatedContainerDemo(),
      ),
    );
  }
}

class AnimatedContainerDemo extends StatefulWidget {
  @override
  _AnimatedContainerDemoState createState() => _AnimatedContainerDemoState();
}

class _AnimatedContainerDemoState extends State<AnimatedContainerDemo> {
  // state variables                           <-- state
  final _myDuration = Duration(seconds: 1);
  final Color _init_value = Color(0xFF00BB00);
  var _myValue = Color(0xFF00BB00);
  final _myNewValue = Color(0xFF0000FF);

  // starting width
  var _my_value_border = 0.0;
// ending width
  final _my_new_value_border = 7.0;
  final _init_value_border = 0.0;

  // starting radius
  var _myvalue_border_radius = 0.0;

// ending radius
  final _mynewvalue_border_radius = 40.0;
  final _init_value_border_radius = 0.0;

  // starting radius
  var _myvalue_image = DecorationImage(
    image: NetworkImage('https://placebear.com/300/300'),
  );

// ending radius
  final _my_new_value_image = DecorationImage(
    image: NetworkImage('https://placebear.com/400/400'),
  );
  final _init_value_image = DecorationImage(
    image: NetworkImage('https://placebear.com/300/300'),
  );

  // starting
  var _my_value_shadow = 0.0;

// ending
  final _my_new_value_shadow = 20.0;
  final _init_value_shadow = 0.0;

  // starting
  var _myValue_gradient = Colors.green;

// ending
  final _myNewValue_gradient = Colors.blue;
  var _initValue_gradient = Colors.green;

  // starting
  var _myValue_shape = 0.0;

// ending
  final _myNewValue_shape = 100.0;
  final _initValue_shape = 0.0;

  var _myValue_padding = 8.0;
  var _mynewValue_padding = 16.0;
  final _initValue_padding = 8.0;

  // starting
  var _myValue_align = -1.0;

// ending
  final _myNewValue_align = 1.0;
  final _initValue_align = -1.0;

  // starting
  var _myValue_transform = 0.0;
// ending
  final _myNewValue_transform = 2.0;
  final _init_transform = 0.0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
      return SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: viewportConstraints.maxHeight,
          ),
          child: Column(
            children: [
              updateStateButton(),
              Wrap(
                spacing: 50,

                // alignment: WrapAlignment.spaceBetween,
                children: [
                  AnimatedContainer(
                    color: _myValue,
                    duration: _myDuration,
                    child: SomeOtherWidget(),
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 100),
                    child: SomeOtherWidget(),
                    decoration: BoxDecoration(
                      color: Color(0xFF0099EE),
                      border: Border.all(
                        color: Color(0xFF12569A),
                        width: _my_value_border,
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    duration: _myDuration,
                    decoration: BoxDecoration(
                      color: Color(0xFF0099EE),
                      borderRadius:
                          BorderRadius.circular(_myvalue_border_radius),
                      border: Border.all(
                        color: Color(0xFF12569A),
                        width: 7.0,
                      ),
                    ),
                    child: SomeOtherWidget(),
                  ),
                  AnimatedContainer(
                    duration: _myDuration,
                    decoration: BoxDecoration(
                      image: _myvalue_image,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: SomeOtherWidget(),
                  ),
                  AnimatedContainer(
                    duration: _myDuration,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        _myValue,
                        Colors.black.withBlue(_myValue.blue),
                      ]),
                    ),
                    child: SomeOtherWidget(),
                  ),
                  AnimatedContainer(
                    duration: _myDuration,
                    color: Color(0xFF0099EE),
                    width: 200 + _myValue_shape,
                    height: 200 - _myValue_shape,
                    child: SomeOtherWidget(),
                  ),
                  AnimatedContainer(
                    duration: _myDuration,
                    padding: EdgeInsets.all(_myValue_padding),
                  ),
                  AnimatedContainer(
                    duration: _myDuration,
                    alignment: Alignment(_myValue_align, _myValue_align),
                    color: Color(0xFF00992E),
                    width: 200,
                    height: 200,
                    child: Text('Flutter'),
                  ),
                  AnimatedContainer(
                    duration: Duration(seconds: 3),
                    curve: Curves.elasticInOut,
                    alignment: Alignment(_myValue_align, _myValue_align),
                    color: Color(0xFF0099EE),
                    width: 200,
                    height: 200,
                    child: Text('Flutter'),
                  ),
                  AnimatedContainer(
                    duration: _myDuration,
                    width: 50,
                    height: 50,
                    transform:
                        Matrix4.skew(_myValue_transform, _myValue_transform),
                    color: Color(0xFFEE99EE),
                    child: SomeOtherWidget(),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }

  Align updateStateButton() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(bottom: 100),
        child: RaisedButton(
          child: Text('Update State'),
          onPressed: () {
            setState(() {
              //                    <-- update state
              // _myValue = _myNewValue;
              _myValue = _myValue != _myNewValue ? _myNewValue : _init_value;

              _my_value_border = _my_value_border != _my_new_value_border
                  ? _my_new_value_border
                  : _init_value_border;

              _myvalue_border_radius =
                  _myvalue_border_radius != _mynewvalue_border_radius
                      ? _mynewvalue_border_radius
                      : _init_value_border_radius;

              _myvalue_image = _myvalue_image != _my_new_value_image
                  ? _my_new_value_image
                  : _init_value_image;

              _my_value_shadow = _my_value_shadow != _my_new_value_shadow
                  ? _my_new_value_shadow
                  : _init_value_shadow;
              _myValue_gradient = _myValue_gradient != _myNewValue_gradient
                  ? _myNewValue_gradient
                  : _initValue_gradient;
              _myValue_shape = _myValue_shape != _myNewValue_shape
                  ? _myNewValue_shape
                  : _initValue_shape;

              _myValue_gradient = _myValue_gradient != _myNewValue_gradient
                  ? _myNewValue_gradient
                  : _initValue_gradient;

              _myValue_padding = _myValue_padding != _mynewValue_padding
                  ? _mynewValue_padding
                  : _initValue_padding;

              _myValue_align = _myValue_align != _myNewValue_align
                  ? _myNewValue_align
                  : _initValue_align;

              _myValue_transform = _myValue_transform != _myNewValue_transform
                  ? _myNewValue_transform
                  : _init_transform;

              // starting
            });
          },
        ),
      ),
    );
  }
}

class SomeOtherWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
    );
  }
}
