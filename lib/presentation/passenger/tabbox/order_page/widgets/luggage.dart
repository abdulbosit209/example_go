import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gotaxi/global_blocs/order_taxi_bloc/order_taxi_bloc.dart';
import 'package:gotaxi/utils/style.dart';

class CheckBoxItem extends StatelessWidget {
  const CheckBoxItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "bagaj kerakmi",
          style: MyTextStyle.sfProMedium.copyWith(fontSize: 20),
        ),
        Checkbox(
          checkColor: Colors.white,
          value: context.select((OrderTaxiBloc bloc) => bloc.state.fields['need_luggage']),
          onChanged: (bool? value) {
            context.read<OrderTaxiBloc>().add(UpdateCurrentOrder(fieldKey: 'need_luggage', fieldValue: value));
          },
        ),
      ],
    );
  }
}