import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'store.dart';
import 'view.dart';

class WorkBenchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<WorkbenchStore>(
      create: (context) => WorkbenchStore(),
      child: Builder(
        builder: (context) {
          final store = Provider.of<WorkbenchStore>(context);
          return buildView(context, store);
        },
      ),
    );
  }

}