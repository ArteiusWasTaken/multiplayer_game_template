import 'package:flutter/cupertino.dart';
import 'package:multiplayer_game/provider/room_data_provider.dart';
import 'package:multiplayer_game/resources/socket_client.dart';
import 'package:multiplayer_game/screens/screens.dart';
import 'package:multiplayer_game/utils/utils.dart';
import 'package:provider/provider.dart';

class SocketMethods {
  final _socketClient = SocketClient.instance.socket!;

  void createRoom(String nickname) {
    if (nickname.isNotEmpty) {
      _socketClient.emit('createRoom', {
        'nickname': nickname,
      });
    }
  }

  void joinRoom(String nickname, String roomId) {
    if (nickname.isNotEmpty && roomId.isNotEmpty) {
      _socketClient.emit('joinRoom', {
        'nicname': nickname,
        'roomId': roomId,
      });
    }
  }

  void createRoomSuccessListener(BuildContext context) {
    _socketClient.on('createRoomSuccess', (room) {
      Provider.of<RoomDataProvider>(context, listen: false)
          .updateRoomData(room);
      Navigator.pushNamed(context, GameScreen.routeName);
    });
  }

  void joinRoomSuccessListener(BuildContext context) {
    _socketClient.on('joinRoomSuccess', (room) {
      Provider.of<RoomDataProvider>(context, listen: false)
          .updateRoomData(room);
      Navigator.pushNamed(context, GameScreen.routeName);
    });
  }

  void errorOcurredListener(BuildContext context) {
    _socketClient.on('errorOcurred', (data) {
      showSnackBar(context, data);
    });
  }
}
