// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'goshthi_data_update_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GoshthiDataUpdateState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoadingStatus loadingStatus) empty,
    required TResult Function(
            SubmitGoshthiReportAttendanceModel?
                submitGoshthiReportAttendanceModel,
            LoadingStatus loadingStatus)
        submitGoshthiReportAttendance,
    required TResult Function(
            UpdateGoshthiHeldStatusModel? updateGoshthiHeldStatusModel)
        updateGoshthiHeldStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(LoadingStatus loadingStatus)? empty,
    TResult Function(
            SubmitGoshthiReportAttendanceModel?
                submitGoshthiReportAttendanceModel,
            LoadingStatus loadingStatus)?
        submitGoshthiReportAttendance,
    TResult Function(
            UpdateGoshthiHeldStatusModel? updateGoshthiHeldStatusModel)?
        updateGoshthiHeldStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoadingStatus loadingStatus)? empty,
    TResult Function(
            SubmitGoshthiReportAttendanceModel?
                submitGoshthiReportAttendanceModel,
            LoadingStatus loadingStatus)?
        submitGoshthiReportAttendance,
    TResult Function(
            UpdateGoshthiHeldStatusModel? updateGoshthiHeldStatusModel)?
        updateGoshthiHeldStatus,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GoshthiDataUpdateEmpty value) empty,
    required TResult Function(_ReportStateSubmitGoshthiReportAttendance value)
        submitGoshthiReportAttendance,
    required TResult Function(_ReportStateUpdateGoshthiHeldStatus value)
        updateGoshthiHeldStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GoshthiDataUpdateEmpty value)? empty,
    TResult Function(_ReportStateSubmitGoshthiReportAttendance value)?
        submitGoshthiReportAttendance,
    TResult Function(_ReportStateUpdateGoshthiHeldStatus value)?
        updateGoshthiHeldStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GoshthiDataUpdateEmpty value)? empty,
    TResult Function(_ReportStateSubmitGoshthiReportAttendance value)?
        submitGoshthiReportAttendance,
    TResult Function(_ReportStateUpdateGoshthiHeldStatus value)?
        updateGoshthiHeldStatus,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoshthiDataUpdateStateCopyWith<$Res> {
  factory $GoshthiDataUpdateStateCopyWith(GoshthiDataUpdateState value,
          $Res Function(GoshthiDataUpdateState) then) =
      _$GoshthiDataUpdateStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$GoshthiDataUpdateStateCopyWithImpl<$Res>
    implements $GoshthiDataUpdateStateCopyWith<$Res> {
  _$GoshthiDataUpdateStateCopyWithImpl(this._value, this._then);

  final GoshthiDataUpdateState _value;
  // ignore: unused_field
  final $Res Function(GoshthiDataUpdateState) _then;
}

/// @nodoc
abstract class _$$_GoshthiDataUpdateEmptyCopyWith<$Res> {
  factory _$$_GoshthiDataUpdateEmptyCopyWith(_$_GoshthiDataUpdateEmpty value,
          $Res Function(_$_GoshthiDataUpdateEmpty) then) =
      __$$_GoshthiDataUpdateEmptyCopyWithImpl<$Res>;
  $Res call({LoadingStatus loadingStatus});
}

/// @nodoc
class __$$_GoshthiDataUpdateEmptyCopyWithImpl<$Res>
    extends _$GoshthiDataUpdateStateCopyWithImpl<$Res>
    implements _$$_GoshthiDataUpdateEmptyCopyWith<$Res> {
  __$$_GoshthiDataUpdateEmptyCopyWithImpl(_$_GoshthiDataUpdateEmpty _value,
      $Res Function(_$_GoshthiDataUpdateEmpty) _then)
      : super(_value, (v) => _then(v as _$_GoshthiDataUpdateEmpty));

  @override
  _$_GoshthiDataUpdateEmpty get _value =>
      super._value as _$_GoshthiDataUpdateEmpty;

  @override
  $Res call({
    Object? loadingStatus = freezed,
  }) {
    return _then(_$_GoshthiDataUpdateEmpty(
      loadingStatus == freezed
          ? _value.loadingStatus
          : loadingStatus // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
    ));
  }
}

/// @nodoc

class _$_GoshthiDataUpdateEmpty implements _GoshthiDataUpdateEmpty {
  const _$_GoshthiDataUpdateEmpty(this.loadingStatus);

  @override
  final LoadingStatus loadingStatus;

  @override
  String toString() {
    return 'GoshthiDataUpdateState.empty(loadingStatus: $loadingStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GoshthiDataUpdateEmpty &&
            const DeepCollectionEquality()
                .equals(other.loadingStatus, loadingStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(loadingStatus));

  @JsonKey(ignore: true)
  @override
  _$$_GoshthiDataUpdateEmptyCopyWith<_$_GoshthiDataUpdateEmpty> get copyWith =>
      __$$_GoshthiDataUpdateEmptyCopyWithImpl<_$_GoshthiDataUpdateEmpty>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoadingStatus loadingStatus) empty,
    required TResult Function(
            SubmitGoshthiReportAttendanceModel?
                submitGoshthiReportAttendanceModel,
            LoadingStatus loadingStatus)
        submitGoshthiReportAttendance,
    required TResult Function(
            UpdateGoshthiHeldStatusModel? updateGoshthiHeldStatusModel)
        updateGoshthiHeldStatus,
  }) {
    return empty(loadingStatus);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(LoadingStatus loadingStatus)? empty,
    TResult Function(
            SubmitGoshthiReportAttendanceModel?
                submitGoshthiReportAttendanceModel,
            LoadingStatus loadingStatus)?
        submitGoshthiReportAttendance,
    TResult Function(
            UpdateGoshthiHeldStatusModel? updateGoshthiHeldStatusModel)?
        updateGoshthiHeldStatus,
  }) {
    return empty?.call(loadingStatus);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoadingStatus loadingStatus)? empty,
    TResult Function(
            SubmitGoshthiReportAttendanceModel?
                submitGoshthiReportAttendanceModel,
            LoadingStatus loadingStatus)?
        submitGoshthiReportAttendance,
    TResult Function(
            UpdateGoshthiHeldStatusModel? updateGoshthiHeldStatusModel)?
        updateGoshthiHeldStatus,
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
    required TResult Function(_GoshthiDataUpdateEmpty value) empty,
    required TResult Function(_ReportStateSubmitGoshthiReportAttendance value)
        submitGoshthiReportAttendance,
    required TResult Function(_ReportStateUpdateGoshthiHeldStatus value)
        updateGoshthiHeldStatus,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GoshthiDataUpdateEmpty value)? empty,
    TResult Function(_ReportStateSubmitGoshthiReportAttendance value)?
        submitGoshthiReportAttendance,
    TResult Function(_ReportStateUpdateGoshthiHeldStatus value)?
        updateGoshthiHeldStatus,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GoshthiDataUpdateEmpty value)? empty,
    TResult Function(_ReportStateSubmitGoshthiReportAttendance value)?
        submitGoshthiReportAttendance,
    TResult Function(_ReportStateUpdateGoshthiHeldStatus value)?
        updateGoshthiHeldStatus,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class _GoshthiDataUpdateEmpty implements GoshthiDataUpdateState {
  const factory _GoshthiDataUpdateEmpty(final LoadingStatus loadingStatus) =
      _$_GoshthiDataUpdateEmpty;

  LoadingStatus get loadingStatus => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$_GoshthiDataUpdateEmptyCopyWith<_$_GoshthiDataUpdateEmpty> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ReportStateSubmitGoshthiReportAttendanceCopyWith<$Res> {
  factory _$$_ReportStateSubmitGoshthiReportAttendanceCopyWith(
          _$_ReportStateSubmitGoshthiReportAttendance value,
          $Res Function(_$_ReportStateSubmitGoshthiReportAttendance) then) =
      __$$_ReportStateSubmitGoshthiReportAttendanceCopyWithImpl<$Res>;
  $Res call(
      {SubmitGoshthiReportAttendanceModel? submitGoshthiReportAttendanceModel,
      LoadingStatus loadingStatus});
}

/// @nodoc
class __$$_ReportStateSubmitGoshthiReportAttendanceCopyWithImpl<$Res>
    extends _$GoshthiDataUpdateStateCopyWithImpl<$Res>
    implements _$$_ReportStateSubmitGoshthiReportAttendanceCopyWith<$Res> {
  __$$_ReportStateSubmitGoshthiReportAttendanceCopyWithImpl(
      _$_ReportStateSubmitGoshthiReportAttendance _value,
      $Res Function(_$_ReportStateSubmitGoshthiReportAttendance) _then)
      : super(_value,
            (v) => _then(v as _$_ReportStateSubmitGoshthiReportAttendance));

  @override
  _$_ReportStateSubmitGoshthiReportAttendance get _value =>
      super._value as _$_ReportStateSubmitGoshthiReportAttendance;

  @override
  $Res call({
    Object? submitGoshthiReportAttendanceModel = freezed,
    Object? loadingStatus = freezed,
  }) {
    return _then(_$_ReportStateSubmitGoshthiReportAttendance(
      submitGoshthiReportAttendanceModel == freezed
          ? _value.submitGoshthiReportAttendanceModel
          : submitGoshthiReportAttendanceModel // ignore: cast_nullable_to_non_nullable
              as SubmitGoshthiReportAttendanceModel?,
      loadingStatus == freezed
          ? _value.loadingStatus
          : loadingStatus // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
    ));
  }
}

/// @nodoc

class _$_ReportStateSubmitGoshthiReportAttendance
    implements _ReportStateSubmitGoshthiReportAttendance {
  const _$_ReportStateSubmitGoshthiReportAttendance(
      this.submitGoshthiReportAttendanceModel, this.loadingStatus);

  @override
  final SubmitGoshthiReportAttendanceModel? submitGoshthiReportAttendanceModel;
  @override
  final LoadingStatus loadingStatus;

  @override
  String toString() {
    return 'GoshthiDataUpdateState.submitGoshthiReportAttendance(submitGoshthiReportAttendanceModel: $submitGoshthiReportAttendanceModel, loadingStatus: $loadingStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReportStateSubmitGoshthiReportAttendance &&
            const DeepCollectionEquality().equals(
                other.submitGoshthiReportAttendanceModel,
                submitGoshthiReportAttendanceModel) &&
            const DeepCollectionEquality()
                .equals(other.loadingStatus, loadingStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(submitGoshthiReportAttendanceModel),
      const DeepCollectionEquality().hash(loadingStatus));

  @JsonKey(ignore: true)
  @override
  _$$_ReportStateSubmitGoshthiReportAttendanceCopyWith<
          _$_ReportStateSubmitGoshthiReportAttendance>
      get copyWith => __$$_ReportStateSubmitGoshthiReportAttendanceCopyWithImpl<
          _$_ReportStateSubmitGoshthiReportAttendance>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoadingStatus loadingStatus) empty,
    required TResult Function(
            SubmitGoshthiReportAttendanceModel?
                submitGoshthiReportAttendanceModel,
            LoadingStatus loadingStatus)
        submitGoshthiReportAttendance,
    required TResult Function(
            UpdateGoshthiHeldStatusModel? updateGoshthiHeldStatusModel)
        updateGoshthiHeldStatus,
  }) {
    return submitGoshthiReportAttendance(
        submitGoshthiReportAttendanceModel, loadingStatus);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(LoadingStatus loadingStatus)? empty,
    TResult Function(
            SubmitGoshthiReportAttendanceModel?
                submitGoshthiReportAttendanceModel,
            LoadingStatus loadingStatus)?
        submitGoshthiReportAttendance,
    TResult Function(
            UpdateGoshthiHeldStatusModel? updateGoshthiHeldStatusModel)?
        updateGoshthiHeldStatus,
  }) {
    return submitGoshthiReportAttendance?.call(
        submitGoshthiReportAttendanceModel, loadingStatus);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoadingStatus loadingStatus)? empty,
    TResult Function(
            SubmitGoshthiReportAttendanceModel?
                submitGoshthiReportAttendanceModel,
            LoadingStatus loadingStatus)?
        submitGoshthiReportAttendance,
    TResult Function(
            UpdateGoshthiHeldStatusModel? updateGoshthiHeldStatusModel)?
        updateGoshthiHeldStatus,
    required TResult orElse(),
  }) {
    if (submitGoshthiReportAttendance != null) {
      return submitGoshthiReportAttendance(
          submitGoshthiReportAttendanceModel, loadingStatus);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GoshthiDataUpdateEmpty value) empty,
    required TResult Function(_ReportStateSubmitGoshthiReportAttendance value)
        submitGoshthiReportAttendance,
    required TResult Function(_ReportStateUpdateGoshthiHeldStatus value)
        updateGoshthiHeldStatus,
  }) {
    return submitGoshthiReportAttendance(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GoshthiDataUpdateEmpty value)? empty,
    TResult Function(_ReportStateSubmitGoshthiReportAttendance value)?
        submitGoshthiReportAttendance,
    TResult Function(_ReportStateUpdateGoshthiHeldStatus value)?
        updateGoshthiHeldStatus,
  }) {
    return submitGoshthiReportAttendance?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GoshthiDataUpdateEmpty value)? empty,
    TResult Function(_ReportStateSubmitGoshthiReportAttendance value)?
        submitGoshthiReportAttendance,
    TResult Function(_ReportStateUpdateGoshthiHeldStatus value)?
        updateGoshthiHeldStatus,
    required TResult orElse(),
  }) {
    if (submitGoshthiReportAttendance != null) {
      return submitGoshthiReportAttendance(this);
    }
    return orElse();
  }
}

