import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_mobx_example/helpers/AppColors.dart';
import 'effect.dart';
import 'store.dart';
import 'type_enum.dart';

part 'item_view.dart';

part 'tab_component.dart';

Widget buildView(BuildContext context, FilterOrderStore store) {
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
        '订单筛选',
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
            height: 90,
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
            child: ListView(
              children: ListTile.divideTiles(context: context, tiles: [
                buildItemView(context, store, FilterType.status),
                buildItemView(context, store, FilterType.channel),
              ]).toList(),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15, right: 15, top: 90),
            child: TimeTabWidget(store: store),
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
                        backgroundColor: AppColors.colorF3F3F3,
                        label: Container(
                          height: 40,
                          alignment: Alignment.center,
                          child: Text(
                            '重置',
                            style: TextStyle(
                                color: AppColors.color666666, fontSize: 17),
                          ),
                        ),
                      ),
                      onPressed: () => reset(context, store),
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
                            '确认',
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          ),
                        ),
                      ),
                      onPressed: () => confirm(context, store),
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
