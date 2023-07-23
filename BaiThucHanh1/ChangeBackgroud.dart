import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ColorPaletteApp(),
    );
  }
}

class ColorPaletteApp extends StatefulWidget {
  @override
  _ColorPaletteAppState createState() => _ColorPaletteAppState();
}

class _ColorPaletteAppState extends State<ColorPaletteApp> {
  final List<Color> colors = [
    Colors.red,
    Colors.black,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.grey,
    Colors.pink,
    Colors.brown,
    Colors.orange,
    Colors.purple
  ];

  int currentIndex = 9; // Chỉ số màu hiện tại

  void changeBackgroundColor() {
    setState(() {
      currentIndex = (currentIndex + 1) % colors.length; // Tăng chỉ số màu và lặp lại trong khoảng màu có sẵn
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Homework'),
      ),
      body: Container(
        color: colors[currentIndex],
        child: Center(
          child: ElevatedButton(
            onPressed: changeBackgroundColor,
            child: Text(
              'Click me in change background color',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
