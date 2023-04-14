part of 'passenger_bloc.dart';

abstract class PassengerEvent extends Equatable {
  const PassengerEvent();

  @override
  List<Object?> get props => [];
}

class UpdateCurrentPassenger extends PassengerEvent {
  const UpdateCurrentPassenger({
    required this.fieldKey,
    required this.fieldValue,
  });

  final dynamic fieldValue;
  final String fieldKey;

  @override
  List<Object?> get props => [fieldKey, fieldValue];
}

class GetUserData extends PassengerEvent {
  const GetUserData({required this.userId});

  final String userId;

  @override
  List<Object?> get props => [userId];
}

class UpdatePassengerModel extends PassengerEvent {
  const UpdatePassengerModel({
    required this.passengerModel,
    required this.docID,
  });

  final String docID;
  final PassengerModel passengerModel;

  @override
  List<Object?> get props => [docID, passengerModel];
}

class UpdateImagePassengerModel extends PassengerEvent {
  final String image;

  const UpdateImagePassengerModel({required this.image});

  @override
  List<Object?> get props => [image];
}

class AddPassenger extends PassengerEvent {}

class EmptyPassenger extends PassengerEvent {}
