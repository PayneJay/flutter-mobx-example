// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderListEntity _$OrderListEntityFromJson(Map<String, dynamic> json) {
  return OrderListEntity()
    ..rowCount = json['rowCount'] as int
    ..pageCount = json['pageCount'] as int
    ..localOrderList = (json['localOrderList'] as List)
        ?.map((e) => e == null
            ? null
            : OrderItemEntity.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..channelOrderList = (json['channelOrderList'] as List)
        ?.map((e) => e == null
            ? null
            : OrderItemEntity.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$OrderListEntityToJson(OrderListEntity instance) =>
    <String, dynamic>{
      'rowCount': instance.rowCount,
      'pageCount': instance.pageCount,
      'localOrderList': instance.localOrderList,
      'channelOrderList': instance.channelOrderList,
    };
