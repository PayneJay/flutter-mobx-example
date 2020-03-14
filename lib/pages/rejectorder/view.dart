import 'package:flutter/material.dart';
import 'package:flutter_mobx_example/helpers/AppColors.dart';
import 'package:flutter_mobx_example/pages/rejectorder/effect.dart';
import 'package:flutter_mobx_example/pages/rejectorder/store.dart';
import 'reasonitem/component.dart';

import 'reject_order.dart' show reasons;

Widget buildView(BuildContext context, RejectOrderStore store) {
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
        '拒单原因',
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
          Card(
            margin: EdgeInsets.only(left: 15, right: 15, bottom: 85),
            elevation: 3,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
            child: ListView.separated(
                controller: store.controller,
                shrinkWrap: true,
                itemBuilder: (context, index) =>
                    ReasonItemComponent(parentStore: store, index: index),
                separatorBuilder: (context, index) => Divider(
                      color: AppColors.colorEAEAEA,
                      height: 1,
                    ),
                itemCount: reasons.length),
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
              child: Flex(
                direction: Axis.horizontal,
                children: <Widget>[
                  Expanded(
                    child: FlatButton(
                      child: Chip(
                        backgroundColor: Colors.white24,
                        label: Container(
                          height: 40,
                          alignment: Alignment.center,
                          child: Text(
                            '取消',
                            style: TextStyle(
                                color: AppColors.color666666, fontSize: 17),
                          ),
                        ),
                      ),
                      onPressed: () => cancel(context, store),
                    ),
                    flex: 1,
                  ),
                  Expanded(
                    child: FlatButton(
                      child: Chip(
                        backgroundColor: AppColors.color58BC62,
                        label: Container(
                          height: 40,
                          alignment: Alignment.center,
                          child: Text(
                            '拒单',
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          ),
                        ),
                      ),
                      onPressed: () => reject(context, store),
                    ),
                    flex: 1,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}
