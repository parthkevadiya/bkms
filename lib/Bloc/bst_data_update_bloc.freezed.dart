// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'bst_data_update_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BSTDataUpdateState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoadingStatus loadingStatus) empty,
    required TResult Function(GetBSTWingNameModel? getBSTWingNameModel)
        getBSTWingName,
    required TResult Function(TakeBSTAttendanceModel? takeBSTAttendanceModel,
            LoadingStatus loadingStatus)
        takeBSTAttendance,
    required TResult Function(
            UpdateBSTNiyamAssesmentScoreModel?
                updateBSTNiyamAssesmentScoreModel,
            LoadingStatus loadingStatus)
        updateBSTNiyamAssesmentScore,
    required TResult Function(SaveBSTQuizScoreModel? saveBSTQuizScoreModel,
            LoadingStatus loadingStatus)
        saveBSTQuizScore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(LoadingStatus loadingStatus)? empty,
    TResult Function(GetBSTWingNameModel? getBSTWingNameModel)? getBSTWingName,
    TResult Function(TakeBSTAttendanceModel? takeBSTAttendanceModel,
            LoadingStatus loadingStatus)?
        takeBSTAttendance,
    TResult Function(
            UpdateBSTNiyamAssesmentScoreModel?
                updateBSTNiyamAssesmentScoreModel,
            LoadingStatus loadingStatus)?
        updateBSTNiyamAssesmentScore,
    TResult Function(SaveBSTQuizScoreModel? saveBSTQuizScoreModel,
            LoadingStatus loadingStatus)?
        saveBSTQuizScore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoadingStatus loadingStatus)? empty,
    TResult Function(GetBSTWingNameModel? getBSTWingNameModel)? getBSTWingName,
    TResult Function(TakeBSTAttendanceModel? takeBSTAttendanceModel,
            LoadingStatus loadingStatus)?
        takeBSTAttendance,
    TResult Function(
            UpdateBSTNiyamAssesmentScoreModel?
                updateBSTNiyamAssesmentScoreModel,
            LoadingStatus loadingStatus)?
        updateBSTNiyamAssesmentScore,
    TResult Function(SaveBSTQuizScoreModel? saveBSTQuizScoreModel,
            LoadingStatus loadingStatus)?
        saveBSTQuizScore,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_BSTDataUpdateEmpty value) empty,
    required TResult Function(_ReportStateGetBSTWingName value) getBSTWingName,
    required TResult Function(_ReportStateTakeBSTAttendance value)
        takeBSTAttendance,
    required TResult Function(_ReportStateUpdateBSTNiyamAssesmentScore value)
        updateBSTNiyamAssesmentScore,
    required TResult Function(_ReportStateSaveBSTQuizScore value)
        saveBSTQuizScore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_BSTDataUpdateEmpty value)? empty,
    TResult Function(_ReportStateGetBSTWingName value)? getBSTWingName,
    TResult Function(_ReportStateTakeBSTAttendance value)? takeBSTAttendance,
    TResult Function(_ReportStateUpdateBSTNiyamAssesmentScore value)?
        updateBSTNiyamAssesmentScore,
    TResult Function(_ReportStateSaveBSTQuizScore value)? saveBSTQuizScore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_BSTDataUpdateEmpty value)? empty,
    TResult Function(_ReportStateGetBSTWingName value)? getBSTWingName,
    TResult Function(_ReportStateTakeBSTAttendance value)? takeBSTAttendance,
    TResult Function(_ReportStateUpdateBSTNiyamAssesmentScore value)?
        updateBSTNiyamAssesmentScore,
    TResult Function(_ReportStateSaveBSTQuizScore value)? saveBSTQuizScore,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BSTDataUpdateStateCopyWith<$Res> {
  factory $BSTDataUpdateStateCopyWith(
          BSTDataUpdateState value, $Res Function(BSTDataUpdateState) then) =
      _$BSTDataUpdateStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$BSTDataUpdateStateCopyWithImpl<$Res>
    implements $BSTDataUpdateStateCopyWith<$Res> {
  _$BSTDataUpdateStateCopyWithImpl(this._value, this._then);

  final BSTDataUpdateState _value;
  // ignore: unused_field
  final $Res Function(BSTDataUpdateState) _then;
}

/// @nodoc
abstract class _$$_BSTDataUpdateEmptyCopyWith<$Res> {
  factory _$$_BSTDataUpdateEmptyCopyWith(_$_BSTDataUpdateEmpty value,
          $Res Function(_$_BSTDataUpdateEmpty) then) =
      __$$_BSTDataUpdateEmptyCopyWithImpl<$Res>;
  $Res call({LoadingStatus loadingStatus});
}

/// @nodoc
class __$$_BSTDataUpdateEmptyCopyWithImpl<$Res>
    extends _$BSTDataUpdateStateCopyWithImpl<$Res>
    implements _$$_BSTDataUpdateEmptyCopyWith<$Res> {
  __$$_BSTDataUpdateEmptyCopyWithImpl(
      _$_BSTDataUpdateEmpty _value, $Res Function(_$_BSTDataUpdateEmpty) _then)
      : super(_value, (v) => _then(v as _$_BSTDataUpdateEmpty));

  @override
  _$_BSTDataUpdateEmpty get _value => super._value as _$_BSTDataUpdateEmpty;

  @override
  $Res call({
    Object? loadingStatus = freezed,
  }) {
    return _then(_$_BSTDataUpdateEmpty(
      loadingStatus == freezed
          ? _value.loadingStatus
          : loadingStatus // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
    ));
  }
}

/// @nodoc

class _$_BSTDataUpdateEmpty implements _BSTDataUpdateEmpty {
  const _$_BSTDataUpdateEmpty(this.loadingStatus);

  @override
  final LoadingStatus loadingStatus;

  @override
  String toString() {
    return 'BSTDataUpdateState.empty(loadingStatus: $loadingStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BSTDataUpdateEmpty &&
            const DeepCollectionEquality()
                .equals(other.loadingStatus, loadingStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(loadingStatus));

  @JsonKey(ignore: true)
  @override
  _$$_BSTDataUpdateEmptyCopyWith<_$_BSTDataUpdateEmpty> get copyWith =>
      __$$_BSTDataUpdateEmptyCopyWithImpl<_$_BSTDataUpdateEmpty>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoadingStatus loadingStatus) empty,
    required TResult Function(GetBSTWingNameModel? getBSTWingNameModel)
        getBSTWingName,
    required TResult Function(TakeBSTAttendanceModel? takeBSTAttendanceModel,
            LoadingStatus loadingStatus)
        takeBSTAttendance,
    required TResult Function(
            UpdateBSTNiyamAssesmentScoreModel?
                updateBSTNiyamAssesmentScoreModel,
            LoadingStatus loadingStatus)
        updateBSTNiyamAssesmentScore,
    required TResult Function(SaveBSTQuizScoreModel? saveBSTQuizScoreModel,
            LoadingStatus loadingStatus)
        saveBSTQuizScore,
  }) {
    return empty(loadingStatus);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(LoadingStatus loadingStatus)? empty,
    TResult Function(GetBSTWingNameModel? getBSTWingNameModel)? getBSTWingName,
    TResult Function(TakeBSTAttendanceModel? takeBSTAttendanceModel,
            LoadingStatus loadingStatus)?
        takeBSTAttendance,
    TResult Function(
            UpdateBSTNiyamAssesmentScoreModel?
                updateBSTNiyamAssesmentScoreModel,
            LoadingStatus loadingStatus)?
        updateBSTNiyamAssesmentScore,
    TResult Function(SaveBSTQuizScoreModel? saveBSTQuizScoreModel,
            LoadingStatus loadingStatus)?
        saveBSTQuizScore,
  }) {
    return empty?.call(loadingStatus);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoadingStatus loadingStatus)? empty,
    TResult Function(GetBSTWingNameModel? getBSTWingNameModel)? getBSTWingName,
    TResult Function(TakeBSTAttendanceModel? takeBSTAttendanceModel,
            LoadingStatus loadingStatus)?
        takeBSTAttendance,
    TResult Function(
            UpdateBSTNiyamAssesmentScoreModel?
                updateBSTNiyamAssesmentScoreModel,
            LoadingStatus loadingStatus)?
        updateBSTNiyamAssesmentScore,
    TResult Function(SaveBSTQuizScoreModel? saveBSTQuizScoreModel,
            LoadingStatus loadingStatus)?
        saveBSTQuizScore,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(loadingStatus);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_BSTDataUpdateEmpty value) empty,
    required TResult Function(_ReportStateGetBSTWingName value) getBSTWingName,
    required TResult Function(_ReportStateTakeBSTAttendance value)
        takeBSTAttendance,
    required TResult Function(_ReportStateUpdateBSTNiyamAssesmentScore value)
        updateBSTNiyamAssesmentScore,
    required TResult Function(_ReportStateSaveBSTQuizScore value)
        saveBSTQuizScore,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_BSTDataUpdateEmpty value)? empty,
    TResult Function(_ReportStateGetBSTWingName value)? getBSTWingName,
    TResult Function(_ReportStateTakeBSTAttendance value)? takeBSTAttendance,
    TResult Function(_ReportStateUpdateBSTNiyamAssesmentScore value)?
        updateBSTNiyamAssesmentScore,
    TResult Function(_ReportStateSaveBSTQuizScore value)? saveBSTQuizScore,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_BSTDataUpdateEmpty value)? empty,
    TResult Function(_ReportStateGetBSTWingName value)? getBSTWingName,
    TResult Function(_ReportStateTakeBSTAttendance value)? takeBSTAttendance,
    TResult Function(_ReportStateUpdateBSTNiyamAssesmentScore value)?
        updateBSTNiyamAssesmentScore,
    TResult Function(_ReportStateSaveBSTQuizScore value)? saveBSTQuizScore,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class _BSTDataUpdateEmpty implements BSTDataUpdateState {
  const factory _BSTDataUpdateEmpty(final LoadingStatus loadingStatus) =
      _$_BSTDataUpdateEmpty;

  LoadingStatus get loadingStatus => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$_BSTDataUpdateEmptyCopyWith<_$_BSTDataUpdateEmpty> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ReportStateGetBSTWingNameCopyWith<$Res> {
  factory _$$_ReportStateGetBSTWingNameCopyWith(
          _$_ReportStateGetBSTWingName value,
          $Res Function(_$_ReportStateGetBSTWingName) then) =
      __$$_ReportStateGetBSTWingNameCopyWithImpl<$Res>;
  $Res call({GetBSTWingNameModel? getBSTWingNameModel});
}

/// @nodoc
class __$$_ReportStateGetBSTWingNameCopyWithImpl<$Res>
    extends _$BSTDataUpdateStateCopyWithImpl<$Res>
    implements _$$_ReportStateGetBSTWingNameCopyWith<$Res> {
  __$$_ReportStateGetBSTWingNameCopyWithImpl(
      _$_ReportStateGetBSTWingName _value,
      $Res Function(_$_ReportStateGetBSTWingName) _then)
      : super(_value, (v) => _then(v as _$_ReportStateGetBSTWingName));

  @override
  _$_ReportStateGetBSTWingName get _value =>
      super._value as _$_ReportStateGetBSTWingName;

  @override
  $Res call({
    Object? getBSTWingNameModel = freezed,
  }) {
    return _then(_$_ReportStateGetBSTWingName(
      getBSTWingNameModel == freezed
          ? _value.getBSTWingNameModel
          : getBSTWingNameModel // ignore: cast_nullable_to_non_nullable
              as GetBSTWingNameModel?,
    ));
  }
}

/// @nodoc

class _$_ReportStateGetBSTWingName implements _ReportStateGetBSTWingName {
  const _$_ReportStateGetBSTWingName(this.getBSTWingNameModel);

  @override
  final GetBSTWingNameModel? getBSTWingNameModel;

  @override
  String toString() {
    return 'BSTDataUpdateState.getBSTWingName(getBSTWingNameModel: $getBSTWingNameModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReportStateGetBSTWingName &&
            const DeepCollectionEquality()
                .equals(other.getBSTWingNameModel, getBSTWingNameModel));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(getBSTWingNameModel));

  @JsonKey(ignore: true)
  @override
  _$$_ReportStateGetBSTWingNameCopyWith<_$_ReportStateGetBSTWingName>
      get copyWith => __$$_ReportStateGetBSTWingNameCopyWithImpl<
          _$_ReportStateGetBSTWingName>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoadingStatus loadingStatus) empty,
    required TResult Function(GetBSTWingNameModel? getBSTWingNameModel)
        getBSTWingName,
    required TResult Function(TakeBSTAttendanceModel? takeBSTAttendanceModel,
            LoadingStatus loadingStatus)
        takeBSTAttendance,
    required TResult Function(
            UpdateBSTNiyamAssesmentScoreModel?
                updateBSTNiyamAssesmentScoreModel,
            LoadingStatus loadingStatus)
        updateBSTNiyamAssesmentScore,
    required TResult Function(SaveBSTQuizScoreModel? saveBSTQuizScoreModel,
            LoadingStatus loadingStatus)
        saveBSTQuizScore,
  }) {
    return getBSTWingName(getBSTWingNameModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(LoadingStatus loadingStatus)? empty,
    TResult Function(GetBSTWingNameModel? getBSTWingNameModel)? getBSTWingName,
    TResult Function(TakeBSTAttendanceModel? takeBSTAttendanceModel,
            LoadingStatus loadingStatus)?
        takeBSTAttendance,
    TResult Function(
            UpdateBSTNiyamAssesmentScoreModel?
                updateBSTNiyamAssesmentScoreModel,
            LoadingStatus loadingStatus)?
        updateBSTNiyamAssesmentScore,
    TResult Function(SaveBSTQuizScoreModel? saveBSTQuizScoreModel,
            LoadingStatus loadingStatus)?
        saveBSTQuizScore,
  }) {
    return getBSTWingName?.call(getBSTWingNameModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoadingStatus loadingStatus)? empty,
    TResult Function(GetBSTWingNameModel? getBSTWingNameModel)? getBSTWingName,
    TResult Function(TakeBSTAttendanceModel? takeBSTAttendanceModel,
            LoadingStatus loadingStatus)?
        takeBSTAttendance,
    TResult Function(
            UpdateBSTNiyamAssesmentScoreModel?
                updateBSTNiyamAssesmentScoreModel,
            LoadingStatus loadingStatus)?
        updateBSTNiyamAssesmentScore,
    TResult Function(SaveBSTQuizScoreModel? saveBSTQuizScoreModel,
            LoadingStatus loadingStatus)?
        saveBSTQuizScore,
    required TResult orElse(),
  }) {
    if (getBSTWingName != null) {
      return getBSTWingName(getBSTWingNameModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_BSTDataUpdateEmpty value) empty,
    required TResult Function(_ReportStateGetBSTWingName value) getBSTWingName,
    required TResult Function(_ReportStateTakeBSTAttendance value)
        takeBSTAttendance,
    required TResult Function(_ReportStateUpdateBSTNiyamAssesmentScore value)
        updateBSTNiyamAssesmentScore,
    required TResult Function(_ReportStateSaveBSTQuizScore value)
        saveBSTQuizScore,
  }) {
    return getBSTWingName(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_BSTDataUpdateEmpty value)? empty,
    TResult Function(_ReportStateGetBSTWingName value)? getBSTWingName,
    TResult Function(_ReportStateTakeBSTAttendance value)? takeBSTAttendance,
    TResult Function(_ReportStateUpdateBSTNiyamAssesmentScore value)?
        updateBSTNiyamAssesmentScore,
    TResult Function(_ReportStateSaveBSTQuizScore value)? saveBSTQuizScore,
  }) {
    return getBSTWingName?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_BSTDataUpdateEmpty value)? empty,
    TResult Function(_ReportStateGetBSTWingName value)? getBSTWingName,
    TResult Function(_ReportStateTakeBSTAttendance value)? takeBSTAttendance,
    TResult Function(_ReportStateUpdateBSTNiyamAssesmentScore value)?
        updateBSTNiyamAssesmentScore,
    TResult Function(_ReportStateSaveBSTQuizScore value)? saveBSTQuizScore,
    required TResult orElse(),
  }) {
    if (getBSTWingName != null) {
      return getBSTWingName(this);
    }
    return orElse();
  }
}

