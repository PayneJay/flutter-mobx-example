import 'package:mobx/mobx.dart';

part 'store.g.dart';

class SearchStore = _SearchStore with _$SearchStore;

abstract class _SearchStore with Store {
  @observable
  String inputText = "";
  @observable
  bool showDelIcon = false;

  @action
  void setInputText(String value) {
    inputText = value;
  }

  @action
  void setShowDel(bool value) {
    showDelIcon = value;
  }
}
