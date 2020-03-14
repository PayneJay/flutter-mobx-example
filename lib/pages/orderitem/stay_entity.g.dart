// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stay_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StayEntity _$StayEntityFromJson(Map<String, dynamic> json) {
  return StayEntity()
    ..stayNo = json['stayNo'] as String
    ..numOfRoom = json['numOfRoom'] as num
    ..stateCode = json['stateCode'] as String
    ..stateName = json['stateName'] as String
    ..customerName = json['customerName'] as String
    ..customerTelNo = json['customerTelNo'] as String
    ..roomNo = json['roomNo'] as String
    ..doorNo = json['doorNo'] as String
    ..occupyCiDate = json['occupyCiDate'] as String
    ..occupyCoDate = json['occupyCoDate'] as String
    ..price = json['price'] as String
    ..estimateCiDate = json['estimateCiDate'] as String
    ..estimateCoDate = json['estimateCoDate'] as String
    ..certificateType = json['certificateType'] as String
    ..certificateNo = json['certificateNo'] as String;
}

Map<String, dynamic> _$StayEntityToJson(StayEntity instance) =>
    <String, dynamic>{
      'stayNo': instance.stayNo,
      'numOfRoom': instance.numOfRoom,
      'stateCode': instance.stateCode,
      'stateName': instance.stateName,
      'customerName': instance.customerName,
      'customerTelNo': instance.customerTelNo,
      'roomNo': instance.roomNo,
      'doorNo': instance.doorNo,
      'occupyCiDate': instance.occupyCiDate,
      'occupyCoDate': instance.occupyCoDate,
      'price': instance.price,
      'estimateCiDate': instance.estimateCiDate,
      'estimateCoDate': instance.estimateCoDate,
      'certificateType': instance.certificateType,
      'certificateNo': instance.certificateNo,
    };
