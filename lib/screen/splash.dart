import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:login_page/main.dart';
import 'package:login_page/screen/home.dart';
import 'package:login_page/screen/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    CheckUserLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Image.network(
            "https://png.pngtree.com/png-vector/20221018/ourmid/pngtree-login_page-icon-png-image_6315974.png",
            height: 130,
          )),
        ],
      ),
    );
  }

  Future<void> gotoLogin() async {
    await Future.delayed(Duration(seconds: 2));
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (ctx) => ScreenLogin(),
      ),
    );
  }

  Future<void> CheckUserLogin() async {
    final _sharedprefs = await SharedPreferences.getInstance();

    final _userLoggedIn = _sharedprefs.getBool(Save_Key_Name);
    if (_userLoggedIn == null || _userLoggedIn == false) {
      gotoLogin();
    } else {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (ctx) => ScreenHome()));
    }
  }
}
