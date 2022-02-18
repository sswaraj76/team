import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/group_provider.dart';
import '../Widgets/tile_card.dart';
import '../Screen/member_screen.dart';

class GroupScreen extends StatelessWidget {
  static const routName = "/groupscreen";
  const GroupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final groupData = Provider.of<GroupProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
          itemBuilder: (context, index) => InkWell(
            onTap: () =>
                Navigator.of(context).pushNamed(MemberScreen.routeName),
            child: TileCard(
              id: groupData.groups.keys.toList()[index],
              data: groupData.groups.values.toList()[index],
            ),
          ),
          itemCount: groupData.groups.length,
        ),
      ),
    );
  }
}
