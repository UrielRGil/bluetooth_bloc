import 'package:bloc/bloc.dart';
import 'package:bluetooth_bloc/controllers/controllers.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

part 'bonded_device_event.dart';
part 'bonded_device_state.dart';

class BondedDeviceBloc extends Bloc<BondedDeviceEvent, BondedDeviceState> {
  final BluetoothController _blueController;
  BondedDeviceBloc(this._blueController)
      : super(const BondedDeviceState(
            status: BondedDevicesStatus.inital, devices: [])) {
    on<OnGetDevicesEvent>(_onGetDevicesEvent);
  }

  void _onGetDevicesEvent(
      OnGetDevicesEvent event, Emitter<BondedDeviceState> emit) async {
    emit(state.copyWith(BondedDevicesStatus.loading, []));

    final devices = await _blueController.serialInstance.getBondedDevices();

    if (devices.isNotEmpty) {
      emit(state.copyWith(BondedDevicesStatus.complete, devices));
    } else {
      emit(state.copyWith(BondedDevicesStatus.inital, []));
    }
  }
}
