import 'package:flutter/material.dart';
import 'package:wan_android_flutter/string_source.dart';

///登陆页面
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  String todo = Strings.TO_LOGIN;
  bool needEnterConfirmPwd = true;
  bool isRegisterState = true;
  String? account = "", password = "", confirmPassword = "";
  TextEditingController controllerAccount = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  TextEditingController controllerConfirmPassword = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.greenAccent, Colors.green])),
        child: _buildLogin(),
      ),
    );
  }

  _buildLogin() {
    ///可滑动布局，避免弹出键盘时会有溢出异常
    return ListView(
      children: [
        const SizedBox(height: 80),
        _main(),
        GestureDetector(
          child: Text(
            isRegisterState ? Strings.TO_LOGIN : Strings.TO_REGISTER,
            style: const TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
          onTap: () {
            setState(() {
              isRegisterState = !isRegisterState;
            });
          },
        ),
      ],
    );
  }

  _main() {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [_editArea(), _submitArea(context)],
    );
  }

  ///输入内容部分
  _editArea() {
    return Container(
      margin: const EdgeInsets.only(top: 50),
      padding: const EdgeInsets.all(40),
      child: Card(
        elevation: 5,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _key,
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                    controller: controllerAccount,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.person_outline),
                      labelText: Strings.HINT_ENTER_ACCOUNT,
                    ),
                    onChanged: (text) {
                      account = text;
                      print('$account');
                    }),
                const SizedBox(height: 20),
                TextFormField(
                  //是否显示密码类型
                  obscureText: true,
                  controller: controllerPassword,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.lock_outline),
                    labelText: Strings.HINT_ENTER_PASSWORD,
                  ),
                  ///如果想获取到输入框的内容的话，有两种方式，第一种：为该控件设置controller;第二种：重写onChanged方法，在该方法的回调里面赋值变量
                  onChanged: (text) {
                    password = text;
                  },
                ),
                const SizedBox(height: 20),
                Offstage(
                  offstage: !isRegisterState,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: controllerConfirmPassword,
                          obscureText: true,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            icon: Icon(Icons.lock_outline),
                            labelText: Strings.HINT_ENTER_CONFIRM_PASSWORD,
                          ),
                          onChanged: (text) {
                            confirmPassword = text;
                          }),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ///提交部分
  _submitArea(BuildContext context) {
    return Positioned(
      bottom: 20,
      left: 130,
      right: 130,
      child: MaterialButton(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
        ),
        elevation: 5,
        highlightElevation: 10,
        textColor: Colors.white,
        padding: const EdgeInsets.all(0.0),
        onPressed: () {
          if (isRegisterState) {
            _doRegister();
          } else {
            _doLogin();
          }
        },
        child: Container(
          width: 120,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            gradient: LinearGradient(
              colors: <Color>[Colors.greenAccent, Colors.green],
            ),
          ),
          padding: const EdgeInsets.all(10.0),
          child: Text(
            isRegisterState ? Strings.REGISTER : Strings.LOGIN,
            style: const TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }

  _doRegister() {
    print('do register:用户名：$account,密码:$password');
    print('do register controller 用户名：${controllerAccount.text},密码:${controllerPassword.text}');
  }

  _doLogin() {
    print('do login:用户名：$account,密码:$password');
  }
}
