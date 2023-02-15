part of 'bonded_device_bloc.dart';

enum BondedDevicesStatus { inital, loading, complete, error }

class BondedDeviceState extends Equatable {
  final BondedDevicesStatus status;
  final List<BluetoothDevice> devices;
  const BondedDeviceState({required this.status, required this.devices});

  BondedDeviceState copyWith(
          BondedDevicesStatus? status, List<BluetoothDevice>? devices) =>
      BondedDeviceState(
          status: status ?? status!, devices: devices ?? devices!);

  @override
  List<Object> get props => [status, devices];
}