abstract class _ReportStateGetBSTWingName implements BSTDataUpdateState {
  const factory _ReportStateGetBSTWingName(
          final GetBSTWingNameModel? getBSTWingNameModel) =
      _$_ReportStateGetBSTWingName;

  GetBSTWingNameModel? get getBSTWingNameModel =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$_ReportStateGetBSTWingNameCopyWith<_$_ReportStateGetBSTWingName>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ReportStateTakeBSTAttendanceCopyWith<$Res> {
  factory _$$_ReportStateTakeBSTAttendanceCopyWith(
          _$_ReportStateTakeBSTAttendance value,
          $Res Function(_$_ReportStateTakeBSTAttendance) then) =
      __$$_ReportStateTakeBSTAttendanceCopyWithImpl<$Res>;
  $Res call(
      {TakeBSTAttendanceModel? takeBSTAttendanceModel,
      LoadingStatus loadingStatus});
}

/// @nodoc
class __$$_ReportStateTakeBSTAttendanceCopyWithImpl<$Res>
    extends _$BSTDataUpdateStateCopyWithImpl<$Res>
    implements _$$_ReportStateTakeBSTAttendanceCopyWith<$Res> {
  __$$_ReportStateTakeBSTAttendanceCopyWithImpl(
      _$_ReportStateTakeBSTAttendance _value,
      $Res Function(_$_ReportStateTakeBSTAttendance) _then)
      : super(_value, (v) => _then(v as _$_ReportStateTakeBSTAttendance));

  @override
  _$_ReportStateTakeBSTAttendance get _value =>
      super._value as _$_ReportStateTakeBSTAttendance;

  @override
  $Res call({
    Object? takeBSTAttendanceModel = freezed,
    Object? loadingStatus = freezed,
  }) {
    return _then(_$_ReportStateTakeBSTAttendance(
      takeBSTAttendanceModel == freezed
          ? _value.takeBSTAttendanceModel
          : takeBSTAttendanceModel // ignore: cast_nullable_to_non_nullable
              as TakeBSTAttendanceModel?,
      loadingStatus == freezed
          ? _value.loadingStatus
          : loadingStatus // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
    ));
  }
}

/// @nodoc

class _$_ReportStateTakeBSTAttendance implements _ReportStateTakeBSTAttendance {
  const _$_ReportStateTakeBSTAttendance(
      this.takeBSTAttendanceModel, this.loadingStatus);

