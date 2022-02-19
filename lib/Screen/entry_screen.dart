import 'package:flutter/material.dart';

import './admin_signup_screen.dart';
import './log_in.dart';
import '../Widgets/AuthButton.dart';
import '../Widgets/bg_image.dart';

class EntryScreen extends StatelessWidget {
  const EntryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        const BgImage(
          imageUrl:
              'https://images.pexels.com/photos/3184325/pexels-photo-3184325.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
        ),
        SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                ),
                const Text(
                  "Wellcome to our App. Here you can build your team Chat with your Team. Specially for project discussion.",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 20,
                ),
                AuthButton(
                  name: "Sign Up",
                  funtion: () {
                    Navigator.of(context).pushNamed(AdminSignUpScreen.routName);
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                AuthButton(
                  name: "Sign In",
                  funtion: () {
                    Navigator.of(context).pushNamed(LoginPage.routeName);
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}

// "https://images.pexels.com/photos/3182811/pexels-photo-3182811.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260"
// "https://images.pexels.com/photos/1181655/pexels-photo-1181655.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"