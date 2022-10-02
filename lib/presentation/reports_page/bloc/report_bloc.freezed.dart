// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'report_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ReportState {
  LoadingStatus get loadingStatus => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoadingStatus loadingStatus) empty,
    required TResult Function(
            ReportModel? reportModel,
            GoshthiReportModel? goshthiModel,
            NetworkingReportModel? networkingModel,
            BSTReportModel? bstModel,
            KSTReportModel? kstModel,
            CampusHangoutModel? campusHangoutModel,
            LoadingStatus loadingStatus)
        loadReports,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(LoadingStatus loadingStatus)? empty,
    TResult Function(
            ReportModel? reportModel,
            GoshthiReportModel? goshthiModel,
            NetworkingReportModel? networkingModel,
            BSTReportModel? bstModel,
            KSTReportModel? kstModel,
            CampusHangoutModel? campusHangoutModel,
            LoadingStatus loadingStatus)?
        loadReports,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoadingStatus loadingStatus)? empty,
    TResult Function(
            ReportModel? reportModel,
            GoshthiReportModel? goshthiModel,
            NetworkingReportModel? networkingModel,
            BSTReportModel? bstModel,
            KSTReportModel? kstModel,
            CampusHangoutModel? campusHangoutModel,
            LoadingStatus loadingStatus)?
        loadReports,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ReportStateEmpty value) empty,
    required TResult Function(_ReportStateLoadReports value) loadReports,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ReportStateEmpty value)? empty,
    TResult Function(_ReportStateLoadReports value)? loadReports,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ReportStateEmpty value)? empty,
    TResult Function(_ReportStateLoadReports value)? loadReports,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReportStateCopyWith<ReportState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportStateCopyWith<$Res> {
  factory $ReportStateCopyWith(
          ReportState value, $Res Function(ReportState) then) =
      _$ReportStateCopyWithImpl<$Res>;
  $Res call({LoadingStatus loadingStatus});
}

/// @nodoc
class _$ReportStateCopyWithImpl<$Res> implements $ReportStateCopyWith<$Res> {
  _$ReportStateCopyWithImpl(this._value, this._then);

  final ReportState _value;
  // ignore: unused_field
  final $Res Function(ReportState) _then;

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
abstract class _$$_ReportStateEmptyCopyWith<$Res>
    implements $ReportStateCopyWith<$Res> {
  factory _$$_ReportStateEmptyCopyWith(
          _$_ReportStateEmpty value, $Res Function(_$_ReportStateEmpty) then) =
      __$$_ReportStateEmptyCopyWithImpl<$Res>;
  @override
  $Res call({LoadingStatus loadingStatus});
}

/// @nodoc
class __$$_ReportStateEmptyCopyWithImpl<$Res>
    extends _$ReportStateCopyWithImpl<$Res>
    implements _$$_ReportStateEmptyCopyWith<$Res> {
  __$$_ReportStateEmptyCopyWithImpl(
      _$_ReportStateEmpty _value, $Res Function(_$_ReportStateEmpty) _then)
      : super(_value, (v) => _then(v as _$_ReportStateEmpty));

  @override
  _$_ReportStateEmpty get _value => super._value as _$_ReportStateEmpty;

  @override
  $Res call({
    Object? loadingStatus = freezed,
  }) {
    return _then(_$_ReportStateEmpty(
      loadingStatus == freezed
          ? _value.loadingStatus
          : loadingStatus // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
    ));
  }
}

/// @nodoc

class _$_ReportStateEmpty implements _ReportStateEmpty {
  const _$_ReportStateEmpty(this.loadingStatus);

  @override
  final LoadingStatus loadingStatus;

