import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_mobx_example/helpers/AppColors.dart';
import 'package:flutter_mobx_example/widgets/searchpopup/effect.dart';

import 'store.dart';

Widget buildView(BuildContext context, SearchStore store) {
  return Material(
    //创建透明层
    type: MaterialType.transparency,
    child: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.transparent,
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              child: Container(
                padding: EdgeInsets.only(
                  left: NavigationToolbar.kMiddleSpacing,
                  right: NavigationToolbar.kMiddleSpacing,
                ),
                constraints: BoxConstraints(maxHeight: kToolbarHeight),
                decoration: BoxDecoration(
                  gradient: AppColors.themeGradientColor,
                ),
                child: Flex(
                  direction: Axis.horizontal,
                  children: <Widget>[
                    Expanded(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(maxHeight: 30),
                        child: Observer(
                          builder: (_) => TextField(
                            controller: TextEditingController.fromValue(
                              TextEditingValue(
                                text: store.inputText ?? '',
                                selection: TextSelection.fromPosition(
                                  TextPosition(
                                      affinity: TextAffinity.downstream,
                                      offset: store.inputText.length),
                                ),
                              ),
                            ),
                            autofocus: false,
                            decoration: InputDecoration(
                              hintText: '请输入姓名、电话或订单号',
                              hintStyle: TextStyle(
                                color: AppColors.colorCCCCCC,
                                fontSize: 15,
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                //添加边框
                                gapPadding: 10.0,
                                borderSide:
                                    BorderSide(color: AppColors.colorDDDDDD),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              suffixIcon: Offstage(
                                offstage: store.showDelIcon,
                                child: IconButton(
                                  icon: Icon(
                                    Icons.cancel,
                                    color: AppColors.colorCCCCCC,
                                    size: 18,
                                  ),
                                  padding: EdgeInsets.all(5),
                                  onPressed: () => clearContent(context, store),
                                ),
                              ),
                              contentPadding:
                                  const EdgeInsets.only(left: 12, right: 12),
                            ),
                            keyboardType: TextInputType.text,
                            onChanged: (value) =>
                                onInputChanged(context, store, value),
                            onSubmitted: (value) =>
                                doSearch(context, store, value),
                          ),
                        ),
                      ),
                      flex: 11,
                    ),
                    Expanded(
                      child: IconButton(
                        icon: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        onPressed: () =>
                            doSearch(context, store, store.inputText),
                      ),
                      flex: 1,
                    )
                  ],
                ),
              ),
              onTap: null,
            ),
          ),
          GestureDetector(
            child: Container(
              color: Colors.transparent,
              height: MediaQuery.of(context).size.height -
                  MediaQueryData.fromWindow(window).padding.top -
                  100,
              margin: EdgeInsets.only(top: 45),
            ),
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    ),
  );
}
