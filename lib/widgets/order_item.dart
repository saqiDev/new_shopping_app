import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../providers/order.dart';

class OrderItemO extends StatefulWidget {
  const OrderItemO({
    Key key,
    this.order,
  }) : super(key: key);
  final OrderItem order;

  @override
  State<OrderItemO> createState() => _OrderItemOState();
}

class _OrderItemOState extends State<OrderItemO> {
  var _expanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text("\$${widget.order.amount}"),
            subtitle: Text(
              DateFormat("dd/MM/yyyy hh:mm").format(widget.order.date),
            ),
            trailing: IconButton(
                onPressed: () {
                  setState(() {
                    _expanded = !_expanded;
                  });
                },
                icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more)),
          ),
          if (_expanded)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              height: (min(widget.order.products.length * 20.0 + 40, 180)),
              child: ListView(
                children: widget.order.products
                    .map((prod) => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              prod.title,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "\$${prod.price} x ${prod.quantity}",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.grey),
                            ),
                          ],
                        ))
                    .toList(),
              ),
            )
        ],
      ),
    );
  }
}
