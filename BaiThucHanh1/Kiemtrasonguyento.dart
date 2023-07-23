import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PrimeCheckerApp(),
    );
  }
}

class PrimeCheckerApp extends StatefulWidget {
  @override
  _PrimeCheckerAppState createState() => _PrimeCheckerAppState();
}

class _PrimeCheckerAppState extends State<PrimeCheckerApp> {
  TextEditingController _numberController = TextEditingController();
  String _resultText = '';

  bool isPrime(int number) {
    if (number <= 1) return false;

    for (int i = 2; i * i <= number; i++) {
      if (number % i == 0) {
        return false;
      }
    }
    return true;
  }

  void checkPrime() {
    int number = int.tryParse(_numberController.text) ?? 0;
    setState(() {
      if (isPrime(number)) {
        _resultText = '$number là số nguyên tố.';
      } else {
        _resultText = '$number không phải là số nguyên tố.';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kiểm tra số nguyên tố'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _numberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Nhập số',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: checkPrime,
              child: Text('Kiểm tra'),
            ),
            SizedBox(height: 20),
            Text(
              _resultText,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