  @override
  String toString() {
    return 'ReportState.empty(loadingStatus: $loadingStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReportStateEmpty &&
            const DeepCollectionEquality()
                .equals(other.loadingStatus, loadingStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(loadingStatus));

  @JsonKey(ignore: true)
  @override
  _$$_ReportStateEmptyCopyWith<_$_ReportStateEmpty> get copyWith =>
      __$$_ReportStateEmptyCopyWithImpl<_$_ReportStateEmpty>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoadingStatus loadingStatus) empty,
    required TResult Function(
            ReportModel? reportModel,
            GoshthiReportModel? goshthiModel,
            NetworkingReportModel? networkingModel,
            BSTReportModel? bstModel,
            KSTReportModel? kstModel,
            CampusHangoutModel? campusHangoutModel,
            LoadingStatus loadingStatus)
        loadReports,
  }) {
    return empty(loadingStatus);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(LoadingStatus loadingStatus)? empty,
    TResult Function(
            ReportModel? reportModel,
            GoshthiReportModel? goshthiModel,
            NetworkingReportModel? networkingModel,
            BSTReportModel? bstModel,
            KSTReportModel? kstModel,
            CampusHangoutModel? campusHangoutModel,
            LoadingStatus loadingStatus)?
        loadReports,
  }) {
    return empty?.call(loadingStatus);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoadingStatus loadingStatus)? empty,
    TResult Function(
            ReportModel? reportModel,
            GoshthiReportModel? goshthiModel,
            NetworkingReportModel? networkingModel,
            BSTReportModel? bstModel,
            KSTReportModel? kstModel,
            CampusHangoutModel? campusHangoutModel,
            LoadingStatus loadingStatus)?
        loadReports,
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
    required TResult Function(_ReportStateEmpty value) empty,
    required TResult Function(_ReportStateLoadReports value) loadReports,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ReportStateEmpty value)? empty,
    TResult Function(_ReportStateLoadReports value)? loadReports,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ReportStateEmpty value)? empty,
    TResult Function(_ReportStateLoadReports value)? loadReports,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class _ReportStateEmpty implements ReportState {
  const factory _ReportStateEmpty(final LoadingStatus loadingStatus) =
      _$_ReportStateEmpty;

  @override
  LoadingStatus get loadingStatus => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ReportStateEmptyCopyWith<_$_ReportStateEmpty> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ReportStateLoadReportsCopyWith<$Res>
    implements $ReportStateCopyWith<$Res> {
  factory _$$_ReportStateLoadReportsCopyWith(_$_ReportStateLoadReports value,
          $Res Function(_$_ReportStateLoadReports) then) =
      __$$_ReportStateLoadReportsCopyWithImpl<$Res>;
  @override
  $Res call(
      {ReportModel? reportModel,
      GoshthiReportModel? goshthiModel,
      NetworkingReportModel? networkingModel,
      BSTReportModel? bstModel,
      KSTReportModel? kstModel,
      CampusHangoutModel? campusHangoutModel,
      LoadingStatus loadingStatus});
}

/// @nodoc
class __$$_ReportStateLoadReportsCopyWithImpl<$Res>
    extends _$ReportStateCopyWithImpl<$Res>
    implements _$$_ReportStateLoadReportsCopyWith<$Res> {
  __$$_ReportStateLoadReportsCopyWithImpl(_$_ReportStateLoadReports _value,
      $Res Function(_$_ReportStateLoadReports) _then)
      : super(_value, (v) => _then(v as _$_ReportStateLoadReports));

  @override
  _$_ReportStateLoadReports get _value =>
      super._value as _$_ReportStateLoadReports;

  @override
  $Res call({
    Object? reportModel = freezed,
    Object? goshthiModel = freezed,
    Object? networkingModel = freezed,
    Object? bstModel = freezed,
    Object? kstModel = freezed,
    Object? campusHangoutModel = freezed,
    Object? loadingStatus = freezed,
  }) {
    return _then(_$_ReportStateLoadReports(
      reportModel == freezed
          ? _value.reportModel
          : reportModel // ignore: cast_nullable_to_non_nullable
              as ReportModel?,
      goshthiModel == freezed
          ? _value.goshthiModel
          : goshthiModel // ignore: cast_nullable_to_non_nullable
              as GoshthiReportModel?,
      networkingModel == freezed
          ? _value.networkingModel
          : networkingModel // ignore: cast_nullable_to_non_nullable
              as NetworkingReportModel?,
      bstModel == freezed
          ? _value.bstModel
          : bstModel // ignore: cast_nullable_to_non_nullable
              as BSTReportModel?,
      kstModel == freezed
          ? _value.kstModel
          : kstModel // ignore: cast_nullable_to_non_nullable
              as KSTReportModel?,
      campusHangoutModel == freezed
          ? _value.campusHangoutModel
          : campusHangoutModel // ignore: cast_nullable_to_non_nullable
              as CampusHangoutModel?,
      loadingStatus == freezed
          ? _value.loadingStatus
          : loadingStatus // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
    ));
  }
}

/// @nodoc

class _$_ReportStateLoadReports implements _ReportStateLoadReports {
  const _$_ReportStateLoadReports(
      this.reportModel,
      this.goshthiModel,
      this.networkingModel,
      this.bstModel,
      this.kstModel,
      this.campusHangoutModel,
      this.loadingStatus);

  @override
  final ReportModel? reportModel;
  @override
  final GoshthiReportModel? goshthiModel;
  @override
  final NetworkingReportModel? networkingModel;
  @override
  final BSTReportModel? bstModel;
  @override
  final KSTReportModel? kstModel;
  @override
  final CampusHangoutModel? campusHangoutModel;
  @override
  final LoadingStatus loadingStatus;

  @override
  String toString() {
    return 'ReportState.loadReports(reportModel: $reportModel, goshthiModel: $goshthiModel, networkingModel: $networkingModel, bstModel: $bstModel, kstModel: $kstModel, campusHangoutModel: $campusHangoutModel, loadingStatus: $loadingStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReportStateLoadReports &&
            const DeepCollectionEquality()
                .equals(other.reportModel, reportModel) &&
            const DeepCollectionEquality()
                .equals(other.goshthiModel, goshthiModel) &&
            const DeepCollectionEquality()
                .equals(other.networkingModel, networkingModel) &&
            const DeepCollectionEquality().equals(other.bstModel, bstModel) &&
            const DeepCollectionEquality().equals(other.kstModel, kstModel) &&
            const DeepCollectionEquality()
                .equals(other.campusHangoutModel, campusHangoutModel) &&
            const DeepCollectionEquality()
                .equals(other.loadingStatus, loadingStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(reportModel),
      const DeepCollectionEquality().hash(goshthiModel),
      const DeepCollectionEquality().hash(networkingModel),
      const DeepCollectionEquality().hash(bstModel),
      const DeepCollectionEquality().hash(kstModel),
      const DeepCollectionEquality().hash(campusHangoutModel),
      const DeepCollectionEquality().hash(loadingStatus));

  @JsonKey(ignore: true)
  @override
  _$$_ReportStateLoadReportsCopyWith<_$_ReportStateLoadReports> get copyWith =>
      __$$_ReportStateLoadReportsCopyWithImpl<_$_ReportStateLoadReports>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoadingStatus loadingStatus) empty,
    required TResult Function(
            ReportModel? reportModel,
            GoshthiReportModel? goshthiModel,
            NetworkingReportModel? networkingModel,
            BSTReportModel? bstModel,
            KSTReportModel? kstModel,
            CampusHangoutModel? campusHangoutModel,
            LoadingStatus loadingStatus)
        loadReports,
  }) {
    return loadReports(reportModel, goshthiModel, networkingModel, bstModel,
        kstModel, campusHangoutModel, loadingStatus);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(LoadingStatus loadingStatus)? empty,
    TResult Function(
            ReportModel? reportModel,
            GoshthiReportModel? goshthiModel,
            NetworkingReportModel? networkingModel,
            BSTReportModel? bstModel,
            KSTReportModel? kstModel,
            CampusHangoutModel? campusHangoutModel,
            LoadingStatus loadingStatus)?
        loadReports,
  }) {
    return loadReports?.call(reportModel, goshthiModel, networkingModel,
        bstModel, kstModel, campusHangoutModel, loadingStatus);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoadingStatus loadingStatus)? empty,
    TResult Function(
            ReportModel? reportModel,
            GoshthiReportModel? goshthiModel,
            NetworkingReportModel? networkingModel,
            BSTReportModel? bstModel,
            KSTReportModel? kstModel,
            CampusHangoutModel? campusHangoutModel,
            LoadingStatus loadingStatus)?
        loadReports,
    required TResult orElse(),
  }) {
    if (loadReports != null) {
      return loadReports(reportModel, goshthiModel, networkingModel, bstModel,
          kstModel, campusHangoutModel, loadingStatus);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ReportStateEmpty value) empty,
    required TResult Function(_ReportStateLoadReports value) loadReports,
  }) {
    return loadReports(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ReportStateEmpty value)? empty,
    TResult Function(_ReportStateLoadReports value)? loadReports,
  }) {
    return loadReports?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ReportStateEmpty value)? empty,
    TResult Function(_ReportStateLoadReports value)? loadReports,
    required TResult orElse(),
  }) {
    if (loadReports != null) {
      return loadReports(this);
    }
    return orElse();
  }
}

