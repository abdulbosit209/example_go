part of 'location_bloc.dart';

class LocationState extends Equatable {
   const LocationState({
    required this.latLng,
    required this.status,
    required this.errorText,
    required this.fromLocationName,
     required this.toLocationName,
     required this.positionLatLng
  });

  final LatLng latLng;
  final FormzStatus status;
  final String fromLocationName;
  final String toLocationName;
  final String errorText;
  final LatLng positionLatLng;

  LocationState copyWith({
    FormzStatus? status,
    String? errorText,
    String? fromLocationName,
    LatLng? latLng,
    LatLng? positionLatLng,
    String? toLocationName
  }) {
    return LocationState(
      toLocationName: toLocationName ?? this.toLocationName,
      positionLatLng: positionLatLng ?? this.positionLatLng,
      errorText: errorText ?? this.errorText,
      status: status ?? this.status,
      fromLocationName: fromLocationName ?? this.fromLocationName,
      latLng: latLng ?? this.latLng,
    );
  }

  @override
  List<Object?> get props => [latLng, status, fromLocationName, errorText, positionLatLng, toLocationName];
}
