import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bluetooth_bloc/controllers/controllers.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_blue/flutter_blue.dart';

part 'bluetooth_state_state.dart';

class BluetoothStateCubit extends Cubit<BluetoothStateState> {
  final BluetoothController _bluetoothController;
  StreamSubscription<BluetoothState>? _bluetoothState;
  BluetoothStateCubit(this._bluetoothController)
      : super(const BluetoothStateInitial()) {
    _bluetoothState = _bluetoothController.blueInstance.state.listen((state) {
      if (state != this.state.state) {
        emit(BluetoothStateChanged(state));
      }
    });
  }

  @override
  Future<void> close() {
    _bluetoothState?.cancel();
    return super.close();
  }
}
