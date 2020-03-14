import 'package:flutter/material.dart';

import '../view.dart';

class RemarkComponent extends StatefulWidget {
  @override
  _RemarkState createState() => _RemarkState();
}

class _RemarkState extends State<RemarkComponent> {
  @override
  Widget build(BuildContext context) {
    return _buildItem();
  }

  _buildItem() {
    List<Widget> items = [];
    items.add(_buildDriverItem());
    items.add(_buildInputItem('备两双儿童拖鞋'));
    return buildWhiteItem(Icons.cast, '备注', items, true);
  }

  _buildDriverItem() {
    return buildDriverItem('0xFFEAEAEA');
  }

  _buildInputItem(String content) {
    return TextField(
      maxLines: 5,
      maxLength: 400,
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: '最多输入400字',
          hintStyle: TextStyle(
            fontSize: 15,
            color: Color(int.parse('0xFFCCCCCC')),
          )),
      controller: TextEditingController(
        text: content
      ),
    );
  }
}
