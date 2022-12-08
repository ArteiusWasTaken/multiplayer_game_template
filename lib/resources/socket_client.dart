import 'package:socket_io_client/socket_io_client.dart' as io;

class SocketClient {
  io.Socket? socket;
  static SocketClient? _instance;

  SocketClient._intetnal() {
    socket = io.io('http://10.0.21.148:3000', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });
    socket!.connect();
  }
  static SocketClient get instance {
    _instance ??= SocketClient._intetnal();
    return _instance!;
  }
}
