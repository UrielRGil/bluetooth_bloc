import 'package:flutter/material.dart';

class ResultDeviceTile extends StatelessWidget {
  final String name;
  final String address;
  final String rssi;

  const ResultDeviceTile(
      {super.key,
      required this.name,
      required this.address,
      required this.rssi});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name),
      subtitle: Text(address),
      onTap: () {},
      onLongPress: () {},
    );
  }
}
