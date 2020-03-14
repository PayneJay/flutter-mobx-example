import 'package:flutter/material.dart';

Widget buildTitleSelectView(
    BuildContext context, String title, String select, void Function() click) {
  Widget child = Stack(
    children: <Widget>[
      Align(
        child: Text(
          title,
          style: TextStyle(
            fontSize: 15,
            color: Color(int.parse('0xFF333333')),
          ),
        ),
        alignment: Alignment.centerLeft,
      ),
      Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(
              select,
              style: TextStyle(
                fontSize: 15,
                color: Color(int.parse('0xFF333333')),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 6),
              child: Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Color(int.parse('0xFFCCCCCC')),
              ),
            ),
          ],
        ),
        alignment: Alignment.centerRight,
      ),
    ],
  );
  child = _addPaddingAll(child, 12);
  return _addClick(child, click);
}

Widget buildTitleInputView(BuildContext context, TextInputType inputType,
    String title, String hint, TextEditingController controller) {
  Widget child = Row(
    children: <Widget>[
      Text(
        title,
        style: TextStyle(
          fontSize: 15,
          color: Color(int.parse('0xFF333333')),
        ),
      ),
      Expanded(
        flex: 1,
        child: TextField(
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hint,
              hintStyle: TextStyle(
                fontSize: 15,
                color: Color(int.parse('0xFFCCCCCC')),
              )),
          keyboardType: inputType,
          style: TextStyle(
            fontSize: 15,
            color: Color(int.parse('0xFF333333')),
          ),
          textAlign: TextAlign.end,
          controller: controller,
        ),
      ),
    ],
  );
  return _addPaddingOnly(child, left: 12, right: 12);
}

Widget buildGreyItem(List<Widget> children) {
  return Container(
    decoration: BoxDecoration(
      color: Color(int.parse('0xFFF8F8F8')),
      borderRadius: BorderRadius.all(Radius.circular(4)),
    ),
    child: Column(
      children: children,
    ),
  );
}

Widget buildWhiteItem(IconData icon, String title, List<Widget> children, bool bottom) {
  Widget widget = Padding(
    padding: EdgeInsets.only(bottom: 10),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Icon(
          icon,
          color: Color(int.parse('0xFF58BC62')),
          size: 18,
        ),
        Padding(
          padding: EdgeInsets.only(left: 8),
          child: Text(title,
              style: TextStyle(
                  color: Color(int.parse('0xFF58BC62')), fontSize: 15)),
        ),
      ],
    ),
  );
  if (children != null) {
    children.insert(0, widget);
  } else {
    children = [widget];
  }
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      color: Colors.white,
    ),
    child: Padding(
      padding: EdgeInsets.only(left: 12, right: 12, top: 12, bottom: bottom ? 12 : 0),
      child: Column(
        children: children,
      ),
    ),
  );
}

Widget buildDriverItem(String color) {
  return Container(
    height: 1,
    color: Color(int.parse(color)),
  );
}

Widget buildAddLabel(String label, void Function() click) {
  Widget child = Chip(
    label: Text(label),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
      side: BorderSide(color: Color(int.parse('0xFF58BC62')), width: 0.5),
    ),
    backgroundColor: Colors.white,
    labelStyle: TextStyle(color: Color(int.parse('0xFF58BC62')), fontSize: 15),
    labelPadding: EdgeInsets.only(left: 0, right: 5),
    avatar: Icon(Icons.add, color: Color(int.parse('0xFF58BC62'))),
  );
  return _addClick(child, click);
}

Widget _addPaddingOnly(
    Widget child, {
      double left = 0.0,
      double top = 0.0,
      double right = 0.0,
      double bottom = 0.0,
    }) {
  return Padding(
    child: child,
    padding:
    EdgeInsets.only(left: left, top: top, right: right, bottom: bottom),
  );
}

Widget _addPaddingAll(Widget child, double padding) {
  return Padding(
    child: child,
    padding: EdgeInsets.all(padding),
  );
}

Widget _addClick(Widget child, void Function() onClick) {
  return GestureDetector(
    onTap: onClick,
    child: child,
  );
}