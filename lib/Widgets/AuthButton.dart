import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final String name;
  final VoidCallback funtion;
  const AuthButton({
    Key? key,
    required this.name,
    required this.funtion,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      textColor: Colors.white,
      color: Colors.deepPurple,
      onPressed: funtion,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        child: Text(
          name,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