  @override
  final TakeBSTAttendanceModel? takeBSTAttendanceModel;
  @override
  final LoadingStatus loadingStatus;

  @override
  String toString() {
    return 'BSTDataUpdateState.takeBSTAttendance(takeBSTAttendanceModel: $takeBSTAttendanceModel, loadingStatus: $loadingStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReportStateTakeBSTAttendance &&
            const DeepCollectionEquality()
                .equals(other.takeBSTAttendanceModel, takeBSTAttendanceModel) &&
            const DeepCollectionEquality()
                .equals(other.loadingStatus, loadingStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(takeBSTAttendanceModel),
      const DeepCollectionEquality().hash(loadingStatus));

  @JsonKey(ignore: true)
  @override
  _$$_ReportStateTakeBSTAttendanceCopyWith<_$_ReportStateTakeBSTAttendance>
      get copyWith => __$$_ReportStateTakeBSTAttendanceCopyWithImpl<
          _$_ReportStateTakeBSTAttendance>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoadingStatus loadingStatus) empty,
    required TResult Function(GetBSTWingNameModel? getBSTWingNameModel)
        getBSTWingName,
    required TResult Function(TakeBSTAttendanceModel? takeBSTAttendanceModel,
            LoadingStatus loadingStatus)
        takeBSTAttendance,
    required TResult Function(
            UpdateBSTNiyamAssesmentScoreModel?
                updateBSTNiyamAssesmentScoreModel,
            LoadingStatus loadingStatus)
        updateBSTNiyamAssesmentScore,
    required TResult Function(SaveBSTQuizScoreModel? saveBSTQuizScoreModel,
            LoadingStatus loadingStatus)
        saveBSTQuizScore,
  }) {
    return takeBSTAttendance(takeBSTAttendanceModel, loadingStatus);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(LoadingStatus loadingStatus)? empty,
    TResult Function(GetBSTWingNameModel? getBSTWingNameModel)? getBSTWingName,
    TResult Function(TakeBSTAttendanceModel? takeBSTAttendanceModel,
            LoadingStatus loadingStatus)?
        takeBSTAttendance,
    TResult Function(
            UpdateBSTNiyamAssesmentScoreModel?
                updateBSTNiyamAssesmentScoreModel,
            LoadingStatus loadingStatus)?
        updateBSTNiyamAssesmentScore,
    TResult Function(SaveBSTQuizScoreModel? saveBSTQuizScoreModel,
            LoadingStatus loadingStatus)?
        saveBSTQuizScore,
  }) {
    return takeBSTAttendance?.call(takeBSTAttendanceModel, loadingStatus);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoadingStatus loadingStatus)? empty,
    TResult Function(GetBSTWingNameModel? getBSTWingNameModel)? getBSTWingName,
    TResult Function(TakeBSTAttendanceModel? takeBSTAttendanceModel,
            LoadingStatus loadingStatus)?
        takeBSTAttendance,
    TResult Function(
            UpdateBSTNiyamAssesmentScoreModel?
                updateBSTNiyamAssesmentScoreModel,
            LoadingStatus loadingStatus)?
        updateBSTNiyamAssesmentScore,
    TResult Function(SaveBSTQuizScoreModel? saveBSTQuizScoreModel,
            LoadingStatus loadingStatus)?
        saveBSTQuizScore,
    required TResult orElse(),
  }) {
    if (takeBSTAttendance != null) {
      return takeBSTAttendance(takeBSTAttendanceModel, loadingStatus);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_BSTDataUpdateEmpty value) empty,
    required TResult Function(_ReportStateGetBSTWingName value) getBSTWingName,
    required TResult Function(_ReportStateTakeBSTAttendance value)
        takeBSTAttendance,
    required TResult Function(_ReportStateUpdateBSTNiyamAssesmentScore value)
        updateBSTNiyamAssesmentScore,
    required TResult Function(_ReportStateSaveBSTQuizScore value)
        saveBSTQuizScore,
  }) {
    return takeBSTAttendance(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_BSTDataUpdateEmpty value)? empty,
    TResult Function(_ReportStateGetBSTWingName value)? getBSTWingName,
    TResult Function(_ReportStateTakeBSTAttendance value)? takeBSTAttendance,
    TResult Function(_ReportStateUpdateBSTNiyamAssesmentScore value)?
        updateBSTNiyamAssesmentScore,
    TResult Function(_ReportStateSaveBSTQuizScore value)? saveBSTQuizScore,
  }) {
    return takeBSTAttendance?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_BSTDataUpdateEmpty value)? empty,
    TResult Function(_ReportStateGetBSTWingName value)? getBSTWingName,
    TResult Function(_ReportStateTakeBSTAttendance value)? takeBSTAttendance,
    TResult Function(_ReportStateUpdateBSTNiyamAssesmentScore value)?
        updateBSTNiyamAssesmentScore,
    TResult Function(_ReportStateSaveBSTQuizScore value)? saveBSTQuizScore,
    required TResult orElse(),
  }) {
    if (takeBSTAttendance != null) {
      return takeBSTAttendance(this);
    }
    return orElse();
  }
}

abstract class _ReportStateTakeBSTAttendance implements BSTDataUpdateState {
  const factory _ReportStateTakeBSTAttendance(
      final TakeBSTAttendanceModel? takeBSTAttendanceModel,
      final LoadingStatus loadingStatus) = _$_ReportStateTakeBSTAttendance;

