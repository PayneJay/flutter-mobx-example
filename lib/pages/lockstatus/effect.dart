import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:flutter_mobx_example/pages/modifylockpwd/modify_lock_pwd.dart';

import 'store.dart';

///临时开门
void temporaryOpen(LockStatusStore store) {
  showToast('临时开门');
}

///修改密码
void modifyPassword(BuildContext context, LockStatusStore store) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (_) => ModifyLockPwdPage(),
    ),
  );
}

///切换脏净状态
void switchCleanStatus(LockStatusStore store) {
  store.switchCleanStatus();
}
