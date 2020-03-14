import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'store.dart';
import 'effect.dart';

Widget buildView(BuildContext context, WorkbenchStore store) {
  return Scaffold(
    appBar: AppBar(
      title: Text('工作台')
    ),
    body: Container(
      color: Colors.blue[100],
      alignment: Alignment.center,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          IconButton(
            onPressed: () => handleButtonPress(context, store),
            icon: Icon(Icons.add),
          ),
          Observer(
            builder: (_) => Text(
              store.count.toString()
            ),
          )
        ],
      )
    ),
  );
}