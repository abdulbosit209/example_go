// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'passenger_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PassengerUser _$$_PassengerUserFromJson(Map<String, dynamic> json) =>
    _$_PassengerUser(
      fullName: json['full_name'] as String? ?? "",
      gender: json['gender'] as String? ?? '',
      age: json['age'] as int? ?? 0,
      phoneNumber: json['phone_number'] as String? ?? "",
      passengerDocId: json['passenger_doc_id'] as String? ?? "",
      orderDocId: json['order_doc_id'] as String? ?? "",
      passengerSeat: json['passenger_seat'] as int? ?? 0,
    );

Map<String, dynamic> _$$_PassengerUserToJson(_$_PassengerUser instance) =>
    <String, dynamic>{
      'full_name': instance.fullName,
      'gender': instance.gender,
      'age': instance.age,
      'phone_number': instance.phoneNumber,
      'passenger_doc_id': instance.passengerDocId,
      'order_doc_id': instance.orderDocId,
      'passenger_seat': instance.passengerSeat,
    };
