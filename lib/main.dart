import 'package:flutter/material.dart';
import 'package:play/custom_widgets/my_widget.dart';
import 'package:play/pages/home_page.dart';
import 'package:play/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: myTheme(context),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      routes: {
        HomePage.id:(context)=>HomePage(),
      },
    );
  }
}
