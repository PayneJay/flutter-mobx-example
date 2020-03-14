import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobx_example/pages/orderlist/item_entity.dart';

import 'store.dart';
import 'view.dart';

class OrderItemComponent extends StatelessWidget {
  final int status;
  final ItemEntity entity;

  const OrderItemComponent({
    Key key,
    @required this.status,
    @required this.entity,
  })  : assert(entity != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<OrderItemStore>(
      create: (context) => OrderItemStore(),
      child: Builder(
        builder: (context) {
          final store = Provider.of<OrderItemStore>(context);
          store.changeOrderStatus(status);
          store.itemEntity = entity;
          return buildView(context, store);
        },
      ),
    );
  }
}
