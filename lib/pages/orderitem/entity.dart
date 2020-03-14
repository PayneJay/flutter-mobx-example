import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_mobx_example/pages/orderitem/stay_entity.dart';

part 'entity.g.dart';

@JsonSerializable()
class OrderItemEntity {
  OrderItemEntity();

  String hotelNo;
  String channelOrderNo;
  String orderNo;
  bool isAssigned;
  String contactName;
  String contactTelNo;
  num numOfRoom;
  String roomTypeName;
  String roomTypeNo;
  String orderTypeCode;
  String orderTypeName;
  String checkInTime;
  String checkOutTime;
  String orderMoney;
  String totalIncome;
  String totalOrderMoney;
  String channelName;
  String channelCode;
  String payTypeCode;
  String payTypeName;
  String payStateCode;
  String payStateName;
  String payMoney;
  String guaranteeMoney;
  String orderComment;
  String roomAssigner;
  String orderStateCode;
  String orderStateName;
  String consume;
  List<StayEntity> stayList;

  factory OrderItemEntity.fromJson(Map<String, dynamic> json) =>
      _$OrderItemEntityFromJson(json);

  Map<String, dynamic> toJson() => _$OrderItemEntityToJson(this);
}
