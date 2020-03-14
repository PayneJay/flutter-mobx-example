import 'package:mobx/mobx.dart';

import 'item_entity.dart';

part 'store.g.dart';

class OrderListStore = _OrderListStore with _$OrderListStore;

abstract class _OrderListStore with Store {
  @observable
  int currentTab;

  ///订单列表数据
  ObservableList<ItemEntity> orderList = ObservableList();

  @action
  void changeTab(int tab) {
    currentTab = tab;
  }
}
