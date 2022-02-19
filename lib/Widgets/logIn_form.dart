import 'package:flutter/material.dart';
import 'package:team/Constants/constants.dart';

import '../Widgets/AuthButton.dart';
import '../Widgets/text_field_container.dart';
import '../Screen/admin_signup_screen.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  var _showPass = true;

  void _savedForm() {
    var isvalid = _formKey.currentState!.validate();
    if (isvalid) {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Login",
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        const SizedBox(
          height: 20,
        ),
        Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              TextFieldContainer(
                child: TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(
                      Icons.mail,
                      color: Color(0xFF6A2C70),
                    ),
                    hintStyle:
                        TextStyle(color: Color.fromARGB(255, 199, 134, 206)),
                    border: InputBorder.none,
                    hintText: "Email",
                  ),
                  textInputAction: TextInputAction.next,
                  onSaved: (val) {},
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Please enter a Password";
                    }
                    if (!val.contains('@')) {
                      return "Please enter valid Mail";
                    }
                    if (!val.contains(
                        RegExp(r"^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$"))) {
                      return "Please enter valid email";
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFieldContainer(
                child: TextFormField(
                  obscureText: _showPass,
                  decoration: InputDecoration(
                    icon: const Icon(
                      Icons.lock,
                      color: Color(0xFF6A2C70),
                    ),
                    hintStyle: const TextStyle(
                        color: Color.fromARGB(255, 199, 134, 206)),
                    border: InputBorder.none,
                    hintText: "Password",
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _showPass = !_showPass;
                        });
                      },
                      child: Icon(
                        _showPass ? Icons.visibility : Icons.visibility_off,
                        color: const Color(0xFF6A2C70),
                      ),
                    ),
                  ),
                  onFieldSubmitted: (_) => _savedForm(),
                  onSaved: (val) {},
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Please enter a Password";
                    }
                    if (val.length < 8) {
                      return "Password of atlest 8 character";
                    }
                    if (!val.contains(RegExp(
                        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$'))) {
                      return "Please add a Number and Characters";
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        AuthButton(name: "Sign Up", funtion: _savedForm),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Want to Register?",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            TextButton(
              child: const Text(
                "Sign Up",
                style: TextStyle(color: btnColor, fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                Navigator.of(context)
                    .pushReplacementNamed(AdminSignUpScreen.routName);
              },
            ),
          ],
        )
      ],
    );
  }
}
