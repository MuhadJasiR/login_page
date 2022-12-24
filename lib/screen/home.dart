import 'package:flutter/material.dart';
import 'package:login_page/screen/chat.dart';

import 'package:login_page/screen/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Instagram"),
        actions: [
          IconButton(
              onPressed: () {
                signOut(context);
              },
              icon: const Icon(Icons.exit_to_app))
        ],
      ),
      body: SafeArea(
        child: ListView.separated(
            itemBuilder: (ctx, index) {
              return ListTile(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) {
                        return ScreenChat(name: "Person $index");
                      },
                    ),
                  );
                },
                title: Text("Person $index"),
                subtitle: Text("message $index"),
                leading: index.isEven
                    ? CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage(
                            "https://i.pinimg.com/236x/4a/ff/c2/4affc215fcc7abe946bbc6cbdfe08f4f--purple-aesthetic-pastel-purple.jpg"),
                      )
                    : SizedBox(
                        height: 100.0,
                        width: 50,
                        child: Image.network(
                            "https://i.pinimg.com/236x/4a/ff/c2/4affc215fcc7abe946bbc6cbdfe08f4f--purple-aesthetic-pastel-purple.jpg")),
                trailing: Text("$index:00 PM"),
              );
            },
            separatorBuilder: (ctx, index) {
              return const Divider();
            },
            itemCount: 20),
      ),
    );
  }

  signOut(BuildContext ctx) async {
    final _sharedPrefs = await SharedPreferences.getInstance();
    await _sharedPrefs.clear();

    Navigator.of(ctx).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx) => ScreenLogin()), (route) => false);
  }
}
