part of 'connect_device_bloc.dart';

enum ConnectDeviceStatus { initial, connecting, connected, error }

abstract class ConnectDeviceState extends Equatable {
  final ConnectDeviceStatus status;
  final BluetoothDevice? device;
  const ConnectDeviceState({required this.status, this.device});

  @override
  List<Object?> get props => [status, device];
}

class ConnectDeviceInitial extends ConnectDeviceState {
  const ConnectDeviceInitial({required super.status, super.device});
}

class DeviceState extends ConnectDeviceState {
  final ConnectDeviceStatus status;
  final BluetoothDevice? device;

  DeviceState({required this.status, required this.device})
      : super(status: status, device: device);

  @override
  List<Object?> get props => [status, device];
}
