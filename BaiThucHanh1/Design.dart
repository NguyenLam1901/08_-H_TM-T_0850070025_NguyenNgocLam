import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My app', //use by the OS task switcher
      home: MyHomeScreen(),
  ),
  );
}

class MyHomeScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trang chu'),
      ),
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          width: 390,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Nguyen Ngoc Lam,08_DH_TMDT',
                style: TextStyle(fontSize: 40,fontWeight: FontWeight.w900),
              ),
              const SizedBox(
                height: 20,
              ),
              buildRowLayout(),
              const SizedBox(
                height: 20,
              ),
              Image.network(
                  'https://www.alisco-it.com/wp-content/uploads/2022/01/Flutter_Featured_Logo.png',
                height: 200,
                width: 450,
              ),

              ElevatedButton(
                onPressed: (){
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Nut da duoc bam!'))
                  );
                },
                child: const Text('Bam vao day!')),
            ],
          )),
      ),
      );
  }
}
Widget buildRowLayout() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        color: Colors.blue,
        height: 100,
        width: 100,
      ),
      Container(
        color: Colors.green,
        height: 100,
        width: 100,
      ),
      Container(
        color: Colors.orange,
        height: 100,
        width: 100,
      )
    ],
  );
}