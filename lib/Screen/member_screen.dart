import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/group_provider.dart';

class MemberScreen extends StatelessWidget {
  static const routeName = "/membersScreen";
  final String id;
  const MemberScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final id = ModalRoute.of(context)!.settings.arguments as String;
    final data = Provider.of<GroupProvider>(context).groups;
    final item = data[id];

    return Scaffold(
      appBar: AppBar(
        title: Text(id),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10),
          itemBuilder: (context, index) => Material(
            color: Colors.blueGrey,
            elevation: 5,
            borderRadius: BorderRadius.circular(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.account_circle,
                  size: 50,
                ),
                Text(
                  item!.user[index].name,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
          itemCount: item!.size,
        ),
      ),
    );
  }
}
