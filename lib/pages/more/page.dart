import 'package:flutter/material.dart';
import 'package:flutter_mobx_example/pages/orderlist/order_list.dart';

class MorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        child: Text('更多'),
        onTap: () => _goOrderList(context),
      ),
    );
  }

  void _goOrderList(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return OrderListPage();
    }));
  }
}
