import 'package:mobx/mobx.dart';

import '../common_option.dart';

part 'store.g.dart';

class PickerStore = _PickerStore with _$PickerStore;

abstract class _PickerStore with Store {
  ///选项列表
  List<CommonOption> opts;

  ///当前选中项
  CommonOption selectedOpt;

  @observable
  int index = 3;

  @action
  void setSelectIndex(int value) {
    index = value;
  }
}
