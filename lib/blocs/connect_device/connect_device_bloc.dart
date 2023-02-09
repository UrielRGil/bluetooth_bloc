import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bluetooth_bloc/controllers/controllers.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

part 'connect_device_event.dart';
part 'connect_device_state.dart';

class ConnectDeviceBloc extends Bloc<ConnectDeviceEvent, ConnectDeviceState> {
  final BluetoothController _blueController;
  ConnectDeviceBloc(this._blueController)
      : super(const ConnectDeviceInitial(
            status: ConnectDeviceStatus.initial, device: null)) {
    on<ConnectDeviceEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<OnConnectDevice>(_onConnectDevice);
  }

  void _onConnectDevice(
      OnConnectDevice event, Emitter<ConnectDeviceState> emit) async {
    emit(DeviceState(status: ConnectDeviceStatus.connecting, device: null));

    final bondedStatus = await _blueController.serialInstance
        .getBondStateForAddress(event.device.address);

    if (bondedStatus.isBonded) {
      emit(DeviceState(
          status: ConnectDeviceStatus.connected, device: event.device));
    } else {
      final bonded = await _blueController.serialInstance
          .bondDeviceAtAddress(event.device.address);

      if (bonded != null && bonded) {
        emit(DeviceState(
            status: ConnectDeviceStatus.connected, device: event.device));
      } else {
        emit(DeviceState(status: ConnectDeviceStatus.error, device: null));
      }
    }
  }
}