  TakeBSTAttendanceModel? get takeBSTAttendanceModel =>
      throw _privateConstructorUsedError;
  LoadingStatus get loadingStatus => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$_ReportStateTakeBSTAttendanceCopyWith<_$_ReportStateTakeBSTAttendance>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ReportStateUpdateBSTNiyamAssesmentScoreCopyWith<$Res> {
  factory _$$_ReportStateUpdateBSTNiyamAssesmentScoreCopyWith(
          _$_ReportStateUpdateBSTNiyamAssesmentScore value,
          $Res Function(_$_ReportStateUpdateBSTNiyamAssesmentScore) then) =
      __$$_ReportStateUpdateBSTNiyamAssesmentScoreCopyWithImpl<$Res>;
  $Res call(
      {UpdateBSTNiyamAssesmentScoreModel? updateBSTNiyamAssesmentScoreModel,
      LoadingStatus loadingStatus});
}

/// @nodoc
class __$$_ReportStateUpdateBSTNiyamAssesmentScoreCopyWithImpl<$Res>
    extends _$BSTDataUpdateStateCopyWithImpl<$Res>
    implements _$$_ReportStateUpdateBSTNiyamAssesmentScoreCopyWith<$Res> {
  __$$_ReportStateUpdateBSTNiyamAssesmentScoreCopyWithImpl(
      _$_ReportStateUpdateBSTNiyamAssesmentScore _value,
      $Res Function(_$_ReportStateUpdateBSTNiyamAssesmentScore) _then)
      : super(_value,
            (v) => _then(v as _$_ReportStateUpdateBSTNiyamAssesmentScore));

  @override
  _$_ReportStateUpdateBSTNiyamAssesmentScore get _value =>
      super._value as _$_ReportStateUpdateBSTNiyamAssesmentScore;

  @override
  $Res call({
    Object? updateBSTNiyamAssesmentScoreModel = freezed,
    Object? loadingStatus = freezed,
  }) {
    return _then(_$_ReportStateUpdateBSTNiyamAssesmentScore(
      updateBSTNiyamAssesmentScoreModel == freezed
          ? _value.updateBSTNiyamAssesmentScoreModel
          : updateBSTNiyamAssesmentScoreModel // ignore: cast_nullable_to_non_nullable
              as UpdateBSTNiyamAssesmentScoreModel?,
      loadingStatus == freezed
          ? _value.loadingStatus
          : loadingStatus // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
    ));
  }
}

/// @nodoc

class _$_ReportStateUpdateBSTNiyamAssesmentScore
    implements _ReportStateUpdateBSTNiyamAssesmentScore {
  const _$_ReportStateUpdateBSTNiyamAssesmentScore(
      this.updateBSTNiyamAssesmentScoreModel, this.loadingStatus);

  @override
  final UpdateBSTNiyamAssesmentScoreModel? updateBSTNiyamAssesmentScoreModel;
  @override
  final LoadingStatus loadingStatus;

  @override
  String toString() {
    return 'BSTDataUpdateState.updateBSTNiyamAssesmentScore(updateBSTNiyamAssesmentScoreModel: $updateBSTNiyamAssesmentScoreModel, loadingStatus: $loadingStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReportStateUpdateBSTNiyamAssesmentScore &&
            const DeepCollectionEquality().equals(
                other.updateBSTNiyamAssesmentScoreModel,
                updateBSTNiyamAssesmentScoreModel) &&
            const DeepCollectionEquality()
                .equals(other.loadingStatus, loadingStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(updateBSTNiyamAssesmentScoreModel),
      const DeepCollectionEquality().hash(loadingStatus));

  @JsonKey(ignore: true)
  @override
  _$$_ReportStateUpdateBSTNiyamAssesmentScoreCopyWith<
          _$_ReportStateUpdateBSTNiyamAssesmentScore>
      get copyWith => __$$_ReportStateUpdateBSTNiyamAssesmentScoreCopyWithImpl<
          _$_ReportStateUpdateBSTNiyamAssesmentScore>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoadingStatus loadingStatus) empty,
    required TResult Function(GetBSTWingNameModel? getBSTWingNameModel)
        getBSTWingName,
    required TResult Function(TakeBSTAttendanceModel? takeBSTAttendanceModel,
            LoadingStatus loadingStatus)
        takeBSTAttendance,
    required TResult Function(
            UpdateBSTNiyamAssesmentScoreModel?
                updateBSTNiyamAssesmentScoreModel,
            LoadingStatus loadingStatus)
        updateBSTNiyamAssesmentScore,
    required TResult Function(SaveBSTQuizScoreModel? saveBSTQuizScoreModel,
            LoadingStatus loadingStatus)
        saveBSTQuizScore,
  }) {
    return updateBSTNiyamAssesmentScore(
        updateBSTNiyamAssesmentScoreModel, loadingStatus);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(LoadingStatus loadingStatus)? empty,
    TResult Function(GetBSTWingNameModel? getBSTWingNameModel)? getBSTWingName,
    TResult Function(TakeBSTAttendanceModel? takeBSTAttendanceModel,
            LoadingStatus loadingStatus)?
        takeBSTAttendance,
    TResult Function(
            UpdateBSTNiyamAssesmentScoreModel?
                updateBSTNiyamAssesmentScoreModel,
            LoadingStatus loadingStatus)?
        updateBSTNiyamAssesmentScore,
    TResult Function(SaveBSTQuizScoreModel? saveBSTQuizScoreModel,
            LoadingStatus loadingStatus)?
        saveBSTQuizScore,
  }) {
    return updateBSTNiyamAssesmentScore?.call(
        updateBSTNiyamAssesmentScoreModel, loadingStatus);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoadingStatus loadingStatus)? empty,
    TResult Function(GetBSTWingNameModel? getBSTWingNameModel)? getBSTWingName,
    TResult Function(TakeBSTAttendanceModel? takeBSTAttendanceModel,
            LoadingStatus loadingStatus)?
        takeBSTAttendance,
    TResult Function(
            UpdateBSTNiyamAssesmentScoreModel?
                updateBSTNiyamAssesmentScoreModel,
            LoadingStatus loadingStatus)?
        updateBSTNiyamAssesmentScore,
    TResult Function(SaveBSTQuizScoreModel? saveBSTQuizScoreModel,
            LoadingStatus loadingStatus)?
        saveBSTQuizScore,
    required TResult orElse(),
  }) {
    if (updateBSTNiyamAssesmentScore != null) {
      return updateBSTNiyamAssesmentScore(
          updateBSTNiyamAssesmentScoreModel, loadingStatus);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_BSTDataUpdateEmpty value) empty,
    required TResult Function(_ReportStateGetBSTWingName value) getBSTWingName,
    required TResult Function(_ReportStateTakeBSTAttendance value)
        takeBSTAttendance,
    required TResult Function(_ReportStateUpdateBSTNiyamAssesmentScore value)
        updateBSTNiyamAssesmentScore,
    required TResult Function(_ReportStateSaveBSTQuizScore value)
        saveBSTQuizScore,
  }) {
    return updateBSTNiyamAssesmentScore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_BSTDataUpdateEmpty value)? empty,
    TResult Function(_ReportStateGetBSTWingName value)? getBSTWingName,
    TResult Function(_ReportStateTakeBSTAttendance value)? takeBSTAttendance,
    TResult Function(_ReportStateUpdateBSTNiyamAssesmentScore value)?
        updateBSTNiyamAssesmentScore,
    TResult Function(_ReportStateSaveBSTQuizScore value)? saveBSTQuizScore,
  }) {
    return updateBSTNiyamAssesmentScore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_BSTDataUpdateEmpty value)? empty,
    TResult Function(_ReportStateGetBSTWingName value)? getBSTWingName,
    TResult Function(_ReportStateTakeBSTAttendance value)? takeBSTAttendance,
    TResult Function(_ReportStateUpdateBSTNiyamAssesmentScore value)?
        updateBSTNiyamAssesmentScore,
    TResult Function(_ReportStateSaveBSTQuizScore value)? saveBSTQuizScore,
    required TResult orElse(),
  }) {
    if (updateBSTNiyamAssesmentScore != null) {
      return updateBSTNiyamAssesmentScore(this);
    }
    return orElse();
  }
}

