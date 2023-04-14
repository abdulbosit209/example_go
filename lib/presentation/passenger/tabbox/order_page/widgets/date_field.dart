import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gotaxi/global_blocs/order_taxi_bloc/order_taxi_bloc.dart';
import 'package:gotaxi/presentation/passenger/tabbox/order_page/widgets/time_button.dart';
import 'package:gotaxi/utils/my_utils.dart';

class DateField extends StatelessWidget {
  const DateField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderTaxiBloc, OrderTaxiState>(
      builder: (context, state) {
        return TimeButton(
          onTap: () async {
            String date = await MyUtils.selectDate(context);
            context.read<OrderTaxiBloc>().add(UpdateCurrentOrder(
              fieldKey: 'passenger_date',
              fieldValue: date,
            ));
          },
          descriptionText: 'Kunni tanlang',
          timeText: state.fields['passenger_date'].isEmpty
              ? "Kuni belgilang"
              : state.fields['passenger_date'],
        );
      },
    );
  }
}