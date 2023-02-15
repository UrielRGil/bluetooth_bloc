part of 'device_bloc.dart';

abstract class DeviceEvent extends Equatable {
  const DeviceEvent();

  @override
  List<Object> get props => [];
}

class OnConnectDeviceEvent extends DeviceEvent {
  final BluetoothDevice device;

  OnConnectDeviceEvent(this.device);
}
