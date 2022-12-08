import 'package:flutter/material.dart';
import 'package:multiplayer_game/provider/room_data_provider.dart';
import 'package:multiplayer_game/screens/create_room_screen.dart';
import 'package:multiplayer_game/screens/game_screen.dart';
import 'package:multiplayer_game/screens/join_room_screen.dart';
import 'package:multiplayer_game/screens/main_screen.dart';
import 'package:multiplayer_game/utils/colors.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RoomDataProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: bgColor,
        ),
        routes: {
          MainMenuScreen.routeName: (context) => const MainMenuScreen(),
          JoinRoomScreen.routeName: (context) => const JoinRoomScreen(),
          CreateRoomScreen.routeName: (context) => const CreateRoomScreen(),
          GameScreen.routeName: (context) => const GameScreen(),
        },
        initialRoute: MainMenuScreen.routeName,
      ),
    );
  }
}