abstract class _ReportStateSubmitGoshthiReportAttendance
    implements GoshthiDataUpdateState {
  const factory _ReportStateSubmitGoshthiReportAttendance(
          final SubmitGoshthiReportAttendanceModel?
              submitGoshthiReportAttendanceModel,
          final LoadingStatus loadingStatus) =
      _$_ReportStateSubmitGoshthiReportAttendance;

  SubmitGoshthiReportAttendanceModel? get submitGoshthiReportAttendanceModel =>
      throw _privateConstructorUsedError;
  LoadingStatus get loadingStatus => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$_ReportStateSubmitGoshthiReportAttendanceCopyWith<
          _$_ReportStateSubmitGoshthiReportAttendance>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ReportStateUpdateGoshthiHeldStatusCopyWith<$Res> {
  factory _$$_ReportStateUpdateGoshthiHeldStatusCopyWith(
          _$_ReportStateUpdateGoshthiHeldStatus value,
          $Res Function(_$_ReportStateUpdateGoshthiHeldStatus) then) =
      __$$_ReportStateUpdateGoshthiHeldStatusCopyWithImpl<$Res>;
  $Res call({UpdateGoshthiHeldStatusModel? updateGoshthiHeldStatusModel});
}

/// @nodoc
class __$$_ReportStateUpdateGoshthiHeldStatusCopyWithImpl<$Res>
    extends _$GoshthiDataUpdateStateCopyWithImpl<$Res>
    implements _$$_ReportStateUpdateGoshthiHeldStatusCopyWith<$Res> {
  __$$_ReportStateUpdateGoshthiHeldStatusCopyWithImpl(
      _$_ReportStateUpdateGoshthiHeldStatus _value,
      $Res Function(_$_ReportStateUpdateGoshthiHeldStatus) _then)
      : super(_value, (v) => _then(v as _$_ReportStateUpdateGoshthiHeldStatus));

  @override
  _$_ReportStateUpdateGoshthiHeldStatus get _value =>
      super._value as _$_ReportStateUpdateGoshthiHeldStatus;

  @override
  $Res call({
    Object? updateGoshthiHeldStatusModel = freezed,
  }) {
    return _then(_$_ReportStateUpdateGoshthiHeldStatus(
      updateGoshthiHeldStatusModel == freezed
          ? _value.updateGoshthiHeldStatusModel
          : updateGoshthiHeldStatusModel // ignore: cast_nullable_to_non_nullable
              as UpdateGoshthiHeldStatusModel?,
    ));
  }
}

/// @nodoc

class _$_ReportStateUpdateGoshthiHeldStatus
    implements _ReportStateUpdateGoshthiHeldStatus {
  const _$_ReportStateUpdateGoshthiHeldStatus(
      this.updateGoshthiHeldStatusModel);

  @override
  final UpdateGoshthiHeldStatusModel? updateGoshthiHeldStatusModel;

  @override
  String toString() {
    return 'GoshthiDataUpdateState.updateGoshthiHeldStatus(updateGoshthiHeldStatusModel: $updateGoshthiHeldStatusModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReportStateUpdateGoshthiHeldStatus &&
            const DeepCollectionEquality().equals(
                other.updateGoshthiHeldStatusModel,
                updateGoshthiHeldStatusModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(updateGoshthiHeldStatusModel));

  @JsonKey(ignore: true)
  @override
  _$$_ReportStateUpdateGoshthiHeldStatusCopyWith<
          _$_ReportStateUpdateGoshthiHeldStatus>
      get copyWith => __$$_ReportStateUpdateGoshthiHeldStatusCopyWithImpl<
          _$_ReportStateUpdateGoshthiHeldStatus>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoadingStatus loadingStatus) empty,
    required TResult Function(
            SubmitGoshthiReportAttendanceModel?
                submitGoshthiReportAttendanceModel,
            LoadingStatus loadingStatus)
        submitGoshthiReportAttendance,
    required TResult Function(
            UpdateGoshthiHeldStatusModel? updateGoshthiHeldStatusModel)
        updateGoshthiHeldStatus,
  }) {
    return updateGoshthiHeldStatus(updateGoshthiHeldStatusModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(LoadingStatus loadingStatus)? empty,
    TResult Function(
            SubmitGoshthiReportAttendanceModel?
                submitGoshthiReportAttendanceModel,
            LoadingStatus loadingStatus)?
        submitGoshthiReportAttendance,
    TResult Function(
            UpdateGoshthiHeldStatusModel? updateGoshthiHeldStatusModel)?
        updateGoshthiHeldStatus,
  }) {
    return updateGoshthiHeldStatus?.call(updateGoshthiHeldStatusModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoadingStatus loadingStatus)? empty,
    TResult Function(
            SubmitGoshthiReportAttendanceModel?
                submitGoshthiReportAttendanceModel,
            LoadingStatus loadingStatus)?
        submitGoshthiReportAttendance,
    TResult Function(
            UpdateGoshthiHeldStatusModel? updateGoshthiHeldStatusModel)?
        updateGoshthiHeldStatus,
    required TResult orElse(),
  }) {
    if (updateGoshthiHeldStatus != null) {
      return updateGoshthiHeldStatus(updateGoshthiHeldStatusModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GoshthiDataUpdateEmpty value) empty,
    required TResult Function(_ReportStateSubmitGoshthiReportAttendance value)
        submitGoshthiReportAttendance,
    required TResult Function(_ReportStateUpdateGoshthiHeldStatus value)
        updateGoshthiHeldStatus,
  }) {
    return updateGoshthiHeldStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GoshthiDataUpdateEmpty value)? empty,
    TResult Function(_ReportStateSubmitGoshthiReportAttendance value)?
        submitGoshthiReportAttendance,
    TResult Function(_ReportStateUpdateGoshthiHeldStatus value)?
        updateGoshthiHeldStatus,
  }) {
    return updateGoshthiHeldStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GoshthiDataUpdateEmpty value)? empty,
    TResult Function(_ReportStateSubmitGoshthiReportAttendance value)?
        submitGoshthiReportAttendance,
    TResult Function(_ReportStateUpdateGoshthiHeldStatus value)?
        updateGoshthiHeldStatus,
    required TResult orElse(),
  }) {
    if (updateGoshthiHeldStatus != null) {
      return updateGoshthiHeldStatus(this);
    }
    return orElse();
  }
}

