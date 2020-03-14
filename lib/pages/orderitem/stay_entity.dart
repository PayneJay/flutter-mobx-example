import 'package:json_annotation/json_annotation.dart';

part 'stay_entity.g.dart';

@JsonSerializable()
class StayEntity {
  StayEntity();

  String stayNo;
  num numOfRoom;
  String stateCode;
  String stateName;
  String customerName;
  String customerTelNo;
  String roomNo;
  String doorNo;
  String occupyCiDate;
  String occupyCoDate;
  String price;
  String estimateCiDate;
  String estimateCoDate;
  String certificateType;
  String certificateNo;

  factory StayEntity.fromJson(Map<String, dynamic> json) =>
      _$StayEntityFromJson(json);

  Map<String, dynamic> toJson() => _$StayEntityToJson(this);
}
