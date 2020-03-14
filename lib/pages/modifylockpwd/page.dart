import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'store.dart';
import 'view.dart';

class ModifyLockPwdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<ModifyLockPwdStore>(
      create: (context) => ModifyLockPwdStore(),
      child: Builder(
        builder: (context) {
          final store = Provider.of<ModifyLockPwdStore>(context);
          store.setChecked(true);
          return buildView(context, store);
        },
      ),
    );
  }
}
