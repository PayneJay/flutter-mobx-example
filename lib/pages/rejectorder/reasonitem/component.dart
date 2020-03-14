import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobx_example/pages/rejectorder/store.dart';
import 'package:flutter_mobx_example/pages/rejectorder/reject_order.dart' show reasons;

import 'store.dart';
import 'view.dart';

class ReasonItemComponent extends StatelessWidget {
  final int index;
  final RejectOrderStore parentStore;

  const ReasonItemComponent({
    Key key,
    @required this.parentStore,
    @required this.index,
  })  : assert(parentStore != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<RejectItemStore>(
      create: (_) => RejectItemStore(),
      child: Builder(
        builder: (context) {
          final store = Provider.of<RejectItemStore>(context);
          store.setReasonOption(reasons[index]);
          return buildView(context, store, parentStore, index);
        },
      ),
    );
  }
}
