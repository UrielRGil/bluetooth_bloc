import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bluetooth_bloc/blocs/blocs.dart';
import 'package:bluetooth_bloc/widgets/widgets.dart';

class BondedDevicesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.read<BondedDeviceBloc>().add(OnGetDevicesEvent());
    return Scaffold(
      body: BlocBuilder<BondedDeviceBloc, BondedDeviceState>(
        builder: (context, state) {
          if (state.status == BondedDevicesStatus.inital) {
            return const Center(child: Text('Sin dispositivos vinculados'));
          }
          if (state.status == BondedDevicesStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          final devices = state.devices;
          return ListView.separated(
              itemBuilder: (context, index) => BondDeviceTile(
                    device: devices[index],
                    onTap: () {
                      context
                          .read<DeviceBloc>()
                          .add(OnConnectDeviceEvent(devices[index]));
                    },
                  ),
              separatorBuilder: (context, index) => const Divider(),
              itemCount: state.devices.length);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<BondedDeviceBloc>().add(OnGetDevicesEvent());
        },
        child: const Icon(Icons.refresh_rounded),
      ),
    );
  }
}
