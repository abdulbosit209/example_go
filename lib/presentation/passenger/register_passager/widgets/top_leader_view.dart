import 'package:flutter/material.dart';
import 'package:gotaxi/utils/style.dart';

class TopLeaderViewVacancy extends StatelessWidget {
  const TopLeaderViewVacancy({Key? key, required this.currentPage})
      : super(key: key);

  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          getRoundedWidget(currentPage >= 1, "1", context),
          Expanded(
            child: Container(
              height: 1,
              color: Colors.grey,
            ),
          ),
          getRoundedWidget(currentPage >= 2, "2", context),
        ],
      ),
    );
  }

  Widget getRoundedWidget(bool isActive, String text, context) {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        color: isActive ? const Color(0xff356899) : const Color(0xff95969d),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          text,
          style: MyTextStyle.sfProBold.copyWith(
              color: isActive ? Colors.white : Theme.of(context).cardColor),
        ),
      ),
    );
  }
}
