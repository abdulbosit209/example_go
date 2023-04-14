part of 'order_taxi_bloc.dart';

abstract class OrderTaxiEvent extends Equatable {
  const OrderTaxiEvent();

  @override
  List<Object?> get props => [];
}

class UpdateCurrentOrder extends OrderTaxiEvent {
  const UpdateCurrentOrder({
    required this.fieldKey,
    required this.fieldValue,
  });

  final dynamic fieldValue;
  final String fieldKey;

  @override
  List<Object?> get props => [fieldKey, fieldValue];
}

class AddOrder extends OrderTaxiEvent {}

class EmptyOrder extends  OrderTaxiEvent {}
