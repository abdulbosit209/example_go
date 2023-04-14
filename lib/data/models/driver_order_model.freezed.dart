// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'driver_order_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DriverOrderModel _$DriverOrderModelFromJson(Map<String, dynamic> json) {
  return _DriverOrderModel.fromJson(json);
}

/// @nodoc
mixin _$DriverOrderModel {
  @JsonKey(name: "from_where_text")
  String get fromWhereText => throw _privateConstructorUsedError;
  @JsonKey(name: "driver_order_doc_id")
  String get orderDocId => throw _privateConstructorUsedError;
  @JsonKey(name: "from_where_lat")
  double get fromWhereLat => throw _privateConstructorUsedError;
  @JsonKey(name: "from_where_lng")
  double get fromWhereLng => throw _privateConstructorUsedError;
  @JsonKey(name: "driver_date")
  String get driverDate => throw _privateConstructorUsedError;
  @JsonKey(name: "driver_time")
  String get driverTime => throw _privateConstructorUsedError;
  @JsonKey(name: "have_luggage")
  bool get needLuggage => throw _privateConstructorUsedError;
  @JsonKey(name: "to_where_text")
  String get toWhereText => throw _privateConstructorUsedError;
  @JsonKey(name: "car_number")
  String get carNumber => throw _privateConstructorUsedError;
  @JsonKey(name: "user_id")
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: "to_where_lat")
  double get toWhereLat => throw _privateConstructorUsedError;
  @JsonKey(name: "to_where_lng")
  double get toWhereLng => throw _privateConstructorUsedError;
  @JsonKey(name: "seats")
  int get seats => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DriverOrderModelCopyWith<DriverOrderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DriverOrderModelCopyWith<$Res> {
  factory $DriverOrderModelCopyWith(
          DriverOrderModel value, $Res Function(DriverOrderModel) then) =
      _$DriverOrderModelCopyWithImpl<$Res, DriverOrderModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "from_where_text") String fromWhereText,
      @JsonKey(name: "driver_order_doc_id") String orderDocId,
      @JsonKey(name: "from_where_lat") double fromWhereLat,
      @JsonKey(name: "from_where_lng") double fromWhereLng,
      @JsonKey(name: "driver_date") String driverDate,
      @JsonKey(name: "driver_time") String driverTime,
      @JsonKey(name: "have_luggage") bool needLuggage,
      @JsonKey(name: "to_where_text") String toWhereText,
      @JsonKey(name: "car_number") String carNumber,
      @JsonKey(name: "user_id") String userId,
      @JsonKey(name: "to_where_lat") double toWhereLat,
      @JsonKey(name: "to_where_lng") double toWhereLng,
      @JsonKey(name: "seats") int seats});
}

/// @nodoc
class _$DriverOrderModelCopyWithImpl<$Res, $Val extends DriverOrderModel>
    implements $DriverOrderModelCopyWith<$Res> {
  _$DriverOrderModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fromWhereText = null,
    Object? orderDocId = null,
    Object? fromWhereLat = null,
    Object? fromWhereLng = null,
    Object? driverDate = null,
    Object? driverTime = null,
    Object? needLuggage = null,
    Object? toWhereText = null,
    Object? carNumber = null,
    Object? userId = null,
    Object? toWhereLat = null,
    Object? toWhereLng = null,
    Object? seats = null,
  }) {
    return _then(_value.copyWith(
      fromWhereText: null == fromWhereText
          ? _value.fromWhereText
          : fromWhereText // ignore: cast_nullable_to_non_nullable
              as String,
      orderDocId: null == orderDocId
          ? _value.orderDocId
          : orderDocId // ignore: cast_nullable_to_non_nullable
              as String,
      fromWhereLat: null == fromWhereLat
          ? _value.fromWhereLat
          : fromWhereLat // ignore: cast_nullable_to_non_nullable
              as double,
      fromWhereLng: null == fromWhereLng
          ? _value.fromWhereLng
          : fromWhereLng // ignore: cast_nullable_to_non_nullable
              as double,
      driverDate: null == driverDate
          ? _value.driverDate
          : driverDate // ignore: cast_nullable_to_non_nullable
              as String,
      driverTime: null == driverTime
          ? _value.driverTime
          : driverTime // ignore: cast_nullable_to_non_nullable
              as String,
      needLuggage: null == needLuggage
          ? _value.needLuggage
          : needLuggage // ignore: cast_nullable_to_non_nullable
              as bool,
      toWhereText: null == toWhereText
          ? _value.toWhereText
          : toWhereText // ignore: cast_nullable_to_non_nullable
              as String,
      carNumber: null == carNumber
          ? _value.carNumber
          : carNumber // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      toWhereLat: null == toWhereLat
          ? _value.toWhereLat
          : toWhereLat // ignore: cast_nullable_to_non_nullable
              as double,
      toWhereLng: null == toWhereLng
          ? _value.toWhereLng
          : toWhereLng // ignore: cast_nullable_to_non_nullable
              as double,
      seats: null == seats
          ? _value.seats
          : seats // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DriverOrderModelCopyWith<$Res>
    implements $DriverOrderModelCopyWith<$Res> {
  factory _$$_DriverOrderModelCopyWith(
          _$_DriverOrderModel value, $Res Function(_$_DriverOrderModel) then) =
      __$$_DriverOrderModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "from_where_text") String fromWhereText,
      @JsonKey(name: "driver_order_doc_id") String orderDocId,
      @JsonKey(name: "from_where_lat") double fromWhereLat,
      @JsonKey(name: "from_where_lng") double fromWhereLng,
      @JsonKey(name: "driver_date") String driverDate,
      @JsonKey(name: "driver_time") String driverTime,
      @JsonKey(name: "have_luggage") bool needLuggage,
      @JsonKey(name: "to_where_text") String toWhereText,
      @JsonKey(name: "car_number") String carNumber,
      @JsonKey(name: "user_id") String userId,
      @JsonKey(name: "to_where_lat") double toWhereLat,
      @JsonKey(name: "to_where_lng") double toWhereLng,
      @JsonKey(name: "seats") int seats});
}

