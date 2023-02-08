part of 'bluetooth_state_cubit.dart';

abstract class BluetoothStateState extends Equatable {
  final BluetoothState state;
  const BluetoothStateState({required this.state});

  BluetoothState get actualState => state;

  @override
  List<Object> get props => [state];
}

class BluetoothStateInitial extends BluetoothStateState {
  const BluetoothStateInitial() : super(state: BluetoothState.unknown);
}

class BluetoothStateChanged extends BluetoothStateState {
  final BluetoothState newState;

  const BluetoothStateChanged(this.newState) : super(state: newState);

  @override
  List<Object> get props => [newState];
}
