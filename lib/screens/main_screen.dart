import 'package:flutter/material.dart';
import 'package:multiplayer_game/responsive/responsive.dart';
import 'package:multiplayer_game/screens/screens.dart';
import 'package:multiplayer_game/widgets/widgets.dart';

class MainScreen extends StatelessWidget {
  static String routeName = '/main-menu';

  const MainScreen({Key? key}) : super(key: key);

  void createRoom(BuildContext context) {
    Navigator.pushNamed(context, CreateRoomScreen.routeName);
  }

  void joinRoom(BuildContext context) {
    Navigator.pushNamed(context, JoinRoomScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Responsive(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButton(onTap: () => createRoom(context), text: 'Create Room'),
          const SizedBox(height: 25),
          CustomButton(onTap: () => joinRoom(context), text: 'Join Room'),
        ],
      ),
    ));
  }
}
