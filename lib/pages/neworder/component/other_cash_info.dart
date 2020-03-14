import 'package:flutter/material.dart';

import '../view.dart';

class OtherCashInfoComponent extends StatefulWidget {
  @override
  _OtherCashInfoState createState() => _OtherCashInfoState();
}

class _OtherCashInfoState extends State<OtherCashInfoComponent> {
  @override
  Widget build(BuildContext context) {
    return _buildItems(context);
  }

  _buildItems(BuildContext context) {
    return buildWhiteItem(Icons.cast, '其它消费',
        [_buildItem(context), _buildAddLabel('新增其它消费')], false);
  }

  _buildItem(BuildContext context) {
    List<Widget> items = [];
    items.add(_buildCashTypeItem(context));
    items.add(_buildDriverItem('0xFFEAEAEA'));
    items.add(_buildCashManyItem(context));
    return buildGreyItem(items);
  }

  _buildCashTypeItem(BuildContext context) {
    return buildTitleSelectView(context, '消费1', '收押金', _cashTypeClick);
  }

  _buildCashManyItem(BuildContext context) {
    return buildTitleInputView(
        context, TextInputType.number, '金额', '请输入金额', TextEditingController());
  }

  Widget _buildDriverItem(String color) {
    return buildDriverItem(color);
  }

  void _cashTypeClick() {
    print('消费1 点击');
  }

  _buildAddLabel(String label) {
    return Align(
      child: buildAddLabel(label, _addItemClick),
      alignment: Alignment.centerRight,
    );
  }

  void _addItemClick() {
    print('新增其它消费 点击');
  }
}
