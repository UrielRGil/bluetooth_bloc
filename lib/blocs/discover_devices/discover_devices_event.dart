part of 'discover_devices_bloc.dart';

abstract class DiscoverDevicesEvent extends Equatable {
  const DiscoverDevicesEvent();

  @override
  List<Object> get props => [];
}

class OnStartDiscoverDevices extends DiscoverDevicesEvent {}

class OnDiscoverDevicesCompleted extends DiscoverDevicesEvent {
  final List<BluetoothDiscoveryResult> results;

  const OnDiscoverDevicesCompleted(this.results);

  @override
  List<Object> get props => [results];
}
