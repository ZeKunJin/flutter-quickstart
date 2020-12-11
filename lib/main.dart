import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import './router/application.dart';
import './router/routes.dart';
import './provider/provider.dart';
import './pages/index_page.dart';

void main() => runApp(useProvider(MyApp()));

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    final router = FluroRouter();
    Routes.defineRoutes(router);
    Application.router = router;

    return MaterialApp(
      title: 'FLUTTER',
      onGenerateRoute: Application.router.generator,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.pink,
        platform: TargetPlatform.iOS,
      ),
      home: IndexPage(),
    );
  }
}
