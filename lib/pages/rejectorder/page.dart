import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'reject_order.dart' show reasons;

import 'store.dart';
import 'view.dart';

class RejectOrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<RejectOrderStore>(
      create: (context) => RejectOrderStore(),
      child: Builder(
        builder: (context) {
          final store = Provider.of<RejectOrderStore>(context);
          store.setGroupValue(reasons[0]);
          store.setOtherReason('');
          return buildView(context, store);
        },
      ),
    );
  }
}
