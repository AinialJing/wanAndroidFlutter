import 'package:flutter/material.dart';
import 'package:wan_android_flutter/home/dao/home_dao.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Center(
        child: Text('首页'),
      ),
    );
  }
  @override
  void initState() {
    super.initState();
    HomeDao homeDao=HomeDao();
    homeDao.getBanners();
  }
}
