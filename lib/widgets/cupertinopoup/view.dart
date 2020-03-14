import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx_example/helpers/AppColors.dart';
import 'package:flutter_mobx_example/widgets/cupertinopoup/effect.dart';
import 'package:flutter_mobx_example/widgets/cupertinopoup/store.dart';

Widget buildView(BuildContext context, PickerStore store, Function callback) {
  return Container(
    height: 250,
    margin: EdgeInsets.all(15),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            FlatButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                '取消',
                style: TextStyle(color: AppColors.color666666, fontSize: 17),
              ),
            ),
            FlatButton(
              onPressed: () {
                setSelectedOpt(store);
                Navigator.pop(context);
                callback(store.index);
              },
              child: Text(
                '确定',
                style: TextStyle(color: AppColors.color58BC62, fontSize: 17),
              ),
            ),
          ],
        ),
        Divider(
          height: 1,
          color: AppColors.colorEAEAEA,
        ),
        Expanded(
          child: CupertinoPicker(
            itemExtent: 40,
            scrollController:
                FixedExtentScrollController(initialItem: store.index ?? 0),
            onSelectedItemChanged: (index) {
              setSelectIndex(store, index);
            },
            children: store.opts.map((option) {
              return Center(
                child: Text(
                  option.name,
                  style: TextStyle(
                    color: AppColors.color333333,
                    fontSize: 15,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    ),
  );
}
