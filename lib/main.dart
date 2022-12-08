import 'package:flutter/material.dart';
import 'package:multiplayer_game/provider/room_data_provider.dart';
import 'package:multiplayer_game/screens/screens.dart';
import 'package:multiplayer_game/utils/colors.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RoomDataProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: bgColor),
        routes: {
          MainScreen.routeName: (context) => const MainScreen(),
          JoinRoomScreen.routeName: (context) => const JoinRoomScreen(),
          CreateRoomScreen.routeName: (context) => const CreateRoomScreen(),
          GameScreen.routeName: (context) => const GameScreen()
        },
        initialRoute: MainScreen.routeName,
      ),
    );
  }
}
