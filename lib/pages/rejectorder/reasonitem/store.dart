import 'package:mobx/mobx.dart';
import 'package:flutter_mobx_example/widgets/common_option.dart';

part 'store.g.dart';

class RejectItemStore = _RejectItemStore with _$RejectItemStore;

abstract class _RejectItemStore with Store {
  @observable
  CommonOption value;

  @action
  void setReasonOption(CommonOption option) {
    this.value = option;
  }
}
