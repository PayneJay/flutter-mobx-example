// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderItemEntity _$OrderItemEntityFromJson(Map<String, dynamic> json) {
  return OrderItemEntity()
    ..hotelNo = json['hotelNo'] as String
    ..channelOrderNo = json['channelOrderNo'] as String
    ..orderNo = json['orderNo'] as String
    ..isAssigned = json['isAssigned'] as bool
    ..contactName = json['contactName'] as String
    ..contactTelNo = json['contactTelNo'] as String
    ..numOfRoom = json['numOfRoom'] as num
    ..roomTypeName = json['roomTypeName'] as String
    ..roomTypeNo = json['roomTypeNo'] as String
    ..orderTypeCode = json['orderTypeCode'] as String
    ..orderTypeName = json['orderTypeName'] as String
    ..checkInTime = json['checkInTime'] as String
    ..checkOutTime = json['checkOutTime'] as String
    ..orderMoney = json['orderMoney'] as String
    ..totalIncome = json['totalIncome'] as String
    ..totalOrderMoney = json['totalOrderMoney'] as String
    ..channelName = json['channelName'] as String
    ..channelCode = json['channelCode'] as String
    ..payTypeCode = json['payTypeCode'] as String
    ..payTypeName = json['payTypeName'] as String
    ..payStateCode = json['payStateCode'] as String
    ..payStateName = json['payStateName'] as String
    ..payMoney = json['payMoney'] as String
    ..guaranteeMoney = json['guaranteeMoney'] as String
    ..orderComment = json['orderComment'] as String
    ..roomAssigner = json['roomAssigner'] as String
    ..orderStateCode = json['orderStateCode'] as String
    ..orderStateName = json['orderStateName'] as String
    ..consume = json['consume'] as String
    ..stayList = (json['stayList'] as List)
        ?.map((e) =>
            e == null ? null : StayEntity.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$OrderItemEntityToJson(OrderItemEntity instance) =>
    <String, dynamic>{
      'hotelNo': instance.hotelNo,
      'channelOrderNo': instance.channelOrderNo,
      'orderNo': instance.orderNo,
      'isAssigned': instance.isAssigned,
      'contactName': instance.contactName,
      'contactTelNo': instance.contactTelNo,
      'numOfRoom': instance.numOfRoom,
      'roomTypeName': instance.roomTypeName,
      'roomTypeNo': instance.roomTypeNo,
      'orderTypeCode': instance.orderTypeCode,
      'orderTypeName': instance.orderTypeName,
      'checkInTime': instance.checkInTime,
      'checkOutTime': instance.checkOutTime,
      'orderMoney': instance.orderMoney,
      'totalIncome': instance.totalIncome,
      'totalOrderMoney': instance.totalOrderMoney,
      'channelName': instance.channelName,
      'channelCode': instance.channelCode,
      'payTypeCode': instance.payTypeCode,
      'payTypeName': instance.payTypeName,
      'payStateCode': instance.payStateCode,
      'payStateName': instance.payStateName,
      'payMoney': instance.payMoney,
      'guaranteeMoney': instance.guaranteeMoney,
      'orderComment': instance.orderComment,
      'roomAssigner': instance.roomAssigner,
      'orderStateCode': instance.orderStateCode,
      'orderStateName': instance.orderStateName,
      'consume': instance.consume,
      'stayList': instance.stayList,
    };
