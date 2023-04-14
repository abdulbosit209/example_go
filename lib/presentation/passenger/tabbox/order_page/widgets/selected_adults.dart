import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gotaxi/global_blocs/order_taxi_bloc/order_taxi_bloc.dart';
import 'package:gotaxi/presentation/passenger/tabbox/order_page/widgets/add_button.dart';
import 'package:gotaxi/utils/style.dart';

class SelectAdults extends StatelessWidget {
  const SelectAdults({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int count = context.select((OrderTaxiBloc bloc) => bloc.state.fields['adults']);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "yo'lovchilar soni  $count",
          style: MyTextStyle.sfProMedium.copyWith(fontSize: 20),
        ),
        Row(
          children: [
            AddButton(onTap: count > 3 ? null : (){
              count++;
              context.read<OrderTaxiBloc>().add(UpdateCurrentOrder(fieldKey: 'adults', fieldValue: count));
            }, icon: Icons.add, color: count > 3 ? Colors.grey : Colors.green,),
            const SizedBox(width: 10),
            AddButton(onTap: count <= 0 ? null : (){
              count--;
              context.read<OrderTaxiBloc>().add(UpdateCurrentOrder(fieldKey: 'adults', fieldValue: count));
            }, icon: Icons.remove, color: count <= 0 ? Colors.grey : Colors.green,),
          ],
        )
      ],
    );
  }
}