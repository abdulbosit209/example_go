// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DriverModel _$$_DriverModelFromJson(Map<String, dynamic> json) =>
    _$_DriverModel(
      passengerId: json['passenger_id'] as String? ?? "",
      name: json['name'] as String? ?? "",
      lastName: json['last_name'] as String? ?? "",
      driverPhoneNumber: json['driver_phone_number'] as String? ?? "",
      driverPhoto: json['driver_photo'] as String? ?? "",
      telegramUrl: json['telegram_url'] as String? ?? "",
      gender: json['gender'] as String? ?? "",
      driverLicense: json['driver_license'] as String? ?? "",
      passport: json['passport'] as String? ?? "",
      carNumber: json['car_number'] as String? ?? "",
      carImages: (json['car_images'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_DriverModelToJson(_$_DriverModel instance) =>
    <String, dynamic>{
      'passenger_id': instance.passengerId,
      'name': instance.name,
      'last_name': instance.lastName,
      'driver_phone_number': instance.driverPhoneNumber,
      'driver_photo': instance.driverPhoto,
      'telegram_url': instance.telegramUrl,
      'gender': instance.gender,
      'driver_license': instance.driverLicense,
      'passport': instance.passport,
      'car_number': instance.carNumber,
      'car_images': instance.carImages,
    };
