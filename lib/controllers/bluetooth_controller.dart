import 'dart:async';

import 'package:flutter_blue/flutter_blue.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class BluetoothController {
  static final BluetoothController _instance = BluetoothController._internal();

  late final FlutterBluetoothSerial _serialInstance;

  late final FlutterBlue _blueInstance;

  factory BluetoothController() {
    return _instance;
  }
  BluetoothController._internal() {
    _serialInstance = FlutterBluetoothSerial.instance;
    _blueInstance = FlutterBlue.instance;
  }

  FlutterBluetoothSerial get serialInstance => _serialInstance;

  FlutterBlue get blueInstance => _blueInstance;
}
