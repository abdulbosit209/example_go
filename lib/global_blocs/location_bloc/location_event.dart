part of 'location_bloc.dart';

abstract class LocationEvent extends Equatable {
  const LocationEvent();

  @override
  List<Object?> get props => [];
}

class UpdateCurrentPosition extends LocationEvent {
  const UpdateCurrentPosition({required this.position});

  final Position position;

  @override
  List<Object?> get props => [position];
}

class GetFromLocationName extends LocationEvent {
  const GetFromLocationName({required this.lat, required this.long});

  final double lat;
  final double long;

  @override
  List<Object?> get props => [lat, long];
}

class GetToLocationName extends LocationEvent {
  const GetToLocationName({required this.lat, required this.long});

  final double lat;
  final double long;

  @override
  List<Object?> get props => [lat, long];
}

class GetLocationLatLng extends LocationEvent {

  final String locationName;

  const GetLocationLatLng({required this.locationName});

  @override
  List<Object?> get props => [locationName];
}





