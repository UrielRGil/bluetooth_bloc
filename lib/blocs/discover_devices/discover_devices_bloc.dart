import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bluetooth_bloc/controllers/controllers.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

part 'discover_devices_event.dart';
part 'discover_devices_state.dart';

class DiscoverDevicesBloc
    extends Bloc<DiscoverDevicesEvent, DiscoverDevicesState> {
  final BluetoothController _bluetoothController;
  StreamSubscription<BluetoothDiscoveryResult>? _discoverDevicesSubscription;
  DiscoverDevicesBloc(this._bluetoothController)
      : super(const DiscoverDevicesInitial(
            results: [], status: DiscoverDevicesStatus.initial)) {
    on<DiscoverDevicesEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<OnStartDiscoverDevices>(_onStartDiscoverDevices);
    on<OnDiscoverDevicesCompleted>(_onDiscoverDevicesCompleted);
    on<OnBondNewDeviceEvent>(_onBondNewDeviceEvent);
  }

  void _onBondNewDeviceEvent(
      OnBondNewDeviceEvent event, Emitter<DiscoverDevicesState> emit) async {
    log('Bonding with ${event.device.address}');
    final resp = await _bluetoothController.serialInstance
        .bondDeviceAtAddress(event.device.address);
  }

  void _onStartDiscoverDevices(
    OnStartDiscoverDevices event,
    Emitter<DiscoverDevicesState> emit,
  ) async {
    emit(const DiscoverDevicesChanged(
        status: DiscoverDevicesStatus.finding, results: []));
    List<BluetoothDiscoveryResult> resultDevices = [];
    _discoverDevicesSubscription =
        _bluetoothController.serialInstance.startDiscovery().listen((devices) {
      resultDevices.add(devices);
      log(devices.toString());
    });

    _discoverDevicesSubscription?.onDone(() async {
      add(OnDiscoverDevicesCompleted(resultDevices));
    });
  }

  void _onDiscoverDevicesCompleted(
      OnDiscoverDevicesCompleted event, Emitter<DiscoverDevicesState> emit) {
    emit(DiscoverDevicesChanged(
        status: DiscoverDevicesStatus.complete, results: event.results));
  }
}
