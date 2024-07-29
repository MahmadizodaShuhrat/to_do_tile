import 'package:flutter/material.dart';
import 'package:num/my_home_page.dart';

void main(List<String> args) {
  runApp(const Myapp());
}
class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(debugShowCheckedModeBanner: false,
      home: MyHomePage()
    );
  }
}