abstract class _ReportStateUpdateBSTNiyamAssesmentScore
    implements BSTDataUpdateState {
  const factory _ReportStateUpdateBSTNiyamAssesmentScore(
          final UpdateBSTNiyamAssesmentScoreModel?
              updateBSTNiyamAssesmentScoreModel,
          final LoadingStatus loadingStatus) =
      _$_ReportStateUpdateBSTNiyamAssesmentScore;

  UpdateBSTNiyamAssesmentScoreModel? get updateBSTNiyamAssesmentScoreModel =>
      throw _privateConstructorUsedError;
  LoadingStatus get loadingStatus => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$_ReportStateUpdateBSTNiyamAssesmentScoreCopyWith<
          _$_ReportStateUpdateBSTNiyamAssesmentScore>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ReportStateSaveBSTQuizScoreCopyWith<$Res> {
  factory _$$_ReportStateSaveBSTQuizScoreCopyWith(
          _$_ReportStateSaveBSTQuizScore value,
          $Res Function(_$_ReportStateSaveBSTQuizScore) then) =
      __$$_ReportStateSaveBSTQuizScoreCopyWithImpl<$Res>;
  $Res call(
      {SaveBSTQuizScoreModel? saveBSTQuizScoreModel,
      LoadingStatus loadingStatus});
}

/// @nodoc
class __$$_ReportStateSaveBSTQuizScoreCopyWithImpl<$Res>
    extends _$BSTDataUpdateStateCopyWithImpl<$Res>
    implements _$$_ReportStateSaveBSTQuizScoreCopyWith<$Res> {
  __$$_ReportStateSaveBSTQuizScoreCopyWithImpl(
      _$_ReportStateSaveBSTQuizScore _value,
      $Res Function(_$_ReportStateSaveBSTQuizScore) _then)
      : super(_value, (v) => _then(v as _$_ReportStateSaveBSTQuizScore));

  @override
  _$_ReportStateSaveBSTQuizScore get _value =>
      super._value as _$_ReportStateSaveBSTQuizScore;

  @override
  $Res call({
    Object? saveBSTQuizScoreModel = freezed,
    Object? loadingStatus = freezed,
  }) {
    return _then(_$_ReportStateSaveBSTQuizScore(
      saveBSTQuizScoreModel == freezed
          ? _value.saveBSTQuizScoreModel
          : saveBSTQuizScoreModel // ignore: cast_nullable_to_non_nullable
              as SaveBSTQuizScoreModel?,
      loadingStatus == freezed
          ? _value.loadingStatus
          : loadingStatus // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
    ));
  }
}

/// @nodoc

class _$_ReportStateSaveBSTQuizScore implements _ReportStateSaveBSTQuizScore {
  const _$_ReportStateSaveBSTQuizScore(
      this.saveBSTQuizScoreModel, this.loadingStatus);

  @override
  final SaveBSTQuizScoreModel? saveBSTQuizScoreModel;
  @override
  final LoadingStatus loadingStatus;

  @override
  String toString() {
    return 'BSTDataUpdateState.saveBSTQuizScore(saveBSTQuizScoreModel: $saveBSTQuizScoreModel, loadingStatus: $loadingStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReportStateSaveBSTQuizScore &&
            const DeepCollectionEquality()
                .equals(other.saveBSTQuizScoreModel, saveBSTQuizScoreModel) &&
            const DeepCollectionEquality()
                .equals(other.loadingStatus, loadingStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(saveBSTQuizScoreModel),
      const DeepCollectionEquality().hash(loadingStatus));

  @JsonKey(ignore: true)
  @override
  _$$_ReportStateSaveBSTQuizScoreCopyWith<_$_ReportStateSaveBSTQuizScore>
      get copyWith => __$$_ReportStateSaveBSTQuizScoreCopyWithImpl<
          _$_ReportStateSaveBSTQuizScore>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoadingStatus loadingStatus) empty,
    required TResult Function(GetBSTWingNameModel? getBSTWingNameModel)
        getBSTWingName,
    required TResult Function(TakeBSTAttendanceModel? takeBSTAttendanceModel,
            LoadingStatus loadingStatus)
        takeBSTAttendance,
    required TResult Function(
            UpdateBSTNiyamAssesmentScoreModel?
                updateBSTNiyamAssesmentScoreModel,
            LoadingStatus loadingStatus)
        updateBSTNiyamAssesmentScore,
    required TResult Function(SaveBSTQuizScoreModel? saveBSTQuizScoreModel,
            LoadingStatus loadingStatus)
        saveBSTQuizScore,
  }) {
    return saveBSTQuizScore(saveBSTQuizScoreModel, loadingStatus);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(LoadingStatus loadingStatus)? empty,
    TResult Function(GetBSTWingNameModel? getBSTWingNameModel)? getBSTWingName,
    TResult Function(TakeBSTAttendanceModel? takeBSTAttendanceModel,
            LoadingStatus loadingStatus)?
        takeBSTAttendance,
    TResult Function(
            UpdateBSTNiyamAssesmentScoreModel?
                updateBSTNiyamAssesmentScoreModel,
            LoadingStatus loadingStatus)?
        updateBSTNiyamAssesmentScore,
    TResult Function(SaveBSTQuizScoreModel? saveBSTQuizScoreModel,
            LoadingStatus loadingStatus)?
        saveBSTQuizScore,
  }) {
    return saveBSTQuizScore?.call(saveBSTQuizScoreModel, loadingStatus);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoadingStatus loadingStatus)? empty,
    TResult Function(GetBSTWingNameModel? getBSTWingNameModel)? getBSTWingName,
    TResult Function(TakeBSTAttendanceModel? takeBSTAttendanceModel,
            LoadingStatus loadingStatus)?
        takeBSTAttendance,
    TResult Function(
            UpdateBSTNiyamAssesmentScoreModel?
                updateBSTNiyamAssesmentScoreModel,
            LoadingStatus loadingStatus)?
        updateBSTNiyamAssesmentScore,
    TResult Function(SaveBSTQuizScoreModel? saveBSTQuizScoreModel,
            LoadingStatus loadingStatus)?
        saveBSTQuizScore,
    required TResult orElse(),
  }) {
    if (saveBSTQuizScore != null) {
      return saveBSTQuizScore(saveBSTQuizScoreModel, loadingStatus);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_BSTDataUpdateEmpty value) empty,
    required TResult Function(_ReportStateGetBSTWingName value) getBSTWingName,
    required TResult Function(_ReportStateTakeBSTAttendance value)
        takeBSTAttendance,
    required TResult Function(_ReportStateUpdateBSTNiyamAssesmentScore value)
        updateBSTNiyamAssesmentScore,
    required TResult Function(_ReportStateSaveBSTQuizScore value)
        saveBSTQuizScore,
  }) {
    return saveBSTQuizScore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_BSTDataUpdateEmpty value)? empty,
    TResult Function(_ReportStateGetBSTWingName value)? getBSTWingName,
    TResult Function(_ReportStateTakeBSTAttendance value)? takeBSTAttendance,
    TResult Function(_ReportStateUpdateBSTNiyamAssesmentScore value)?
        updateBSTNiyamAssesmentScore,
    TResult Function(_ReportStateSaveBSTQuizScore value)? saveBSTQuizScore,
  }) {
    return saveBSTQuizScore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_BSTDataUpdateEmpty value)? empty,
    TResult Function(_ReportStateGetBSTWingName value)? getBSTWingName,
    TResult Function(_ReportStateTakeBSTAttendance value)? takeBSTAttendance,
    TResult Function(_ReportStateUpdateBSTNiyamAssesmentScore value)?
        updateBSTNiyamAssesmentScore,
    TResult Function(_ReportStateSaveBSTQuizScore value)? saveBSTQuizScore,
    required TResult orElse(),
  }) {
    if (saveBSTQuizScore != null) {
      return saveBSTQuizScore(this);
    }
    return orElse();
  }
}

abstract class _ReportStateSaveBSTQuizScore implements BSTDataUpdateState {
  const factory _ReportStateSaveBSTQuizScore(
      final SaveBSTQuizScoreModel? saveBSTQuizScoreModel,
      final LoadingStatus loadingStatus) = _$_ReportStateSaveBSTQuizScore;

  SaveBSTQuizScoreModel? get saveBSTQuizScoreModel =>
      throw _privateConstructorUsedError;
  LoadingStatus get loadingStatus => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$_ReportStateSaveBSTQuizScoreCopyWith<_$_ReportStateSaveBSTQuizScore>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BSTDataUpdateEvent {
  BuildContext get context => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            BuildContext context, String center_id, String wing_name)
        getBSTWingName,
    required TResult Function(BuildContext context,
            TakeBSTAttendanceRequestModel takeBSTAttendanceRequestModel)
        takeBSTAttendance,
    required TResult Function(
            BuildContext context,
            UpdateBSTNiyamAssesmentScoreRequestModel
                updateBSTNiyamAssesmentScoreRequestModel)
        updateBSTNiyamAssesmentScore,
    required TResult Function(BuildContext context,
            SaveBSTQuizScoreRequestModel saveBSTQuizScoreRequestModel)
        saveBSTQuizScore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(BuildContext context, String center_id, String wing_name)?
        getBSTWingName,
    TResult Function(BuildContext context,
            TakeBSTAttendanceRequestModel takeBSTAttendanceRequestModel)?
        takeBSTAttendance,
    TResult Function(
            BuildContext context,
            UpdateBSTNiyamAssesmentScoreRequestModel
                updateBSTNiyamAssesmentScoreRequestModel)?
        updateBSTNiyamAssesmentScore,
    TResult Function(BuildContext context,
            SaveBSTQuizScoreRequestModel saveBSTQuizScoreRequestModel)?
        saveBSTQuizScore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, String center_id, String wing_name)?
        getBSTWingName,
    TResult Function(BuildContext context,
            TakeBSTAttendanceRequestModel takeBSTAttendanceRequestModel)?
        takeBSTAttendance,
    TResult Function(
            BuildContext context,
            UpdateBSTNiyamAssesmentScoreRequestModel
                updateBSTNiyamAssesmentScoreRequestModel)?
        updateBSTNiyamAssesmentScore,
    TResult Function(BuildContext context,
            SaveBSTQuizScoreRequestModel saveBSTQuizScoreRequestModel)?
        saveBSTQuizScore,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_getBSTWingName value) getBSTWingName,
    required TResult Function(_takeBSTAttendance value) takeBSTAttendance,
    required TResult Function(_updateBSTNiyamAssesmentScore value)
        updateBSTNiyamAssesmentScore,
    required TResult Function(_saveBSTQuizScore value) saveBSTQuizScore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_getBSTWingName value)? getBSTWingName,
    TResult Function(_takeBSTAttendance value)? takeBSTAttendance,
    TResult Function(_updateBSTNiyamAssesmentScore value)?
        updateBSTNiyamAssesmentScore,
    TResult Function(_saveBSTQuizScore value)? saveBSTQuizScore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_getBSTWingName value)? getBSTWingName,
    TResult Function(_takeBSTAttendance value)? takeBSTAttendance,
    TResult Function(_updateBSTNiyamAssesmentScore value)?
        updateBSTNiyamAssesmentScore,
    TResult Function(_saveBSTQuizScore value)? saveBSTQuizScore,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BSTDataUpdateEventCopyWith<BSTDataUpdateEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BSTDataUpdateEventCopyWith<$Res> {
  factory $BSTDataUpdateEventCopyWith(
          BSTDataUpdateEvent value, $Res Function(BSTDataUpdateEvent) then) =
      _$BSTDataUpdateEventCopyWithImpl<$Res>;
  $Res call({BuildContext context});
}

/// @nodoc
class _$BSTDataUpdateEventCopyWithImpl<$Res>
    implements $BSTDataUpdateEventCopyWith<$Res> {
  _$BSTDataUpdateEventCopyWithImpl(this._value, this._then);

  final BSTDataUpdateEvent _value;
  // ignore: unused_field
  final $Res Function(BSTDataUpdateEvent) _then;

  @override
  $Res call({
    Object? context = freezed,
  }) {
    return _then(_value.copyWith(
      context: context == freezed
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
    ));
  }
}

