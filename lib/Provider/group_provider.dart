import 'package:flutter/foundation.dart';

import '../Models/user.dart';

class GroupProvider with ChangeNotifier {
  final Map<String, List<User>> _groups = {};

  Map<String, List<User>> get groups {
    return {..._groups};
  }

  void addGroup(String groupId, User user) {
    if (_groups.containsKey(groupId)) {
      _groups.update(groupId, (value) {
        value.add(
          User(
              id: groupId,
              name: user.name,
              mailId: user.mailId,
              password: user.password),
        );
        return value;
      });
    } else {
      _groups.putIfAbsent(groupId, () {
        List<User> teamlist = [];
        teamlist.insert(
          0,
          User(
              id: DateTime.now().toString(),
              name: user.name,
              mailId: user.mailId,
              password: user.password),
        );
        return teamlist;
      });
    }
  }
}