abstract class _ReportStateUpdateGoshthiHeldStatus
    implements GoshthiDataUpdateState {
  const factory _ReportStateUpdateGoshthiHeldStatus(
          final UpdateGoshthiHeldStatusModel? updateGoshthiHeldStatusModel) =
      _$_ReportStateUpdateGoshthiHeldStatus;

  UpdateGoshthiHeldStatusModel? get updateGoshthiHeldStatusModel =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$_ReportStateUpdateGoshthiHeldStatusCopyWith<
          _$_ReportStateUpdateGoshthiHeldStatus>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$GoshthiDataUpdateEvent {
  BuildContext get context => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context, String sabha_id,
            String user_id, String status)
        submitGoshthiReportAttendance,
    required TResult Function(
            BuildContext context,
            UpdateGoshthiHeldStatusRequestModel
                updateGoshthiHeldStatusRequestModel)
        updateGoshthiHeldStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(BuildContext context, String sabha_id, String user_id,
            String status)?
        submitGoshthiReportAttendance,
    TResult Function(
            BuildContext context,
            UpdateGoshthiHeldStatusRequestModel
                updateGoshthiHeldStatusRequestModel)?
        updateGoshthiHeldStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, String sabha_id, String user_id,
            String status)?
        submitGoshthiReportAttendance,
    TResult Function(
            BuildContext context,
            UpdateGoshthiHeldStatusRequestModel
                updateGoshthiHeldStatusRequestModel)?
        updateGoshthiHeldStatus,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_submitGoshthiReportAttendance value)
        submitGoshthiReportAttendance,
    required TResult Function(_updateGoshthiHeldStatus value)
        updateGoshthiHeldStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_submitGoshthiReportAttendance value)?
        submitGoshthiReportAttendance,
    TResult Function(_updateGoshthiHeldStatus value)? updateGoshthiHeldStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_submitGoshthiReportAttendance value)?
        submitGoshthiReportAttendance,
    TResult Function(_updateGoshthiHeldStatus value)? updateGoshthiHeldStatus,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GoshthiDataUpdateEventCopyWith<GoshthiDataUpdateEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoshthiDataUpdateEventCopyWith<$Res> {
  factory $GoshthiDataUpdateEventCopyWith(GoshthiDataUpdateEvent value,
          $Res Function(GoshthiDataUpdateEvent) then) =
      _$GoshthiDataUpdateEventCopyWithImpl<$Res>;
  $Res call({BuildContext context});
}