/// @nodoc
abstract class _$$_getBSTWingNameCopyWith<$Res>
    implements $BSTDataUpdateEventCopyWith<$Res> {
  factory _$$_getBSTWingNameCopyWith(
          _$_getBSTWingName value, $Res Function(_$_getBSTWingName) then) =
      __$$_getBSTWingNameCopyWithImpl<$Res>;
  @override
  $Res call({BuildContext context, String center_id, String wing_name});
}

/// @nodoc
class __$$_getBSTWingNameCopyWithImpl<$Res>
    extends _$BSTDataUpdateEventCopyWithImpl<$Res>
    implements _$$_getBSTWingNameCopyWith<$Res> {
  __$$_getBSTWingNameCopyWithImpl(
      _$_getBSTWingName _value, $Res Function(_$_getBSTWingName) _then)
      : super(_value, (v) => _then(v as _$_getBSTWingName));

  @override
  _$_getBSTWingName get _value => super._value as _$_getBSTWingName;

  @override
  $Res call({
    Object? context = freezed,
    Object? center_id = freezed,
    Object? wing_name = freezed,
  }) {
    return _then(_$_getBSTWingName(
      context == freezed
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      center_id == freezed
          ? _value.center_id
          : center_id // ignore: cast_nullable_to_non_nullable
              as String,
      wing_name == freezed
          ? _value.wing_name
          : wing_name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_getBSTWingName implements _getBSTWingName {
  const _$_getBSTWingName(this.context, this.center_id, this.wing_name);

  @override
  final BuildContext context;
  @override
  final String center_id;
  @override
  final String wing_name;

  @override
  String toString() {
    return 'BSTDataUpdateEvent.getBSTWingName(context: $context, center_id: $center_id, wing_name: $wing_name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_getBSTWingName &&
            const DeepCollectionEquality().equals(other.context, context) &&
            const DeepCollectionEquality().equals(other.center_id, center_id) &&
            const DeepCollectionEquality().equals(other.wing_name, wing_name));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(context),
      const DeepCollectionEquality().hash(center_id),
      const DeepCollectionEquality().hash(wing_name));

  @JsonKey(ignore: true)
  @override
  _$$_getBSTWingNameCopyWith<_$_getBSTWingName> get copyWith =>
      __$$_getBSTWingNameCopyWithImpl<_$_getBSTWingName>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            BuildContext context, String center_id, String wing_name)
        getBSTWingName,
    required TResult Function(BuildContext context,
            TakeBSTAttendanceRequestModel takeBSTAttendanceRequestModel)
        takeBSTAttendance,
    required TResult Function(
            BuildContext context,
            UpdateBSTNiyamAssesmentScoreRequestModel
                updateBSTNiyamAssesmentScoreRequestModel)
        updateBSTNiyamAssesmentScore,
    required TResult Function(BuildContext context,
            SaveBSTQuizScoreRequestModel saveBSTQuizScoreRequestModel)
        saveBSTQuizScore,
  }) {
    return getBSTWingName(context, center_id, wing_name);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(BuildContext context, String center_id, String wing_name)?
        getBSTWingName,
    TResult Function(BuildContext context,
            TakeBSTAttendanceRequestModel takeBSTAttendanceRequestModel)?
        takeBSTAttendance,
    TResult Function(
            BuildContext context,
            UpdateBSTNiyamAssesmentScoreRequestModel
                updateBSTNiyamAssesmentScoreRequestModel)?
        updateBSTNiyamAssesmentScore,
    TResult Function(BuildContext context,
            SaveBSTQuizScoreRequestModel saveBSTQuizScoreRequestModel)?
        saveBSTQuizScore,
  }) {
    return getBSTWingName?.call(context, center_id, wing_name);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, String center_id, String wing_name)?
        getBSTWingName,
    TResult Function(BuildContext context,
            TakeBSTAttendanceRequestModel takeBSTAttendanceRequestModel)?
        takeBSTAttendance,
    TResult Function(
            BuildContext context,
            UpdateBSTNiyamAssesmentScoreRequestModel
                updateBSTNiyamAssesmentScoreRequestModel)?
        updateBSTNiyamAssesmentScore,
    TResult Function(BuildContext context,
            SaveBSTQuizScoreRequestModel saveBSTQuizScoreRequestModel)?
        saveBSTQuizScore,
    required TResult orElse(),
  }) {
    if (getBSTWingName != null) {
      return getBSTWingName(context, center_id, wing_name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_getBSTWingName value) getBSTWingName,
    required TResult Function(_takeBSTAttendance value) takeBSTAttendance,
    required TResult Function(_updateBSTNiyamAssesmentScore value)
        updateBSTNiyamAssesmentScore,
    required TResult Function(_saveBSTQuizScore value) saveBSTQuizScore,
  }) {
    return getBSTWingName(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_getBSTWingName value)? getBSTWingName,
    TResult Function(_takeBSTAttendance value)? takeBSTAttendance,
    TResult Function(_updateBSTNiyamAssesmentScore value)?
        updateBSTNiyamAssesmentScore,
    TResult Function(_saveBSTQuizScore value)? saveBSTQuizScore,
  }) {
    return getBSTWingName?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_getBSTWingName value)? getBSTWingName,
    TResult Function(_takeBSTAttendance value)? takeBSTAttendance,
    TResult Function(_updateBSTNiyamAssesmentScore value)?
        updateBSTNiyamAssesmentScore,
    TResult Function(_saveBSTQuizScore value)? saveBSTQuizScore,
    required TResult orElse(),
  }) {
    if (getBSTWingName != null) {
      return getBSTWingName(this);
    }
    return orElse();
  }
}

abstract class _getBSTWingName implements BSTDataUpdateEvent {
  const factory _getBSTWingName(final BuildContext context,
      final String center_id, final String wing_name) = _$_getBSTWingName;

  @override
  BuildContext get context => throw _privateConstructorUsedError;
  String get center_id => throw _privateConstructorUsedError;
  String get wing_name => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_getBSTWingNameCopyWith<_$_getBSTWingName> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_takeBSTAttendanceCopyWith<$Res>
    implements $BSTDataUpdateEventCopyWith<$Res> {
  factory _$$_takeBSTAttendanceCopyWith(_$_takeBSTAttendance value,
          $Res Function(_$_takeBSTAttendance) then) =
      __$$_takeBSTAttendanceCopyWithImpl<$Res>;
  @override
  $Res call(
      {BuildContext context,
      TakeBSTAttendanceRequestModel takeBSTAttendanceRequestModel});
}

/// @nodoc
class __$$_takeBSTAttendanceCopyWithImpl<$Res>
    extends _$BSTDataUpdateEventCopyWithImpl<$Res>
    implements _$$_takeBSTAttendanceCopyWith<$Res> {
  __$$_takeBSTAttendanceCopyWithImpl(
      _$_takeBSTAttendance _value, $Res Function(_$_takeBSTAttendance) _then)
      : super(_value, (v) => _then(v as _$_takeBSTAttendance));

  @override
  _$_takeBSTAttendance get _value => super._value as _$_takeBSTAttendance;

  @override
  $Res call({
    Object? context = freezed,
    Object? takeBSTAttendanceRequestModel = freezed,
  }) {
    return _then(_$_takeBSTAttendance(
      context == freezed
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      takeBSTAttendanceRequestModel == freezed
          ? _value.takeBSTAttendanceRequestModel
          : takeBSTAttendanceRequestModel // ignore: cast_nullable_to_non_nullable
              as TakeBSTAttendanceRequestModel,
    ));
  }
}

/// @nodoc

class _$_takeBSTAttendance implements _takeBSTAttendance {
  const _$_takeBSTAttendance(this.context, this.takeBSTAttendanceRequestModel);

  @override
  final BuildContext context;
  @override
  final TakeBSTAttendanceRequestModel takeBSTAttendanceRequestModel;

  @override
  String toString() {
    return 'BSTDataUpdateEvent.takeBSTAttendance(context: $context, takeBSTAttendanceRequestModel: $takeBSTAttendanceRequestModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_takeBSTAttendance &&
            const DeepCollectionEquality().equals(other.context, context) &&
            const DeepCollectionEquality().equals(
                other.takeBSTAttendanceRequestModel,
                takeBSTAttendanceRequestModel));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(context),
      const DeepCollectionEquality().hash(takeBSTAttendanceRequestModel));

