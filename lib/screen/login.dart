import 'package:flutter/material.dart';
import 'package:login_page/main.dart';
import 'package:login_page/screen/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenLogin extends StatefulWidget {
  const ScreenLogin({super.key});

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  final _usernameController = TextEditingController();

  final _passwordController = TextEditingController();

  bool _isDataMatched = true;

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formkey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 73,
                      backgroundColor: Color.fromARGB(255, 194, 118, 208),
                      child: CircleAvatar(
                        backgroundImage: const NetworkImage(
                          "https://i.pinimg.com/550x/5c/fe/ac/5cfeac87e19348960b73795ace5434f2.jpg",
                        ),
                        radius: 70,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.person,
                          color: Colors.purple,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                        hintText: "Username",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Value is Empty";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                        icon: const Icon(
                          Icons.lock,
                          color: Colors.purple,
                        ),
                        hintText: "Password",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Value is Empty";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          checkLogin(context);
                        } else {
                          print("Data Empty");
                        }
                      },
                      icon: Icon(Icons.check_box),
                      label: Text("Login"),
                      style: ElevatedButton.styleFrom(shape: StadiumBorder()),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }

  void checkLogin(BuildContext ctx) async {
    final _username = "jasir";
    final _password = "1234";
    if (_username == _usernameController.text &&
        _password == _passwordController.text) {
      final _sharedprefs = await SharedPreferences.getInstance();
      await _sharedprefs.setBool(Save_Key_Name, true);

      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {
        return ScreenHome();
      }));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Username password desnot match "),
        backgroundColor: Colors.red,
      ));
    }
  }
}
