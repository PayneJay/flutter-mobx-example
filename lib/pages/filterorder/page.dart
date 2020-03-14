import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'view.dart';

import 'store.dart';

class FilterOrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<FilterOrderStore>(
      create: (context) => FilterOrderStore(),
      child: Builder(
        builder: (context) {
          final store = Provider.of<FilterOrderStore>(context);
          return buildView(context, store);
        },
      ),
    );
  }
}
