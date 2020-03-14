import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../view.dart';

class BookInfoComponent extends StatefulWidget {
  final int type;

  BookInfoComponent({Key key, this.type = 0}) : super(key: key);

  @override
  _BookInfoState createState() => _BookInfoState();
}

class _BookInfoState extends State<BookInfoComponent> {
  int _type;

  @override
  Widget build(BuildContext context) {
    return _buildBookInfoView(context);
  }

  @override
  void initState() {
    super.initState();
    _type = widget.type;
  }

  Widget _buildBookInfoView(BuildContext context) {
    return buildWhiteItem(
        Icons.description, '预订信息', [_buildItems(context)], true);
  }

  Widget _buildItems(BuildContext context) {
    List<Widget> items = [];
    if (_type == 0) {
      items.add(_buildNameItem(context));
      items.add(_buildDriverItem('0xFFEAEAEA'));
      items.add(_buildPhoneItem(context));
      items.add(_buildDriverItem('0xFFEAEAEA'));
    }
    items.add(_buildTitleSelectItem(context, '渠道来源', '线下客人', _channelClick));
    items.add(_buildDriverItem('0xFFEAEAEA'));
    items.add(_buildTitleSelectItem(context, '支付类型', '到店支付', _payClick));
    return buildGreyItem(items);
  }

  Widget _buildNameItem(BuildContext context) {
    return buildTitleInputView(
        context, null, '姓名', '请输入客人姓名（必填)', TextEditingController());
  }

  Widget _buildPhoneItem(BuildContext context) {
    return buildTitleInputView(context, TextInputType.phone, '电话',
        '请输入客人电话（非必填)', TextEditingController());
  }

  Widget _buildTitleSelectItem(
      BuildContext context, String title, String select, Function onClick) {
    return buildTitleSelectView(context, title, select, onClick);
  }

  void _channelClick() {
    print('渠道来源 点击');
  }

  void _payClick() {
    print('支付类型 点击');
  }

  Widget _buildDriverItem(String color) {
    return buildDriverItem(color);
  }
}
