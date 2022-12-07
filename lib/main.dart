import 'package:flutter/material.dart';
import 'package:multiplayer_game/screens/create_room_screen.dart';
import 'package:multiplayer_game/screens/join_room_screen.dart';

import 'package:multiplayer_game/screens/screens.dart';
import 'package:multiplayer_game/utils/utils.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: bgColor),
      routes: {
        MainScreen.routeName: (context) => const MainScreen(),
        JoinRoomScreen.routeName: (context) => const JoinRoomScreen(),
        CreateRoomScreen.routeName: (context) => const CreateRoomScreen()
      },
      initialRoute: MainScreen.routeName,
    );
  }
}
