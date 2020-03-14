import 'package:mobx/mobx.dart';
import 'package:flutter_mobx_example/widgets/common_option.dart';

part 'store.g.dart';

class AssignStore = _AssignStore with _$AssignStore;

abstract class _AssignStore with Store {
  ObservableList<CommonOption> selectedList = ObservableList();

  @observable
  bool isEmpty = false;

  @action
  void add(CommonOption value) {
    if (!selectedList.contains(value)) {
      selectedList.add(value);
    }
    isEmpty = selectedList.length <= 0;
  }

  @action
  void remove(CommonOption value) {
    if (selectedList.contains(value)) {
      selectedList.remove(value);
    }
    isEmpty = selectedList.length <= 0;
  }

  @action
  void clearList() {
    selectedList.clear();
    isEmpty = selectedList.length <= 0;
  }
}
