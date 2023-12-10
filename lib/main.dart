import 'package:flutter/material.dart';
import 'car_grid_view.dart';
import 'car_controller.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final CarController _controller = CarController();
  bool _isDarkTheme = false;

  void _toggleTheme() {
    setState(() {
      _isDarkTheme = !_isDarkTheme;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Car List App',
      theme: _isDarkTheme ? ThemeData.dark() : ThemeData.light(),
      home: CarGridView(controller: _controller, toggleTheme: _toggleTheme),
    );
  }
}
