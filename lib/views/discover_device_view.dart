import 'package:bluetooth_bloc/blocs/blocs.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/widgets.dart';

class DiscoverDevicesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.read<DiscoverDevicesBloc>().add(OnStartDiscoverDevices());
    return Scaffold(
      body: BlocBuilder<DiscoverDevicesBloc, DiscoverDevicesState>(
        builder: (context, state) {
          if (state.status == DiscoverDevicesStatus.initial) {
            return const Center(child: Text('Sin dispositivos'));
          } else if (state.status == DiscoverDevicesStatus.finding) {
            return const Center(child: CircularProgressIndicator());
          }

          final devices = state.results;

          return ListView.separated(
              itemBuilder: (context, index) {
                final device = devices[index];
                return ResultDeviceTile(
                  name: device.device.name ?? '',
                  address: device.device.address,
                  rssi: device.rssi.toString(),
                  onTap: () {
                    context
                        .read<DiscoverDevicesBloc>()
                        .add(OnBondNewDeviceEvent(device.device));
                  },
                );
              },
              separatorBuilder: (context, index) => const Divider(),
              itemCount: devices!.length);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<DiscoverDevicesBloc>().add(OnStartDiscoverDevices());
        },
        child: const Icon(Icons.refresh_rounded),
      ),
    );
  }
}
