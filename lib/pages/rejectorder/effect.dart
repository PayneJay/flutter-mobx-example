import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:flutter_mobx_example/pages/rejectorder/store.dart';

///取消拒单
void cancel(BuildContext context, RejectOrderStore store) {
  showToast('取消');
  Navigator.pop(context);
}

///拒单
void reject(BuildContext context, RejectOrderStore store) {
  showToast(
      '拒单原因：${store.groupValue.name}， id：${store.groupValue.id}， other：${store
          .otherReason}');
  Navigator.pop(context);
}
