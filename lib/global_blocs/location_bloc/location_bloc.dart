import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:gotaxi/data/repositories/location_repository.dart';
import 'package:gotaxi/utils/my_utils.dart';

part 'location_event.dart';

part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc({
    required LocationRepository locationRepository,
  })  : _locationRepository = locationRepository,
        super(
          LocationState(
              latLng:  const LatLng(0.0, 0.0),
              status: FormzStatus.pure,
              errorText: "",
              positionLatLng: const LatLng(0.0, 0.0),
              toLocationName: '',
              fromLocationName: '',
              ),
        ) {
    on<LocationEvent>(_onEvent, transformer: sequential());
  }

  Future<void> _onEvent(LocationEvent event, Emitter<LocationState> emit) async {
    if (event is UpdateCurrentPosition) return _updateCurrentPosition(event, emit);
    if (event is GetToLocationName) return _getToLocationName(event, emit);
    if (event is GetFromLocationName) return _getFromLocationName(event, emit);
    if (event is GetLocationLatLng) return _getLocationLatLng(event, emit);
  }

  final LocationRepository _locationRepository;


  void _getLocationLatLng(GetLocationLatLng event, Emitter<LocationState> emit) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try{
      String data = await _locationRepository.getLocationLatLng(event.locationName);
      List<double> place = MyUtils.getLatLngList(data);
      emit(state.copyWith(status: FormzStatus.submissionSuccess, positionLatLng: LatLng(place[0], place[1])));
    }catch(e){
      emit(state.copyWith(errorText: e.toString(), status: FormzStatus.submissionFailure));
    }
  }

  void _updateCurrentPosition(
    UpdateCurrentPosition event,
    Emitter<LocationState> emit,
  ) async {
    emit(
      state.copyWith(
        latLng: LatLng(
          event.position.latitude,
          event.position.longitude,
        ),
      ),
    );
  }

  void _getToLocationName(
    GetToLocationName event,
    Emitter<LocationState> emit,
  ) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      String selectedLocationName = await _locationRepository
          .getLocationName("${event.long},${event.lat}");
      emit(
        state.copyWith(
          status: FormzStatus.submissionSuccess,
          toLocationName: selectedLocationName,
        ),
      );
    } catch (e) {
      emit(state.copyWith(
        status: FormzStatus.submissionFailure,
        errorText: e.toString(),
      ));
    }
  }


  void _getFromLocationName(
      GetFromLocationName event,
    Emitter<LocationState> emit,
  ) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      String selectedLocationName = await _locationRepository
          .getLocationName("${event.long},${event.lat}");
      emit(
        state.copyWith(
          status: FormzStatus.submissionSuccess,
          fromLocationName: selectedLocationName,
        ),
      );
    } catch (e) {
      emit(state.copyWith(
        status: FormzStatus.submissionFailure,
        errorText: e.toString(),
      ));
    }
  }

}
