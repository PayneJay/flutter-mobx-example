import 'package:flutter/material.dart';

class OrderDetailItem extends StatelessWidget {
  final int leftFlex;
  final int rightFlex;
  final Widget leftChild;
  final Widget rightChild;

  OrderDetailItem({
    Key key,
    this.leftFlex = 1,
    this.rightFlex = 2,
    @required this.leftChild,
    @required this.rightChild,
  })  : assert(leftChild != null),
        assert(rightChild != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Flex(
        direction: Axis.horizontal,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(
            child: leftChild,
            flex: leftFlex,
          ),
          Expanded(
            child: rightChild,
            flex: rightFlex,
          ),
        ],
      ),
    );
  }
}

class OrderDetailTextItem extends StatelessWidget {
  final int leftFlex;
  final int rightFlex;
  final TextStyle leftTextStyle;
  final TextStyle rightTextStyle;
  final String leftText;
  final String rightText;
  final int leftMaxLines;
  final int rightMaxLines;

  OrderDetailTextItem({
    Key key,
    this.leftFlex = 1,
    this.rightFlex = 2,
    this.leftMaxLines = 1,
    this.rightMaxLines = 1,
    this.leftTextStyle,
    this.rightTextStyle,
    @required this.leftText,
    @required this.rightText,
  })  : assert(leftText != null),
        assert(rightText != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    var normalStyle = TextStyle(
      fontSize: 15,
      color: Color(0xff333333),
    );

    return OrderDetailItem(
      leftFlex: leftFlex,
      rightFlex: rightFlex,
      leftChild: Text(
        leftText,
        style: leftTextStyle ?? normalStyle,
        textAlign: TextAlign.left,
        maxLines: leftMaxLines,
        overflow: TextOverflow.ellipsis,
      ),
      rightChild: Text(
        rightText,
        style: rightTextStyle ?? normalStyle,
        textAlign: TextAlign.right,
        maxLines: rightMaxLines,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
