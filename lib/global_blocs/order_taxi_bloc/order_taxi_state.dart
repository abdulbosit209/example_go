part of 'order_taxi_bloc.dart';

class OrderTaxiState extends Equatable {
  const OrderTaxiState({
    required this.status,
    required this.fields,
  });

  final Map<String, dynamic> fields;
  final FormzStatus status;

  OrderTaxiState copyWith({
    Map<String, dynamic>? fields,
    FormzStatus? status,
  }) =>
      OrderTaxiState(
        fields: fields ?? this.fields,
        status: status ?? this.status,
      );

  @override
  List<Object?> get props => [fields, status];
}
