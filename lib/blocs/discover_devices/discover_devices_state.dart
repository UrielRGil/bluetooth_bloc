part of 'discover_devices_bloc.dart';

enum DiscoverDevicesStatus { initial, finding, complete, error }

abstract class DiscoverDevicesState extends Equatable {
  final List<BluetoothDiscoveryResult>? results;
  final DiscoverDevicesStatus status;
  const DiscoverDevicesState({this.results, required this.status});

  @override
  List<Object?> get props => [results, status];
}

class DiscoverDevicesInitial extends DiscoverDevicesState {
  const DiscoverDevicesInitial({required super.results, required super.status});
}

class DiscoverDevicesChanged extends DiscoverDevicesState {
  final DiscoverDevicesStatus status;
  final List<BluetoothDiscoveryResult> results;

  const DiscoverDevicesChanged({required this.status, required this.results})
      : super(results: results, status: status);

  @override
  List<Object> get props => [status, results];
}
