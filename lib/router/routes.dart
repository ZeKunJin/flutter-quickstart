import 'package:fluro/fluro.dart';
import 'router_handlers.dart';

class Routes {
  static String root = '/';
  static String product = '/product';

  static void defineRoutes(FluroRouter router) {
    router.define(product, handler: productHandler);
  }
}
