import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My app',
      home: MyHomeScreen(),
    ),
  );
}

class MyHomeScreen extends StatefulWidget {
  @override
  _MyHomeScreenState createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  TextEditingController controllerA = TextEditingController();
  TextEditingController controllerB = TextEditingController();
  double result = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          width: 390,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                'https://cdn.tgdd.vn/Files/2018/11/28/1134248/xiaomi_800x450.jpg',
                width: 220,
              ),
              SizedBox(height: 20),
              buildInputFields(controllerA, 'Nhập vào A'),
              SizedBox(height: 10),
              buildInputFields(controllerB, 'Nhập vào B'),
              SizedBox(height: 20),
              Text(
                'Kết quả là: $result',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              buildCalculationButtons(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInputFields(TextEditingController controller, String hintText) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 100,
          child: TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            onChanged: (_) => setState(() {}), // Trigger a rebuild to update the result text
            decoration: InputDecoration(
              labelText: controller.text.isEmpty ? hintText : null,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildCalculationButtons() {
    const operators = {'+': '+', '-': '-', 'x': 'x', '/': '/'};

    Widget buildCalculationButton(String operator) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 5), // Adjust the horizontal spacing here
        child: ElevatedButton(
          onPressed: () => performCalculation(operator),
          child: Text(operator),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              operator == '-' ? Colors.red : operator == 'x' ? Colors.green : operator == ':' ? Colors.orange : Colors.blue,
            ),
          ),
        ),
      );
    }

    final calculationButtons = operators.keys.map(buildCalculationButton).toList();

    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
      children: calculationButtons,
    );
  }

  void performCalculation(String operator) {
    double a = double.tryParse(controllerA.text) ?? 0;
    double b = double.tryParse(controllerB.text) ?? 0;

    setState(() {
      switch (operator) {
        case '+':
          result = a + b;
          break;
        case '-':
          result = a - b;
          break;
        case 'x':
          result = a * b;
          break;
        case '/':
          result = a / b;
          break;
          default:
          result = 0;
      }
    });
  }
}