/// @nodoc
class __$$_DriverOrderModelCopyWithImpl<$Res>
    extends _$DriverOrderModelCopyWithImpl<$Res, _$_DriverOrderModel>
    implements _$$_DriverOrderModelCopyWith<$Res> {
  __$$_DriverOrderModelCopyWithImpl(
      _$_DriverOrderModel _value, $Res Function(_$_DriverOrderModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fromWhereText = null,
    Object? orderDocId = null,
    Object? fromWhereLat = null,
    Object? fromWhereLng = null,
    Object? driverDate = null,
    Object? driverTime = null,
    Object? needLuggage = null,
    Object? toWhereText = null,
    Object? carNumber = null,
    Object? userId = null,
    Object? toWhereLat = null,
    Object? toWhereLng = null,
    Object? seats = null,
  }) {
    return _then(_$_DriverOrderModel(
      fromWhereText: null == fromWhereText
          ? _value.fromWhereText
          : fromWhereText // ignore: cast_nullable_to_non_nullable
              as String,
      orderDocId: null == orderDocId
          ? _value.orderDocId
          : orderDocId // ignore: cast_nullable_to_non_nullable
              as String,
      fromWhereLat: null == fromWhereLat
          ? _value.fromWhereLat
          : fromWhereLat // ignore: cast_nullable_to_non_nullable
              as double,
      fromWhereLng: null == fromWhereLng
          ? _value.fromWhereLng
          : fromWhereLng // ignore: cast_nullable_to_non_nullable
              as double,
      driverDate: null == driverDate
          ? _value.driverDate
          : driverDate // ignore: cast_nullable_to_non_nullable
              as String,
      driverTime: null == driverTime
          ? _value.driverTime
          : driverTime // ignore: cast_nullable_to_non_nullable
              as String,
      needLuggage: null == needLuggage
          ? _value.needLuggage
          : needLuggage // ignore: cast_nullable_to_non_nullable
              as bool,
      toWhereText: null == toWhereText
          ? _value.toWhereText
          : toWhereText // ignore: cast_nullable_to_non_nullable
              as String,
      carNumber: null == carNumber
          ? _value.carNumber
          : carNumber // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      toWhereLat: null == toWhereLat
          ? _value.toWhereLat
          : toWhereLat // ignore: cast_nullable_to_non_nullable
              as double,
      toWhereLng: null == toWhereLng
          ? _value.toWhereLng
          : toWhereLng // ignore: cast_nullable_to_non_nullable
              as double,
      seats: null == seats
          ? _value.seats
          : seats // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DriverOrderModel implements _DriverOrderModel {
  const _$_DriverOrderModel(
      {@JsonKey(name: "from_where_text") this.fromWhereText = "",
      @JsonKey(name: "driver_order_doc_id") this.orderDocId = "",
      @JsonKey(name: "from_where_lat") this.fromWhereLat = 0.0,
      @JsonKey(name: "from_where_lng") this.fromWhereLng = 0.0,
      @JsonKey(name: "driver_date") this.driverDate = '',
      @JsonKey(name: "driver_time") this.driverTime = "",
      @JsonKey(name: "have_luggage") this.needLuggage = false,
      @JsonKey(name: "to_where_text") this.toWhereText = "",
      @JsonKey(name: "car_number") this.carNumber = "",
      @JsonKey(name: "user_id") this.userId = "",
      @JsonKey(name: "to_where_lat") this.toWhereLat = 0.0,
      @JsonKey(name: "to_where_lng") this.toWhereLng = 0.0,
      @JsonKey(name: "seats") this.seats = 0});

  factory _$_DriverOrderModel.fromJson(Map<String, dynamic> json) =>
      _$$_DriverOrderModelFromJson(json);

  @override
  @JsonKey(name: "from_where_text")
  final String fromWhereText;
  @override
  @JsonKey(name: "driver_order_doc_id")
  final String orderDocId;
  @override
  @JsonKey(name: "from_where_lat")
  final double fromWhereLat;
  @override
  @JsonKey(name: "from_where_lng")
  final double fromWhereLng;
  @override
  @JsonKey(name: "driver_date")
  final String driverDate;
  @override
  @JsonKey(name: "driver_time")
  final String driverTime;
  @override
  @JsonKey(name: "have_luggage")
  final bool needLuggage;
  @override
  @JsonKey(name: "to_where_text")
  final String toWhereText;
  @override
  @JsonKey(name: "car_number")
  final String carNumber;
  @override
  @JsonKey(name: "user_id")
  final String userId;
  @override
  @JsonKey(name: "to_where_lat")
  final double toWhereLat;
  @override
  @JsonKey(name: "to_where_lng")
  final double toWhereLng;
  @override
  @JsonKey(name: "seats")
  final int seats;

  @override
  String toString() {
    return 'DriverOrderModel(fromWhereText: $fromWhereText, orderDocId: $orderDocId, fromWhereLat: $fromWhereLat, fromWhereLng: $fromWhereLng, driverDate: $driverDate, driverTime: $driverTime, needLuggage: $needLuggage, toWhereText: $toWhereText, carNumber: $carNumber, userId: $userId, toWhereLat: $toWhereLat, toWhereLng: $toWhereLng, seats: $seats)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DriverOrderModel &&
            (identical(other.fromWhereText, fromWhereText) ||
                other.fromWhereText == fromWhereText) &&
            (identical(other.orderDocId, orderDocId) ||
                other.orderDocId == orderDocId) &&
            (identical(other.fromWhereLat, fromWhereLat) ||
                other.fromWhereLat == fromWhereLat) &&
            (identical(other.fromWhereLng, fromWhereLng) ||
                other.fromWhereLng == fromWhereLng) &&
            (identical(other.driverDate, driverDate) ||
                other.driverDate == driverDate) &&
            (identical(other.driverTime, driverTime) ||
                other.driverTime == driverTime) &&
            (identical(other.needLuggage, needLuggage) ||
                other.needLuggage == needLuggage) &&
            (identical(other.toWhereText, toWhereText) ||
                other.toWhereText == toWhereText) &&
            (identical(other.carNumber, carNumber) ||
                other.carNumber == carNumber) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.toWhereLat, toWhereLat) ||
                other.toWhereLat == toWhereLat) &&
            (identical(other.toWhereLng, toWhereLng) ||
                other.toWhereLng == toWhereLng) &&
            (identical(other.seats, seats) || other.seats == seats));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      fromWhereText,
      orderDocId,
      fromWhereLat,
      fromWhereLng,
      driverDate,
      driverTime,
      needLuggage,
      toWhereText,
      carNumber,
      userId,
      toWhereLat,
      toWhereLng,
      seats);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DriverOrderModelCopyWith<_$_DriverOrderModel> get copyWith =>
      __$$_DriverOrderModelCopyWithImpl<_$_DriverOrderModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DriverOrderModelToJson(
      this,
    );
  }
}

