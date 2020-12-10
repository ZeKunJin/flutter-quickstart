import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import '../pages/product/product_page.dart';

Handler productHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return ProductPage(params['id'].first);
});
