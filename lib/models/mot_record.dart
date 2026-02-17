import 'package:freezed_annotation/freezed_annotation.dart';

part 'mot_record.freezed.dart';
part 'mot_record.g.dart';

@freezed
class MOTRecord with _$MOTRecord {
  const factory MOTRecord({
    required String id,
    required String vehicleId,
    @Default('') String testDate,
    @Default('') String expiryDate,
    @Default('') String testCentre,
    @Default(0) int mileage,
    @Default('pass') String result,
    @Default('') String advisories,
  }) = _MOTRecord;

  factory MOTRecord.fromJson(Map<String, dynamic> json) =>
      _$MOTRecordFromJson(json);
}
