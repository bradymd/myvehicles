// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ServiceEntry _$ServiceEntryFromJson(Map<String, dynamic> json) {
  return _ServiceEntry.fromJson(json);
}

/// @nodoc
mixin _$ServiceEntry {
  String get id => throw _privateConstructorUsedError;
  String get vehicleId => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  double get cost => throw _privateConstructorUsedError;
  String get garage => throw _privateConstructorUsedError;
  int get mileage => throw _privateConstructorUsedError;
  String get nextServiceDate => throw _privateConstructorUsedError;
  int get nextServiceMileage => throw _privateConstructorUsedError;

  /// Serializes this ServiceEntry to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ServiceEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ServiceEntryCopyWith<ServiceEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceEntryCopyWith<$Res> {
  factory $ServiceEntryCopyWith(
    ServiceEntry value,
    $Res Function(ServiceEntry) then,
  ) = _$ServiceEntryCopyWithImpl<$Res, ServiceEntry>;
  @useResult
  $Res call({
    String id,
    String vehicleId,
    String date,
    String type,
    String description,
    double cost,
    String garage,
    int mileage,
    String nextServiceDate,
    int nextServiceMileage,
  });
}

/// @nodoc
class _$ServiceEntryCopyWithImpl<$Res, $Val extends ServiceEntry>
    implements $ServiceEntryCopyWith<$Res> {
  _$ServiceEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ServiceEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? vehicleId = null,
    Object? date = null,
    Object? type = null,
    Object? description = null,
    Object? cost = null,
    Object? garage = null,
    Object? mileage = null,
    Object? nextServiceDate = null,
    Object? nextServiceMileage = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            vehicleId: null == vehicleId
                ? _value.vehicleId
                : vehicleId // ignore: cast_nullable_to_non_nullable
                      as String,
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            cost: null == cost
                ? _value.cost
                : cost // ignore: cast_nullable_to_non_nullable
                      as double,
            garage: null == garage
                ? _value.garage
                : garage // ignore: cast_nullable_to_non_nullable
                      as String,
            mileage: null == mileage
                ? _value.mileage
                : mileage // ignore: cast_nullable_to_non_nullable
                      as int,
            nextServiceDate: null == nextServiceDate
                ? _value.nextServiceDate
                : nextServiceDate // ignore: cast_nullable_to_non_nullable
                      as String,
            nextServiceMileage: null == nextServiceMileage
                ? _value.nextServiceMileage
                : nextServiceMileage // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ServiceEntryImplCopyWith<$Res>
    implements $ServiceEntryCopyWith<$Res> {
  factory _$$ServiceEntryImplCopyWith(
    _$ServiceEntryImpl value,
    $Res Function(_$ServiceEntryImpl) then,
  ) = __$$ServiceEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String vehicleId,
    String date,
    String type,
    String description,
    double cost,
    String garage,
    int mileage,
    String nextServiceDate,
    int nextServiceMileage,
  });
}

/// @nodoc
class __$$ServiceEntryImplCopyWithImpl<$Res>
    extends _$ServiceEntryCopyWithImpl<$Res, _$ServiceEntryImpl>
    implements _$$ServiceEntryImplCopyWith<$Res> {
  __$$ServiceEntryImplCopyWithImpl(
    _$ServiceEntryImpl _value,
    $Res Function(_$ServiceEntryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ServiceEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? vehicleId = null,
    Object? date = null,
    Object? type = null,
    Object? description = null,
    Object? cost = null,
    Object? garage = null,
    Object? mileage = null,
    Object? nextServiceDate = null,
    Object? nextServiceMileage = null,
  }) {
    return _then(
      _$ServiceEntryImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        vehicleId: null == vehicleId
            ? _value.vehicleId
            : vehicleId // ignore: cast_nullable_to_non_nullable
                  as String,
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        cost: null == cost
            ? _value.cost
            : cost // ignore: cast_nullable_to_non_nullable
                  as double,
        garage: null == garage
            ? _value.garage
            : garage // ignore: cast_nullable_to_non_nullable
                  as String,
        mileage: null == mileage
            ? _value.mileage
            : mileage // ignore: cast_nullable_to_non_nullable
                  as int,
        nextServiceDate: null == nextServiceDate
            ? _value.nextServiceDate
            : nextServiceDate // ignore: cast_nullable_to_non_nullable
                  as String,
        nextServiceMileage: null == nextServiceMileage
            ? _value.nextServiceMileage
            : nextServiceMileage // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ServiceEntryImpl implements _ServiceEntry {
  const _$ServiceEntryImpl({
    required this.id,
    required this.vehicleId,
    this.date = '',
    this.type = 'service',
    this.description = '',
    this.cost = 0,
    this.garage = '',
    this.mileage = 0,
    this.nextServiceDate = '',
    this.nextServiceMileage = 0,
  });

  factory _$ServiceEntryImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServiceEntryImplFromJson(json);

  @override
  final String id;
  @override
  final String vehicleId;
  @override
  @JsonKey()
  final String date;
  @override
  @JsonKey()
  final String type;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final double cost;
  @override
  @JsonKey()
  final String garage;
  @override
  @JsonKey()
  final int mileage;
  @override
  @JsonKey()
  final String nextServiceDate;
  @override
  @JsonKey()
  final int nextServiceMileage;

  @override
  String toString() {
    return 'ServiceEntry(id: $id, vehicleId: $vehicleId, date: $date, type: $type, description: $description, cost: $cost, garage: $garage, mileage: $mileage, nextServiceDate: $nextServiceDate, nextServiceMileage: $nextServiceMileage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceEntryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.vehicleId, vehicleId) ||
                other.vehicleId == vehicleId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.cost, cost) || other.cost == cost) &&
            (identical(other.garage, garage) || other.garage == garage) &&
            (identical(other.mileage, mileage) || other.mileage == mileage) &&
            (identical(other.nextServiceDate, nextServiceDate) ||
                other.nextServiceDate == nextServiceDate) &&
            (identical(other.nextServiceMileage, nextServiceMileage) ||
                other.nextServiceMileage == nextServiceMileage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    vehicleId,
    date,
    type,
    description,
    cost,
    garage,
    mileage,
    nextServiceDate,
    nextServiceMileage,
  );

  /// Create a copy of ServiceEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceEntryImplCopyWith<_$ServiceEntryImpl> get copyWith =>
      __$$ServiceEntryImplCopyWithImpl<_$ServiceEntryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ServiceEntryImplToJson(this);
  }
}

abstract class _ServiceEntry implements ServiceEntry {
  const factory _ServiceEntry({
    required final String id,
    required final String vehicleId,
    final String date,
    final String type,
    final String description,
    final double cost,
    final String garage,
    final int mileage,
    final String nextServiceDate,
    final int nextServiceMileage,
  }) = _$ServiceEntryImpl;

  factory _ServiceEntry.fromJson(Map<String, dynamic> json) =
      _$ServiceEntryImpl.fromJson;

  @override
  String get id;
  @override
  String get vehicleId;
  @override
  String get date;
  @override
  String get type;
  @override
  String get description;
  @override
  double get cost;
  @override
  String get garage;
  @override
  int get mileage;
  @override
  String get nextServiceDate;
  @override
  int get nextServiceMileage;

  /// Create a copy of ServiceEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServiceEntryImplCopyWith<_$ServiceEntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
