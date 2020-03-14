import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_mobx_example/helpers/AppColors.dart';
import 'package:flutter_mobx_example/helpers/iconfont.dart';
import 'package:flutter_mobx_example/pages/lockstatus/store.dart';

import 'effect.dart';

part 'lock_view.dart';

part 'clean_view.dart';

Widget buildView(BuildContext context, LockStatusStore store) {
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
        '海景大床房',
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
          buildLockView(context, store),
          buildCleanView(context, store),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 60,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(left: 15, right: 15),
              decoration: BoxDecoration(
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
              child: FlatButton(
                onPressed: () => temporaryOpen(store),
                child: Chip(
                  backgroundColor: AppColors.color58BC62,
                  label: Container(
                    margin: EdgeInsets.only(left: 15, right: 15),
                    constraints: BoxConstraints(maxHeight: 40),
                    alignment: Alignment.center,
                    child: Text(
                      '临时开门',
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
