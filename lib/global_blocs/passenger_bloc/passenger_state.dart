part of 'passenger_bloc.dart';

class PassengerState extends Equatable {
  const PassengerState({
    required this.status,
    required this.fields,
    required this.passengerModel
});

  final Map<String, dynamic> fields;
  final FormzStatus status;
  final PassengerModel passengerModel;

  PassengerState copyWith({
    Map<String, dynamic>? fields,
    FormzStatus? status,
    PassengerModel? passengerModel,
  }) =>
      PassengerState(
        fields: fields ?? this.fields,
        status: status ?? this.status,
        passengerModel: passengerModel ?? this.passengerModel
      );

  @override
  List<Object?> get props => [fields, status, passengerModel];
}

