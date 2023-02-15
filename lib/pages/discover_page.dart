import 'package:flutter/material.dart';
import 'package:bluetooth_bloc/blocs/blocs.dart';
import 'package:bluetooth_bloc/views/views.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bluetooth_bloc/controllers/bluetooth_controller.dart';

class DiscoverPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DiscoverDevicesBloc(BluetoothController()),
        ),
        BlocProvider(
          create: (context) => BondedDeviceBloc(BluetoothController()),
        ),
      ],
      child: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              bottom: const TabBar(
                tabs: [
                  Tab(
                    icon: Icon(Icons.devices),
                    text: 'Vinculados',
                  ),
                  Tab(
                    icon: Icon(Icons.search_rounded),
                    text: 'Buscar',
                  )
                ],
              ),
              title: const Text('Dispositivos'),
              elevation: 8,
            ),
            body: TabBarView(
                children: [BondedDevicesView(), DiscoverDevicesView()]),
          )),
    );
  }
}
