import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

import 'store.dart';

///点击完成
void confirm(BuildContext context, ModifyLockPwdStore store) {
  if (store.password.length < 6) {
    showToast('管家密码应该为6位数字', context: context);
    return;
  }
  showToast('checked : ${store.isChecked}, password : ${store.password}');
  Navigator.pop(context);
}

///输入内容监听
void onInputChanged(
    BuildContext context, ModifyLockPwdStore store, String value) {
  store.setPassword(value);
}

///开关监听
void onCheckChanged(
    BuildContext context, ModifyLockPwdStore store, bool value) {
  store.setChecked(value);
}
