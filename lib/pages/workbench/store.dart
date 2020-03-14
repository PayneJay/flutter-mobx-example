import 'package:mobx/mobx.dart';


part 'store.g.dart';

class WorkbenchStore = _WorkbenchStore with _$WorkbenchStore;

abstract class _WorkbenchStore with Store {

  @observable
  int count = 0;


  @action
  void increaseCount() {
    count += 1;
  }

}