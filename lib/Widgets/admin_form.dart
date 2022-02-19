import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Widgets/AuthButton.dart';
import '../Models/user.dart';
import '../Provider/group_provider.dart';
import '../Widgets/text_field_container.dart';
import '../Screen/group_Screen.dart';
import '../Constants/constants.dart';
import '../Screen/log_in.dart';

class AdminForm extends StatefulWidget {
  const AdminForm({
    Key? key,
  }) : super(key: key);

  @override
  State<AdminForm> createState() => _AdminFormState();
}

class _AdminFormState extends State<AdminForm> {
  final _formKey = GlobalKey<FormState>();
  var _editedUser = User(id: null, name: "", mailId: "", password: '');
  var _groupId = "";
  bool _showPass = true;

  void _savedForm() {
    var isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();
    Provider.of<GroupProvider>(context, listen: false)
        .addGroup(_groupId, _editedUser);

    Navigator.of(context).pushNamed(GroupScreen.routName);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Sign Up",
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        const SizedBox(
          height: 20,
        ),
        Form(
          key: _formKey,
          child: Column(
            children: [
              TextFieldContainer(
                child: TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(
                      Icons.account_circle,
                      color: Color(0xFF6A2C70),
                    ),
                    hintStyle:
                        TextStyle(color: Color.fromARGB(255, 199, 134, 206)),
                    border: InputBorder.none,
                    hintText: "Name",
                  ),
                  textInputAction: TextInputAction.next,
                  onSaved: (val) {
                    _editedUser = User(
                        id: null,
                        name: val!,
                        mailId: _editedUser.mailId,
                        password: _editedUser.password);
                  },
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Please enter your name";
                    }

                    if (val.contains(RegExp(r'[0-9]'))) {
                      return "Please add only alphabets";
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
                  onSaved: (val) {
                    _editedUser = User(
                        id: null,
                        name: _editedUser.name,
                        mailId: val!,
                        password: _editedUser.password);
                  },
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
                  onSaved: (val) {
                    _editedUser = User(
                        id: null,
                        name: _editedUser.name,
                        mailId: _editedUser.mailId,
                        password: val!);
                  },
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
              TextFieldContainer(
                child: TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(
                      Icons.password,
                      color: Color(0xFF6A2C70),
                    ),
                    hintStyle:
                        TextStyle(color: Color.fromARGB(255, 199, 134, 206)),
                    border: InputBorder.none,
                    hintText: "PassKey(Optional)",
                  ),
                  onFieldSubmitted: (_) => _savedForm(),
                  onSaved: (val) {
                    if (val!.isEmpty) {
                      _groupId = DateTime.now().toString();
                    } else {
                      _groupId = val;
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
        AuthButton(name: "Sign Up", funtion: _savedForm),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Already have Account?",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            TextButton(
              child: const Text(
                "Log In",
                style: TextStyle(color: btnColor, fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                Navigator.of(context).pushReplacementNamed(LoginPage.routeName);
              },
            ),
          ],
        )
      ],
    );
  }
}
