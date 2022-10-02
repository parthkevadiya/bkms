// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'manage_bst_attendance_report_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ManageBstAttendanceReportState {
  LoadingStatus get loadingStatus => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoadingStatus loadingStatus) empty,
    required TResult Function(
            ManageBSTAttendanceModel? manageBSTAttendanceModel,
            LoadingStatus loadingStatus)
        manageBSTAttendance,
    required TResult Function(ManageBSTQuizScoreModel? manageBSTQuizScoreModel,
            LoadingStatus loadingStatus)
        manageBSTQuizScore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(LoadingStatus loadingStatus)? empty,
    TResult Function(ManageBSTAttendanceModel? manageBSTAttendanceModel,
            LoadingStatus loadingStatus)?
        manageBSTAttendance,
    TResult Function(ManageBSTQuizScoreModel? manageBSTQuizScoreModel,
            LoadingStatus loadingStatus)?
        manageBSTQuizScore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoadingStatus loadingStatus)? empty,
    TResult Function(ManageBSTAttendanceModel? manageBSTAttendanceModel,
            LoadingStatus loadingStatus)?
        manageBSTAttendance,
    TResult Function(ManageBSTQuizScoreModel? manageBSTQuizScoreModel,
            LoadingStatus loadingStatus)?
        manageBSTQuizScore,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ManageNiyamReportEmpty value) empty,
    required TResult Function(_ReportStateManageBSTAttendance value)
        manageBSTAttendance,
    required TResult Function(_ReportStateManageBSTQuizScore value)
        manageBSTQuizScore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ManageNiyamReportEmpty value)? empty,
    TResult Function(_ReportStateManageBSTAttendance value)?
        manageBSTAttendance,
    TResult Function(_ReportStateManageBSTQuizScore value)? manageBSTQuizScore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ManageNiyamReportEmpty value)? empty,
    TResult Function(_ReportStateManageBSTAttendance value)?
        manageBSTAttendance,
    TResult Function(_ReportStateManageBSTQuizScore value)? manageBSTQuizScore,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ManageBstAttendanceReportStateCopyWith<ManageBstAttendanceReportState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ManageBstAttendanceReportStateCopyWith<$Res> {
  factory $ManageBstAttendanceReportStateCopyWith(
          ManageBstAttendanceReportState value,
          $Res Function(ManageBstAttendanceReportState) then) =
      _$ManageBstAttendanceReportStateCopyWithImpl<$Res>;
  $Res call({LoadingStatus loadingStatus});
}

/// @nodoc
class _$ManageBstAttendanceReportStateCopyWithImpl<$Res>
    implements $ManageBstAttendanceReportStateCopyWith<$Res> {
  _$ManageBstAttendanceReportStateCopyWithImpl(this._value, this._then);

  final ManageBstAttendanceReportState _value;
  // ignore: unused_field
  final $Res Function(ManageBstAttendanceReportState) _then;

  @override
  $Res call({
    Object? loadingStatus = freezed,
  }) {
    return _then(_value.copyWith(
      loadingStatus: loadingStatus == freezed
          ? _value.loadingStatus
          : loadingStatus // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
    ));
  }
}

/// @nodoc
abstract class _$$_ManageNiyamReportEmptyCopyWith<$Res>
    implements $ManageBstAttendanceReportStateCopyWith<$Res> {
  factory _$$_ManageNiyamReportEmptyCopyWith(_$_ManageNiyamReportEmpty value,
          $Res Function(_$_ManageNiyamReportEmpty) then) =
      __$$_ManageNiyamReportEmptyCopyWithImpl<$Res>;
  @override
  $Res call({LoadingStatus loadingStatus});
}

/// @nodoc
class __$$_ManageNiyamReportEmptyCopyWithImpl<$Res>
    extends _$ManageBstAttendanceReportStateCopyWithImpl<$Res>
    implements _$$_ManageNiyamReportEmptyCopyWith<$Res> {
  __$$_ManageNiyamReportEmptyCopyWithImpl(_$_ManageNiyamReportEmpty _value,
      $Res Function(_$_ManageNiyamReportEmpty) _then)
      : super(_value, (v) => _then(v as _$_ManageNiyamReportEmpty));

  @override
  _$_ManageNiyamReportEmpty get _value =>
      super._value as _$_ManageNiyamReportEmpty;

  @override
  $Res call({
    Object? loadingStatus = freezed,
  }) {
    return _then(_$_ManageNiyamReportEmpty(
      loadingStatus == freezed
          ? _value.loadingStatus
          : loadingStatus // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
    ));
  }
}

/// @nodoc

class _$_ManageNiyamReportEmpty implements _ManageNiyamReportEmpty {
  const _$_ManageNiyamReportEmpty(this.loadingStatus);

  @override
  final LoadingStatus loadingStatus;

