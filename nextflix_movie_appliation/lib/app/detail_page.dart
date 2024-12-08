import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final String title;

  DetailsPage({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Details')),
      body: Center(
        child: Text('Details of: $title', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
