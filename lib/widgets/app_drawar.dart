import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/order_screen.dart';
import 'package:flutter_complete_guide/screens/user_products_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
              title: Text("Hello Flutter Devs"),
              automaticallyImplyLeading: false),
          Divider(),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text("Shop"),
            onTap: () => Navigator.of(context).pushReplacementNamed("/"),
          ),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text("Order"),
            onTap: () => Navigator.of(context)
                .pushReplacementNamed(OrderScreen.routName),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text("Manage Products"),
            onTap: () => Navigator.of(context)
                .pushReplacementNamed(UserProductsScreen.routName),
          ),
        ],
      ),
    );
  }
}
