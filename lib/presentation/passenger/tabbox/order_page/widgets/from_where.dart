

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:gotaxi/data/repositories/location_repository.dart';
import 'package:gotaxi/global_blocs/location_bloc/location_bloc.dart';
import 'package:gotaxi/presentation/passenger/widgets/google_map_page_where.dart';
import 'package:gotaxi/utils/my_utils.dart';

class FromWhere extends StatelessWidget {
  const FromWhere({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Colors.grey),
          borderRadius: BorderRadius.circular(15)
      ),
      onTap: () async {
        await showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) {
            return SizedBox(
              height: 700,
              child: ListView.separated(
                itemBuilder: (context, index) =>
                    PlaceListTile(name: MyUtils.cityNames[index],),
                separatorBuilder: (context, index) =>
                const SizedBox(height: 6),
                itemCount: MyUtils.cityNames.length,
              ),
            );
          },
        );
      },
      title: BlocBuilder<LocationBloc, LocationState>(
        builder: (context, state) {
          return Text(state.fromLocationName.isEmpty ? "Qayerdan" : state.fromLocationName);
        },
      ),
      visualDensity: VisualDensity.comfortable,
    );
  }
}

class PlaceListTile extends StatefulWidget {
  const PlaceListTile({
    super.key, required this.name,
  });

  final String name;

  @override
  State<PlaceListTile> createState() => _PlaceListTileState();
}

class _PlaceListTileState extends State<PlaceListTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.name),
      visualDensity: VisualDensity.standard,
      onTap: () async {
        var position = await RepositoryProvider.of<LocationRepository>(context)
            .determinePosition();
        if (!mounted) return;
        String locationName = await RepositoryProvider.of<LocationRepository>(context).getLocationLatLng(widget.name);
        List<double> place = MyUtils.getLatLngList(locationName);
        if (!mounted) return;
        context.read<LocationBloc>().add(UpdateCurrentPosition(position: position));
        context.read<LocationBloc>().add(GetFromLocationName(lat: place[1], long: place[0]));
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return GoogleMapView(
                callback: () {},
                latLng: LatLng(place[1], place[0]),
              );
            },
          ),
        );
      },
    );
  }
}