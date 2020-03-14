import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:flutter_mobx_example/pages/rejectorder/page.dart';
import 'package:flutter_mobx_example/widgets/custom_dialog.dart';
import 'package:flutter_mobx_example/widgets/assigndialog/component.dart';

import 'store.dart';

///点击条目
void clickItem(BuildContext context, OrderItemStore store) {
  showToast('跳转订单详情');
}

///确认订单
void confirmOrder(BuildContext context, OrderItemStore store) {
  showDialog(
    context: context,
    builder: (context) => CustomDialog(
      message: '当前房型已超售N间，是否继续确认',
      onPositivePressEvent: () => showToast('确定', context: context),
      radius: Radius.circular(12.0),
    ),
  );
}

///拒单
void rejectOrder(BuildContext context, OrderItemStore store) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => RejectOrderPage(),
    ),
  );
}

///快速分房
void quickHousing(BuildContext context, OrderItemStore store) {
  showDialog(
    context: context,
    builder: (context) => AssignDialog(),
  );
}
