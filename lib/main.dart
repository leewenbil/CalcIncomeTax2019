import 'package:flutter/material.dart';
import 'person_tax_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PersonTax(),
      theme: ThemeData(primaryColor: Colors.blueAccent),
    );
  }
}
