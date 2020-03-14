import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../common_option.dart';
import 'store.dart';
import 'view.dart';

class AssignDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<AssignStore>(
      create: (context) => AssignStore(),
      child: Builder(
        builder: (context) {
          final store = Provider.of<AssignStore>(context);
          store.clearList();
          return buildView(context, store);
        },
      ),
    );
  }
}

const List<CommonOption> rooms = [
  const CommonOption(name: '房间1', id: 1),
  const CommonOption(name: '房间房间2', id: 2),
  const CommonOption(name: '房间房间房间3', id: 3),
  const CommonOption(name: '房间房间4', id: 4),
  const CommonOption(name: '房间5', id: 5),
  const CommonOption(name: '房间房间6', id: 6),
  const CommonOption(name: '房间房间房间房间7', id: 7),
  const CommonOption(name: '房间8', id: 8),
];
