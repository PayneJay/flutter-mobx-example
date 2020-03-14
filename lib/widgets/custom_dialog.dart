import 'package:flutter/material.dart';
import 'package:flutter_mobx_example/helpers/AppColors.dart';

class CustomDialog extends Dialog {
  final String title;
  final String message;
  final String negativeText;
  final String positiveText;
  final Function onNegativePressEvent;
  final Function onPositivePressEvent;
  final Radius radius;

  const CustomDialog({
    Key key,
    this.title,
    @required this.message,
    this.negativeText,
    this.positiveText,
    this.onNegativePressEvent,
    @required this.onPositivePressEvent,
    @required this.radius,
  })  : assert(onPositivePressEvent != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 8 / 9,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(radius),
          ),
          padding: EdgeInsets.only(top: 30, bottom: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Offstage(
                offstage: title == null,
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(left: 20, right: 10, bottom: 20),
                    child: Text(
                      title ?? '',
                      style: TextStyle(
                        fontSize: 17,
                        color: AppColors.color333333,
                        fontWeight: FontWeight.w600,
                      ),
                      softWrap: true,
                    ),
                  ),
                ),
              ),
              ConstrainedBox(
                child: SingleChildScrollView(
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(left: 20, right: 10, bottom: 10),
                      child: Text(
                        message,
                        style: TextStyle(
                          fontSize: 15,
                          color: AppColors.color333333,
                        ),
                        textAlign: TextAlign.center,
                        softWrap: true,
                      ),
                    ),
                  ),
                ),
                constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height * 9 / 16),
              ),
              Container(height: 20),
              Flex(
                direction: Axis.horizontal,
                children: <Widget>[
                  Expanded(
                    child: FlatButton(
                      child: Chip(
                        backgroundColor: AppColors.colorF3F3F3,
                        label: Container(
                          height: 40,
                          width: 120,
                          alignment: Alignment.center,
                          child: Text(
                            negativeText ?? '取消',
                            style: TextStyle(
                                color: AppColors.color666666, fontSize: 17),
                          ),
                        ),
                      ),
                      onPressed: () {
                        return onNegativePressEvent ?? Navigator.pop(context);
                      },
                    ),
                    flex: 1,
                  ),
                  Expanded(
                    child: FlatButton(
                      child: Chip(
                        backgroundColor: AppColors.color58BC62,
                        label: Container(
                          height: 40,
                          width: 120,
                          alignment: Alignment.center,
                          child: Text(
                            positiveText ?? '确定',
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        onPositivePressEvent();
                      },
                    ),
                    flex: 1,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
