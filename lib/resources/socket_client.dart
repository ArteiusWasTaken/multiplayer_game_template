import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketClient {
  IO.Socket? socket;
  static SocketClient? _instance;

  SocketClient._internal() {
    socket = IO.io(
        'http://mpserver-env.eba-4wzp3wvp.us-east-2.elasticbeanstalk.com/',
        <String, dynamic>{
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
