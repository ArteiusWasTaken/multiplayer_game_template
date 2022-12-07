import 'package:flutter/material.dart';
import 'package:multiplayer_game/responsive/responsive.dart';
import 'package:multiplayer_game/widgets/widgets.dart';

class JoinRoomScreen extends StatefulWidget {
  static String routeName = '/join-room';

  const JoinRoomScreen({Key? key}) : super(key: key);

  @override
  State<JoinRoomScreen> createState() => _JoinRoomScreenState();
}

class _JoinRoomScreenState extends State<JoinRoomScreen> {
  final TextEditingController _gameIdController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _gameIdController.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Responsive(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomText(
                shadows: [Shadow(blurRadius: 40, color: Colors.blue)],
                text: 'Join Room',
                fontSize: 70,
              ),
              SizedBox(height: size.height * 0.08),
              CustomTextField(
                  hintText: 'Enter your Nickname', controller: _nameController),
              const SizedBox(height: 20),
              CustomTextField(
                  hintText: 'Enter game ID', controller: _gameIdController),
              SizedBox(height: size.height * 0.045),
              CustomButton(onTap: () {}, text: 'Join')
            ],
          ),
        ),
      ),
    );
  }
}
