import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gotaxi/global_blocs/order_taxi_bloc/order_taxi_bloc.dart';
import 'package:gotaxi/presentation/passenger/tabbox/order_page/widgets/from_where.dart';
import 'package:gotaxi/utils/style.dart';

import 'widgets/date_field.dart';
import 'widgets/luggage.dart';
import 'widgets/selected_adults.dart';
import 'widgets/time_field.dart';
import 'widgets/to_where.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 15,
          bottom: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FromWhere(),
            SizedBox(height: 10),
            ToWhere(),
            DateField(),
            TimeField(),
            CheckBoxItem(),
            SelectAdults(),
            SizedBox(height: 50),
            Builder(
              builder: (context) {
                var field = context.watch<OrderTaxiBloc>().state.fields;
                return Center(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(120, 55)),
                      onPressed: isValidated(field) ? (){

                      } : null,
                      child: Text(
                        "Keyingisi",
                        style: MyTextStyle.sfProMedium.copyWith(fontSize: 20),
                      )),
                );
              }
            )
          ],
        ),
      ),
    );
  }
}

bool isValidated(Map<String, dynamic> fields) {
  bool isValid = false;
  String fromWhere = fields["from_where_text"];
  String toWhereText = fields["to_where_text"];
  String passengerDate = fields["passenger_date"];
  String passengerTime = fields["passenger_time"];
  int people = fields["adults"];
  double fromWhereLat = fields["from_where_lat"];
  double toWhereLng = fields["to_where_lng"];
  if (
  fromWhere.isNotEmpty &&
  toWhereText.isNotEmpty &&
  passengerDate.isNotEmpty &&
  passengerTime.isNotEmpty &&
  people != 0 &&
  fromWhereLat != 0.0 &&
  toWhereLng != 0.0
  ) isValid = true;

    return isValid;
}

/*

    @JsonKey(name: "need_luggage") @Default(false) bool needLuggage,
    @JsonKey(name: "adults") @Default(0) int adults,

    @JsonKey(name: "from_where_text") @Default("") String fromWhereText,
    @JsonKey(name: "order_doc_id") @Default("") String orderDocId,
    @JsonKey(name: "from_where_lat") @Default(0.0) double fromWhereLat,
    @JsonKey(name: "from_where_lng") @Default(0.0) double fromWhereLng,
    @JsonKey(name: "passenger_date") @Default('') String passengerDate,
    @JsonKey(name: "passenger_time") @Default("") String passengerTime,
    @JsonKey(name: "need_luggage") @Default(false) bool needLuggage,
    @JsonKey(name: "to_where_text") @Default("") String toWhereText,
    @JsonKey(name: "to_where_lat") @Default(0.0) double toWhereLat,
    @JsonKey(name: "to_where_lng") @Default(0.0) double toWhereLng,
    @JsonKey(name: "adults") @Default(0) int adults,



 */
