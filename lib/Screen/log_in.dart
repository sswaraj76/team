import 'package:flutter/material.dart';

import '../Widgets/bg_image.dart';
import '../Widgets/logIn_form.dart';

class LoginPage extends StatelessWidget {
  static const routeName = "/loginpage";
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        const BgImage(
            imageUrl:
                "https://images.pexels.com/photos/2246476/pexels-photo-2246476.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"),
        SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.25,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Material(
                    elevation: 5,
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(20),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                      child: LoginForm(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
