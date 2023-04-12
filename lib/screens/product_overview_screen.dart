import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/providers/cart.dart';
import 'package:flutter_complete_guide/widgets/app_drawar.dart';
import 'package:provider/provider.dart';
import '../widgets/badge.dart';
import '../widgets/product_grid.dart';
import 'cart_screen.dart';

enum filterValue { Favorites, All }

class ProductOverviewScreen extends StatefulWidget {
  ProductOverviewScreen({Key key}) : super(key: key);

  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var _showFavorites = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Product OverView"),
          actions: [
            PopupMenuButton(
              onSelected: (filterValue selectedValue) {
                print(selectedValue);
                setState(() {
                  if (selectedValue == filterValue.Favorites) {
                    _showFavorites = true;
                  } else {
                    _showFavorites = false;
                  }
                });
              },
              itemBuilder: (_) => [
                PopupMenuItem(
                  child: Text("Only Favorites"),
                  value: filterValue.Favorites,
                ),
                PopupMenuItem(
                  child: Text("Show All"),
                  value: filterValue.All,
                ),
              ],
              icon: Icon(Icons.more_vert),
            ),
            Consumer<Cart>(
              builder: (_, cart, ch) => Badge1(
                child: ch,
                value: cart.itemCount.toString(),
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(CartScreen.routName);
                },
                icon: Icon(Icons.shopping_cart),
              ),
            ),
          ],
        ),
        drawer: AppDrawer(),
        body: ProductGrids(_showFavorites));
  }
}
