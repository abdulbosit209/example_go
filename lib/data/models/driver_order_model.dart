
import 'package:freezed_annotation/freezed_annotation.dart';


part 'driver_order_model.freezed.dart';

part 'driver_order_model.g.dart';

@freezed
class DriverOrderModel with _$DriverOrderModel {
  const factory DriverOrderModel({
    @JsonKey(name: "from_where_text") @Default("") String fromWhereText,
    @JsonKey(name: "driver_order_doc_id") @Default("") String orderDocId,
    @JsonKey(name: "from_where_lat") @Default(0.0) double fromWhereLat,
    @JsonKey(name: "from_where_lng") @Default(0.0) double fromWhereLng,
    @JsonKey(name: "driver_date") @Default('') String driverDate,
    @JsonKey(name: "driver_time") @Default("") String driverTime,
    @JsonKey(name: "have_luggage") @Default(false) bool needLuggage,
    @JsonKey(name: "to_where_text") @Default("") String toWhereText,
    @JsonKey(name: "car_number") @Default("") String carNumber,
    @JsonKey(name: "user_id") @Default("") String userId,
    @JsonKey(name: "to_where_lat") @Default(0.0) double toWhereLat,
    @JsonKey(name: "to_where_lng") @Default(0.0) double toWhereLng,
    @JsonKey(name: "seats") @Default(0) int seats,
  }) = _DriverOrderModel;

  factory DriverOrderModel.fromJson(Map<String, dynamic> json) =>
      _$DriverOrderModelFromJson(json);
}