abstract class _DriverOrderModel implements DriverOrderModel {
  const factory _DriverOrderModel(
      {@JsonKey(name: "from_where_text") final String fromWhereText,
      @JsonKey(name: "driver_order_doc_id") final String orderDocId,
      @JsonKey(name: "from_where_lat") final double fromWhereLat,
      @JsonKey(name: "from_where_lng") final double fromWhereLng,
      @JsonKey(name: "driver_date") final String driverDate,
      @JsonKey(name: "driver_time") final String driverTime,
      @JsonKey(name: "have_luggage") final bool needLuggage,
      @JsonKey(name: "to_where_text") final String toWhereText,
      @JsonKey(name: "car_number") final String carNumber,
      @JsonKey(name: "user_id") final String userId,
      @JsonKey(name: "to_where_lat") final double toWhereLat,
      @JsonKey(name: "to_where_lng") final double toWhereLng,
      @JsonKey(name: "seats") final int seats}) = _$_DriverOrderModel;

  factory _DriverOrderModel.fromJson(Map<String, dynamic> json) =
      _$_DriverOrderModel.fromJson;

  @override
  @JsonKey(name: "from_where_text")
  String get fromWhereText;
  @override
  @JsonKey(name: "driver_order_doc_id")
  String get orderDocId;
  @override
  @JsonKey(name: "from_where_lat")
  double get fromWhereLat;
  @override
  @JsonKey(name: "from_where_lng")
  double get fromWhereLng;
  @override
  @JsonKey(name: "driver_date")
  String get driverDate;
  @override
  @JsonKey(name: "driver_time")
  String get driverTime;
  @override
  @JsonKey(name: "have_luggage")
  bool get needLuggage;
  @override
  @JsonKey(name: "to_where_text")
  String get toWhereText;
  @override
  @JsonKey(name: "car_number")
  String get carNumber;
  @override
  @JsonKey(name: "user_id")
  String get userId;
  @override
  @JsonKey(name: "to_where_lat")
  double get toWhereLat;
  @override
  @JsonKey(name: "to_where_lng")
  double get toWhereLng;
  @override
  @JsonKey(name: "seats")
  int get seats;
  @override
  @JsonKey(ignore: true)
  _$$_DriverOrderModelCopyWith<_$_DriverOrderModel> get copyWith =>
      throw _privateConstructorUsedError;
}
