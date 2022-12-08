import 'package:flutter/material.dart';

class NavigatorHomePage extends StatefulWidget {
  const NavigatorHomePage({Key? key}) : super(key: key);

  @override
  State<NavigatorHomePage> createState() => _NavigatorHomePageState();
}

class _NavigatorHomePageState extends State<NavigatorHomePage> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Center(
        child: Text('导航'),
      ),
    );
  }
}
