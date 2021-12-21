import 'dart:io';

class Enviroment {
  static String apiUrl =
      Platform.isAndroid ? 'http://192.168.1.67:3002' : 'http://localhost:3002';
  static String socketUrl =
      Platform.isAndroid ? 'http://192.168.67:3002' : 'http://localhost:3002';
}
