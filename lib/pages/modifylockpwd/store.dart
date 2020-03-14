import 'package:mobx/mobx.dart';

part 'store.g.dart';

class ModifyLockPwdStore = _ModifyLockPwdStore with _$ModifyLockPwdStore;

abstract class _ModifyLockPwdStore with Store {
  @observable
  String password = "";

  @observable
  bool isChecked;

  @action
  void setPassword(String value) {
    password = value;
  }

  @action
  void setChecked(bool checked) {
    isChecked = checked;
  }
}
