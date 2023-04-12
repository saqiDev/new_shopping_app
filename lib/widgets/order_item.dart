import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../providers/order.dart' as ord;

class OrderItemO extends StatelessWidget {
  const OrderItemO({
    Key key,
    this.order,
  }) : super(key: key);
  final ord.OrderItem order;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text("\$${order.amount}"),
            subtitle: Text(
              DateFormat("dd MM yyyy hh:mm").format(order.date),
            ),
            trailing:
                IconButton(onPressed: () {}, icon: Icon(Icons.expand_more)),
          ),
        ],
      ),
    );
  }
}
