import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import './Screen/entry_screen.dart';
import './Screen/admin_signup_screen.dart';
import './Screen/group_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Team',
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.deepPurple,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.deepPurple),
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
      ),
      home: const EntryScreen(),
      routes: {
        AdminSignUpScreen.routName: (context) => const AdminSignUpScreen(),
        GroupScreen.routName: (context) => const GroupScreen()
      },
    );
  }
}
