import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:flutter_mobx_example/widgets/common_option.dart';

import '../custom_dialog.dart';
import 'store.dart';

///清空房间
void clearHouse(BuildContext context, AssignStore store) {
  showToast('清空房间', context: context);
  store.clearList();
}

///删除label
void deleteLabel(BuildContext context, AssignStore store, CommonOption label) {
  showToast('delete ${label.id} : ${label.name}');
  store.remove(label);
}

///添加label
void addLabel(BuildContext context, AssignStore store, CommonOption label) {
  showToast('add ${label.id} : ${label.name}');
  store.add(label);
}

///提交选择
void submit(BuildContext context, AssignStore store) {
  showDialog(
    context: context,
    builder: (context) => CustomDialog(
      title: '温馨提示',
      message: '订单所需房间未全部安排，是否确定？提交后可在已分房订单中继续修改房间',
      onPositivePressEvent: () {
        Navigator.of(context).pop();
        showToast('确定');
      },
      radius: Radius.circular(12.0),
    ),
  );
}