  @override
  String toString() {
    return 'ManageBstAttendanceReportState.empty(loadingStatus: $loadingStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ManageNiyamReportEmpty &&
            const DeepCollectionEquality()
                .equals(other.loadingStatus, loadingStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(loadingStatus));

  @JsonKey(ignore: true)
  @override
  _$$_ManageNiyamReportEmptyCopyWith<_$_ManageNiyamReportEmpty> get copyWith =>
      __$$_ManageNiyamReportEmptyCopyWithImpl<_$_ManageNiyamReportEmpty>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoadingStatus loadingStatus) empty,
    required TResult Function(
            ManageBSTAttendanceModel? manageBSTAttendanceModel,
            LoadingStatus loadingStatus)
        manageBSTAttendance,
    required TResult Function(ManageBSTQuizScoreModel? manageBSTQuizScoreModel,
            LoadingStatus loadingStatus)
        manageBSTQuizScore,
  }) {
    return empty(loadingStatus);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(LoadingStatus loadingStatus)? empty,
    TResult Function(ManageBSTAttendanceModel? manageBSTAttendanceModel,
            LoadingStatus loadingStatus)?
        manageBSTAttendance,
    TResult Function(ManageBSTQuizScoreModel? manageBSTQuizScoreModel,
            LoadingStatus loadingStatus)?
        manageBSTQuizScore,
  }) {
    return empty?.call(loadingStatus);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoadingStatus loadingStatus)? empty,
    TResult Function(ManageBSTAttendanceModel? manageBSTAttendanceModel,
            LoadingStatus loadingStatus)?
        manageBSTAttendance,
    TResult Function(ManageBSTQuizScoreModel? manageBSTQuizScoreModel,
            LoadingStatus loadingStatus)?
        manageBSTQuizScore,
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
    required TResult Function(_ManageNiyamReportEmpty value) empty,
    required TResult Function(_ReportStateManageBSTAttendance value)
        manageBSTAttendance,
    required TResult Function(_ReportStateManageBSTQuizScore value)
        manageBSTQuizScore,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ManageNiyamReportEmpty value)? empty,
    TResult Function(_ReportStateManageBSTAttendance value)?
        manageBSTAttendance,
    TResult Function(_ReportStateManageBSTQuizScore value)? manageBSTQuizScore,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ManageNiyamReportEmpty value)? empty,
    TResult Function(_ReportStateManageBSTAttendance value)?
        manageBSTAttendance,
    TResult Function(_ReportStateManageBSTQuizScore value)? manageBSTQuizScore,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class _ManageNiyamReportEmpty
    implements ManageBstAttendanceReportState {
  const factory _ManageNiyamReportEmpty(final LoadingStatus loadingStatus) =
      _$_ManageNiyamReportEmpty;

  @override
  LoadingStatus get loadingStatus => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ManageNiyamReportEmptyCopyWith<_$_ManageNiyamReportEmpty> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ReportStateManageBSTAttendanceCopyWith<$Res>
    implements $ManageBstAttendanceReportStateCopyWith<$Res> {
  factory _$$_ReportStateManageBSTAttendanceCopyWith(
          _$_ReportStateManageBSTAttendance value,
          $Res Function(_$_ReportStateManageBSTAttendance) then) =
      __$$_ReportStateManageBSTAttendanceCopyWithImpl<$Res>;
  @override
  $Res call(
      {ManageBSTAttendanceModel? manageBSTAttendanceModel,
      LoadingStatus loadingStatus});
}

/// @nodoc
class __$$_ReportStateManageBSTAttendanceCopyWithImpl<$Res>
    extends _$ManageBstAttendanceReportStateCopyWithImpl<$Res>
    implements _$$_ReportStateManageBSTAttendanceCopyWith<$Res> {
  __$$_ReportStateManageBSTAttendanceCopyWithImpl(
      _$_ReportStateManageBSTAttendance _value,
      $Res Function(_$_ReportStateManageBSTAttendance) _then)
      : super(_value, (v) => _then(v as _$_ReportStateManageBSTAttendance));

  @override
  _$_ReportStateManageBSTAttendance get _value =>
      super._value as _$_ReportStateManageBSTAttendance;

  @override
  $Res call({
    Object? manageBSTAttendanceModel = freezed,
    Object? loadingStatus = freezed,
  }) {
    return _then(_$_ReportStateManageBSTAttendance(
      manageBSTAttendanceModel == freezed
          ? _value.manageBSTAttendanceModel
          : manageBSTAttendanceModel // ignore: cast_nullable_to_non_nullable
              as ManageBSTAttendanceModel?,
      loadingStatus == freezed
          ? _value.loadingStatus
          : loadingStatus // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
    ));
  }
}

/// @nodoc

class _$_ReportStateManageBSTAttendance
    implements _ReportStateManageBSTAttendance {
  const _$_ReportStateManageBSTAttendance(
      this.manageBSTAttendanceModel, this.loadingStatus);

  @override
  final ManageBSTAttendanceModel? manageBSTAttendanceModel;
  @override
  final LoadingStatus loadingStatus;

  @override
  String toString() {
    return 'ManageBstAttendanceReportState.manageBSTAttendance(manageBSTAttendanceModel: $manageBSTAttendanceModel, loadingStatus: $loadingStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReportStateManageBSTAttendance &&
            const DeepCollectionEquality().equals(
                other.manageBSTAttendanceModel, manageBSTAttendanceModel) &&
            const DeepCollectionEquality()
                .equals(other.loadingStatus, loadingStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(manageBSTAttendanceModel),
      const DeepCollectionEquality().hash(loadingStatus));

  @JsonKey(ignore: true)
  @override
  _$$_ReportStateManageBSTAttendanceCopyWith<_$_ReportStateManageBSTAttendance>
      get copyWith => __$$_ReportStateManageBSTAttendanceCopyWithImpl<
          _$_ReportStateManageBSTAttendance>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoadingStatus loadingStatus) empty,
    required TResult Function(
            ManageBSTAttendanceModel? manageBSTAttendanceModel,
            LoadingStatus loadingStatus)
        manageBSTAttendance,
    required TResult Function(ManageBSTQuizScoreModel? manageBSTQuizScoreModel,
            LoadingStatus loadingStatus)
        manageBSTQuizScore,
  }) {
    return manageBSTAttendance(manageBSTAttendanceModel, loadingStatus);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(LoadingStatus loadingStatus)? empty,
    TResult Function(ManageBSTAttendanceModel? manageBSTAttendanceModel,
            LoadingStatus loadingStatus)?
        manageBSTAttendance,
    TResult Function(ManageBSTQuizScoreModel? manageBSTQuizScoreModel,
            LoadingStatus loadingStatus)?
        manageBSTQuizScore,
  }) {
    return manageBSTAttendance?.call(manageBSTAttendanceModel, loadingStatus);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoadingStatus loadingStatus)? empty,
    TResult Function(ManageBSTAttendanceModel? manageBSTAttendanceModel,
            LoadingStatus loadingStatus)?
        manageBSTAttendance,
    TResult Function(ManageBSTQuizScoreModel? manageBSTQuizScoreModel,
            LoadingStatus loadingStatus)?
        manageBSTQuizScore,
    required TResult orElse(),
  }) {
    if (manageBSTAttendance != null) {
      return manageBSTAttendance(manageBSTAttendanceModel, loadingStatus);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ManageNiyamReportEmpty value) empty,
    required TResult Function(_ReportStateManageBSTAttendance value)
        manageBSTAttendance,
    required TResult Function(_ReportStateManageBSTQuizScore value)
        manageBSTQuizScore,
  }) {
    return manageBSTAttendance(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ManageNiyamReportEmpty value)? empty,
    TResult Function(_ReportStateManageBSTAttendance value)?
        manageBSTAttendance,
    TResult Function(_ReportStateManageBSTQuizScore value)? manageBSTQuizScore,
  }) {
    return manageBSTAttendance?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ManageNiyamReportEmpty value)? empty,
    TResult Function(_ReportStateManageBSTAttendance value)?
        manageBSTAttendance,
    TResult Function(_ReportStateManageBSTQuizScore value)? manageBSTQuizScore,
    required TResult orElse(),
  }) {
    if (manageBSTAttendance != null) {
      return manageBSTAttendance(this);
    }
    return orElse();
  }
}

