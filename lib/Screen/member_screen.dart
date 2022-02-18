import 'package:flutter/material.dart';

class MemberScreen extends StatelessWidget {
  static const routeName = "/membersScreen";
  const MemberScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView.builder(itemBuilder: (context, i) => Container()),
      ),
    );
  }
}
