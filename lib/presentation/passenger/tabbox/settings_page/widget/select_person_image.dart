import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gotaxi/global_blocs/passenger_bloc/passenger_bloc.dart';
import 'package:gotaxi/presentation/passenger/register_passager/widgets/image_shimmer.dart';

import 'package:gotaxi/utils/constants.dart';

class SelectImage extends StatelessWidget {
  const SelectImage({
    Key? key,
    required this.onEditTap,
  }) : super(key: key);

  final VoidCallback onEditTap;

  @override
  Widget build(BuildContext context) {
    var image = context.select((PassengerBloc bloc) => bloc.state.passengerModel.passengerPhoto);

    return ClipRRect(
      borderRadius: BorderRadius.circular(60),
      child: Material(
        child: InkWell(
          onTap: onEditTap,
          child: CachedNetworkImage(
            imageUrl: image.isEmpty ? companyLogo : image,
            height: 130,
            width: 130,
            fit: BoxFit.cover,
            placeholder: (context, url) => const PersonShimmer(),
          ),
        ),
      ),
    );
  }
}