abstract class _ReportStateManageBSTAttendance
    implements ManageBstAttendanceReportState {
  const factory _ReportStateManageBSTAttendance(
      final ManageBSTAttendanceModel? manageBSTAttendanceModel,
      final LoadingStatus loadingStatus) = _$_ReportStateManageBSTAttendance;

  ManageBSTAttendanceModel? get manageBSTAttendanceModel =>
      throw _privateConstructorUsedError;
  @override
  LoadingStatus get loadingStatus => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ReportStateManageBSTAttendanceCopyWith<_$_ReportStateManageBSTAttendance>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ReportStateManageBSTQuizScoreCopyWith<$Res>
    implements $ManageBstAttendanceReportStateCopyWith<$Res> {
  factory _$$_ReportStateManageBSTQuizScoreCopyWith(
          _$_ReportStateManageBSTQuizScore value,
          $Res Function(_$_ReportStateManageBSTQuizScore) then) =
      __$$_ReportStateManageBSTQuizScoreCopyWithImpl<$Res>;
  @override
  $Res call(
      {ManageBSTQuizScoreModel? manageBSTQuizScoreModel,
      LoadingStatus loadingStatus});
}

/// @nodoc
class __$$_ReportStateManageBSTQuizScoreCopyWithImpl<$Res>
    extends _$ManageBstAttendanceReportStateCopyWithImpl<$Res>
    implements _$$_ReportStateManageBSTQuizScoreCopyWith<$Res> {
  __$$_ReportStateManageBSTQuizScoreCopyWithImpl(
      _$_ReportStateManageBSTQuizScore _value,
      $Res Function(_$_ReportStateManageBSTQuizScore) _then)
      : super(_value, (v) => _then(v as _$_ReportStateManageBSTQuizScore));

  @override
  _$_ReportStateManageBSTQuizScore get _value =>
      super._value as _$_ReportStateManageBSTQuizScore;

  @override
  $Res call({
    Object? manageBSTQuizScoreModel = freezed,
    Object? loadingStatus = freezed,
  }) {
    return _then(_$_ReportStateManageBSTQuizScore(
      manageBSTQuizScoreModel == freezed
          ? _value.manageBSTQuizScoreModel
          : manageBSTQuizScoreModel // ignore: cast_nullable_to_non_nullable
              as ManageBSTQuizScoreModel?,
      loadingStatus == freezed
          ? _value.loadingStatus
          : loadingStatus // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
    ));
  }
}

/// @nodoc

class _$_ReportStateManageBSTQuizScore
    implements _ReportStateManageBSTQuizScore {
  const _$_ReportStateManageBSTQuizScore(
      this.manageBSTQuizScoreModel, this.loadingStatus);

  @override
  final ManageBSTQuizScoreModel? manageBSTQuizScoreModel;
  @override
  final LoadingStatus loadingStatus;

  @override
  String toString() {
    return 'ManageBstAttendanceReportState.manageBSTQuizScore(manageBSTQuizScoreModel: $manageBSTQuizScoreModel, loadingStatus: $loadingStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReportStateManageBSTQuizScore &&
            const DeepCollectionEquality().equals(
                other.manageBSTQuizScoreModel, manageBSTQuizScoreModel) &&
            const DeepCollectionEquality()
                .equals(other.loadingStatus, loadingStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(manageBSTQuizScoreModel),
      const DeepCollectionEquality().hash(loadingStatus));

  @JsonKey(ignore: true)
  @override
  _$$_ReportStateManageBSTQuizScoreCopyWith<_$_ReportStateManageBSTQuizScore>
      get copyWith => __$$_ReportStateManageBSTQuizScoreCopyWithImpl<
          _$_ReportStateManageBSTQuizScore>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoadingStatus loadingStatus) empty,
    required TResult Function(
            ManageBSTAttendanceModel? manageBSTAttendanceModel,
            LoadingStatus loadingStatus)
        manageBSTAttendance,
    required TResult Function(ManageBSTQuizScoreModel? manageBSTQuizScoreModel,
            LoadingStatus loadingStatus)
        manageBSTQuizScore,
  }) {
    return manageBSTQuizScore(manageBSTQuizScoreModel, loadingStatus);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(LoadingStatus loadingStatus)? empty,
    TResult Function(ManageBSTAttendanceModel? manageBSTAttendanceModel,
            LoadingStatus loadingStatus)?
        manageBSTAttendance,
    TResult Function(ManageBSTQuizScoreModel? manageBSTQuizScoreModel,
            LoadingStatus loadingStatus)?
        manageBSTQuizScore,
  }) {
    return manageBSTQuizScore?.call(manageBSTQuizScoreModel, loadingStatus);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoadingStatus loadingStatus)? empty,
    TResult Function(ManageBSTAttendanceModel? manageBSTAttendanceModel,
            LoadingStatus loadingStatus)?
        manageBSTAttendance,
    TResult Function(ManageBSTQuizScoreModel? manageBSTQuizScoreModel,
            LoadingStatus loadingStatus)?
        manageBSTQuizScore,
    required TResult orElse(),
  }) {
    if (manageBSTQuizScore != null) {
      return manageBSTQuizScore(manageBSTQuizScoreModel, loadingStatus);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ManageNiyamReportEmpty value) empty,
    required TResult Function(_ReportStateManageBSTAttendance value)
        manageBSTAttendance,
    required TResult Function(_ReportStateManageBSTQuizScore value)
        manageBSTQuizScore,
  }) {
    return manageBSTQuizScore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ManageNiyamReportEmpty value)? empty,
    TResult Function(_ReportStateManageBSTAttendance value)?
        manageBSTAttendance,
    TResult Function(_ReportStateManageBSTQuizScore value)? manageBSTQuizScore,
  }) {
    return manageBSTQuizScore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ManageNiyamReportEmpty value)? empty,
    TResult Function(_ReportStateManageBSTAttendance value)?
        manageBSTAttendance,
    TResult Function(_ReportStateManageBSTQuizScore value)? manageBSTQuizScore,
    required TResult orElse(),
  }) {
    if (manageBSTQuizScore != null) {
      return manageBSTQuizScore(this);
    }
    return orElse();
  }
}

