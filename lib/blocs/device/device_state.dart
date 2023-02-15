part of 'device_bloc.dart';

enum DeviceStatus { connected, disconnected, error }

abstract class DeviceState extends Equatable {
  final DeviceStatus status;
  final BluetoothDevice? device;
  const DeviceState({required this.status, this.device});

  @override
  List<Object?> get props => [status, device];
}

class DeviceInitial extends DeviceState {
  const DeviceInitial({required super.status});
}

class DeviceStateChanged extends DeviceState {
  final DeviceStatus newStatus;
  final BluetoothDevice? d;

  const DeviceStateChanged({required this.newStatus, required this.d})
      : super(status: newStatus, device: d);

  @override
  List<Object?> get props => [newStatus, d];
}
