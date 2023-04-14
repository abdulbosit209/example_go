import 'package:gotaxi/data/models/geo_model/point_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'meta_data_property.dart';

part 'geo_object.g.dart';

@JsonSerializable(explicitToJson: true)
class GeoObject {
  @JsonKey(name: 'metaDataProperty')
  MetaDataProperty metaDataProperty;
  @JsonKey(defaultValue: '')
  String name;
  @JsonKey(defaultValue: '')
  String description;
  @JsonKey(name: "Point")
  Points point;

  GeoObject({
    required this.metaDataProperty,
    required this.name,
    required this.description,
    required this.point,
  });

  factory GeoObject.fromJson(Map<String, dynamic> json) =>
      _$GeoObjectFromJson(json);

  Map<String, dynamic> toJson() => _$GeoObjectToJson(this);
}