abstract class _ReportStateManageBSTQuizScore
    implements ManageBstAttendanceReportState {
  const factory _ReportStateManageBSTQuizScore(
      final ManageBSTQuizScoreModel? manageBSTQuizScoreModel,
      final LoadingStatus loadingStatus) = _$_ReportStateManageBSTQuizScore;

  ManageBSTQuizScoreModel? get manageBSTQuizScoreModel =>
      throw _privateConstructorUsedError;
  @override
  LoadingStatus get loadingStatus => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ReportStateManageBSTQuizScoreCopyWith<_$_ReportStateManageBSTQuizScore>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ManageBstAttendanceReportEvent {
  BuildContext get context => throw _privateConstructorUsedError;
  String get bst_fall_spring_report_data_id =>
      throw _privateConstructorUsedError;
  String get edit_mode => throw _privateConstructorUsedError;
  String get selected_wing => throw _privateConstructorUsedError;
  String get selected_region => throw _privateConstructorUsedError;
  String get selected_center => throw _privateConstructorUsedError;
  String get search_user_id => throw _privateConstructorUsedError;
  String get group => throw _privateConstructorUsedError;
  String get subgroup => throw _privateConstructorUsedError;
  String get schoolyear => throw _privateConstructorUsedError;
  String get first_name => throw _privateConstructorUsedError;
  String get middle_name => throw _privateConstructorUsedError;
  String get last_name => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;
  String get generic_search => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            BuildContext context,
            String bst_fall_spring_report_data_id,
            String edit_mode,
            String selected_wing,
            String selected_region,
            String selected_center,
            String search_user_id,
            String group,
            String subgroup,
            String schoolyear,
            String first_name,
            String middle_name,
            String last_name,
            int page,
            int limit,
            String generic_search)
        manageBSTAttendance,
    required TResult Function(
            BuildContext context,
            String bst_fall_spring_report_data_id,
            String edit_mode,
            String selected_wing,
            String selected_region,
            String selected_center,
            String search_user_id,
            String group,
            String subgroup,
            String schoolyear,
            String first_name,
            String middle_name,
            String last_name,
            int page,
            int limit,
            String generic_search)
        manageBSTQuizScore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            BuildContext context,
            String bst_fall_spring_report_data_id,
            String edit_mode,
            String selected_wing,
            String selected_region,
            String selected_center,
            String search_user_id,
            String group,
            String subgroup,
            String schoolyear,
            String first_name,
            String middle_name,
            String last_name,
            int page,
            int limit,
            String generic_search)?
        manageBSTAttendance,
    TResult Function(
            BuildContext context,
            String bst_fall_spring_report_data_id,
            String edit_mode,
            String selected_wing,
            String selected_region,
            String selected_center,
            String search_user_id,
            String group,
            String subgroup,
            String schoolyear,
            String first_name,
            String middle_name,
            String last_name,
            int page,
            int limit,
            String generic_search)?
        manageBSTQuizScore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            BuildContext context,
            String bst_fall_spring_report_data_id,
            String edit_mode,
            String selected_wing,
            String selected_region,
            String selected_center,
            String search_user_id,
            String group,
            String subgroup,
            String schoolyear,
            String first_name,
            String middle_name,
            String last_name,
            int page,
            int limit,
            String generic_search)?
        manageBSTAttendance,
    TResult Function(
            BuildContext context,
            String bst_fall_spring_report_data_id,
            String edit_mode,
            String selected_wing,
            String selected_region,
            String selected_center,
            String search_user_id,
            String group,
            String subgroup,
            String schoolyear,
            String first_name,
            String middle_name,
            String last_name,
            int page,
            int limit,
            String generic_search)?
        manageBSTQuizScore,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_manageBSTAttendance value) manageBSTAttendance,
    required TResult Function(_manageBSTQuizScore value) manageBSTQuizScore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_manageBSTAttendance value)? manageBSTAttendance,
    TResult Function(_manageBSTQuizScore value)? manageBSTQuizScore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_manageBSTAttendance value)? manageBSTAttendance,
    TResult Function(_manageBSTQuizScore value)? manageBSTQuizScore,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ManageBstAttendanceReportEventCopyWith<ManageBstAttendanceReportEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ManageBstAttendanceReportEventCopyWith<$Res> {
  factory $ManageBstAttendanceReportEventCopyWith(
          ManageBstAttendanceReportEvent value,
          $Res Function(ManageBstAttendanceReportEvent) then) =
      _$ManageBstAttendanceReportEventCopyWithImpl<$Res>;
  $Res call(
      {BuildContext context,
      String bst_fall_spring_report_data_id,
      String edit_mode,
      String selected_wing,
      String selected_region,
      String selected_center,
      String search_user_id,
      String group,
      String subgroup,
      String schoolyear,
      String first_name,
      String middle_name,
      String last_name,
      int page,
      int limit,
      String generic_search});
}

