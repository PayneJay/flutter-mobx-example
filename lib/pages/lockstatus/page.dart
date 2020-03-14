import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobx_example/pages/lockstatus/store.dart';

import 'view.dart';

class LockStatusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<LockStatusStore>(
      create: (context) => LockStatusStore(),
      child: Builder(
        builder: (context) {
          final store = Provider.of<LockStatusStore>(context);
          store.isClean = false;
          return buildView(context, store);
        },
      ),
    );
  }
}
