import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_mobx_example/helpers/AppColors.dart';

import 'effect.dart';
import 'store.dart';

Widget buildView(BuildContext context, ModifyLockPwdStore store) {
  return Scaffold(
    appBar: AppBar(
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: AppColors.themeGradientColor,
        ),
      ),
      centerTitle: true,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios, color: Colors.white),
        onPressed: () => Navigator.of(context).pop(),
      ),
      title: Text(
        '修改管家密码',
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: 17, color: Colors.white),
      ),
    ),
    body: Container(
      child: Stack(
        children: <Widget>[
          Container(
            height: 45,
            decoration: BoxDecoration(
              gradient: AppColors.themeGradientColor,
            ),
          ),
          Container(
            constraints: BoxConstraints(maxHeight: 90),
            margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
              boxShadow: [
                BoxShadow(
                    color: Colors.black12,
                    offset: Offset(1, 1),
                    blurRadius: 15),
                BoxShadow(
                  color: Colors.white,
                )
              ],
            ),
            child: Flex(
              direction: Axis.vertical,
              children: <Widget>[
                Expanded(
                  child: Container(
                    height: 45,
                    padding: EdgeInsets.only(left: 12, right: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '管家密码',
                          style:
                              TextStyle(color: AppColors.color333333, fontSize: 15),
                        ),
                        Expanded(
                          child: TextField(
                            controller: TextEditingController.fromValue(
                              TextEditingValue(
                                text: store.password ?? '',
                                selection: TextSelection.fromPosition(
                                  TextPosition(
                                      affinity: TextAffinity.downstream,
                                      offset: 0),
                                ),
                              ),
                            ),
                            autofocus: false,
                            decoration: InputDecoration(
                              hintText: "请输入管家密码",
                              fillColor: Colors.white,
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                                borderRadius: BorderRadius.circular(5.0),
                                gapPadding: 10,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                                borderRadius: BorderRadius.circular(15.0),
                                gapPadding: 10,
                              ),
                              counterText: "",
                            ),
                            maxLength: 6,
                            keyboardType: TextInputType.number,
                            obscureText: true,
                            textAlignVertical: TextAlignVertical.bottom,
                            textAlign: TextAlign.end,
                            onChanged: (value) {
                              onInputChanged(context, store, value);
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  flex: 1,
                ),
                Divider(
                  height: 1,
                  color: AppColors.colorEAEAEA,
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 12, right: 12),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: Text(
                            '修改该门店所有房间',
                            style: TextStyle(
                              fontSize: 15,
                              color: AppColors.color333333,
                            ),
                          ),
                        ),
                        Observer(
                          builder: (_) => CupertinoSwitch(
                            value: store.isChecked,
                            onChanged: (value) =>
                                onCheckChanged(context, store, value),
                          ),
                        ),
                      ],
                    ),
                  ),
                  flex: 1,
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 60,
              padding: EdgeInsets.only(left: 15, right: 15),
              decoration: BoxDecoration(shape: BoxShape.rectangle, boxShadow: [
                BoxShadow(
                    color: Colors.black12,
                    offset: Offset(1, 1),
                    blurRadius: 15),
                BoxShadow(
                  color: Colors.white,
                )
              ]),
              child: FlatButton(
                onPressed: () => confirm(context, store),
                child: Chip(
                  backgroundColor: AppColors.color58BC62,
                  label: Container(
                    margin: EdgeInsets.only(left: 15, right: 15),
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width,
                        maxHeight: 40),
                    alignment: Alignment.center,
                    child: Text(
                      '完成',
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}
