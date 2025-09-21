import 'package:flutter/material.dart';

class ImagePage extends StatelessWidget {
  const ImagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Page'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('My Image', 
            style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Image.asset('assets\images\719160413dc7337928c50d35862741a0.jpg'),
            SizedBox(height: 8),
            Text('This is TWS Jihoon Cute Pixel Ver Image',
            style: Theme.of(context).textTheme.bodyMedium)
          ],
        )
      )
    );
  }
}