  @JsonKey(ignore: true)
  @override
  _$$_takeBSTAttendanceCopyWith<_$_takeBSTAttendance> get copyWith =>
      __$$_takeBSTAttendanceCopyWithImpl<_$_takeBSTAttendance>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            BuildContext context, String center_id, String wing_name)
        getBSTWingName,
    required TResult Function(BuildContext context,
            TakeBSTAttendanceRequestModel takeBSTAttendanceRequestModel)
        takeBSTAttendance,
    required TResult Function(
            BuildContext context,
            UpdateBSTNiyamAssesmentScoreRequestModel
                updateBSTNiyamAssesmentScoreRequestModel)
        updateBSTNiyamAssesmentScore,
    required TResult Function(BuildContext context,
            SaveBSTQuizScoreRequestModel saveBSTQuizScoreRequestModel)
        saveBSTQuizScore,
  }) {
    return takeBSTAttendance(context, takeBSTAttendanceRequestModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(BuildContext context, String center_id, String wing_name)?
        getBSTWingName,
    TResult Function(BuildContext context,
            TakeBSTAttendanceRequestModel takeBSTAttendanceRequestModel)?
        takeBSTAttendance,
    TResult Function(
            BuildContext context,
            UpdateBSTNiyamAssesmentScoreRequestModel
                updateBSTNiyamAssesmentScoreRequestModel)?
        updateBSTNiyamAssesmentScore,
    TResult Function(BuildContext context,
            SaveBSTQuizScoreRequestModel saveBSTQuizScoreRequestModel)?
        saveBSTQuizScore,
  }) {
    return takeBSTAttendance?.call(context, takeBSTAttendanceRequestModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, String center_id, String wing_name)?
        getBSTWingName,
    TResult Function(BuildContext context,
            TakeBSTAttendanceRequestModel takeBSTAttendanceRequestModel)?
        takeBSTAttendance,
    TResult Function(
            BuildContext context,
            UpdateBSTNiyamAssesmentScoreRequestModel
                updateBSTNiyamAssesmentScoreRequestModel)?
        updateBSTNiyamAssesmentScore,
    TResult Function(BuildContext context,
            SaveBSTQuizScoreRequestModel saveBSTQuizScoreRequestModel)?
        saveBSTQuizScore,
    required TResult orElse(),
  }) {
    if (takeBSTAttendance != null) {
      return takeBSTAttendance(context, takeBSTAttendanceRequestModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_getBSTWingName value) getBSTWingName,
    required TResult Function(_takeBSTAttendance value) takeBSTAttendance,
    required TResult Function(_updateBSTNiyamAssesmentScore value)
        updateBSTNiyamAssesmentScore,
    required TResult Function(_saveBSTQuizScore value) saveBSTQuizScore,
  }) {
    return takeBSTAttendance(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_getBSTWingName value)? getBSTWingName,
    TResult Function(_takeBSTAttendance value)? takeBSTAttendance,
    TResult Function(_updateBSTNiyamAssesmentScore value)?
        updateBSTNiyamAssesmentScore,
    TResult Function(_saveBSTQuizScore value)? saveBSTQuizScore,
  }) {
    return takeBSTAttendance?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_getBSTWingName value)? getBSTWingName,
    TResult Function(_takeBSTAttendance value)? takeBSTAttendance,
    TResult Function(_updateBSTNiyamAssesmentScore value)?
        updateBSTNiyamAssesmentScore,
    TResult Function(_saveBSTQuizScore value)? saveBSTQuizScore,
    required TResult orElse(),
  }) {
    if (takeBSTAttendance != null) {
      return takeBSTAttendance(this);
    }
    return orElse();
  }
}

abstract class _takeBSTAttendance implements BSTDataUpdateEvent {
  const factory _takeBSTAttendance(final BuildContext context,
          final TakeBSTAttendanceRequestModel takeBSTAttendanceRequestModel) =
      _$_takeBSTAttendance;

  @override
  BuildContext get context => throw _privateConstructorUsedError;
  TakeBSTAttendanceRequestModel get takeBSTAttendanceRequestModel =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_takeBSTAttendanceCopyWith<_$_takeBSTAttendance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_updateBSTNiyamAssesmentScoreCopyWith<$Res>
    implements $BSTDataUpdateEventCopyWith<$Res> {
  factory _$$_updateBSTNiyamAssesmentScoreCopyWith(
          _$_updateBSTNiyamAssesmentScore value,
          $Res Function(_$_updateBSTNiyamAssesmentScore) then) =
      __$$_updateBSTNiyamAssesmentScoreCopyWithImpl<$Res>;
  @override
  $Res call(
      {BuildContext context,
      UpdateBSTNiyamAssesmentScoreRequestModel
          updateBSTNiyamAssesmentScoreRequestModel});
}

/// @nodoc
class __$$_updateBSTNiyamAssesmentScoreCopyWithImpl<$Res>
    extends _$BSTDataUpdateEventCopyWithImpl<$Res>
    implements _$$_updateBSTNiyamAssesmentScoreCopyWith<$Res> {
  __$$_updateBSTNiyamAssesmentScoreCopyWithImpl(
      _$_updateBSTNiyamAssesmentScore _value,
      $Res Function(_$_updateBSTNiyamAssesmentScore) _then)
      : super(_value, (v) => _then(v as _$_updateBSTNiyamAssesmentScore));

  @override
  _$_updateBSTNiyamAssesmentScore get _value =>
      super._value as _$_updateBSTNiyamAssesmentScore;

  @override
  $Res call({
    Object? context = freezed,
    Object? updateBSTNiyamAssesmentScoreRequestModel = freezed,
  }) {
    return _then(_$_updateBSTNiyamAssesmentScore(
      context == freezed
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      updateBSTNiyamAssesmentScoreRequestModel == freezed
          ? _value.updateBSTNiyamAssesmentScoreRequestModel
          : updateBSTNiyamAssesmentScoreRequestModel // ignore: cast_nullable_to_non_nullable
              as UpdateBSTNiyamAssesmentScoreRequestModel,
    ));
  }
}

/// @nodoc

class _$_updateBSTNiyamAssesmentScore implements _updateBSTNiyamAssesmentScore {
  const _$_updateBSTNiyamAssesmentScore(
      this.context, this.updateBSTNiyamAssesmentScoreRequestModel);

  @override
  final BuildContext context;
  @override
  final UpdateBSTNiyamAssesmentScoreRequestModel
      updateBSTNiyamAssesmentScoreRequestModel;

  @override
  String toString() {
    return 'BSTDataUpdateEvent.updateBSTNiyamAssesmentScore(context: $context, updateBSTNiyamAssesmentScoreRequestModel: $updateBSTNiyamAssesmentScoreRequestModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_updateBSTNiyamAssesmentScore &&
            const DeepCollectionEquality().equals(other.context, context) &&
            const DeepCollectionEquality().equals(
                other.updateBSTNiyamAssesmentScoreRequestModel,
                updateBSTNiyamAssesmentScoreRequestModel));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(context),
      const DeepCollectionEquality()
          .hash(updateBSTNiyamAssesmentScoreRequestModel));

  @JsonKey(ignore: true)
  @override
  _$$_updateBSTNiyamAssesmentScoreCopyWith<_$_updateBSTNiyamAssesmentScore>
      get copyWith => __$$_updateBSTNiyamAssesmentScoreCopyWithImpl<
          _$_updateBSTNiyamAssesmentScore>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            BuildContext context, String center_id, String wing_name)
        getBSTWingName,
    required TResult Function(BuildContext context,
            TakeBSTAttendanceRequestModel takeBSTAttendanceRequestModel)
        takeBSTAttendance,
    required TResult Function(
            BuildContext context,
            UpdateBSTNiyamAssesmentScoreRequestModel
                updateBSTNiyamAssesmentScoreRequestModel)
        updateBSTNiyamAssesmentScore,
    required TResult Function(BuildContext context,
            SaveBSTQuizScoreRequestModel saveBSTQuizScoreRequestModel)
        saveBSTQuizScore,
  }) {
    return updateBSTNiyamAssesmentScore(
        context, updateBSTNiyamAssesmentScoreRequestModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(BuildContext context, String center_id, String wing_name)?
        getBSTWingName,
    TResult Function(BuildContext context,
            TakeBSTAttendanceRequestModel takeBSTAttendanceRequestModel)?
        takeBSTAttendance,
    TResult Function(
            BuildContext context,
            UpdateBSTNiyamAssesmentScoreRequestModel
                updateBSTNiyamAssesmentScoreRequestModel)?
        updateBSTNiyamAssesmentScore,
    TResult Function(BuildContext context,
            SaveBSTQuizScoreRequestModel saveBSTQuizScoreRequestModel)?
        saveBSTQuizScore,
  }) {
    return updateBSTNiyamAssesmentScore?.call(
        context, updateBSTNiyamAssesmentScoreRequestModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, String center_id, String wing_name)?
        getBSTWingName,
    TResult Function(BuildContext context,
            TakeBSTAttendanceRequestModel takeBSTAttendanceRequestModel)?
        takeBSTAttendance,
    TResult Function(
            BuildContext context,
            UpdateBSTNiyamAssesmentScoreRequestModel
                updateBSTNiyamAssesmentScoreRequestModel)?
        updateBSTNiyamAssesmentScore,
    TResult Function(BuildContext context,
            SaveBSTQuizScoreRequestModel saveBSTQuizScoreRequestModel)?
        saveBSTQuizScore,
    required TResult orElse(),
  }) {
    if (updateBSTNiyamAssesmentScore != null) {
      return updateBSTNiyamAssesmentScore(
          context, updateBSTNiyamAssesmentScoreRequestModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_getBSTWingName value) getBSTWingName,
    required TResult Function(_takeBSTAttendance value) takeBSTAttendance,
    required TResult Function(_updateBSTNiyamAssesmentScore value)
        updateBSTNiyamAssesmentScore,
    required TResult Function(_saveBSTQuizScore value) saveBSTQuizScore,
  }) {
    return updateBSTNiyamAssesmentScore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_getBSTWingName value)? getBSTWingName,
    TResult Function(_takeBSTAttendance value)? takeBSTAttendance,
    TResult Function(_updateBSTNiyamAssesmentScore value)?
        updateBSTNiyamAssesmentScore,
    TResult Function(_saveBSTQuizScore value)? saveBSTQuizScore,
  }) {
    return updateBSTNiyamAssesmentScore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_getBSTWingName value)? getBSTWingName,
    TResult Function(_takeBSTAttendance value)? takeBSTAttendance,
    TResult Function(_updateBSTNiyamAssesmentScore value)?
        updateBSTNiyamAssesmentScore,
    TResult Function(_saveBSTQuizScore value)? saveBSTQuizScore,
    required TResult orElse(),
  }) {
    if (updateBSTNiyamAssesmentScore != null) {
      return updateBSTNiyamAssesmentScore(this);
    }
    return orElse();
  }
}

