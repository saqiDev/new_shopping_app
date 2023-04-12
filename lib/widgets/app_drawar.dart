import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  static const routName = "/orders";
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
            onTap: () =>
                Navigator.of(context).pushReplacementNamed(AppDrawer.routName),
          ),
        ],
      ),
    );
  }
}
