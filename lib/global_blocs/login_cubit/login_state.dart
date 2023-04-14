part of 'login_cubit.dart';

class LoginState extends Equatable {
  const LoginState({
    this.errorText,
    this.phone = const Phone.pure(),
    this.status = FormzStatus.pure,
  });

  final String? errorText;
  final FormzStatus status;
  final Phone phone;

  LoginState copyWith({
    String? errorText,
    FormzStatus? status,
    Phone? phone,
  }) =>
      LoginState(
        errorText: errorText ?? this.errorText,
        status: status ?? this.status,
        phone: phone ?? this.phone,
      );

  @override
  List<Object> get props => [phone, status];
}