/// @nodoc
class _$GoshthiDataUpdateEventCopyWithImpl<$Res>
    implements $GoshthiDataUpdateEventCopyWith<$Res> {
  _$GoshthiDataUpdateEventCopyWithImpl(this._value, this._then);

  final GoshthiDataUpdateEvent _value;
  // ignore: unused_field
  final $Res Function(GoshthiDataUpdateEvent) _then;

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
abstract class _$$_submitGoshthiReportAttendanceCopyWith<$Res>
    implements $GoshthiDataUpdateEventCopyWith<$Res> {
  factory _$$_submitGoshthiReportAttendanceCopyWith(
          _$_submitGoshthiReportAttendance value,
          $Res Function(_$_submitGoshthiReportAttendance) then) =
      __$$_submitGoshthiReportAttendanceCopyWithImpl<$Res>;
  @override
  $Res call(
      {BuildContext context, String sabha_id, String user_id, String status});
}

/// @nodoc
class __$$_submitGoshthiReportAttendanceCopyWithImpl<$Res>
    extends _$GoshthiDataUpdateEventCopyWithImpl<$Res>
    implements _$$_submitGoshthiReportAttendanceCopyWith<$Res> {
  __$$_submitGoshthiReportAttendanceCopyWithImpl(
      _$_submitGoshthiReportAttendance _value,
      $Res Function(_$_submitGoshthiReportAttendance) _then)
      : super(_value, (v) => _then(v as _$_submitGoshthiReportAttendance));

  @override
  _$_submitGoshthiReportAttendance get _value =>
      super._value as _$_submitGoshthiReportAttendance;

  @override
  $Res call({
    Object? context = freezed,
    Object? sabha_id = freezed,
    Object? user_id = freezed,
    Object? status = freezed,
  }) {
    return _then(_$_submitGoshthiReportAttendance(
      context == freezed
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      sabha_id == freezed
          ? _value.sabha_id
          : sabha_id // ignore: cast_nullable_to_non_nullable
              as String,
      user_id == freezed
          ? _value.user_id
          : user_id // ignore: cast_nullable_to_non_nullable
              as String,
      status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_submitGoshthiReportAttendance
    implements _submitGoshthiReportAttendance {
  const _$_submitGoshthiReportAttendance(
      this.context, this.sabha_id, this.user_id, this.status);

  @override
  final BuildContext context;
  @override
  final String sabha_id;
  @override
  final String user_id;
  @override
  final String status;

  @override
  String toString() {
    return 'GoshthiDataUpdateEvent.submitGoshthiReportAttendance(context: $context, sabha_id: $sabha_id, user_id: $user_id, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_submitGoshthiReportAttendance &&
            const DeepCollectionEquality().equals(other.context, context) &&
            const DeepCollectionEquality().equals(other.sabha_id, sabha_id) &&
            const DeepCollectionEquality().equals(other.user_id, user_id) &&
            const DeepCollectionEquality().equals(other.status, status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(context),
      const DeepCollectionEquality().hash(sabha_id),
      const DeepCollectionEquality().hash(user_id),
      const DeepCollectionEquality().hash(status));

  @JsonKey(ignore: true)
  @override
  _$$_submitGoshthiReportAttendanceCopyWith<_$_submitGoshthiReportAttendance>
      get copyWith => __$$_submitGoshthiReportAttendanceCopyWithImpl<
          _$_submitGoshthiReportAttendance>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context, String sabha_id,
            String user_id, String status)
        submitGoshthiReportAttendance,
    required TResult Function(
            BuildContext context,
            UpdateGoshthiHeldStatusRequestModel
                updateGoshthiHeldStatusRequestModel)
        updateGoshthiHeldStatus,
  }) {
    return submitGoshthiReportAttendance(context, sabha_id, user_id, status);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(BuildContext context, String sabha_id, String user_id,
            String status)?
        submitGoshthiReportAttendance,
    TResult Function(
            BuildContext context,
            UpdateGoshthiHeldStatusRequestModel
                updateGoshthiHeldStatusRequestModel)?
        updateGoshthiHeldStatus,
  }) {
    return submitGoshthiReportAttendance?.call(
        context, sabha_id, user_id, status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, String sabha_id, String user_id,
            String status)?
        submitGoshthiReportAttendance,
    TResult Function(
            BuildContext context,
            UpdateGoshthiHeldStatusRequestModel
                updateGoshthiHeldStatusRequestModel)?
        updateGoshthiHeldStatus,
    required TResult orElse(),
  }) {
    if (submitGoshthiReportAttendance != null) {
      return submitGoshthiReportAttendance(context, sabha_id, user_id, status);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_submitGoshthiReportAttendance value)
        submitGoshthiReportAttendance,
    required TResult Function(_updateGoshthiHeldStatus value)
        updateGoshthiHeldStatus,
  }) {
    return submitGoshthiReportAttendance(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_submitGoshthiReportAttendance value)?
        submitGoshthiReportAttendance,
    TResult Function(_updateGoshthiHeldStatus value)? updateGoshthiHeldStatus,
  }) {
    return submitGoshthiReportAttendance?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_submitGoshthiReportAttendance value)?
        submitGoshthiReportAttendance,
    TResult Function(_updateGoshthiHeldStatus value)? updateGoshthiHeldStatus,
    required TResult orElse(),
  }) {
    if (submitGoshthiReportAttendance != null) {
      return submitGoshthiReportAttendance(this);
    }
    return orElse();
  }
}

