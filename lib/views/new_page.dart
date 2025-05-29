import 'package:flutter/material.dart';

class NewPage extends StatelessWidget {
  const NewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Page'),
        backgroundColor: Color(0xFFD91A60),
      ),
      body: Center(child: Text('New Page')),
    );
  }
}
