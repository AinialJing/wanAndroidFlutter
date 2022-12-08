import 'package:flutter/material.dart';

class CollectionHomePage extends StatefulWidget {
  const CollectionHomePage({Key? key}) : super(key: key);

  @override
  State<CollectionHomePage> createState() => _CollectionHomePageState();
}

class _CollectionHomePageState extends State<CollectionHomePage> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Center(
        child: Text('收藏主页'),
      ),
    );
  }
}
