import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import '../Screen/member_screen.dart';
import '../Screen/chat_screen.dart';
import '../Constants/constants.dart';

class SelectionScreen extends StatefulWidget {
  static const routeName = "/selectionscreen";
  const SelectionScreen({Key? key}) : super(key: key);

  @override
  State<SelectionScreen> createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  var ind = 0;
  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments as String;
    final screens = [
      MemberScreen(
        id: id,
      ),
      const ChatScreen()
    ];
    final navIcons = <Widget>[const Icon(Icons.group), const Icon(Icons.chat)];
    return Scaffold(
      body: screens[ind],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        index: ind,
        animationDuration: const Duration(milliseconds: 300),
        items: navIcons,
        color: btnColor,
        height: 60,
        onTap: (val) {
          setState(() {
            ind = val;
          });
        },
      ),
    );
  }
}
