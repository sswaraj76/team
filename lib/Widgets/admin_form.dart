import 'package:flutter/material.dart';

import '../Widgets/AuthButton.dart';
import '../Models/user.dart';

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
    _formKey.currentState!.save();
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
                  onSaved: (val) {
                    _editedUser = User(
                        id: null,
                        name: _editedUser.name,
                        mailId: _editedUser.mailId,
                        password: val!);
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
                    hintText: "PassKey",
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
        AuthButton(name: "Sign Up", funtion: _savedForm)
      ],
    );
  }
}

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: const Color(0xfff1e6ff),
      ),
      child: child,
    );
  }
}
