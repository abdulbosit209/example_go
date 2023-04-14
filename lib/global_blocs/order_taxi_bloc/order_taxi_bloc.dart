import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:gotaxi/data/repositories/order_repository.dart';

part 'order_taxi_event.dart';

part 'order_taxi_state.dart';

class OrderTaxiBloc extends Bloc<OrderTaxiEvent, OrderTaxiState> {
  OrderTaxiBloc({required OrderRepository orderRepository})
      : _orderRepository = orderRepository,
        super(
           OrderTaxiState(
            status: FormzStatus.pure,
            fields: {
              'from_where_text': "",
              'from_where_lat': 0.0,
              'from_where_lng': 0.0,
              'passenger_date': "",
              'passenger_time': "",
              'need_luggage': false,
              'to_where_text': "",
              'to_where_lat': 0.0,
              'to_where_lng': 0.0,
              'adults': 0,
            },
          ),
        ) {
    on<UpdateCurrentOrder>(_updateCurrentOrder);
    on<AddOrder>(_addOrder);
    on<EmptyOrder>(_emptyOrder);

  }

  final OrderRepository _orderRepository;


  void _updateCurrentOrder(
      UpdateCurrentOrder event, Emitter<OrderTaxiState> emit) {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try{
      Map<String, dynamic> map = state.fields;
      map[event.fieldKey] = event.fieldValue;
      emit(state.copyWith(fields: map, status: FormzStatus.submissionSuccess));
    }catch(e){
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }

  void _addOrder(AddOrder event, Emitter<OrderTaxiState> emit) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      await _orderRepository.postOrder(json: state.fields);
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
      add(EmptyOrder());
    } catch (e) {
      log("$e error");
    }
  }

  void _emptyOrder(
    EmptyOrder event,
    Emitter<OrderTaxiState> emit,
  ) {
    emit(
      state.copyWith(
        fields: {
          'from_where_text': "",
          'from_where_lat': 0.0,
          'from_where_lng': 0.0,
          'passenger_date': "",
          'passenger_time': "",
          'need_luggage': false,
          'to_where_text': "",
          'to_where_lat': 0.0,
          'to_where_lng': 0.0,
          'adults': 0,
        },
      ),
    );
  }
}
