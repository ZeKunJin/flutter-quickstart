import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'counter.dart';
import 'tabbar_state.dart';

Widget useProvider(Widget app) {
  return MultiProvider(
    providers: [
      ChangeNotifierProvider<Counter>(create: (_) => Counter()),
      ChangeNotifierProvider<TabbarState>(create: (_) => TabbarState()),
    ],
    child: app,
  );
}
