import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_mobx_example/widgets/common_option.dart';

part 'store.g.dart';

class RejectOrderStore = _RejectOrderStore with _$RejectOrderStore;

abstract class _RejectOrderStore with Store {
  ScrollController controller = ScrollController();

  @observable
  CommonOption groupValue;

  ///其他原因
  @observable
  String otherReason;

  @action
  void setGroupValue(CommonOption value) {
    groupValue = value;
  }

  @action
  void setOtherReason(String reason) {
    otherReason = reason;
  }
}
