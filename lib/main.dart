import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';
import './router/routes.dart';
import './router/application.dart';
import './pages/index_page.dart';
import './provider/counter.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<Counter>(create: (context) => Counter()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    final router = FluroRouter();
    Routes.defineRoutes(router);
    Application.router = router;

    return MaterialApp(
      title: 'FLUTTER',
      onGenerateRoute: Application.router.generator,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.pink),
      home: IndexPage(),
    );
  }
}
