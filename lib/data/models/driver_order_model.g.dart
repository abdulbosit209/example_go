// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver_order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DriverOrderModel _$$_DriverOrderModelFromJson(Map<String, dynamic> json) =>
    _$_DriverOrderModel(
      fromWhereText: json['from_where_text'] as String? ?? "",
      orderDocId: json['driver_order_doc_id'] as String? ?? "",
      fromWhereLat: (json['from_where_lat'] as num?)?.toDouble() ?? 0.0,
      fromWhereLng: (json['from_where_lng'] as num?)?.toDouble() ?? 0.0,
      driverDate: json['driver_date'] as String? ?? '',
      driverTime: json['driver_time'] as String? ?? "",
      needLuggage: json['have_luggage'] as bool? ?? false,
      toWhereText: json['to_where_text'] as String? ?? "",
      carNumber: json['car_number'] as String? ?? "",
      userId: json['user_id'] as String? ?? "",
      toWhereLat: (json['to_where_lat'] as num?)?.toDouble() ?? 0.0,
      toWhereLng: (json['to_where_lng'] as num?)?.toDouble() ?? 0.0,
      seats: json['seats'] as int? ?? 0,
    );

Map<String, dynamic> _$$_DriverOrderModelToJson(_$_DriverOrderModel instance) =>
    <String, dynamic>{
      'from_where_text': instance.fromWhereText,
      'driver_order_doc_id': instance.orderDocId,
      'from_where_lat': instance.fromWhereLat,
      'from_where_lng': instance.fromWhereLng,
      'driver_date': instance.driverDate,
      'driver_time': instance.driverTime,
      'have_luggage': instance.needLuggage,
      'to_where_text': instance.toWhereText,
      'car_number': instance.carNumber,
      'user_id': instance.userId,
      'to_where_lat': instance.toWhereLat,
      'to_where_lng': instance.toWhereLng,
      'seats': instance.seats,
    };
