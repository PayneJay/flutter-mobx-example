import 'package:flutter/material.dart';

import '../view.dart';

class CashInfoComponent extends StatefulWidget {
  @override
  _CashInfoState createState() => _CashInfoState();
}

class _CashInfoState extends State<CashInfoComponent> {
  @override
  Widget build(BuildContext context) {
    return _buildItems(context);
  }

  _buildItems(BuildContext context) {
    return buildWhiteItem(
        Icons.cast, '收款信息', [_buildItem(context), _buildAddLabel('新增收款信息')], false);
  }

  _buildItem(BuildContext context) {
    List<Widget> items = [];
    items.add(_buildCashTypeItem(context));
    items.add(_buildDriverItem('0xFFEAEAEA'));
    items.add(_buildCashManyItem(context));
    items.add(_buildDriverItem('0xFFEAEAEA'));
    items.add(_buildPayTypeItem(context));
    return buildGreyItem(items);
  }

  _buildCashTypeItem(BuildContext context) {
    return buildTitleSelectView(context, '收款1', '收押金', _cashTypeClick);
  }

  _buildCashManyItem(BuildContext context) {
    return buildTitleInputView(
        context, TextInputType.number, '金额', '请输入金额', TextEditingController());
  }

  _buildPayTypeItem(BuildContext context) {
    return buildTitleSelectView(context, '支付方式', '支付宝', _payTypeClick);
  }

  Widget _buildDriverItem(String color) {
    return buildDriverItem(color);
  }

  _buildAddLabel(String label) {
    return Align(
      child: buildAddLabel(label, _addItemClick),
      alignment: Alignment.centerRight,
    );
  }

  void _cashTypeClick() {
    print('收款1 点击');
  }

  void _payTypeClick() {
    print('支付方式 点击');
  }

  void _addItemClick() {
    print('新增收款信息 点击');
  }
}
