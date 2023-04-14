import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:gotaxi/data/form_inputs/phone_input.dart';
import 'package:gotaxi/data/repositories/authentification_reository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(AuthenticationRepository authenticationRepository)
      : _authenticationRepository = authenticationRepository,
        super(const LoginState());

  final AuthenticationRepository _authenticationRepository;

  void phoneChanged(String value) {
    final phone = Phone.dirty(value);
    emit(
      state.copyWith(phone: phone, status: Formz.validate([phone])),
    );
  }

  void sighUpWithPhoneNumber() async {
    if (!state.status.isValidated) return;
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      await _authenticationRepository.signUpWithPhoneNumber(
        number: state.phone.value,
      );
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } catch (e) {
      emit(state.copyWith(
          errorText: e.toString(), status: FormzStatus.submissionFailure));
    }
  }


  void otpVerification({required String code}) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      _authenticationRepository.otpVerification(code: code);
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } catch (e) {
      emit(
        state.copyWith(
          errorText: e.toString(),
          status: FormzStatus.submissionFailure,
        ),
      );
    }
  }
}
