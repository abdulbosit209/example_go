import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:gotaxi/data/models/passenger_user.dart';

part 'order_passanger.freezed.dart';

part 'order_passanger.g.dart';

@freezed
class OrderPassenger with _$OrderPassenger {
  const factory OrderPassenger({
    @JsonKey(name: "from_where_text") @Default("") String fromWhereText,
    @JsonKey(name: "order_doc_id") @Default("") String orderDocId,
    @JsonKey(name: "from_where_lat") @Default(0.0) double fromWhereLat,
    @JsonKey(name: "from_where_lng") @Default(0.0) double fromWhereLng,
    @JsonKey(name: "passenger_date") @Default('') String passengerDate,
    @JsonKey(name: "passenger_time") @Default("") String passengerTime,
    @JsonKey(name: "need_luggage") @Default(false) bool needLuggage,
    @JsonKey(name: "to_where_text") @Default("") String toWhereText,
    @JsonKey(name: "car_number") @Default("") String carNumber,
    @JsonKey(name: "driver_name") @Default("") String driverName,
    @JsonKey(name: "user_id") @Default("") String userId,
    @JsonKey(name: "to_where_lat") @Default(0.0) double toWhereLat,
    @JsonKey(name: "to_where_lng") @Default(0.0) double toWhereLng,
    @JsonKey(name: "adults") @Default(0) int adults,
  }) = _OrderPassenger;

  factory OrderPassenger.fromJson(Map<String, dynamic> json) =>
      _$OrderPassengerFromJson(json);
}
