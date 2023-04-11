import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/providers/products_provider.dart';
import 'package:provider/provider.dart';

class ProductDetailsScreen extends StatelessWidget {
  @override
  static const routeName = "product-details";
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;
    final lodedData = Provider.of<ProductProvider>(context, listen: false)
        .findById(productId);

    return Scaffold(
      appBar: AppBar(title: Text(lodedData.title)),
    );
  }
}
