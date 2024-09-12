import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: MyCounterDemo(),
    );
  }
}

class MyCounterDemo extends StatefulWidget {
  const MyCounterDemo({super.key});

  @override
  State<MyCounterDemo> createState() => _MyCounterDemoState();
}

class _MyCounterDemoState extends State<MyCounterDemo> {

  int _counter = 0;

  void increment() {
    setState(() {
      _counter++;

    });
  }

  void decrement(){
    setState(() {
      _counter--;

      if(_counter <= 0){
        _counter = 0;
      }

    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Counter '),
      ),
      body:  Center(
  
        child: Column(
          children: [
            Image.asset('asset/download.jpeg'),
            SizedBox(height: 200),
            Row(

              children: [

                ElevatedButton(onPressed: increment, child: Text('+')),
                SizedBox(width: 30),
                Text('$_counter', style: TextStyle(fontSize: 20)),
                SizedBox(width: 30),
                ElevatedButton(onPressed: decrement, child: const Text('-')),
              ],
            ),
            SizedBox(height: 20),
            Text('The price of a coffee is 5 Dollars',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Please pay \$ ${_counter * 5} to proceed')),
                );
              },
              child: Text('Pay'),
            ),
          ],
        ),
      ),
    );
  }
}