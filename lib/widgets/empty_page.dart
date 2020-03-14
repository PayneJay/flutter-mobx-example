import 'package:flutter/material.dart';

class EmptyView extends StatefulWidget {
  final VoidCallback emptyRetry; //无数据事件处理

  EmptyView(this.emptyRetry);

  @override
  _NoDataViewState createState() => _NoDataViewState();
}

class _NoDataViewState extends State<EmptyView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      constraints:
          BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
      child: InkWell(
        onTap: widget.emptyRetry,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Image.asset(
                'images/img_empty.png',
                width: MediaQuery.of(context).size.width * 2 / 3,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                '暂无相关数据，请刷新重试~',
                style: TextStyle(fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
