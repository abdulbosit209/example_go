import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:gotaxi/data/models/passenger_model.dart';
import 'package:gotaxi/data/repositories/passenger_repository.dart';

part 'passenger_event.dart';

part 'passenger_state.dart';

class PassengerBloc extends Bloc<PassengerEvent, PassengerState> {
  PassengerBloc({required PassengerRepository passengerRepository})
      : _passengerRepository = passengerRepository,
        super(PassengerState(
          status: FormzStatus.pure,
          fields: {
            'passenger_id': "",
            'full_name': "",
            'passenger_phone_number': "",
            'passenger_photo': "",
            'telegram_url': "https://t.me/",
            'passenger_doc_id': ""
          },
          passengerModel: PassengerModel(),
        )) {
    on<UpdateCurrentPassenger>(_updateCurrentPassenger);
    on<AddPassenger>(_addPassenger);
    on<EmptyPassenger>(_emptyFields);
    on<GetUserData>(_getUserData);
    on<UpdatePassengerModel>(_updatePassengerModel);
    on<UpdateImagePassengerModel>(_updateImagePassengerModel);
  }

  final PassengerRepository _passengerRepository;

  void _updatePassengerModel(
    UpdatePassengerModel event,
    Emitter<PassengerState> emit,
  ) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      PassengerModel passengerModel =
          await _passengerRepository.updatePassengerModel(
        passengerModel: event.passengerModel,
        docId: event.docID,
      );
      emit(state.copyWith(
        passengerModel: passengerModel,
        status: FormzStatus.submissionSuccess,
      ));
    } catch (e) {
      emit(state.copyWith(status: FormzStatus.submissionCanceled));
    }
  }

  void _updateImagePassengerModel(
    UpdateImagePassengerModel event,
    Emitter<PassengerState> emit,
  ) async {
    emit(state.copyWith(
        passengerModel: state.passengerModel.copyWith(
      passengerPhoneNumber: event.image,
    )));
  }

  void _getUserData(
    GetUserData event,
    Emitter<PassengerState> emit,
  ) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      var userData =
          await _passengerRepository.getUserData(userId: event.userId);
      emit(state.copyWith(
          passengerModel: userData, status: FormzStatus.submissionSuccess));
    } catch (e) {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }

  void _updateCurrentPassenger(
      UpdateCurrentPassenger event, Emitter<PassengerState> emit) {
    Map<String, dynamic> map = state.fields;
    map[event.fieldKey] = event.fieldValue;
    emit(state.copyWith(fields: map));
  }

  void _addPassenger(AddPassenger event, Emitter<PassengerState> emit) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      await _passengerRepository.postPassenger(json: state.fields);
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
      add(EmptyPassenger());
    } catch (e) {
      log("$e error");
    }
  }

  void _emptyFields(EmptyPassenger event, Emitter<PassengerState> emit) {
    emit(
      state.copyWith(fields: {
        'passenger_id': "",
        'full_name': "",
        'passenger_phone_number': "",
        'passenger_photo': "",
        'telegram_url': "",
        'passenger_doc_id': ""
      }),
    );
  }
}
