import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:flutter_mobx_example/widgets/searchpopup/store.dart';

///清空内容
void clearContent(BuildContext context, SearchStore store) {
  store.setInputText('');
  store.setShowDel(false);
}

///输入变化监听
void onInputChanged(BuildContext context, SearchStore store, String value) {
  store.setInputText(value);
  store.setShowDel(value ?? value.isNotEmpty);
}

///开始搜索
void doSearch(BuildContext context, SearchStore store, String value) {
  store.setInputText(value);
  Navigator.pop(context);
  showToast('value : $value');
}
