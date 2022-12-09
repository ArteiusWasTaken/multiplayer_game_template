import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketClient {
  IO.Socket? socket;
  static SocketClient? _instance;

  SocketClient._internal() {
    socket =
        IO.io('https://multiplayer-game-ashen.vercel.app', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });
    print(socket!);
    socket!.connect();
  }

  static SocketClient get instance {
    _instance ??= SocketClient._internal();
    return _instance!;
  }
}
