import 'package:flutter/material.dart';

class ProjectHomePage extends StatefulWidget {
  const ProjectHomePage({Key? key}) : super(key: key);

  @override
  State<ProjectHomePage> createState() => _ProjectHomePageState();
}

class _ProjectHomePageState extends State<ProjectHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('项目'),
      ),
    );
  }
}