abstract class _ReportStateLoadReports implements ReportState {
  const factory _ReportStateLoadReports(
      final ReportModel? reportModel,
      final GoshthiReportModel? goshthiModel,
      final NetworkingReportModel? networkingModel,
      final BSTReportModel? bstModel,
      final KSTReportModel? kstModel,
      final CampusHangoutModel? campusHangoutModel,
      final LoadingStatus loadingStatus) = _$_ReportStateLoadReports;

  ReportModel? get reportModel => throw _privateConstructorUsedError;
  GoshthiReportModel? get goshthiModel => throw _privateConstructorUsedError;
  NetworkingReportModel? get networkingModel =>
      throw _privateConstructorUsedError;
  BSTReportModel? get bstModel => throw _privateConstructorUsedError;
  KSTReportModel? get kstModel => throw _privateConstructorUsedError;
  CampusHangoutModel? get campusHangoutModel =>
      throw _privateConstructorUsedError;
  @override
  LoadingStatus get loadingStatus => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ReportStateLoadReportsCopyWith<_$_ReportStateLoadReports> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ReportEvent {
  BuildContext get context => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;
  int get is_filter => throw _privateConstructorUsedError;
  String get selected_region => throw _privateConstructorUsedError;
  String get selected_center => throw _privateConstructorUsedError;
  String get selected_wing => throw _privateConstructorUsedError;
  String get hangOutYear => throw _privateConstructorUsedError;
  String get sabha_year => throw _privateConstructorUsedError;
  String get sabha_month => throw _privateConstructorUsedError;
  String get sabha_week => throw _privateConstructorUsedError;
  String get report_status => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            BuildContext context,
            int page,
            int limit,
            int is_filter,
            String selected_region,
            String selected_center,
            String selected_wing,
            String hangOutYear,
            String sabha_year,
            String sabha_month,
            String sabha_week,
            String report_status)
        loadReports,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            BuildContext context,
            int page,
            int limit,
            int is_filter,
            String selected_region,
            String selected_center,
            String selected_wing,
            String hangOutYear,
            String sabha_year,
            String sabha_month,
            String sabha_week,
            String report_status)?
        loadReports,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            BuildContext context,
            int page,
            int limit,
            int is_filter,
            String selected_region,
            String selected_center,
            String selected_wing,
            String hangOutYear,
            String sabha_year,
            String sabha_month,
            String sabha_week,
            String report_status)?
        loadReports,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_loadReports value) loadReports,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_loadReports value)? loadReports,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_loadReports value)? loadReports,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReportEventCopyWith<ReportEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportEventCopyWith<$Res> {
  factory $ReportEventCopyWith(
          ReportEvent value, $Res Function(ReportEvent) then) =
      _$ReportEventCopyWithImpl<$Res>;
  $Res call(
      {BuildContext context,
      int page,
      int limit,
      int is_filter,
      String selected_region,
      String selected_center,
      String selected_wing,
      String hangOutYear,
      String sabha_year,
      String sabha_month,
      String sabha_week,
      String report_status});
}

