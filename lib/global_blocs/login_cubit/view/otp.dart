
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gotaxi/global_blocs/login_cubit/login_cubit.dart';
import 'package:gotaxi/router/router.gr.dart';
import 'package:pinput/pinput.dart';

@RoutePage()
class SMSCodeScreen extends StatefulWidget {
  const SMSCodeScreen({Key? key}) : super(key: key);


  @override
  State<SMSCodeScreen> createState() => _SMSCodeScreenState();
}

class _SMSCodeScreenState extends State<SMSCodeScreen> {
  final TextEditingController textController = TextEditingController();
  final FocusNode focusNode = FocusNode();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var code = '';
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(
            height: 60,
          ),
          Image.asset(
            "assets/images/img_6.png",
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: Text("Enter your 6 digit here",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black)),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Pinput(
                length: 6,
                showCursor: true,
                onChanged: (value) {
                  code = value;
                },
              )),
          const SizedBox(height: 50),
          OutlinedButton(
              onPressed: () {
                context.read<LoginCubit>().otpVerification(code: code);
                // context.go('/register_screen');
                AutoRouter.of(context).push(const RegisterPassengerRoute());
              },
              child: const Text("Login")),
          const SizedBox(height: 20),
        ]),
      ),
    );
  }
}
