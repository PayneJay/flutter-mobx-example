import 'package:json_annotation/json_annotation.dart';

import '../orderitem/entity.dart';

part 'entity.g.dart';

@JsonSerializable()
class OrderListEntity {
  OrderListEntity();

  int rowCount;
  int pageCount;
  List<OrderItemEntity> localOrderList;
  List<OrderItemEntity> channelOrderList;

  factory OrderListEntity.fromJson(Map<String, dynamic> json) =>
      _$OrderListEntityFromJson(json);

  Map<String, dynamic> toJson() => _$OrderListEntityToJson(this);
}
