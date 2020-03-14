import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

import 'store.dart';
import 'service.dart';


void handleButtonPress(BuildContext context, WorkbenchStore store) async {
  final entity = await requestWorkbench();
  print(entity.count);

  showToast('请求成功', context: context);

  store.increaseCount();
}