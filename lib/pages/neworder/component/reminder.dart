import 'package:flutter/material.dart';

import '../view.dart';

class ReminderComponent extends StatefulWidget {
  @override
  _ReminderState createState() => _ReminderState();
}

class _ReminderState extends State<ReminderComponent> {
  @override
  Widget build(BuildContext context) {
    return _buildItems();
  }

  _buildItems() {
    return buildWhiteItem(
        Icons.add_alert, '提醒事项', [_buildItem(), _buildAddLabel('新增提醒')], false);
  }

  _buildItem() {
    List<Widget> items = [];
    items.add(_buildReminderType());
    items.add(_buildDriverItem());
    items.add(_buildReminderTime());
    items.add(_buildDriverItem());
    items.add(_buildReminderContent());
    return buildGreyItem(items);
  }

  _buildReminderType() {
    return buildTitleSelectView(context, '提醒类型', '普通提醒', _typeClick);
  }

  _buildReminderTime() {
    return buildTitleSelectView(context, '提醒时间', '提醒时间', _timeClick);
  }

  _buildReminderContent() {
    return buildTitleInputView(
        context, null, '提醒内容', '最多输入50字', TextEditingController());
  }

  _buildAddLabel(String label) {
    return Align(
      child: buildAddLabel(label, _addItemClick),
      alignment: Alignment.centerRight,
    );
  }

  _buildDriverItem() {
    return buildDriverItem('0xFFEAEAEA');
  }

  void _typeClick() {
    print('渠道来源 点击');
  }

  void _timeClick() {
    print('支付类型 点击');
  }

  void _addItemClick() {
    print('新增提醒 点击');
  }
}
