import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  final String id;
  ProductPage(this.id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('PRODUCT')),
      body: Center(
        child: Text('product id: $id'),
      ),
    );
  }
}
