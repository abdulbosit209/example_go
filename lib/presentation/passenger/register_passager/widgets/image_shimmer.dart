import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class PersonShimmer extends StatelessWidget {
  const PersonShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      enabled: true,
      child: Container(
        color: Colors.white,
        child: const ClipOval(child: SizedBox()),
      ),
    );
  }
}
