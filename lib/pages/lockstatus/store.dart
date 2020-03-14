import 'package:mobx/mobx.dart';

part 'store.g.dart';

class LockStatusStore = _LockStatusStore with _$LockStatusStore;

abstract class _LockStatusStore with Store {
  @observable
  int lockStatus;

  @observable
  bool isClean = false;

  @action
  void setLockStatus(int status) {
    lockStatus = status;
  }

  @action
  void switchCleanStatus() {
    isClean = !isClean;
  }
}
