import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_mobx_example/helpers/AppColors.dart';
import 'package:flutter_mobx_example/pages/orderitem/store.dart';
import 'package:flutter_mobx_example/pages/orderlist/status_enum.dart';

import 'effect.dart';

Widget buildView(BuildContext buildContext, OrderItemStore store) {
  return GestureDetector(
    behavior: HitTestBehavior.opaque,
    child: Container(
      margin: const EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(8.0),
        ),
        boxShadow: [
          BoxShadow(
              color: Colors.black12, offset: Offset(1, 1), blurRadius: 8.0),
          BoxShadow(
            color: Colors.white,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 12, right: 12),
              child: SizedBox(
                height: 30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Observer(
                      builder: (_) => Text(
                        '${store.itemEntity.contactName ?? ''}  ${store.itemEntity.contactTelNo ?? ''}',
                        style: TextStyle(
                          color: AppColors.color333333,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Observer(builder: (_) => _buildOrderStatusTag(store)),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 12, right: 12),
              child: Observer(
                builder: (_) => Text(
                  store.itemEntity.doorNo.isEmpty
                      ? '${store.itemEntity.numOfRoom ?? ''}间 ${store.itemEntity.roomTypeName ?? ''}'
                      : '${store.itemEntity.roomTypeName}  ${store.itemEntity.doorNo}',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppColors.color3F3F3F,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 12, right: 12),
              child: SizedBox(
                height: 30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Observer(
                        builder: (_) => Text(
                          '入离：${store.itemEntity.checkInTime ?? ''} 至 ${store.itemEntity.checkOutTime ?? ''}',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: AppColors.color3F3F3F,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                    Observer(
                      builder: (_) => Text(
                        '¥${store.itemEntity.orderMoney ?? ''}',
                        style: TextStyle(
                          color: AppColors.colorFF3300,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              child: Divider(
                height: 1,
                color: AppColors.colorEAEAEA,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 12, right: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Image(
                        image: NetworkImage(
                          store.itemEntity.channelUrl,
                        ),
                        width: 16,
                        height: 16,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 7, right: 7),
                        child: Observer(
                          builder: (_) => Text(
                            '${store.itemEntity.channelName ?? ''}',
                            style: TextStyle(
                              color: AppColors.color333333,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                      Observer(builder: (_) => _buildPayStatusTag(store)),
                    ],
                  ),
                  Expanded(
                    child: Offstage(
                      offstage: store.orderStatus !=
                          OrderStatusValues[OrderStatus.toBeConfirmed],
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          SizedBox(
                            height: 30,
                            width: 60,
                            child: OutlineButton(
                              child: Text(
                                '确认',
                                style: TextStyle(
                                    color: AppColors.color58BC62, fontSize: 15),
                              ),
                              onPressed: () =>
                                  confirmOrder(buildContext, store),
                              clipBehavior: Clip.antiAlias,
                              disabledBorderColor: AppColors.color58BC62,
                              borderSide:
                                  BorderSide(color: AppColors.color58BC62),
                              padding: const EdgeInsets.only(
                                left: 5,
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100)),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                          ),
                          SizedBox(
                            height: 30,
                            width: 60,
                            child: OutlineButton(
                              child: Text(
                                '拒单',
                                style: TextStyle(
                                    color: AppColors.color666666, fontSize: 15),
                              ),
                              onPressed: () => rejectOrder(buildContext, store),
                              padding: const EdgeInsets.only(left: 5, right: 5),
                              clipBehavior: Clip.antiAlias,
                              disabledBorderColor: AppColors.colorCCCCCC,
                              borderSide:
                                  BorderSide(color: AppColors.colorCCCCCC),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100)),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Offstage(
                    offstage: store.orderStatus !=
                        OrderStatusValues[OrderStatus.toBeHousing],
                    child: SizedBox(
                      height: 30,
                      width: 95,
                      child: OutlineButton(
                        child: Text(
                          '快速分房',
                          softWrap: false,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: AppColors.color58BC62, fontSize: 15),
                        ),
                        onPressed: () => quickHousing(buildContext, store),
                        clipBehavior: Clip.antiAlias,
                        disabledBorderColor: AppColors.color58BC62,
                        borderSide: BorderSide(color: AppColors.color58BC62),
                        padding: const EdgeInsets.only(
                          left: 5,
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100)),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ),
    onTap: () => clickItem(buildContext, store),
  );
}

///构建支付状态标签
Widget _buildPayStatusTag(OrderItemStore store) {
  String payTypeName = store.itemEntity.payTypeName ?? '';
  String payTypeCode = store.itemEntity.payTypeCode ?? '';

  Color tagColor = AppColors.color58BC62;
  switch (payTypeCode.toLowerCase()) {
    case 'xf':
      tagColor = AppColors.color58BC62;
      break;
    case 'tyf':
      tagColor = AppColors.colorFF0000;
      break;
    case 'db':
      tagColor = AppColors.color5D9FF8;
      break;
    case 'pyf':
      tagColor = AppColors.colorFF0000;
      break;
  }
  return Container(
    child: Card(
      color: Colors.transparent,
      //z轴的高度，设置card的阴影
      elevation: 0.0,
      //设置shape，这里设置成了R角
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(95.0)),
        side: BorderSide(width: 0.5, color: tagColor),
      ),
      //对Widget截取的行为，比如这里 Clip.antiAlias 指抗锯齿
      clipBehavior: Clip.antiAlias,
      semanticContainer: false,
      child: Padding(
        padding: EdgeInsets.only(left: 5, right: 5),
        child: Text(
          payTypeName,
          style: TextStyle(color: tagColor, fontSize: 13),
          softWrap: true,
        ),
      ),
    ),
  );
}

///绘制订单状态标签
Widget _buildOrderStatusTag(OrderItemStore store) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.transparent,
      borderRadius: BorderRadius.all(Radius.circular(2)),
    ),
    padding: EdgeInsets.only(left: 2, right: 2),
    child: Text(
      store.itemEntity.orderStateName ?? '',
      style: TextStyle(
        color: AppColors.color333333,
        fontSize: 13,
      ),
    ),
  );
}
