import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bluetooth_bloc/controllers/controllers.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

part 'device_event.dart';
part 'device_state.dart';

class DeviceBloc extends Bloc<DeviceEvent, DeviceState> {
  final BluetoothController _blueController;
  BluetoothConnection? _deviceConnection;

  late final BluetoothConnection _connection;
  DeviceBloc(this._blueController)
      : super(const DeviceInitial(status: DeviceStatus.disconnected)) {
    on<DeviceEvent>((event, emit) {});
    on<OnConnectDeviceEvent>(_onConnectDeviceEvent);
  }

  void _onConnectDeviceEvent(
      OnConnectDeviceEvent event, Emitter<DeviceState> emit) async {
    log('Connecting with ${event.device.address}');
    try {
      _connection = await BluetoothConnection.toAddress(event.device.address);

      if (_connection.isConnected) {
        log('Connected to device: ${event.device.address}');
      }
    } catch (e) {
      log('Cannot connect, exception occured\n${e.toString()}');
    }
  }
}