abstract class _updateBSTNiyamAssesmentScore implements BSTDataUpdateEvent {
  const factory _updateBSTNiyamAssesmentScore(
          final BuildContext context,
          final UpdateBSTNiyamAssesmentScoreRequestModel
              updateBSTNiyamAssesmentScoreRequestModel) =
      _$_updateBSTNiyamAssesmentScore;

  @override
  BuildContext get context => throw _privateConstructorUsedError;
  UpdateBSTNiyamAssesmentScoreRequestModel
      get updateBSTNiyamAssesmentScoreRequestModel =>
          throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_updateBSTNiyamAssesmentScoreCopyWith<_$_updateBSTNiyamAssesmentScore>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_saveBSTQuizScoreCopyWith<$Res>
    implements $BSTDataUpdateEventCopyWith<$Res> {
  factory _$$_saveBSTQuizScoreCopyWith(
          _$_saveBSTQuizScore value, $Res Function(_$_saveBSTQuizScore) then) =
      __$$_saveBSTQuizScoreCopyWithImpl<$Res>;
  @override
  $Res call(
      {BuildContext context,
      SaveBSTQuizScoreRequestModel saveBSTQuizScoreRequestModel});
}

/// @nodoc
class __$$_saveBSTQuizScoreCopyWithImpl<$Res>
    extends _$BSTDataUpdateEventCopyWithImpl<$Res>
    implements _$$_saveBSTQuizScoreCopyWith<$Res> {
  __$$_saveBSTQuizScoreCopyWithImpl(
      _$_saveBSTQuizScore _value, $Res Function(_$_saveBSTQuizScore) _then)
      : super(_value, (v) => _then(v as _$_saveBSTQuizScore));

  @override
  _$_saveBSTQuizScore get _value => super._value as _$_saveBSTQuizScore;

  @override
  $Res call({
    Object? context = freezed,
    Object? saveBSTQuizScoreRequestModel = freezed,
  }) {
    return _then(_$_saveBSTQuizScore(
      context == freezed
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      saveBSTQuizScoreRequestModel == freezed
          ? _value.saveBSTQuizScoreRequestModel
          : saveBSTQuizScoreRequestModel // ignore: cast_nullable_to_non_nullable
              as SaveBSTQuizScoreRequestModel,
    ));
  }
}

/// @nodoc

class _$_saveBSTQuizScore implements _saveBSTQuizScore {
  const _$_saveBSTQuizScore(this.context, this.saveBSTQuizScoreRequestModel);

  @override
  final BuildContext context;
  @override
  final SaveBSTQuizScoreRequestModel saveBSTQuizScoreRequestModel;

  @override
  String toString() {
    return 'BSTDataUpdateEvent.saveBSTQuizScore(context: $context, saveBSTQuizScoreRequestModel: $saveBSTQuizScoreRequestModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_saveBSTQuizScore &&
            const DeepCollectionEquality().equals(other.context, context) &&
            const DeepCollectionEquality().equals(
                other.saveBSTQuizScoreRequestModel,
                saveBSTQuizScoreRequestModel));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(context),
      const DeepCollectionEquality().hash(saveBSTQuizScoreRequestModel));

  @JsonKey(ignore: true)
  @override
  _$$_saveBSTQuizScoreCopyWith<_$_saveBSTQuizScore> get copyWith =>
      __$$_saveBSTQuizScoreCopyWithImpl<_$_saveBSTQuizScore>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            BuildContext context, String center_id, String wing_name)
        getBSTWingName,
    required TResult Function(BuildContext context,
            TakeBSTAttendanceRequestModel takeBSTAttendanceRequestModel)
        takeBSTAttendance,
    required TResult Function(
            BuildContext context,
            UpdateBSTNiyamAssesmentScoreRequestModel
                updateBSTNiyamAssesmentScoreRequestModel)
        updateBSTNiyamAssesmentScore,
    required TResult Function(BuildContext context,
            SaveBSTQuizScoreRequestModel saveBSTQuizScoreRequestModel)
        saveBSTQuizScore,
  }) {
    return saveBSTQuizScore(context, saveBSTQuizScoreRequestModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(BuildContext context, String center_id, String wing_name)?
        getBSTWingName,
    TResult Function(BuildContext context,
            TakeBSTAttendanceRequestModel takeBSTAttendanceRequestModel)?
        takeBSTAttendance,
    TResult Function(
            BuildContext context,
            UpdateBSTNiyamAssesmentScoreRequestModel
                updateBSTNiyamAssesmentScoreRequestModel)?
        updateBSTNiyamAssesmentScore,
    TResult Function(BuildContext context,
            SaveBSTQuizScoreRequestModel saveBSTQuizScoreRequestModel)?
        saveBSTQuizScore,
  }) {
    return saveBSTQuizScore?.call(context, saveBSTQuizScoreRequestModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, String center_id, String wing_name)?
        getBSTWingName,
    TResult Function(BuildContext context,
            TakeBSTAttendanceRequestModel takeBSTAttendanceRequestModel)?
        takeBSTAttendance,
    TResult Function(
            BuildContext context,
            UpdateBSTNiyamAssesmentScoreRequestModel
                updateBSTNiyamAssesmentScoreRequestModel)?
        updateBSTNiyamAssesmentScore,
    TResult Function(BuildContext context,
            SaveBSTQuizScoreRequestModel saveBSTQuizScoreRequestModel)?
        saveBSTQuizScore,
    required TResult orElse(),
  }) {
    if (saveBSTQuizScore != null) {
      return saveBSTQuizScore(context, saveBSTQuizScoreRequestModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_getBSTWingName value) getBSTWingName,
    required TResult Function(_takeBSTAttendance value) takeBSTAttendance,
    required TResult Function(_updateBSTNiyamAssesmentScore value)
        updateBSTNiyamAssesmentScore,
    required TResult Function(_saveBSTQuizScore value) saveBSTQuizScore,
  }) {
    return saveBSTQuizScore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_getBSTWingName value)? getBSTWingName,
    TResult Function(_takeBSTAttendance value)? takeBSTAttendance,
    TResult Function(_updateBSTNiyamAssesmentScore value)?
        updateBSTNiyamAssesmentScore,
    TResult Function(_saveBSTQuizScore value)? saveBSTQuizScore,
  }) {
    return saveBSTQuizScore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_getBSTWingName value)? getBSTWingName,
    TResult Function(_takeBSTAttendance value)? takeBSTAttendance,
    TResult Function(_updateBSTNiyamAssesmentScore value)?
        updateBSTNiyamAssesmentScore,
    TResult Function(_saveBSTQuizScore value)? saveBSTQuizScore,
    required TResult orElse(),
  }) {
    if (saveBSTQuizScore != null) {
      return saveBSTQuizScore(this);
    }
    return orElse();
  }
}

abstract class _saveBSTQuizScore implements BSTDataUpdateEvent {
  const factory _saveBSTQuizScore(final BuildContext context,
          final SaveBSTQuizScoreRequestModel saveBSTQuizScoreRequestModel) =
      _$_saveBSTQuizScore;

  @override
  BuildContext get context => throw _privateConstructorUsedError;
  SaveBSTQuizScoreRequestModel get saveBSTQuizScoreRequestModel =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_saveBSTQuizScoreCopyWith<_$_saveBSTQuizScore> get copyWith =>
      throw _privateConstructorUsedError;
}
