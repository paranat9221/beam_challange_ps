import 'package:flutter/material.dart';

class {{name.pascalCase()}}Screen extends StatelessWidget {
  const {{name.pascalCase()}}Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('{{name.pascalCase()}} Screen'),
      ),
      body: const Center(
        child: Text(
          'Welcome to "{{name.pascalCase()}}" Screen!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}