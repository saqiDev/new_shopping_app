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
      body: Column(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            child: Image.network(
              lodedData.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 12),
          Text("\$${lodedData.price}",
              style: TextStyle(fontSize: 20, color: Colors.grey)),
          SizedBox(height: 12),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              lodedData.description,
              textAlign: TextAlign.center,
              softWrap: true,
            ),
          )
        ],
      ),
    );
  }
}
