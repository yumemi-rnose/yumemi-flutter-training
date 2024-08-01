// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_get_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WeatherGetRequest _$WeatherGetRequestFromJson(Map<String, dynamic> json) {
  return _WeatherGetRequest.fromJson(json);
}

/// @nodoc
mixin _$WeatherGetRequest {
  String get area => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeatherGetRequestCopyWith<WeatherGetRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherGetRequestCopyWith<$Res> {
  factory $WeatherGetRequestCopyWith(
          WeatherGetRequest value, $Res Function(WeatherGetRequest) then) =
      _$WeatherGetRequestCopyWithImpl<$Res, WeatherGetRequest>;
  @useResult
  $Res call({String area, DateTime date});
}

/// @nodoc
class _$WeatherGetRequestCopyWithImpl<$Res, $Val extends WeatherGetRequest>
    implements $WeatherGetRequestCopyWith<$Res> {
  _$WeatherGetRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? area = null,
    Object? date = null,
  }) {
    return _then(_value.copyWith(
      area: null == area
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeatherGetRequestImplCopyWith<$Res>
    implements $WeatherGetRequestCopyWith<$Res> {
  factory _$$WeatherGetRequestImplCopyWith(_$WeatherGetRequestImpl value,
          $Res Function(_$WeatherGetRequestImpl) then) =
      __$$WeatherGetRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String area, DateTime date});
}

/// @nodoc
class __$$WeatherGetRequestImplCopyWithImpl<$Res>
    extends _$WeatherGetRequestCopyWithImpl<$Res, _$WeatherGetRequestImpl>
    implements _$$WeatherGetRequestImplCopyWith<$Res> {
  __$$WeatherGetRequestImplCopyWithImpl(_$WeatherGetRequestImpl _value,
      $Res Function(_$WeatherGetRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? area = null,
    Object? date = null,
  }) {
    return _then(_$WeatherGetRequestImpl(
      area: null == area
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeatherGetRequestImpl implements _WeatherGetRequest {
  _$WeatherGetRequestImpl({required this.area, required this.date});

  factory _$WeatherGetRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeatherGetRequestImplFromJson(json);

  @override
  final String area;
  @override
  final DateTime date;

  @override
  String toString() {
    return 'WeatherGetRequest(area: $area, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherGetRequestImpl &&
            (identical(other.area, area) || other.area == area) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, area, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherGetRequestImplCopyWith<_$WeatherGetRequestImpl> get copyWith =>
      __$$WeatherGetRequestImplCopyWithImpl<_$WeatherGetRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeatherGetRequestImplToJson(
      this,
    );
  }
}

abstract class _WeatherGetRequest implements WeatherGetRequest {
  factory _WeatherGetRequest(
      {required final String area,
      required final DateTime date}) = _$WeatherGetRequestImpl;

  factory _WeatherGetRequest.fromJson(Map<String, dynamic> json) =
      _$WeatherGetRequestImpl.fromJson;

  @override
  String get area;
  @override
  DateTime get date;
  @override
  @JsonKey(ignore: true)
  _$$WeatherGetRequestImplCopyWith<_$WeatherGetRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
