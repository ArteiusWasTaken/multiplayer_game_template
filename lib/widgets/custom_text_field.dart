import 'package:flutter/material.dart';
import 'package:multiplayer_game/utils/utils.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;

  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(color: Colors.blue, blurRadius: 5, spreadRadius: 2),
      ]),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            fillColor: bgColor, filled: true, hintText: hintText),
      ),
    );
  }
}
