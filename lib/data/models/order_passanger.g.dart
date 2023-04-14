// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_passanger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderPassenger _$$_OrderPassengerFromJson(Map<String, dynamic> json) =>
    _$_OrderPassenger(
      fromWhereText: json['from_where_text'] as String? ?? "",
      orderDocId: json['order_doc_id'] as String? ?? "",
      fromWhereLat: (json['from_where_lat'] as num?)?.toDouble() ?? 0.0,
      fromWhereLng: (json['from_where_lng'] as num?)?.toDouble() ?? 0.0,
      passengerDate: json['passenger_date'] as String? ?? '',
      passengerTime: json['passenger_time'] as String? ?? "",
      needLuggage: json['need_luggage'] as bool? ?? false,
      toWhereText: json['to_where_text'] as String? ?? "",
      carNumber: json['car_number'] as String? ?? "",
      driverName: json['driver_name'] as String? ?? "",
      userId: json['user_id'] as String? ?? "",
      toWhereLat: (json['to_where_lat'] as num?)?.toDouble() ?? 0.0,
      toWhereLng: (json['to_where_lng'] as num?)?.toDouble() ?? 0.0,
      adults: json['adults'] as int? ?? 0,
    );

Map<String, dynamic> _$$_OrderPassengerToJson(_$_OrderPassenger instance) =>
    <String, dynamic>{
      'from_where_text': instance.fromWhereText,
      'order_doc_id': instance.orderDocId,
      'from_where_lat': instance.fromWhereLat,
      'from_where_lng': instance.fromWhereLng,
      'passenger_date': instance.passengerDate,
      'passenger_time': instance.passengerTime,
      'need_luggage': instance.needLuggage,
      'to_where_text': instance.toWhereText,
      'car_number': instance.carNumber,
      'driver_name': instance.driverName,
      'user_id': instance.userId,
      'to_where_lat': instance.toWhereLat,
      'to_where_lng': instance.toWhereLng,
      'adults': instance.adults,
    };
