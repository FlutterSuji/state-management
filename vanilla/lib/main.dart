import 'package:flutter/material.dart';
import 'package:vanilla/MyHomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int counter;

  @override
  void initState() {
    super.initState();
    counter = counter ?? 0;
  }

  void _decrementCounter(_) {
    setState(() {
      counter--;
      print('decrement: $counter');
    });
  }

  void _incrementCounter(_) {
    setState(() {
      counter++;
      print('increment: $counter');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(
        title: 'My Home Page',
        counter: counter,
        decrementCounter: _decrementCounter,
        incrementCounter: _incrementCounter,
      ),
    );
  }
}
