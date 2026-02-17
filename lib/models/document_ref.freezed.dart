// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'document_ref.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

DocumentRef _$DocumentRefFromJson(Map<String, dynamic> json) {
  return _DocumentRef.fromJson(json);
}

/// @nodoc
mixin _$DocumentRef {
  String get id => throw _privateConstructorUsedError;
  String get parentType => throw _privateConstructorUsedError;
  String get parentId => throw _privateConstructorUsedError;
  String get filename => throw _privateConstructorUsedError;
  String get localPath => throw _privateConstructorUsedError;
  String get fileType => throw _privateConstructorUsedError;
  String get addedDate => throw _privateConstructorUsedError;

  /// Serializes this DocumentRef to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DocumentRef
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DocumentRefCopyWith<DocumentRef> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DocumentRefCopyWith<$Res> {
  factory $DocumentRefCopyWith(
    DocumentRef value,
    $Res Function(DocumentRef) then,
  ) = _$DocumentRefCopyWithImpl<$Res, DocumentRef>;
  @useResult
  $Res call({
    String id,
    String parentType,
    String parentId,
    String filename,
    String localPath,
    String fileType,
    String addedDate,
  });
}

/// @nodoc
class _$DocumentRefCopyWithImpl<$Res, $Val extends DocumentRef>
    implements $DocumentRefCopyWith<$Res> {
  _$DocumentRefCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DocumentRef
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? parentType = null,
    Object? parentId = null,
    Object? filename = null,
    Object? localPath = null,
    Object? fileType = null,
    Object? addedDate = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            parentType: null == parentType
                ? _value.parentType
                : parentType // ignore: cast_nullable_to_non_nullable
                      as String,
            parentId: null == parentId
                ? _value.parentId
                : parentId // ignore: cast_nullable_to_non_nullable
                      as String,
            filename: null == filename
                ? _value.filename
                : filename // ignore: cast_nullable_to_non_nullable
                      as String,
            localPath: null == localPath
                ? _value.localPath
                : localPath // ignore: cast_nullable_to_non_nullable
                      as String,
            fileType: null == fileType
                ? _value.fileType
                : fileType // ignore: cast_nullable_to_non_nullable
                      as String,
            addedDate: null == addedDate
                ? _value.addedDate
                : addedDate // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DocumentRefImplCopyWith<$Res>
    implements $DocumentRefCopyWith<$Res> {
  factory _$$DocumentRefImplCopyWith(
    _$DocumentRefImpl value,
    $Res Function(_$DocumentRefImpl) then,
  ) = __$$DocumentRefImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String parentType,
    String parentId,
    String filename,
    String localPath,
    String fileType,
    String addedDate,
  });
}

/// @nodoc
class __$$DocumentRefImplCopyWithImpl<$Res>
    extends _$DocumentRefCopyWithImpl<$Res, _$DocumentRefImpl>
    implements _$$DocumentRefImplCopyWith<$Res> {
  __$$DocumentRefImplCopyWithImpl(
    _$DocumentRefImpl _value,
    $Res Function(_$DocumentRefImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DocumentRef
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? parentType = null,
    Object? parentId = null,
    Object? filename = null,
    Object? localPath = null,
    Object? fileType = null,
    Object? addedDate = null,
  }) {
    return _then(
      _$DocumentRefImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        parentType: null == parentType
            ? _value.parentType
            : parentType // ignore: cast_nullable_to_non_nullable
                  as String,
        parentId: null == parentId
            ? _value.parentId
            : parentId // ignore: cast_nullable_to_non_nullable
                  as String,
        filename: null == filename
            ? _value.filename
            : filename // ignore: cast_nullable_to_non_nullable
                  as String,
        localPath: null == localPath
            ? _value.localPath
            : localPath // ignore: cast_nullable_to_non_nullable
                  as String,
        fileType: null == fileType
            ? _value.fileType
            : fileType // ignore: cast_nullable_to_non_nullable
                  as String,
        addedDate: null == addedDate
            ? _value.addedDate
            : addedDate // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DocumentRefImpl implements _DocumentRef {
  const _$DocumentRefImpl({
    required this.id,
    this.parentType = 'vehicle',
    this.parentId = '',
    this.filename = '',
    this.localPath = '',
    this.fileType = '',
    this.addedDate = '',
  });

  factory _$DocumentRefImpl.fromJson(Map<String, dynamic> json) =>
      _$$DocumentRefImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey()
  final String parentType;
  @override
  @JsonKey()
  final String parentId;
  @override
  @JsonKey()
  final String filename;
  @override
  @JsonKey()
  final String localPath;
  @override
  @JsonKey()
  final String fileType;
  @override
  @JsonKey()
  final String addedDate;

  @override
  String toString() {
    return 'DocumentRef(id: $id, parentType: $parentType, parentId: $parentId, filename: $filename, localPath: $localPath, fileType: $fileType, addedDate: $addedDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DocumentRefImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.parentType, parentType) ||
                other.parentType == parentType) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId) &&
            (identical(other.filename, filename) ||
                other.filename == filename) &&
            (identical(other.localPath, localPath) ||
                other.localPath == localPath) &&
            (identical(other.fileType, fileType) ||
                other.fileType == fileType) &&
            (identical(other.addedDate, addedDate) ||
                other.addedDate == addedDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    parentType,
    parentId,
    filename,
    localPath,
    fileType,
    addedDate,
  );

  /// Create a copy of DocumentRef
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DocumentRefImplCopyWith<_$DocumentRefImpl> get copyWith =>
      __$$DocumentRefImplCopyWithImpl<_$DocumentRefImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DocumentRefImplToJson(this);
  }
}

abstract class _DocumentRef implements DocumentRef {
  const factory _DocumentRef({
    required final String id,
    final String parentType,
    final String parentId,
    final String filename,
    final String localPath,
    final String fileType,
    final String addedDate,
  }) = _$DocumentRefImpl;

  factory _DocumentRef.fromJson(Map<String, dynamic> json) =
      _$DocumentRefImpl.fromJson;

  @override
  String get id;
  @override
  String get parentType;
  @override
  String get parentId;
  @override
  String get filename;
  @override
  String get localPath;
  @override
  String get fileType;
  @override
  String get addedDate;

  /// Create a copy of DocumentRef
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DocumentRefImplCopyWith<_$DocumentRefImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