abstract class _submitGoshthiReportAttendance
    implements GoshthiDataUpdateEvent {
  const factory _submitGoshthiReportAttendance(
      final BuildContext context,
      final String sabha_id,
      final String user_id,
      final String status) = _$_submitGoshthiReportAttendance;

  @override
  BuildContext get context => throw _privateConstructorUsedError;
  String get sabha_id => throw _privateConstructorUsedError;
  String get user_id => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_submitGoshthiReportAttendanceCopyWith<_$_submitGoshthiReportAttendance>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_updateGoshthiHeldStatusCopyWith<$Res>
    implements $GoshthiDataUpdateEventCopyWith<$Res> {
  factory _$$_updateGoshthiHeldStatusCopyWith(_$_updateGoshthiHeldStatus value,
          $Res Function(_$_updateGoshthiHeldStatus) then) =
      __$$_updateGoshthiHeldStatusCopyWithImpl<$Res>;
  @override
  $Res call(
      {BuildContext context,
      UpdateGoshthiHeldStatusRequestModel updateGoshthiHeldStatusRequestModel});
}

/// @nodoc
class __$$_updateGoshthiHeldStatusCopyWithImpl<$Res>
    extends _$GoshthiDataUpdateEventCopyWithImpl<$Res>
    implements _$$_updateGoshthiHeldStatusCopyWith<$Res> {
  __$$_updateGoshthiHeldStatusCopyWithImpl(_$_updateGoshthiHeldStatus _value,
      $Res Function(_$_updateGoshthiHeldStatus) _then)
      : super(_value, (v) => _then(v as _$_updateGoshthiHeldStatus));

  @override
  _$_updateGoshthiHeldStatus get _value =>
      super._value as _$_updateGoshthiHeldStatus;

  @override
  $Res call({
    Object? context = freezed,
    Object? updateGoshthiHeldStatusRequestModel = freezed,
  }) {
    return _then(_$_updateGoshthiHeldStatus(
      context == freezed
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      updateGoshthiHeldStatusRequestModel == freezed
          ? _value.updateGoshthiHeldStatusRequestModel
          : updateGoshthiHeldStatusRequestModel // ignore: cast_nullable_to_non_nullable
              as UpdateGoshthiHeldStatusRequestModel,
    ));
  }
}

/// @nodoc

class _$_updateGoshthiHeldStatus implements _updateGoshthiHeldStatus {
  const _$_updateGoshthiHeldStatus(
      this.context, this.updateGoshthiHeldStatusRequestModel);

  @override
  final BuildContext context;
  @override
  final UpdateGoshthiHeldStatusRequestModel updateGoshthiHeldStatusRequestModel;

  @override
  String toString() {
    return 'GoshthiDataUpdateEvent.updateGoshthiHeldStatus(context: $context, updateGoshthiHeldStatusRequestModel: $updateGoshthiHeldStatusRequestModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_updateGoshthiHeldStatus &&
            const DeepCollectionEquality().equals(other.context, context) &&
            const DeepCollectionEquality().equals(
                other.updateGoshthiHeldStatusRequestModel,
                updateGoshthiHeldStatusRequestModel));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(context),
      const DeepCollectionEquality().hash(updateGoshthiHeldStatusRequestModel));

  @JsonKey(ignore: true)
  @override
  _$$_updateGoshthiHeldStatusCopyWith<_$_updateGoshthiHeldStatus>
      get copyWith =>
          __$$_updateGoshthiHeldStatusCopyWithImpl<_$_updateGoshthiHeldStatus>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context, String sabha_id,
            String user_id, String status)
        submitGoshthiReportAttendance,
    required TResult Function(
            BuildContext context,
            UpdateGoshthiHeldStatusRequestModel
                updateGoshthiHeldStatusRequestModel)
        updateGoshthiHeldStatus,
  }) {
    return updateGoshthiHeldStatus(
        context, updateGoshthiHeldStatusRequestModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(BuildContext context, String sabha_id, String user_id,
            String status)?
        submitGoshthiReportAttendance,
    TResult Function(
            BuildContext context,
            UpdateGoshthiHeldStatusRequestModel
                updateGoshthiHeldStatusRequestModel)?
        updateGoshthiHeldStatus,
  }) {
    return updateGoshthiHeldStatus?.call(
        context, updateGoshthiHeldStatusRequestModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, String sabha_id, String user_id,
            String status)?
        submitGoshthiReportAttendance,
    TResult Function(
            BuildContext context,
            UpdateGoshthiHeldStatusRequestModel
                updateGoshthiHeldStatusRequestModel)?
        updateGoshthiHeldStatus,
    required TResult orElse(),
  }) {
    if (updateGoshthiHeldStatus != null) {
      return updateGoshthiHeldStatus(
          context, updateGoshthiHeldStatusRequestModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_submitGoshthiReportAttendance value)
        submitGoshthiReportAttendance,
    required TResult Function(_updateGoshthiHeldStatus value)
        updateGoshthiHeldStatus,
  }) {
    return updateGoshthiHeldStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_submitGoshthiReportAttendance value)?
        submitGoshthiReportAttendance,
    TResult Function(_updateGoshthiHeldStatus value)? updateGoshthiHeldStatus,
  }) {
    return updateGoshthiHeldStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_submitGoshthiReportAttendance value)?
        submitGoshthiReportAttendance,
    TResult Function(_updateGoshthiHeldStatus value)? updateGoshthiHeldStatus,
    required TResult orElse(),
  }) {
    if (updateGoshthiHeldStatus != null) {
      return updateGoshthiHeldStatus(this);
    }
    return orElse();
  }
}

abstract class _updateGoshthiHeldStatus implements GoshthiDataUpdateEvent {
  const factory _updateGoshthiHeldStatus(
      final BuildContext context,
      final UpdateGoshthiHeldStatusRequestModel
          updateGoshthiHeldStatusRequestModel) = _$_updateGoshthiHeldStatus;

  @override
  BuildContext get context => throw _privateConstructorUsedError;
  UpdateGoshthiHeldStatusRequestModel get updateGoshthiHeldStatusRequestModel =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_updateGoshthiHeldStatusCopyWith<_$_updateGoshthiHeldStatus>
      get copyWith => throw _privateConstructorUsedError;
}
