import 'package:flutter/material.dart';
import 'package:gotaxi/utils/style.dart';

class TimeButton extends StatelessWidget {
  const TimeButton({
    Key? key,
    required this.descriptionText,
    required this.timeText,
    required this.onTap,
  }) : super(key: key);

  final String descriptionText;
  final String timeText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          descriptionText,
          style: MyTextStyle.sfProMedium.copyWith(fontSize: 20),
        ),
        TextButton(
          onPressed: onTap,
          child: Text(
            timeText,
            style: MyTextStyle.sfProMedium.copyWith(
              fontSize: 20,
            ),
          ),
        )
      ],
    );
  }
}