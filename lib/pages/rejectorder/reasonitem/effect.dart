import 'dart:async';

import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:flutter_mobx_example/pages/rejectorder/reasonitem/store.dart';
import 'package:flutter_mobx_example/widgets/common_option.dart';

import '../store.dart';

///点击条目
void onItemClick(BuildContext context, RejectItemStore store,
    RejectOrderStore parentStore, CommonOption option) {
  showToast('option : name=${option.name}, id=${option.id}');
  store.setReasonOption(option);
  parentStore.setGroupValue(option);
  if (option.id == 0) {
    onInputChanged(context, parentStore, '');
    Timer(
      Duration(milliseconds: 100),
      () => parentStore.controller
          .jumpTo(parentStore.controller.position.maxScrollExtent),
    );
  }
}

///输入内容监听
void onInputChanged(
    BuildContext context, RejectOrderStore store, String value) {
  store.setOtherReason(value);
}
