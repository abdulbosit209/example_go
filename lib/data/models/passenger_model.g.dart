// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'passenger_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PassengerModel _$$_PassengerModelFromJson(Map<String, dynamic> json) =>
    _$_PassengerModel(
      passengerDocId: json['passenger_doc_id'] as String? ?? "",
      passengerId: json['passenger_id'] as String? ?? "",
      fullName: json['full_name'] as String? ?? "",
      passengerPhoneNumber: json['passenger_phone_number'] as String? ?? "",
      passengerPhoto: json['passenger_photo'] as String? ?? "",
      telegramUrl: json['telegram_url'] as String? ?? "",
      gender: json['gender'] as String? ?? "",
    );

Map<String, dynamic> _$$_PassengerModelToJson(_$_PassengerModel instance) =>
    <String, dynamic>{
      'passenger_doc_id': instance.passengerDocId,
      'passenger_id': instance.passengerId,
      'full_name': instance.fullName,
      'passenger_phone_number': instance.passengerPhoneNumber,
      'passenger_photo': instance.passengerPhoto,
      'telegram_url': instance.telegramUrl,
      'gender': instance.gender,
    };