/// @nodoc
class _$ManageBstAttendanceReportEventCopyWithImpl<$Res>
    implements $ManageBstAttendanceReportEventCopyWith<$Res> {
  _$ManageBstAttendanceReportEventCopyWithImpl(this._value, this._then);

  final ManageBstAttendanceReportEvent _value;
  // ignore: unused_field
  final $Res Function(ManageBstAttendanceReportEvent) _then;

  @override
  $Res call({
    Object? context = freezed,
    Object? bst_fall_spring_report_data_id = freezed,
    Object? edit_mode = freezed,
    Object? selected_wing = freezed,
    Object? selected_region = freezed,
    Object? selected_center = freezed,
    Object? search_user_id = freezed,
    Object? group = freezed,
    Object? subgroup = freezed,
    Object? schoolyear = freezed,
    Object? first_name = freezed,
    Object? middle_name = freezed,
    Object? last_name = freezed,
    Object? page = freezed,
    Object? limit = freezed,
    Object? generic_search = freezed,
  }) {
    return _then(_value.copyWith(
      context: context == freezed
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      bst_fall_spring_report_data_id: bst_fall_spring_report_data_id == freezed
          ? _value.bst_fall_spring_report_data_id
          : bst_fall_spring_report_data_id // ignore: cast_nullable_to_non_nullable
              as String,
      edit_mode: edit_mode == freezed
          ? _value.edit_mode
          : edit_mode // ignore: cast_nullable_to_non_nullable
              as String,
      selected_wing: selected_wing == freezed
          ? _value.selected_wing
          : selected_wing // ignore: cast_nullable_to_non_nullable
              as String,
      selected_region: selected_region == freezed
          ? _value.selected_region
          : selected_region // ignore: cast_nullable_to_non_nullable
              as String,
      selected_center: selected_center == freezed
          ? _value.selected_center
          : selected_center // ignore: cast_nullable_to_non_nullable
              as String,
      search_user_id: search_user_id == freezed
          ? _value.search_user_id
          : search_user_id // ignore: cast_nullable_to_non_nullable
              as String,
      group: group == freezed
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as String,
      subgroup: subgroup == freezed
          ? _value.subgroup
          : subgroup // ignore: cast_nullable_to_non_nullable
              as String,
      schoolyear: schoolyear == freezed
          ? _value.schoolyear
          : schoolyear // ignore: cast_nullable_to_non_nullable
              as String,
      first_name: first_name == freezed
          ? _value.first_name
          : first_name // ignore: cast_nullable_to_non_nullable
              as String,
      middle_name: middle_name == freezed
          ? _value.middle_name
          : middle_name // ignore: cast_nullable_to_non_nullable
              as String,
      last_name: last_name == freezed
          ? _value.last_name
          : last_name // ignore: cast_nullable_to_non_nullable
              as String,
      page: page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      limit: limit == freezed
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      generic_search: generic_search == freezed
          ? _value.generic_search
          : generic_search // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_manageBSTAttendanceCopyWith<$Res>
    implements $ManageBstAttendanceReportEventCopyWith<$Res> {
  factory _$$_manageBSTAttendanceCopyWith(_$_manageBSTAttendance value,
          $Res Function(_$_manageBSTAttendance) then) =
      __$$_manageBSTAttendanceCopyWithImpl<$Res>;
  @override
  $Res call(
      {BuildContext context,
      String bst_fall_spring_report_data_id,
      String edit_mode,
      String selected_wing,
      String selected_region,
      String selected_center,
      String search_user_id,
      String group,
      String subgroup,
      String schoolyear,
      String first_name,
      String middle_name,
      String last_name,
      int page,
      int limit,
      String generic_search});
}

/// @nodoc
class __$$_manageBSTAttendanceCopyWithImpl<$Res>
    extends _$ManageBstAttendanceReportEventCopyWithImpl<$Res>
    implements _$$_manageBSTAttendanceCopyWith<$Res> {
  __$$_manageBSTAttendanceCopyWithImpl(_$_manageBSTAttendance _value,
      $Res Function(_$_manageBSTAttendance) _then)
      : super(_value, (v) => _then(v as _$_manageBSTAttendance));

  @override
  _$_manageBSTAttendance get _value => super._value as _$_manageBSTAttendance;

  @override
  $Res call({
    Object? context = freezed,
    Object? bst_fall_spring_report_data_id = freezed,
    Object? edit_mode = freezed,
    Object? selected_wing = freezed,
    Object? selected_region = freezed,
    Object? selected_center = freezed,
    Object? search_user_id = freezed,
    Object? group = freezed,
    Object? subgroup = freezed,
    Object? schoolyear = freezed,
    Object? first_name = freezed,
    Object? middle_name = freezed,
    Object? last_name = freezed,
    Object? page = freezed,
    Object? limit = freezed,
    Object? generic_search = freezed,
  }) {
    return _then(_$_manageBSTAttendance(
      context == freezed
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      bst_fall_spring_report_data_id == freezed
          ? _value.bst_fall_spring_report_data_id
          : bst_fall_spring_report_data_id // ignore: cast_nullable_to_non_nullable
              as String,
      edit_mode == freezed
          ? _value.edit_mode
          : edit_mode // ignore: cast_nullable_to_non_nullable
              as String,
      selected_wing == freezed
          ? _value.selected_wing
          : selected_wing // ignore: cast_nullable_to_non_nullable
              as String,
      selected_region == freezed
          ? _value.selected_region
          : selected_region // ignore: cast_nullable_to_non_nullable
              as String,
      selected_center == freezed
          ? _value.selected_center
          : selected_center // ignore: cast_nullable_to_non_nullable
              as String,
      search_user_id == freezed
          ? _value.search_user_id
          : search_user_id // ignore: cast_nullable_to_non_nullable
              as String,
      group == freezed
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as String,
      subgroup == freezed
          ? _value.subgroup
          : subgroup // ignore: cast_nullable_to_non_nullable
              as String,
      schoolyear == freezed
          ? _value.schoolyear
          : schoolyear // ignore: cast_nullable_to_non_nullable
              as String,
      first_name == freezed
          ? _value.first_name
          : first_name // ignore: cast_nullable_to_non_nullable
              as String,
      middle_name == freezed
          ? _value.middle_name
          : middle_name // ignore: cast_nullable_to_non_nullable
              as String,
      last_name == freezed
          ? _value.last_name
          : last_name // ignore: cast_nullable_to_non_nullable
              as String,
      page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      limit == freezed
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      generic_search == freezed
          ? _value.generic_search
          : generic_search // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_manageBSTAttendance implements _manageBSTAttendance {
  const _$_manageBSTAttendance(
      this.context,
      this.bst_fall_spring_report_data_id,
      this.edit_mode,
      this.selected_wing,
      this.selected_region,
      this.selected_center,
      this.search_user_id,
      this.group,
      this.subgroup,
      this.schoolyear,
      this.first_name,
      this.middle_name,
      this.last_name,
      this.page,
      this.limit,
      this.generic_search);

  @override
  final BuildContext context;
  @override
  final String bst_fall_spring_report_data_id;
  @override
  final String edit_mode;
  @override
  final String selected_wing;
  @override
  final String selected_region;
  @override
  final String selected_center;
  @override
  final String search_user_id;
  @override
  final String group;
  @override
  final String subgroup;
  @override
  final String schoolyear;
  @override
  final String first_name;
  @override
  final String middle_name;
  @override
  final String last_name;
  @override
  final int page;
  @override
  final int limit;
  @override
  final String generic_search;

  @override
  String toString() {
    return 'ManageBstAttendanceReportEvent.manageBSTAttendance(context: $context, bst_fall_spring_report_data_id: $bst_fall_spring_report_data_id, edit_mode: $edit_mode, selected_wing: $selected_wing, selected_region: $selected_region, selected_center: $selected_center, search_user_id: $search_user_id, group: $group, subgroup: $subgroup, schoolyear: $schoolyear, first_name: $first_name, middle_name: $middle_name, last_name: $last_name, page: $page, limit: $limit, generic_search: $generic_search)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_manageBSTAttendance &&
            const DeepCollectionEquality().equals(other.context, context) &&
            const DeepCollectionEquality().equals(
                other.bst_fall_spring_report_data_id,
                bst_fall_spring_report_data_id) &&
            const DeepCollectionEquality().equals(other.edit_mode, edit_mode) &&
            const DeepCollectionEquality()
                .equals(other.selected_wing, selected_wing) &&
            const DeepCollectionEquality()
                .equals(other.selected_region, selected_region) &&
            const DeepCollectionEquality()
                .equals(other.selected_center, selected_center) &&
            const DeepCollectionEquality()
                .equals(other.search_user_id, search_user_id) &&
            const DeepCollectionEquality().equals(other.group, group) &&
            const DeepCollectionEquality().equals(other.subgroup, subgroup) &&
            const DeepCollectionEquality()
                .equals(other.schoolyear, schoolyear) &&
            const DeepCollectionEquality()
                .equals(other.first_name, first_name) &&
            const DeepCollectionEquality()
                .equals(other.middle_name, middle_name) &&
            const DeepCollectionEquality().equals(other.last_name, last_name) &&
            const DeepCollectionEquality().equals(other.page, page) &&
            const DeepCollectionEquality().equals(other.limit, limit) &&
            const DeepCollectionEquality()
                .equals(other.generic_search, generic_search));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(context),
      const DeepCollectionEquality().hash(bst_fall_spring_report_data_id),
      const DeepCollectionEquality().hash(edit_mode),
      const DeepCollectionEquality().hash(selected_wing),
      const DeepCollectionEquality().hash(selected_region),
      const DeepCollectionEquality().hash(selected_center),
      const DeepCollectionEquality().hash(search_user_id),
      const DeepCollectionEquality().hash(group),
      const DeepCollectionEquality().hash(subgroup),
      const DeepCollectionEquality().hash(schoolyear),
      const DeepCollectionEquality().hash(first_name),
      const DeepCollectionEquality().hash(middle_name),
      const DeepCollectionEquality().hash(last_name),
      const DeepCollectionEquality().hash(page),
      const DeepCollectionEquality().hash(limit),
      const DeepCollectionEquality().hash(generic_search));

  @JsonKey(ignore: true)
  @override
  _$$_manageBSTAttendanceCopyWith<_$_manageBSTAttendance> get copyWith =>
      __$$_manageBSTAttendanceCopyWithImpl<_$_manageBSTAttendance>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            BuildContext context,
            String bst_fall_spring_report_data_id,
            String edit_mode,
            String selected_wing,
            String selected_region,
            String selected_center,
            String search_user_id,
            String group,
            String subgroup,
            String schoolyear,
            String first_name,
            String middle_name,
            String last_name,
            int page,
            int limit,
            String generic_search)
        manageBSTAttendance,
    required TResult Function(
            BuildContext context,
            String bst_fall_spring_report_data_id,
            String edit_mode,
            String selected_wing,
            String selected_region,
            String selected_center,
            String search_user_id,
            String group,
            String subgroup,
            String schoolyear,
            String first_name,
            String middle_name,
            String last_name,
            int page,
            int limit,
            String generic_search)
        manageBSTQuizScore,
  }) {
    return manageBSTAttendance(
        context,
        bst_fall_spring_report_data_id,
        edit_mode,
        selected_wing,
        selected_region,
        selected_center,
        search_user_id,
        group,
        subgroup,
        schoolyear,
        first_name,
        middle_name,
        last_name,
        page,
        limit,
        generic_search);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            BuildContext context,
            String bst_fall_spring_report_data_id,
            String edit_mode,
            String selected_wing,
            String selected_region,
            String selected_center,
            String search_user_id,
            String group,
            String subgroup,
            String schoolyear,
            String first_name,
            String middle_name,
            String last_name,
            int page,
            int limit,
            String generic_search)?
        manageBSTAttendance,
    TResult Function(
            BuildContext context,
            String bst_fall_spring_report_data_id,
            String edit_mode,
            String selected_wing,
            String selected_region,
            String selected_center,
            String search_user_id,
            String group,
            String subgroup,
            String schoolyear,
            String first_name,
            String middle_name,
            String last_name,
            int page,
            int limit,
            String generic_search)?
        manageBSTQuizScore,
  }) {
    return manageBSTAttendance?.call(
        context,
        bst_fall_spring_report_data_id,
        edit_mode,
        selected_wing,
        selected_region,
        selected_center,
        search_user_id,
        group,
        subgroup,
        schoolyear,
        first_name,
        middle_name,
        last_name,
        page,
        limit,
        generic_search);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            BuildContext context,
            String bst_fall_spring_report_data_id,
            String edit_mode,
            String selected_wing,
            String selected_region,
            String selected_center,
            String search_user_id,
            String group,
            String subgroup,
            String schoolyear,
            String first_name,
            String middle_name,
            String last_name,
            int page,
            int limit,
            String generic_search)?
        manageBSTAttendance,
    TResult Function(
            BuildContext context,
            String bst_fall_spring_report_data_id,
            String edit_mode,
            String selected_wing,
            String selected_region,
            String selected_center,
            String search_user_id,
            String group,
            String subgroup,
            String schoolyear,
            String first_name,
            String middle_name,
            String last_name,
            int page,
            int limit,
            String generic_search)?
        manageBSTQuizScore,
    required TResult orElse(),
  }) {
    if (manageBSTAttendance != null) {
      return manageBSTAttendance(
          context,
          bst_fall_spring_report_data_id,
          edit_mode,
          selected_wing,
          selected_region,
          selected_center,
          search_user_id,
          group,
          subgroup,
          schoolyear,
          first_name,
          middle_name,
          last_name,
          page,
          limit,
          generic_search);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_manageBSTAttendance value) manageBSTAttendance,
    required TResult Function(_manageBSTQuizScore value) manageBSTQuizScore,
  }) {
    return manageBSTAttendance(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_manageBSTAttendance value)? manageBSTAttendance,
    TResult Function(_manageBSTQuizScore value)? manageBSTQuizScore,
  }) {
    return manageBSTAttendance?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_manageBSTAttendance value)? manageBSTAttendance,
    TResult Function(_manageBSTQuizScore value)? manageBSTQuizScore,
    required TResult orElse(),
  }) {
    if (manageBSTAttendance != null) {
      return manageBSTAttendance(this);
    }
    return orElse();
  }
}

