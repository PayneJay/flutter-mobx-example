import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_mobx_example/helpers/AppColors.dart';
import 'package:flutter_mobx_example/widgets/common_option.dart';

import 'component.dart';

import 'store.dart';
import 'effect.dart';

part 'selected_list_view.dart';

part 'expand_list_view.dart';

part 'label_view.dart';

Widget buildView(BuildContext context, AssignStore store) {
  return Material(
    //创建透明层
    type: MaterialType.transparency, //透明类型
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: 335.0,
            height: 445.0,
            child: Container(
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(12, 12, 12, 14),
                    decoration: BoxDecoration(
                      gradient: AppColors.themeGradientColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12.0),
                        topRight: Radius.circular(12.0),
                      ),
                    ),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              '还有5个房间需要安排',
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            ),
                            Observer(
                              builder: (_) => Offstage(
                                offstage: store.isEmpty,
                                child: ClipRRect(
                                  //剪裁为圆角矩形
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: GestureDetector(
                                    child: Container(
                                      height: 24,
                                      color: Colors.white24,
                                      alignment: Alignment.center,
                                      padding:
                                          EdgeInsets.only(left: 11, right: 11),
                                      child: Text(
                                        '清空房间',
                                        overflow: TextOverflow.ellipsis,
                                        softWrap: true,
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.white),
                                      ),
                                    ),
                                    onTap: () => clearHouse(context, store),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Observer(
                          builder: (_) => Container(
                            margin: const EdgeInsets.only(top: 20),
                            width: MediaQuery.of(context).size.width,
                            height: 100,
                            child: store.isEmpty
                                ? Center(
                                    child: Text(
                                      '请选择房间',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                      ),
                                    ),
                                  )
                                : buildSelectedListView(context, store),
                          ),
                        )
                      ],
                    ),
                  ),
                  buildExpandListView(context, store),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
          ),
          Observer(
            builder: (_) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: store.isEmpty ? 10 : 0),
                  child: IconButton(
                    icon: Icon(
                      Icons.cancel,
                      color: Colors.white,
                      size: 44,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
                Observer(
                  builder: (_) => Offstage(
                    offstage: store.isEmpty,
                    child: Container(
                      margin: EdgeInsets.only(left: 10),
                      child: IconButton(
                        icon: Icon(
                          Icons.offline_pin,
                          color: Colors.white,
                          size: 44,
                        ),
                        onPressed: () {
                          submit(context, store);
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
