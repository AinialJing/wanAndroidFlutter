import 'package:flutter/material.dart';
import 'package:wan_android_flutter/login/page/login.dart';
import 'package:wan_android_flutter/widget/appbar.dart';

import '../../string_source.dart';

///注册页面
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(Strings.REGISTER, Strings.LOGIN, () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const LoginPage(key: Key('Login'))));
      }),
    );
  }
}
