import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'counter.dart';

Widget useProvider(Widget app) {
  return MultiProvider(
    providers: [
      ChangeNotifierProvider<Counter>(create: (_) => Counter()),
    ],
    child: app,
  );
}
