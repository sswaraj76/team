import 'package:flutter/cupertino.dart';

import '../Models/user.dart';

class MemberProvider with ChangeNotifier {
  final List<User> _user = [];

  List<User> get user {
    return [..._user];
  }

  int get size {
    return _user.length;
  }

  void addUser(String name, String mailId, String password) {
    if (_user.isEmpty) {
      _user.insert(
          0,
          User(
            id: DateTime.now().toString(),
            name: name,
            mailId: mailId,
            password: password,
          ));
    } else {
      _user.add(User(
          id: DateTime.now().toString(),
          name: name,
          mailId: mailId,
          password: password));
    }
  }
}
