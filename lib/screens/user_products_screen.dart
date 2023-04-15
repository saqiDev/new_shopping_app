import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/providers/products_provider.dart';
import 'package:flutter_complete_guide/screens/edit_product_screen.dart';
import 'package:flutter_complete_guide/widgets/app_drawar.dart';
import 'package:flutter_complete_guide/widgets/user_product_item.dart';
import 'package:provider/provider.dart';

class UserProductsScreen extends StatelessWidget {
  static const routName = "/user-products";
  const UserProductsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProductProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Your Products"), actions: [
        IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed(EditProductScreen.routName);
          },
          icon: Icon(Icons.add),
        ),
      ]),
      drawer: AppDrawer(),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
          itemBuilder: (_, i) => Column(
            children: [
              UserProductItem(
                  productsData.item[i].title, productsData.item[i].imageUrl),
              Divider()
            ],
          ),
          itemCount: productsData.item.length,
        ),
      ),
    );
  }
}
