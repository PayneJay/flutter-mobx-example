import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_mobx_example/pages/filterorder/filter_order.dart';
import 'package:flutter_mobx_example/widgets/searchpopup/component.dart';
import 'package:oktoast/oktoast.dart';

import 'entity.dart';
import 'item_entity.dart';
import 'service.dart';
import 'store.dart';

///切换门店
void switchHouse(BuildContext context, OrderListStore store) {
  showToast(
      '切换门店 \n widget : ${context.size.width} \n screen : ${MediaQuery.of(context).size.width}');
}

///筛选
void filter(BuildContext context, OrderListStore store) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
    return FilterOrderPage();
  }));
}

///搜索
void search(BuildContext context, OrderListStore store) {
  showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return SearchPopup();
      });
}

///Tab切换
void onTabChanged(OrderListStore store, int index) {
  store.changeTab(index);
}

///数据转换，stayList不为空则拍平
List<ItemEntity> _convertData(OrderListEntity entity) {
  List<ItemEntity> data = List();
  var localOrderList = entity.localOrderList;
  if (localOrderList != null && localOrderList.isNotEmpty) {
    localOrderList.where((order) => (order != null)).forEach((order) {
      ItemEntity itemEntity = ItemEntity();
      itemEntity.orderNo = order.orderNo;
      itemEntity.roomTypeName = order.roomTypeName;
      itemEntity.channelName = order.channelName;
      itemEntity.channelCode = order.channelCode;
      itemEntity.payTypeCode = order.payTypeCode;
      itemEntity.payTypeName = order.payTypeName;
      itemEntity.orderStateCode = order.orderStateCode;
      itemEntity.orderStateName = order.orderStateName;
      itemEntity.channelUrl =
          'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582907746364&di=9bc1b9ee7ac890c8b370e23ba80cf02e&imgtype=0&src=http%3A%2F%2Fimg.mp.itc.cn%2Fupload%2F20161103%2F34efffb37cfc494a86096c020cd8fe8b.jpg';
      if (order.stayList != null && order.stayList.isNotEmpty) {
        order.stayList.where((stay) => (stay != null)).forEach((stay) {
          itemEntity.numOfRoom = stay.numOfRoom;
          itemEntity.orderStateCode = stay.stateCode;
          itemEntity.orderStateName = stay.stateName;
          itemEntity.contactName = stay.customerName;
          itemEntity.contactTelNo = stay.customerTelNo;
          itemEntity.checkInTime = stay.occupyCiDate;
          itemEntity.checkOutTime = stay.occupyCoDate;
          itemEntity.orderMoney = stay.price;
          itemEntity.doorNo = stay.doorNo;
        });
      } else {
        itemEntity.numOfRoom = order.numOfRoom;
        itemEntity.orderStateCode = order.orderStateCode;
        itemEntity.orderStateName = order.orderStateName;
        itemEntity.contactName = order.contactName;
        itemEntity.contactTelNo = order.contactTelNo;
        itemEntity.checkInTime = order.checkInTime;
        itemEntity.checkOutTime = order.checkOutTime;
        itemEntity.orderMoney = order.orderMoney;
        itemEntity.doorNo = '';
      }
      data.add(itemEntity);
    });
  }

  return data;
}

///下拉刷新
Future<void> onRefresh(BuildContext context, OrderListStore store,
    EasyRefreshController controller) async {
  requestOrderList(
    (data) {
      print('==========onRefreshSuccess========== : $data');
      OrderListEntity entity = OrderListEntity.fromJson(data);
      store.orderList.clear();
      store.orderList.addAll(_convertData(entity));
      controller.finishRefresh(success: true);
    },
    onFail: (error) {
      showToast('==========onRefreshFail========== : $error');
      store.orderList.clear();
      controller.finishRefresh(success: false);
    },
  );
}

///上拉加载
Future<void> onLoad(BuildContext context, OrderListStore store,
    EasyRefreshController controller) async {
  requestOrderList(
    (data) {
      print('==========onLoadMoreSuccess========== : $data');
      OrderListEntity entity = OrderListEntity.fromJson(data);
      store.orderList.addAll(_convertData(entity));
      controller.finishLoad(success: true, noMore: store.orderList.length > 10);
    },
    onFail: (error) {
      showToast('==========onLoadMoreFail========== : $error');
      controller.finishLoad(success: false);
    },
  );
}
