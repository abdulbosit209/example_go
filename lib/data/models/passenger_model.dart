import 'package:freezed_annotation/freezed_annotation.dart';

part 'passenger_model.freezed.dart';

part 'passenger_model.g.dart';

@freezed
class PassengerModel with _$PassengerModel{

  const factory PassengerModel({
    @JsonKey(name: "passenger_doc_id")
    @Default("") String passengerDocId,
    @JsonKey(name: "passenger_id")
    @Default("") String passengerId,
    @JsonKey( name: "full_name")
    @Default("") String fullName,
    @JsonKey( name: "passenger_phone_number")
    @Default("") String passengerPhoneNumber,
    @JsonKey(name: "passenger_photo")
    @Default("") String passengerPhoto,
    @JsonKey(name: "telegram_url")
    @Default("") String telegramUrl,
    @JsonKey(name: "gender")
    @Default("") String gender,
  }) = _PassengerModel;

  factory PassengerModel.fromJson(Map<String, dynamic> json) =>
      _$PassengerModelFromJson(json);
}