import 'package:flutter/foundation.dart';

import '../Models/user.dart';
import '../Provider/member_provider.dart';

class GroupProvider with ChangeNotifier {
  final Map<String, MemberProvider> _groups = {};

  Map<String, MemberProvider> get groups {
    return {..._groups};
  }

  void addGroup(String groupId, User user) {
    if (_groups.containsKey(groupId)) {
      _groups.update(groupId, (value) {
        value.addUser(user.name, user.mailId, user.password);
        return value;
      });
    } else {
      _groups.putIfAbsent(
        groupId,
        () {
          MemberProvider? value = MemberProvider();
          value.addUser(user.name, user.mailId, user.password);

          return value;
        },
      );
    }
  }
}
