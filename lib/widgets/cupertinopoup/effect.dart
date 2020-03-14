import 'package:oktoast/oktoast.dart';
import 'package:flutter_mobx_example/widgets/cupertinopoup/store.dart';

///当先滚轮滚到的下标
void setSelectIndex(PickerStore store, int index) {
  showToast("当前项：$index");
  store.setSelectIndex(index);
}

///点击确认时选中的选项
void setSelectedOpt(PickerStore store) {
  print("${store.index}");
  store.selectedOpt = store.opts[store.index];
}
