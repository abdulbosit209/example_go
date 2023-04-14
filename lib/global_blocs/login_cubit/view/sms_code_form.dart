import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:gotaxi/global_blocs/login_cubit/login_cubit.dart';
import 'package:gotaxi/router/router.gr.dart';
import 'package:gotaxi/utils/icons/icon.dart';
import 'package:lottie/lottie.dart';

@RoutePage()
class SmsScreenForm extends StatelessWidget {
  const SmsScreenForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              LottieBuilder.asset(MyIcons.register),
              _PhoneInput(),
              const SizedBox(height: 50),
              _LoginButton()
            ],
          ),
        ),
      );
  }
}

class _PhoneInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) =>
          previous.phone != current.phone,
      builder: (context, state) {
        return TextField(
          key: const Key('loginForm_emailInput_textField'),
          onChanged: (phone) => context.read<LoginCubit>().phoneChanged(phone),
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
            labelText: 'phone',
            helperText: '',
            errorText:
                state.phone.invalid ? 'invalid phone number' : null,
          ),
        );
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status.isSubmissionInProgress
            ? const CircularProgressIndicator()
            : ElevatedButton(
                key: const Key('loginForm_continue_raisedButton'),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  backgroundColor: const Color(0xFFFFD600),
                ),
                onPressed: () {
                        context.read<LoginCubit>().sighUpWithPhoneNumber();
                        AutoRouter.of(context).push(const SMSCodeScreenRoute());
                      },
                    
                child: const Text('LOGIN'),
              );
      },
    );
  }
}
