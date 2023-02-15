part of 'bonded_device_bloc.dart';

abstract class BondedDeviceEvent extends Equatable {
  const BondedDeviceEvent();

  @override
  List<Object> get props => [];
}

class OnGetDevicesEvent extends BondedDeviceEvent {}
