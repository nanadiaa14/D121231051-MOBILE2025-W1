import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _number = 0; // private property, jadi tidak bisa diakses oleh class lain

  void increment() {
    setState(() {
      _number++;
    });
  }

  void decrement() {
    setState(() {
      if (_number != 0) {
        _number--;
      }
    });
  }

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter Page'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ), 
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Increase or Decrease the Number', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            Text('Current number is $_number', style: Theme.of(context).textTheme.bodyLarge),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: increment, icon: Icon(Icons.add)),
                SizedBox(width: 16),
                IconButton(onPressed: decrement, icon: Icon(Icons.remove)),
              ],
            )
          ],
        ),
      ),
    );
  }
}