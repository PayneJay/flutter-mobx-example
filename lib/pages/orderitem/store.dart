import 'package:mobx/mobx.dart';
import 'package:flutter_mobx_example/pages/orderlist/item_entity.dart';

part 'store.g.dart';

class OrderItemStore = _OrderItemStore with _$OrderItemStore;

abstract class _OrderItemStore with Store {
  @observable
  int orderStatus = 0;

  @observable
  ItemEntity itemEntity;

  @computed
  int get calculateStay {
    DateTime start = DateTime.parse(itemEntity.checkInTime);
    DateTime end = DateTime.parse(itemEntity.checkOutTime);
    return end.difference(start).inDays;
  }

  @action
  void changeOrderStatus(int status) {
    orderStatus = status;
  }
}
