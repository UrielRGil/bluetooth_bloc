import 'package:flutter/material.dart';
import 'package:bluetooth_bloc/blocs/blocs.dart';
import 'package:bluetooth_bloc/controllers/controllers.dart';
import 'package:bluetooth_bloc/views/views.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DiscoverPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<DiscoverDevicesBloc>(
      create: (context) => DiscoverDevicesBloc(BluetoothController()),
      child: const _DiscoverPageBody(),
    );
  }
}

class _DiscoverPageBody extends StatelessWidget {
  const _DiscoverPageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    context.read<DiscoverDevicesBloc>().add(OnStartDiscoverDevices());
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<DiscoverDevicesBloc, DiscoverDevicesState>(
          builder: (context, state) {
            if (state.status == DiscoverDevicesStatus.finding) {
              return const Text('Buscando dispositivos');
            } else {
              return const Text('Dispositivos encontrados');
            }
          },
        ),
        elevation: 8,
      ),
      body: BlocBuilder<DiscoverDevicesBloc, DiscoverDevicesState>(
        builder: (context, state) {
          if (state.status == DiscoverDevicesStatus.finding) {
            return const Center(child: CircularProgressIndicator());
          }
          return DevicesListView(devices: state.results);
        },
      ),
      floatingActionButton: const _startDiscoverButton(),
    );
  }
}

class _startDiscoverButton extends StatelessWidget {
  const _startDiscoverButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        context.read<DiscoverDevicesBloc>().add(OnStartDiscoverDevices());
      },
      child: BlocBuilder<DiscoverDevicesBloc, DiscoverDevicesState>(
        builder: (context, state) {
          if (state.status != DiscoverDevicesStatus.finding) {
            return const Icon(Icons.stop_rounded);
          } else {
            return const Icon(Icons.replay_rounded);
          }
        },
      ),
    );
  }
}
