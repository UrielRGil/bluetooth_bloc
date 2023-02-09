import 'package:bluetooth_bloc/blocs/blocs.dart';
import 'package:bluetooth_bloc/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<ConnectDeviceBloc, ConnectDeviceState>(
            builder: (context, state) {
              if (state.status == ConnectDeviceStatus.connected) {
                return Text('Dispositivo emparejado ${state.device?.address}');
              }
              return const Text('Sin despositivo emparejado');
            },
          ),
          Center(
            child: Text('Bluetooth On'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => DiscoverPage()));
        },
        child: const Icon(Icons.link_sharp),
      ),
    );
  }
}
