import 'package:freezed_annotation/freezed_annotation.dart';

part 'passenger_user.freezed.dart';

part 'passenger_user.g.dart';

@freezed
class PassengerUser with _$PassengerUser {
  const factory PassengerUser({
    @JsonKey(name: "full_name") @Default("") String fullName,
    @JsonKey(name: "gender") @Default('') String gender,
    @JsonKey(name: "age") @Default(0) int age,
    @JsonKey(name: "phone_number") @Default("") String phoneNumber,
    @JsonKey(name: "passenger_doc_id") @Default("") String passengerDocId,
    @JsonKey(name: "order_doc_id") @Default("") String orderDocId,
    @JsonKey(name: "passenger_seat") @Default(0) int passengerSeat,
  }) = _PassengerUser;

  factory PassengerUser.fromJson(Map<String, dynamic> json) =>
      _$PassengerUserFromJson(json);
}
