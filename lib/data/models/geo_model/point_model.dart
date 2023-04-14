import 'package:json_annotation/json_annotation.dart';
part 'point_model.g.dart';

@JsonSerializable()
class Points {

  @JsonKey(defaultValue: "", name: 'pos')
  String pos;

  Points({required this.pos});

  factory Points.fromJson(Map<String, dynamic> json) =>
      _$PointsFromJson(json);

  Map<String, dynamic> toJson() => _$PointsToJson(this);
}
