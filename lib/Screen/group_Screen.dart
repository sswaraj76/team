import 'package:flutter/material.dart';

class GroupScreen extends StatelessWidget {
  static const routName = "/groupscreen";
  const GroupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }
}