abstract class _manageBSTAttendance implements ManageBstAttendanceReportEvent {
  const factory _manageBSTAttendance(
      final BuildContext context,
      final String bst_fall_spring_report_data_id,
      final String edit_mode,
      final String selected_wing,
      final String selected_region,
      final String selected_center,
      final String search_user_id,
      final String group,
      final String subgroup,
      final String schoolyear,
      final String first_name,
      final String middle_name,
      final String last_name,
      final int page,
      final int limit,
      final String generic_search) = _$_manageBSTAttendance;

  @override
  BuildContext get context => throw _privateConstructorUsedError;
  @override
  String get bst_fall_spring_report_data_id =>
      throw _privateConstructorUsedError;
  @override
  String get edit_mode => throw _privateConstructorUsedError;
  @override
  String get selected_wing => throw _privateConstructorUsedError;
  @override
  String get selected_region => throw _privateConstructorUsedError;
  @override
  String get selected_center => throw _privateConstructorUsedError;
  @override
  String get search_user_id => throw _privateConstructorUsedError;
  @override
  String get group => throw _privateConstructorUsedError;
  @override
  String get subgroup => throw _privateConstructorUsedError;
  @override
  String get schoolyear => throw _privateConstructorUsedError;
  @override
  String get first_name => throw _privateConstructorUsedError;
  @override
  String get middle_name => throw _privateConstructorUsedError;
  @override
  String get last_name => throw _privateConstructorUsedError;
  @override
  int get page => throw _privateConstructorUsedError;
  @override
  int get limit => throw _privateConstructorUsedError;
  @override
  String get generic_search => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_manageBSTAttendanceCopyWith<_$_manageBSTAttendance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_manageBSTQuizScoreCopyWith<$Res>
    implements $ManageBstAttendanceReportEventCopyWith<$Res> {
  factory _$$_manageBSTQuizScoreCopyWith(_$_manageBSTQuizScore value,
          $Res Function(_$_manageBSTQuizScore) then) =
      __$$_manageBSTQuizScoreCopyWithImpl<$Res>;
  @override
  $Res call(
      {BuildContext context,
      String bst_fall_spring_report_data_id,
      String edit_mode,
      String selected_wing,
      String selected_region,
      String selected_center,
      String search_user_id,
      String group,
      String subgroup,
      String schoolyear,
      String first_name,
      String middle_name,
      String last_name,
      int page,
      int limit,
      String generic_search});
}

/// @nodoc
class __$$_manageBSTQuizScoreCopyWithImpl<$Res>
    extends _$ManageBstAttendanceReportEventCopyWithImpl<$Res>
    implements _$$_manageBSTQuizScoreCopyWith<$Res> {
  __$$_manageBSTQuizScoreCopyWithImpl(
      _$_manageBSTQuizScore _value, $Res Function(_$_manageBSTQuizScore) _then)
      : super(_value, (v) => _then(v as _$_manageBSTQuizScore));

  @override
  _$_manageBSTQuizScore get _value => super._value as _$_manageBSTQuizScore;

  @override
  $Res call({
    Object? context = freezed,
    Object? bst_fall_spring_report_data_id = freezed,
    Object? edit_mode = freezed,
    Object? selected_wing = freezed,
    Object? selected_region = freezed,
    Object? selected_center = freezed,
    Object? search_user_id = freezed,
    Object? group = freezed,
    Object? subgroup = freezed,
    Object? schoolyear = freezed,
    Object? first_name = freezed,
    Object? middle_name = freezed,
    Object? last_name = freezed,
    Object? page = freezed,
    Object? limit = freezed,
    Object? generic_search = freezed,
  }) {
    return _then(_$_manageBSTQuizScore(
      context == freezed
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      bst_fall_spring_report_data_id == freezed
          ? _value.bst_fall_spring_report_data_id
          : bst_fall_spring_report_data_id // ignore: cast_nullable_to_non_nullable
              as String,
      edit_mode == freezed
          ? _value.edit_mode
          : edit_mode // ignore: cast_nullable_to_non_nullable
              as String,
      selected_wing == freezed
          ? _value.selected_wing
          : selected_wing // ignore: cast_nullable_to_non_nullable
              as String,
      selected_region == freezed
          ? _value.selected_region
          : selected_region // ignore: cast_nullable_to_non_nullable
              as String,
      selected_center == freezed
          ? _value.selected_center
          : selected_center // ignore: cast_nullable_to_non_nullable
              as String,
      search_user_id == freezed
          ? _value.search_user_id
          : search_user_id // ignore: cast_nullable_to_non_nullable
              as String,
      group == freezed
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as String,
      subgroup == freezed
          ? _value.subgroup
          : subgroup // ignore: cast_nullable_to_non_nullable
              as String,
      schoolyear == freezed
          ? _value.schoolyear
          : schoolyear // ignore: cast_nullable_to_non_nullable
              as String,
      first_name == freezed
          ? _value.first_name
          : first_name // ignore: cast_nullable_to_non_nullable
              as String,
      middle_name == freezed
          ? _value.middle_name
          : middle_name // ignore: cast_nullable_to_non_nullable
              as String,
      last_name == freezed
          ? _value.last_name
          : last_name // ignore: cast_nullable_to_non_nullable
              as String,
      page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      limit == freezed
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      generic_search == freezed
          ? _value.generic_search
          : generic_search // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_manageBSTQuizScore implements _manageBSTQuizScore {
  const _$_manageBSTQuizScore(
      this.context,
      this.bst_fall_spring_report_data_id,
      this.edit_mode,
      this.selected_wing,
      this.selected_region,
      this.selected_center,
      this.search_user_id,
      this.group,
      this.subgroup,
      this.schoolyear,
      this.first_name,
      this.middle_name,
      this.last_name,
      this.page,
      this.limit,
      this.generic_search);

  @override
  final BuildContext context;
  @override
  final String bst_fall_spring_report_data_id;
  @override
  final String edit_mode;
  @override
  final String selected_wing;
  @override
  final String selected_region;
  @override
  final String selected_center;
  @override
  final String search_user_id;
  @override
  final String group;
  @override
  final String subgroup;
  @override
  final String schoolyear;
  @override
  final String first_name;
  @override
  final String middle_name;
  @override
  final String last_name;
  @override
  final int page;
  @override
  final int limit;
  @override
  final String generic_search;

  @override
  String toString() {
    return 'ManageBstAttendanceReportEvent.manageBSTQuizScore(context: $context, bst_fall_spring_report_data_id: $bst_fall_spring_report_data_id, edit_mode: $edit_mode, selected_wing: $selected_wing, selected_region: $selected_region, selected_center: $selected_center, search_user_id: $search_user_id, group: $group, subgroup: $subgroup, schoolyear: $schoolyear, first_name: $first_name, middle_name: $middle_name, last_name: $last_name, page: $page, limit: $limit, generic_search: $generic_search)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_manageBSTQuizScore &&
            const DeepCollectionEquality().equals(other.context, context) &&
            const DeepCollectionEquality().equals(
                other.bst_fall_spring_report_data_id,
                bst_fall_spring_report_data_id) &&
            const DeepCollectionEquality().equals(other.edit_mode, edit_mode) &&
            const DeepCollectionEquality()
                .equals(other.selected_wing, selected_wing) &&
            const DeepCollectionEquality()
                .equals(other.selected_region, selected_region) &&
            const DeepCollectionEquality()
                .equals(other.selected_center, selected_center) &&
            const DeepCollectionEquality()
                .equals(other.search_user_id, search_user_id) &&
            const DeepCollectionEquality().equals(other.group, group) &&
            const DeepCollectionEquality().equals(other.subgroup, subgroup) &&
            const DeepCollectionEquality()
                .equals(other.schoolyear, schoolyear) &&
            const DeepCollectionEquality()
                .equals(other.first_name, first_name) &&
            const DeepCollectionEquality()
                .equals(other.middle_name, middle_name) &&
            const DeepCollectionEquality().equals(other.last_name, last_name) &&
            const DeepCollectionEquality().equals(other.page, page) &&
            const DeepCollectionEquality().equals(other.limit, limit) &&
            const DeepCollectionEquality()
                .equals(other.generic_search, generic_search));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(context),
      const DeepCollectionEquality().hash(bst_fall_spring_report_data_id),
      const DeepCollectionEquality().hash(edit_mode),
      const DeepCollectionEquality().hash(selected_wing),
      const DeepCollectionEquality().hash(selected_region),
      const DeepCollectionEquality().hash(selected_center),
      const DeepCollectionEquality().hash(search_user_id),
      const DeepCollectionEquality().hash(group),
      const DeepCollectionEquality().hash(subgroup),
      const DeepCollectionEquality().hash(schoolyear),
      const DeepCollectionEquality().hash(first_name),
      const DeepCollectionEquality().hash(middle_name),
      const DeepCollectionEquality().hash(last_name),
      const DeepCollectionEquality().hash(page),
      const DeepCollectionEquality().hash(limit),
      const DeepCollectionEquality().hash(generic_search));

  @JsonKey(ignore: true)
  @override
  _$$_manageBSTQuizScoreCopyWith<_$_manageBSTQuizScore> get copyWith =>
      __$$_manageBSTQuizScoreCopyWithImpl<_$_manageBSTQuizScore>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            BuildContext context,
            String bst_fall_spring_report_data_id,
            String edit_mode,
            String selected_wing,
            String selected_region,
            String selected_center,
            String search_user_id,
            String group,
            String subgroup,
            String schoolyear,
            String first_name,
            String middle_name,
            String last_name,
            int page,
            int limit,
            String generic_search)
        manageBSTAttendance,
    required TResult Function(
            BuildContext context,
            String bst_fall_spring_report_data_id,
            String edit_mode,
            String selected_wing,
            String selected_region,
            String selected_center,
            String search_user_id,
            String group,
            String subgroup,
            String schoolyear,
            String first_name,
            String middle_name,
            String last_name,
            int page,
            int limit,
            String generic_search)
        manageBSTQuizScore,
  }) {
    return manageBSTQuizScore(
        context,
        bst_fall_spring_report_data_id,
        edit_mode,
        selected_wing,
        selected_region,
        selected_center,
        search_user_id,
        group,
        subgroup,
        schoolyear,
        first_name,
        middle_name,
        last_name,
        page,
        limit,
        generic_search);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            BuildContext context,
            String bst_fall_spring_report_data_id,
            String edit_mode,
            String selected_wing,
            String selected_region,
            String selected_center,
            String search_user_id,
            String group,
            String subgroup,
            String schoolyear,
            String first_name,
            String middle_name,
            String last_name,
            int page,
            int limit,
            String generic_search)?
        manageBSTAttendance,
    TResult Function(
            BuildContext context,
            String bst_fall_spring_report_data_id,
            String edit_mode,
            String selected_wing,
            String selected_region,
            String selected_center,
            String search_user_id,
            String group,
            String subgroup,
            String schoolyear,
            String first_name,
            String middle_name,
            String last_name,
            int page,
            int limit,
            String generic_search)?
        manageBSTQuizScore,
  }) {
    return manageBSTQuizScore?.call(
        context,
        bst_fall_spring_report_data_id,
        edit_mode,
        selected_wing,
        selected_region,
        selected_center,
        search_user_id,
        group,
        subgroup,
        schoolyear,
        first_name,
        middle_name,
        last_name,
        page,
        limit,
        generic_search);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            BuildContext context,
            String bst_fall_spring_report_data_id,
            String edit_mode,
            String selected_wing,
            String selected_region,
            String selected_center,
            String search_user_id,
            String group,
            String subgroup,
            String schoolyear,
            String first_name,
            String middle_name,
            String last_name,
            int page,
            int limit,
            String generic_search)?
        manageBSTAttendance,
    TResult Function(
            BuildContext context,
            String bst_fall_spring_report_data_id,
            String edit_mode,
            String selected_wing,
            String selected_region,
            String selected_center,
            String search_user_id,
            String group,
            String subgroup,
            String schoolyear,
            String first_name,
            String middle_name,
            String last_name,
            int page,
            int limit,
            String generic_search)?
        manageBSTQuizScore,
    required TResult orElse(),
  }) {
    if (manageBSTQuizScore != null) {
      return manageBSTQuizScore(
          context,
          bst_fall_spring_report_data_id,
          edit_mode,
          selected_wing,
          selected_region,
          selected_center,
          search_user_id,
          group,
          subgroup,
          schoolyear,
          first_name,
          middle_name,
          last_name,
          page,
          limit,
          generic_search);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_manageBSTAttendance value) manageBSTAttendance,
    required TResult Function(_manageBSTQuizScore value) manageBSTQuizScore,
  }) {
    return manageBSTQuizScore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_manageBSTAttendance value)? manageBSTAttendance,
    TResult Function(_manageBSTQuizScore value)? manageBSTQuizScore,
  }) {
    return manageBSTQuizScore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_manageBSTAttendance value)? manageBSTAttendance,
    TResult Function(_manageBSTQuizScore value)? manageBSTQuizScore,
    required TResult orElse(),
  }) {
    if (manageBSTQuizScore != null) {
      return manageBSTQuizScore(this);
    }
    return orElse();
  }
}

