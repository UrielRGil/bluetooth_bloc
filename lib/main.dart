import 'package:bluetooth_bloc/helpers/routes.dart';
import 'package:flutter/material.dart';
import 'package:bluetooth_bloc/pages/pages.dart';
import 'package:bluetooth_bloc/cubits/cubits.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bluetooth_bloc/controllers/controllers.dart';

import 'blocs/blocs.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DeviceBloc(BluetoothController()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.blue,
        ),
        home: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => BluetoothStateCubit(BluetoothController()),
            ),
          ],
          child: HomePage(),
        ),
      ),
    );
  }
}
