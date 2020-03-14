import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'store.dart';
import 'view.dart';

class OrderListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<OrderListStore>(
      create: (context) => OrderListStore(),
      child: Builder(
        builder: (context) {
          final store = Provider.of<OrderListStore>(context);
          return buildView(context, store);
        },
      ),
    );
  }
}
