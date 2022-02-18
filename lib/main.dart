import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import './Screen/entry_screen.dart';
import './Screen/admin_signup_screen.dart';
import './Screen/group_Screen.dart';
import './Screen/member_screen.dart';
import './Provider/group_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => GroupProvider(),
        ),
      ],
      child: MaterialApp(
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
          GroupScreen.routName: (context) => const GroupScreen(),
          MemberScreen.routeName: (context) => const MemberScreen()
        },
      ),
    );
  }
}
