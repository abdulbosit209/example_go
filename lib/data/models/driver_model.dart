import 'package:freezed_annotation/freezed_annotation.dart';

part 'driver_model.freezed.dart';

part 'driver_model.g.dart';

@freezed
class DriverModel with _$DriverModel{

  const factory DriverModel({
    @JsonKey(name: "passenger_id")
    @Default("") String passengerId,
    @JsonKey( name: "name")
    @Default("") String name,
    @JsonKey( name: "last_name")
    @Default("") String lastName,
    @JsonKey( name: "driver_phone_number")
    @Default("") String driverPhoneNumber,
    @JsonKey(name: "driver_photo")
    @Default("") String driverPhoto,
    @JsonKey(name: "telegram_url")
    @Default("") String telegramUrl,
    @JsonKey(name: "gender")
    @Default("") String gender,
    @JsonKey(name: "driver_license")
    @Default("") String driverLicense,
    @JsonKey(name: "passport")
    @Default("") String passport,
    @JsonKey(name: "car_number")
    @Default("") String carNumber,
    @JsonKey(name: "car_images")
    @Default([]) List<String> carImages

  }) = _DriverModel;

  factory DriverModel.fromJson(Map<String, dynamic> json) =>
      _$DriverModelFromJson(json);
}