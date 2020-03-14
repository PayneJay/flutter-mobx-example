import 'package:flutter/material.dart';

class OrderDetailCard extends StatelessWidget {
  final Widget headChild;
  final Widget centerChild;
  final Widget footChild;
  OrderDetailCard({
    Key key,
    this.headChild,
    @required this.centerChild,
    this.footChild,
  })  : assert(centerChild != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    var childList = <Widget>[];

    if (headChild != null) {
      childList.add(headChild);
    }

    if (centerChild != null) {
      childList.add(centerChild);
    }

    if (footChild != null) {
      childList.add(footChild);
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(2.0, 2.0),
            blurRadius: 4.0,
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: childList,
        ),
      ),
    );
  }
}

class OrderDetailNormalCard extends StatelessWidget {
  final IconData tipIcon;
  final String tipStr;
  final Widget child;
  final bool needLine;
  OrderDetailNormalCard({
    Key key,
    this.needLine = true,
    @required this.tipIcon,
    @required this.tipStr,
    @required this.child,
  })  : assert(tipIcon != null),
        assert(tipStr != null),
        assert(child != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return OrderDetailCard(
      headChild: Container(
        height: 44,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 13),
                    child: Icon(
                      tipIcon,
                      color: Color(0xff58bc62),
                      size: 19,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 13),
                    child: Text(
                      tipStr,
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xff58bc62),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: needLine ? 1 : 0,
              color: needLine ? Color(0xffeaeaea) : Color(0xffffffff),
            ),
          ],
        ),
      ),
      centerChild: child,
    );
  }
}
