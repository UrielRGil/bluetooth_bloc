import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class BondDeviceTile extends StatelessWidget {
  final BluetoothDevice device;
  final VoidCallback? onTap;
  const BondDeviceTile({super.key, required this.device, this.onTap});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(device.name == null ? device.address : device.name!),
      subtitle: Text(device.isConnected ? 'Conectado' : 'Desconectado'),
      trailing: Icon(
          device.isConnected ? Icons.link_rounded : Icons.link_off_rounded),
      onTap: onTap,
    );
  }
}
