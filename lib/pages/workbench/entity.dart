import 'package:json_annotation/json_annotation.dart';


part 'entity.g.dart';

/// 仅仅做Demo使用
@JsonSerializable()
class WorkbenchEntity {
  WorkbenchEntity();

  int count;

  factory WorkbenchEntity.fromJson(Map<String, dynamic> json) => _$WorkbenchEntityFromJson(json);
  Map<String, dynamic> toJson() => _$WorkbenchEntityToJson(this);

}
