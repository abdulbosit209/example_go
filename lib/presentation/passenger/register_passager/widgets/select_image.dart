import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:gotaxi/utils/constants.dart';

import 'image_shimmer.dart';


class SelectPersonImage extends StatelessWidget {
  const SelectPersonImage({
    Key? key,
    required this.logoUrl,
    required this.onEditTap,
  })
      : super(key: key);

  final String logoUrl;
  final VoidCallback onEditTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(width: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: CachedNetworkImage(
              imageUrl: logoUrl.isEmpty ? companyLogo : logoUrl,
              height: 100,
              width: 100,
              fit: BoxFit.cover,
              placeholder: (context, url) => const PersonShimmer(),
            ),
          ),
          const SizedBox(width: 16),
          Center(
            child: ElevatedButton(
              onPressed: onEditTap,
              child: const Text("rasm tanlang (Ixtiyoriy)"),
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
    );
  }
}