/// @nodoc
class _$ReportEventCopyWithImpl<$Res> implements $ReportEventCopyWith<$Res> {
  _$ReportEventCopyWithImpl(this._value, this._then);

  final ReportEvent _value;
  // ignore: unused_field
  final $Res Function(ReportEvent) _then;

  @override
  $Res call({
    Object? context = freezed,
    Object? page = freezed,
    Object? limit = freezed,
    Object? is_filter = freezed,
    Object? selected_region = freezed,
    Object? selected_center = freezed,
    Object? selected_wing = freezed,
    Object? hangOutYear = freezed,
    Object? sabha_year = freezed,
    Object? sabha_month = freezed,
    Object? sabha_week = freezed,
    Object? report_status = freezed,
  }) {
    return _then(_value.copyWith(
      context: context == freezed
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      page: page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      limit: limit == freezed
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      is_filter: is_filter == freezed
          ? _value.is_filter
          : is_filter // ignore: cast_nullable_to_non_nullable
              as int,
      selected_region: selected_region == freezed
          ? _value.selected_region
          : selected_region // ignore: cast_nullable_to_non_nullable
              as String,
      selected_center: selected_center == freezed
          ? _value.selected_center
          : selected_center // ignore: cast_nullable_to_non_nullable
              as String,
      selected_wing: selected_wing == freezed
          ? _value.selected_wing
          : selected_wing // ignore: cast_nullable_to_non_nullable
              as String,
      hangOutYear: hangOutYear == freezed
          ? _value.hangOutYear
          : hangOutYear // ignore: cast_nullable_to_non_nullable
              as String,
      sabha_year: sabha_year == freezed
          ? _value.sabha_year
          : sabha_year // ignore: cast_nullable_to_non_nullable
              as String,
      sabha_month: sabha_month == freezed
          ? _value.sabha_month
          : sabha_month // ignore: cast_nullable_to_non_nullable
              as String,
      sabha_week: sabha_week == freezed
          ? _value.sabha_week
          : sabha_week // ignore: cast_nullable_to_non_nullable
              as String,
      report_status: report_status == freezed
          ? _value.report_status
          : report_status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_loadReportsCopyWith<$Res>
    implements $ReportEventCopyWith<$Res> {
  factory _$$_loadReportsCopyWith(
          _$_loadReports value, $Res Function(_$_loadReports) then) =
      __$$_loadReportsCopyWithImpl<$Res>;
  @override
  $Res call(
      {BuildContext context,
      int page,
      int limit,
      int is_filter,
      String selected_region,
      String selected_center,
      String selected_wing,
      String hangOutYear,
      String sabha_year,
      String sabha_month,
      String sabha_week,
      String report_status});
}

/// @nodoc
class __$$_loadReportsCopyWithImpl<$Res> extends _$ReportEventCopyWithImpl<$Res>
    implements _$$_loadReportsCopyWith<$Res> {
  __$$_loadReportsCopyWithImpl(
      _$_loadReports _value, $Res Function(_$_loadReports) _then)
      : super(_value, (v) => _then(v as _$_loadReports));

  @override
  _$_loadReports get _value => super._value as _$_loadReports;

  @override
  $Res call({
    Object? context = freezed,
    Object? page = freezed,
    Object? limit = freezed,
    Object? is_filter = freezed,
    Object? selected_region = freezed,
    Object? selected_center = freezed,
    Object? selected_wing = freezed,
    Object? hangOutYear = freezed,
    Object? sabha_year = freezed,
    Object? sabha_month = freezed,
    Object? sabha_week = freezed,
    Object? report_status = freezed,
  }) {
    return _then(_$_loadReports(
      context == freezed
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      limit == freezed
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      is_filter == freezed
          ? _value.is_filter
          : is_filter // ignore: cast_nullable_to_non_nullable
              as int,
      selected_region == freezed
          ? _value.selected_region
          : selected_region // ignore: cast_nullable_to_non_nullable
              as String,
      selected_center == freezed
          ? _value.selected_center
          : selected_center // ignore: cast_nullable_to_non_nullable
              as String,
      selected_wing == freezed
          ? _value.selected_wing
          : selected_wing // ignore: cast_nullable_to_non_nullable
              as String,
      hangOutYear == freezed
          ? _value.hangOutYear
          : hangOutYear // ignore: cast_nullable_to_non_nullable
              as String,
      sabha_year == freezed
          ? _value.sabha_year
          : sabha_year // ignore: cast_nullable_to_non_nullable
              as String,
      sabha_month == freezed
          ? _value.sabha_month
          : sabha_month // ignore: cast_nullable_to_non_nullable
              as String,
      sabha_week == freezed
          ? _value.sabha_week
          : sabha_week // ignore: cast_nullable_to_non_nullable
              as String,
      report_status == freezed
          ? _value.report_status
          : report_status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_loadReports implements _loadReports {
  const _$_loadReports(
      this.context,
      this.page,
      this.limit,
      this.is_filter,
      this.selected_region,
      this.selected_center,
      this.selected_wing,
      this.hangOutYear,
      this.sabha_year,
      this.sabha_month,
      this.sabha_week,
      this.report_status);

  @override
  final BuildContext context;
  @override
  final int page;
  @override
  final int limit;
  @override
  final int is_filter;
  @override
  final String selected_region;
  @override
  final String selected_center;
  @override
  final String selected_wing;
  @override
  final String hangOutYear;
  @override
  final String sabha_year;
  @override
  final String sabha_month;
  @override
  final String sabha_week;
  @override
  final String report_status;

  @override
  String toString() {
    return 'ReportEvent.loadReports(context: $context, page: $page, limit: $limit, is_filter: $is_filter, selected_region: $selected_region, selected_center: $selected_center, selected_wing: $selected_wing, hangOutYear: $hangOutYear, sabha_year: $sabha_year, sabha_month: $sabha_month, sabha_week: $sabha_week, report_status: $report_status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_loadReports &&
            const DeepCollectionEquality().equals(other.context, context) &&
            const DeepCollectionEquality().equals(other.page, page) &&
            const DeepCollectionEquality().equals(other.limit, limit) &&
            const DeepCollectionEquality().equals(other.is_filter, is_filter) &&
            const DeepCollectionEquality()
                .equals(other.selected_region, selected_region) &&
            const DeepCollectionEquality()
                .equals(other.selected_center, selected_center) &&
            const DeepCollectionEquality()
                .equals(other.selected_wing, selected_wing) &&
            const DeepCollectionEquality()
                .equals(other.hangOutYear, hangOutYear) &&
            const DeepCollectionEquality()
                .equals(other.sabha_year, sabha_year) &&
            const DeepCollectionEquality()
                .equals(other.sabha_month, sabha_month) &&
            const DeepCollectionEquality()
                .equals(other.sabha_week, sabha_week) &&
            const DeepCollectionEquality()
                .equals(other.report_status, report_status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(context),
      const DeepCollectionEquality().hash(page),
      const DeepCollectionEquality().hash(limit),
      const DeepCollectionEquality().hash(is_filter),
      const DeepCollectionEquality().hash(selected_region),
      const DeepCollectionEquality().hash(selected_center),
      const DeepCollectionEquality().hash(selected_wing),
      const DeepCollectionEquality().hash(hangOutYear),
      const DeepCollectionEquality().hash(sabha_year),
      const DeepCollectionEquality().hash(sabha_month),
      const DeepCollectionEquality().hash(sabha_week),
      const DeepCollectionEquality().hash(report_status));

  @JsonKey(ignore: true)
  @override
  _$$_loadReportsCopyWith<_$_loadReports> get copyWith =>
      __$$_loadReportsCopyWithImpl<_$_loadReports>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            BuildContext context,
            int page,
            int limit,
            int is_filter,
            String selected_region,
            String selected_center,
            String selected_wing,
            String hangOutYear,
            String sabha_year,
            String sabha_month,
            String sabha_week,
            String report_status)
        loadReports,
  }) {
    return loadReports(
        context,
        page,
        limit,
        is_filter,
        selected_region,
        selected_center,
        selected_wing,
        hangOutYear,
        sabha_year,
        sabha_month,
        sabha_week,
        report_status);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            BuildContext context,
            int page,
            int limit,
            int is_filter,
            String selected_region,
            String selected_center,
            String selected_wing,
            String hangOutYear,
            String sabha_year,
            String sabha_month,
            String sabha_week,
            String report_status)?
        loadReports,
  }) {
    return loadReports?.call(
        context,
        page,
        limit,
        is_filter,
        selected_region,
        selected_center,
        selected_wing,
        hangOutYear,
        sabha_year,
        sabha_month,
        sabha_week,
        report_status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            BuildContext context,
            int page,
            int limit,
            int is_filter,
            String selected_region,
            String selected_center,
            String selected_wing,
            String hangOutYear,
            String sabha_year,
            String sabha_month,
            String sabha_week,
            String report_status)?
        loadReports,
    required TResult orElse(),
  }) {
    if (loadReports != null) {
      return loadReports(
          context,
          page,
          limit,
          is_filter,
          selected_region,
          selected_center,
          selected_wing,
          hangOutYear,
          sabha_year,
          sabha_month,
          sabha_week,
          report_status);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_loadReports value) loadReports,
  }) {
    return loadReports(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_loadReports value)? loadReports,
  }) {
    return loadReports?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_loadReports value)? loadReports,
    required TResult orElse(),
  }) {
    if (loadReports != null) {
      return loadReports(this);
    }
    return orElse();
  }
}

abstract class _loadReports implements ReportEvent {
  const factory _loadReports(
      final BuildContext context,
      final int page,
      final int limit,
      final int is_filter,
      final String selected_region,
      final String selected_center,
      final String selected_wing,
      final String hangOutYear,
      final String sabha_year,
      final String sabha_month,
      final String sabha_week,
      final String report_status) = _$_loadReports;

  @override
  BuildContext get context => throw _privateConstructorUsedError;
  @override
  int get page => throw _privateConstructorUsedError;
  @override
  int get limit => throw _privateConstructorUsedError;
  @override
  int get is_filter => throw _privateConstructorUsedError;
  @override
  String get selected_region => throw _privateConstructorUsedError;
  @override
  String get selected_center => throw _privateConstructorUsedError;
  @override
  String get selected_wing => throw _privateConstructorUsedError;
  @override
  String get hangOutYear => throw _privateConstructorUsedError;
  @override
  String get sabha_year => throw _privateConstructorUsedError;
  @override
  String get sabha_month => throw _privateConstructorUsedError;
  @override
  String get sabha_week => throw _privateConstructorUsedError;
  @override
  String get report_status => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_loadReportsCopyWith<_$_loadReports> get copyWith =>
      throw _privateConstructorUsedError;
}
