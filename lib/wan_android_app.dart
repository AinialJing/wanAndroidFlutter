import 'package:flutter/material.dart';
import 'package:wan_android_flutter/collection/page/collection_home_page.dart';
import 'package:wan_android_flutter/home/page/home_page.dart';
import 'package:wan_android_flutter/navigator/page/navigator_home_page.dart';
import 'package:wan_android_flutter/progect/page/progect_home_page.dart';

import 'login/page/login.dart';
import 'login/page/register.dart';

class WanAndroidApp extends StatelessWidget {
  const WanAndroidApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: <String, WidgetBuilder>{
        'register': (context) => const RegisterPage(key: Key('RegisterPage')),
        'login': (context) => const LoginPage(key: Key('LoginPage')),
        'home': (context) => const HomePage(key: Key('HomePage')),
        'project': (context) => const ProjectHomePage(key: Key('ProjectHomePage')),
        'navigator': (context) => const NavigatorHomePage(key: Key('NavigatorHomePage')),
        'collection': (context) => const CollectionHomePage(key: Key('CollectionHomePage')),
      },
      home: _HomeApp(key: Key("HomeApp"),),
    );
  }
}

class _HomeApp extends StatefulWidget {

  _HomeApp({Key? key}) : super(key: key);

  @override
  State<_HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<_HomeApp> {
  int currentIndex=0;

  final pages = [HomePage(), ProjectHomePage(), NavigatorHomePage(), CollectionHomePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.lightBlue,
        currentIndex: currentIndex,
        items:const [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: '首页'),
          BottomNavigationBarItem(icon: Icon(Icons.map_outlined),label: '项目'),
          BottomNavigationBarItem(icon: Icon(Icons.account_tree_outlined),label: '导航'),
          BottomNavigationBarItem(icon: Icon(Icons.star),label: '收藏'),
        ],
        onTap:(value){
          setState(() {
            if(currentIndex !=value){
              currentIndex=value;
            }
          });
        } ,
      ),
      body: pages[currentIndex],
    );
  }
}

