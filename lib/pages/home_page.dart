import 'package:bluetooth_bloc/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:bluetooth_bloc/cubits/bluetooth_state/bluetooth_state_cubit.dart';
import 'package:bluetooth_bloc/views/views.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blue/flutter_blue.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BluetoothStateCubit, BluetoothStateState>(
      builder: (context, state) {
        if (state.state == BluetoothState.unknown ||
            state.state == BluetoothState.off) {
          return BluetoothOffView();
        }

        return MainPage();
      },
    );
  }
}
