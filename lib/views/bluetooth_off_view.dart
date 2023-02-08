import 'package:flutter/material.dart';

class BluetoothOffView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.bluetooth_disabled_rounded,
              size: 100,
              color: Colors.blueGrey.shade400,
            ),
            const Text('El bluetooth esta apagado'),
            const SizedBox(height: 15),
            const Text('Por favor encienda el bluetooth')
          ],
        ),
      ),
    );
  }
}
