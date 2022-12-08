import 'package:socket_io_client/socket_io_client.dart' as sio;

class SocketClient {
  sio.Socket? socket;
  static SocketClient? _instance;

  SocketClient._internal() {
    socket = sio.io('http://10.0.21.148:3000', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });
    socket!.connect();
  }

  static SocketClient get instance {
    _instance ??= SocketClient._internal();
    return _instance!;
  }
}
