import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'store.dart';
import 'view.dart';

class SearchPopup extends Dialog {
  @override
  Widget build(BuildContext context) {
    return Provider<SearchStore>(
      create: (_) => SearchStore(),
      child: Builder(
        builder: (context) {
          final store = Provider.of<SearchStore>(context);
          return buildView(context, store);
        },
      ),
    );
  }
}
