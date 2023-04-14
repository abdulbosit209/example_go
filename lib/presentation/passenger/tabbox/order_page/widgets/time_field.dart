import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gotaxi/global_blocs/order_taxi_bloc/order_taxi_bloc.dart';
import 'package:gotaxi/presentation/passenger/tabbox/order_page/widgets/time_button.dart';
import 'package:gotaxi/utils/my_utils.dart';

class TimeField extends StatelessWidget {
  const TimeField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderTaxiBloc, OrderTaxiState>(
      builder: (context, state) {
        return TimeButton(
          onTap: () async {
            String time = await MyUtils.selectTime(context);
            context.read<OrderTaxiBloc>().add(UpdateCurrentOrder(
              fieldKey: 'passenger_time',
              fieldValue: time,
            ));
          },
          descriptionText: 'Soatini tanlang',
          timeText: state.fields['passenger_time'].isEmpty
              ? "Soatni belgilang"
              : state.fields['passenger_time'],
        );
      },
    );
  }
}