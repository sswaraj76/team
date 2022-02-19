import 'package:flutter/material.dart';

import '../Widgets/bg_image.dart';

import '../Widgets/admin_form.dart';

class AdminSignUpScreen extends StatelessWidget {
  static const routName = "/AdminSignUpScreen";
  const AdminSignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BgImage(
              imageUrl:
                  "https://images.pexels.com/photos/3182811/pexels-photo-3182811.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260"),
          SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
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
                        child: AdminForm(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}







// "https://images.pexels.com/photos/3182811/pexels-photo-3182811.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260"
//"https://images.pexels.com/photos/4534788/pexels-photo-4534788.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"
// "https://images.pexels.com/photos/1181655/pexels-photo-1181655.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"