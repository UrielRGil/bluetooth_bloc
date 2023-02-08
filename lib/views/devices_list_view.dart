import 'package:flutter/material.dart';
import 'package:bluetooth_bloc/widgets/widgets.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class DevicesListView extends StatelessWidget {
  final List<BluetoothDiscoveryResult> devices;

  const DevicesListView({super.key, required this.devices});
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          final device = devices[index].device;
          final rssi = devices[index].rssi;
          return ResultDeviceTile(
              name: (device.name != null) ? device.name! : '',
              address: device.address,
              rssi: rssi.toString());
        },
        separatorBuilder: (context, index) => const Divider(),
        itemCount: devices.length);
  }
}
