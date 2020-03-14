import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobx_example/widgets/common_option.dart';

import 'store.dart';
import 'view.dart';

Provider<PickerStore> buildProvider(
    List<CommonOption> opts, int index, Function callback) {
  return Provider<PickerStore>(
    create: (context) => PickerStore(),
    child: Builder(
      builder: (context) {
        final store = Provider.of<PickerStore>(context);
        store.opts = opts;
        store.setSelectIndex(index);
        return buildView(context, store, callback);
      },
    ),
  );
}
