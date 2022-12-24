import 'package:flutter/material.dart';

import 'package:flutter/src/widgets/framework.dart';

class ScreenChat extends StatelessWidget {
  final String name;

  const ScreenChat({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(
              "https://i.pinimg.com/236x/4a/ff/c2/4affc215fcc7abe946bbc6cbdfe08f4f--purple-aesthetic-pastel-purple.jpg"),
        ),
        title: Text(name),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text("Message will show here"),
            TextField(
              decoration: InputDecoration(
                  icon: Icon(
                    Icons.send,
                    color: Colors.purple,
                    size: 10,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                  hintText: "Send Message"),
            ),
          ],
        ),
      )),
    );
  }
}
