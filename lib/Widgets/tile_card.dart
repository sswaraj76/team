import 'package:flutter/material.dart';

import '../Provider/member_provider.dart';
import '../Constants/constants.dart';

class TileCard extends StatelessWidget {
  final String id;
  final MemberProvider data;
  const TileCard({Key? key, required this.id, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const CircleAvatar(
          child: Icon(Icons.group),
          backgroundColor: iconColor,
        ),
        title: Text(
          id,
          style: const TextStyle(color: Colors.white),
        ),
        subtitle: Text(
          "Members: ${data.size.toString()}",
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
