part of 'connect_device_bloc.dart';

abstract class ConnectDeviceEvent extends Equatable {
  const ConnectDeviceEvent();

  @override
  List<Object> get props => [];
}

class OnConnectDevice extends ConnectDeviceEvent {
  final BluetoothDevice device;

  const OnConnectDevice(this.device);

  @override
  List<Object> get props => [device];
}