abstract class _manageBSTQuizScore implements ManageBstAttendanceReportEvent {
  const factory _manageBSTQuizScore(
      final BuildContext context,
      final String bst_fall_spring_report_data_id,
      final String edit_mode,
      final String selected_wing,
      final String selected_region,
      final String selected_center,
      final String search_user_id,
      final String group,
      final String subgroup,
      final String schoolyear,
      final String first_name,
      final String middle_name,
      final String last_name,
      final int page,
      final int limit,
      final String generic_search) = _$_manageBSTQuizScore;

  @override
  BuildContext get context => throw _privateConstructorUsedError;
  @override
  String get bst_fall_spring_report_data_id =>
      throw _privateConstructorUsedError;
  @override
  String get edit_mode => throw _privateConstructorUsedError;
  @override
  String get selected_wing => throw _privateConstructorUsedError;
  @override
  String get selected_region => throw _privateConstructorUsedError;
  @override
  String get selected_center => throw _privateConstructorUsedError;
  @override
  String get search_user_id => throw _privateConstructorUsedError;
  @override
  String get group => throw _privateConstructorUsedError;
  @override
  String get subgroup => throw _privateConstructorUsedError;
  @override
  String get schoolyear => throw _privateConstructorUsedError;
  @override
  String get first_name => throw _privateConstructorUsedError;
  @override
  String get middle_name => throw _privateConstructorUsedError;
  @override
  String get last_name => throw _privateConstructorUsedError;
  @override
  int get page => throw _privateConstructorUsedError;
  @override
  int get limit => throw _privateConstructorUsedError;
  @override
  String get generic_search => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_manageBSTQuizScoreCopyWith<_$_manageBSTQuizScore> get copyWith =>
      throw _privateConstructorUsedError;
}
