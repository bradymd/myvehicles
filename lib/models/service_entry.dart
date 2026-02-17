import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_entry.freezed.dart';
part 'service_entry.g.dart';

@freezed
class ServiceEntry with _$ServiceEntry {
  const factory ServiceEntry({
    required String id,
    required String vehicleId,
    @Default('') String date,
    @Default('service') String type,
    @Default('') String description,
    @Default(0) double cost,
    @Default('') String garage,
    @Default(0) int mileage,
    @Default('') String nextServiceDate,
    @Default(0) int nextServiceMileage,
  }) = _ServiceEntry;

  factory ServiceEntry.fromJson(Map<String, dynamic> json) =>
      _$ServiceEntryFromJson(json);
}
