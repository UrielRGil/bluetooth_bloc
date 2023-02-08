import 'package:flutter/material.dart';
import 'package:bluetooth_bloc/pages/pages.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> routes = {
    'discover_page': (BuildContext context) => DiscoverPage()
  };
}
