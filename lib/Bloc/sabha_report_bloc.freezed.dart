// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sabha_report_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SabhaReportState {
  LoadingStatus get loadingStatus => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoadingStatus loadingStatus) empty,
    required TResult Function(
            ReportModel? reportModel, LoadingStatus loadingStatus)
        loadSabhaReports,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(LoadingStatus loadingStatus)? empty,
    TResult Function(ReportModel? reportModel, LoadingStatus loadingStatus)?
        loadSabhaReports,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoadingStatus loadingStatus)? empty,
    TResult Function(ReportModel? reportModel, LoadingStatus loadingStatus)?
        loadSabhaReports,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SabhaReportEmpty value) empty,
    required TResult Function(_ReportStateLoadSabhaReports value)
        loadSabhaReports,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SabhaReportEmpty value)? empty,
    TResult Function(_ReportStateLoadSabhaReports value)? loadSabhaReports,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SabhaReportEmpty value)? empty,
    TResult Function(_ReportStateLoadSabhaReports value)? loadSabhaReports,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SabhaReportStateCopyWith<SabhaReportState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SabhaReportStateCopyWith<$Res> {
  factory $SabhaReportStateCopyWith(
          SabhaReportState value, $Res Function(SabhaReportState) then) =
      _$SabhaReportStateCopyWithImpl<$Res>;
  $Res call({LoadingStatus loadingStatus});
}

/// @nodoc
class _$SabhaReportStateCopyWithImpl<$Res>
    implements $SabhaReportStateCopyWith<$Res> {
  _$SabhaReportStateCopyWithImpl(this._value, this._then);

  final SabhaReportState _value;
  // ignore: unused_field
  final $Res Function(SabhaReportState) _then;

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
abstract class _$$_SabhaReportEmptyCopyWith<$Res>
    implements $SabhaReportStateCopyWith<$Res> {
  factory _$$_SabhaReportEmptyCopyWith(
          _$_SabhaReportEmpty value, $Res Function(_$_SabhaReportEmpty) then) =
      __$$_SabhaReportEmptyCopyWithImpl<$Res>;
  @override
  $Res call({LoadingStatus loadingStatus});
}

/// @nodoc
class __$$_SabhaReportEmptyCopyWithImpl<$Res>
    extends _$SabhaReportStateCopyWithImpl<$Res>
    implements _$$_SabhaReportEmptyCopyWith<$Res> {
  __$$_SabhaReportEmptyCopyWithImpl(
      _$_SabhaReportEmpty _value, $Res Function(_$_SabhaReportEmpty) _then)
      : super(_value, (v) => _then(v as _$_SabhaReportEmpty));

  @override
  _$_SabhaReportEmpty get _value => super._value as _$_SabhaReportEmpty;

  @override
  $Res call({
    Object? loadingStatus = freezed,
  }) {
    return _then(_$_SabhaReportEmpty(
      loadingStatus == freezed
          ? _value.loadingStatus
          : loadingStatus // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
    ));
  }
}

/// @nodoc

class _$_SabhaReportEmpty implements _SabhaReportEmpty {
  const _$_SabhaReportEmpty(this.loadingStatus);

  @override
  final LoadingStatus loadingStatus;

  @override
  String toString() {
    return 'SabhaReportState.empty(loadingStatus: $loadingStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SabhaReportEmpty &&
            const DeepCollectionEquality()
                .equals(other.loadingStatus, loadingStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(loadingStatus));

  @JsonKey(ignore: true)
  @override
  _$$_SabhaReportEmptyCopyWith<_$_SabhaReportEmpty> get copyWith =>
      __$$_SabhaReportEmptyCopyWithImpl<_$_SabhaReportEmpty>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoadingStatus loadingStatus) empty,
    required TResult Function(
            ReportModel? reportModel, LoadingStatus loadingStatus)
        loadSabhaReports,
  }) {
    return empty(loadingStatus);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(LoadingStatus loadingStatus)? empty,
    TResult Function(ReportModel? reportModel, LoadingStatus loadingStatus)?
        loadSabhaReports,
  }) {
    return empty?.call(loadingStatus);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoadingStatus loadingStatus)? empty,
    TResult Function(ReportModel? reportModel, LoadingStatus loadingStatus)?
        loadSabhaReports,
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
    required TResult Function(_SabhaReportEmpty value) empty,
    required TResult Function(_ReportStateLoadSabhaReports value)
        loadSabhaReports,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SabhaReportEmpty value)? empty,
    TResult Function(_ReportStateLoadSabhaReports value)? loadSabhaReports,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SabhaReportEmpty value)? empty,
    TResult Function(_ReportStateLoadSabhaReports value)? loadSabhaReports,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class _SabhaReportEmpty implements SabhaReportState {
  const factory _SabhaReportEmpty(final LoadingStatus loadingStatus) =
      _$_SabhaReportEmpty;

  @override
  LoadingStatus get loadingStatus => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_SabhaReportEmptyCopyWith<_$_SabhaReportEmpty> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ReportStateLoadSabhaReportsCopyWith<$Res>
    implements $SabhaReportStateCopyWith<$Res> {
  factory _$$_ReportStateLoadSabhaReportsCopyWith(
          _$_ReportStateLoadSabhaReports value,
          $Res Function(_$_ReportStateLoadSabhaReports) then) =
      __$$_ReportStateLoadSabhaReportsCopyWithImpl<$Res>;
  @override
  $Res call({ReportModel? reportModel, LoadingStatus loadingStatus});
}

/// @nodoc
class __$$_ReportStateLoadSabhaReportsCopyWithImpl<$Res>
    extends _$SabhaReportStateCopyWithImpl<$Res>
    implements _$$_ReportStateLoadSabhaReportsCopyWith<$Res> {
  __$$_ReportStateLoadSabhaReportsCopyWithImpl(
      _$_ReportStateLoadSabhaReports _value,
      $Res Function(_$_ReportStateLoadSabhaReports) _then)
      : super(_value, (v) => _then(v as _$_ReportStateLoadSabhaReports));

  @override
  _$_ReportStateLoadSabhaReports get _value =>
      super._value as _$_ReportStateLoadSabhaReports;

  @override
  $Res call({
    Object? reportModel = freezed,
    Object? loadingStatus = freezed,
  }) {
    return _then(_$_ReportStateLoadSabhaReports(
      reportModel == freezed
          ? _value.reportModel
          : reportModel // ignore: cast_nullable_to_non_nullable
              as ReportModel?,
      loadingStatus == freezed
          ? _value.loadingStatus
          : loadingStatus // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
    ));
  }
}

/// @nodoc

class _$_ReportStateLoadSabhaReports implements _ReportStateLoadSabhaReports {
  const _$_ReportStateLoadSabhaReports(this.reportModel, this.loadingStatus);

  @override
  final ReportModel? reportModel;
  @override
  final LoadingStatus loadingStatus;

  @override
  String toString() {
    return 'SabhaReportState.loadSabhaReports(reportModel: $reportModel, loadingStatus: $loadingStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReportStateLoadSabhaReports &&
            const DeepCollectionEquality()
                .equals(other.reportModel, reportModel) &&
            const DeepCollectionEquality()
                .equals(other.loadingStatus, loadingStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(reportModel),
      const DeepCollectionEquality().hash(loadingStatus));

  @JsonKey(ignore: true)
  @override
  _$$_ReportStateLoadSabhaReportsCopyWith<_$_ReportStateLoadSabhaReports>
      get copyWith => __$$_ReportStateLoadSabhaReportsCopyWithImpl<
          _$_ReportStateLoadSabhaReports>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoadingStatus loadingStatus) empty,
    required TResult Function(
            ReportModel? reportModel, LoadingStatus loadingStatus)
        loadSabhaReports,
  }) {
    return loadSabhaReports(reportModel, loadingStatus);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(LoadingStatus loadingStatus)? empty,
    TResult Function(ReportModel? reportModel, LoadingStatus loadingStatus)?
        loadSabhaReports,
  }) {
    return loadSabhaReports?.call(reportModel, loadingStatus);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoadingStatus loadingStatus)? empty,
    TResult Function(ReportModel? reportModel, LoadingStatus loadingStatus)?
        loadSabhaReports,
    required TResult orElse(),
  }) {
    if (loadSabhaReports != null) {
      return loadSabhaReports(reportModel, loadingStatus);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SabhaReportEmpty value) empty,
    required TResult Function(_ReportStateLoadSabhaReports value)
        loadSabhaReports,
  }) {
    return loadSabhaReports(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SabhaReportEmpty value)? empty,
    TResult Function(_ReportStateLoadSabhaReports value)? loadSabhaReports,
  }) {
    return loadSabhaReports?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SabhaReportEmpty value)? empty,
    TResult Function(_ReportStateLoadSabhaReports value)? loadSabhaReports,
    required TResult orElse(),
  }) {
    if (loadSabhaReports != null) {
      return loadSabhaReports(this);
    }
    return orElse();
  }
}

abstract class _ReportStateLoadSabhaReports implements SabhaReportState {
  const factory _ReportStateLoadSabhaReports(
          final ReportModel? reportModel, final LoadingStatus loadingStatus) =
      _$_ReportStateLoadSabhaReports;

  ReportModel? get reportModel => throw _privateConstructorUsedError;
  @override
  LoadingStatus get loadingStatus => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ReportStateLoadSabhaReportsCopyWith<_$_ReportStateLoadSabhaReports>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SabhaReportEvent {
  BuildContext get context => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;
  int get is_filter => throw _privateConstructorUsedError;
  String get selected_region => throw _privateConstructorUsedError;
  String get selected_center => throw _privateConstructorUsedError;
  String get selected_wing => throw _privateConstructorUsedError;
  String get sabha_year => throw _privateConstructorUsedError;
  String get sabha_week => throw _privateConstructorUsedError;
  String get report_status => throw _privateConstructorUsedError;
  String get generic_search => throw _privateConstructorUsedError;
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
            String sabha_year,
            String sabha_week,
            String report_status,
            String generic_search)
        loadSabhaReports,
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
            String sabha_year,
            String sabha_week,
            String report_status,
            String generic_search)?
        loadSabhaReports,
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
            String sabha_year,
            String sabha_week,
            String report_status,
            String generic_search)?
        loadSabhaReports,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_loadSabhaReports value) loadSabhaReports,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_loadSabhaReports value)? loadSabhaReports,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_loadSabhaReports value)? loadSabhaReports,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SabhaReportEventCopyWith<SabhaReportEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SabhaReportEventCopyWith<$Res> {
  factory $SabhaReportEventCopyWith(
          SabhaReportEvent value, $Res Function(SabhaReportEvent) then) =
      _$SabhaReportEventCopyWithImpl<$Res>;
  $Res call(
      {BuildContext context,
      int page,
      int limit,
      int is_filter,
      String selected_region,
      String selected_center,
      String selected_wing,
      String sabha_year,
      String sabha_week,
      String report_status,
      String generic_search});
}

/// @nodoc
class _$SabhaReportEventCopyWithImpl<$Res>
    implements $SabhaReportEventCopyWith<$Res> {
  _$SabhaReportEventCopyWithImpl(this._value, this._then);

  final SabhaReportEvent _value;
  // ignore: unused_field
  final $Res Function(SabhaReportEvent) _then;

  @override
  $Res call({
    Object? context = freezed,
    Object? page = freezed,
    Object? limit = freezed,
    Object? is_filter = freezed,
    Object? selected_region = freezed,
    Object? selected_center = freezed,
    Object? selected_wing = freezed,
    Object? sabha_year = freezed,
    Object? sabha_week = freezed,
    Object? report_status = freezed,
    Object? generic_search = freezed,
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
      sabha_year: sabha_year == freezed
          ? _value.sabha_year
          : sabha_year // ignore: cast_nullable_to_non_nullable
              as String,
      sabha_week: sabha_week == freezed
          ? _value.sabha_week
          : sabha_week // ignore: cast_nullable_to_non_nullable
              as String,
      report_status: report_status == freezed
          ? _value.report_status
          : report_status // ignore: cast_nullable_to_non_nullable
              as String,
      generic_search: generic_search == freezed
          ? _value.generic_search
          : generic_search // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_loadSabhaReportsCopyWith<$Res>
    implements $SabhaReportEventCopyWith<$Res> {
  factory _$$_loadSabhaReportsCopyWith(
          _$_loadSabhaReports value, $Res Function(_$_loadSabhaReports) then) =
      __$$_loadSabhaReportsCopyWithImpl<$Res>;
  @override
  $Res call(
      {BuildContext context,
      int page,
      int limit,
      int is_filter,
      String selected_region,
      String selected_center,
      String selected_wing,
      String sabha_year,
      String sabha_week,
      String report_status,
      String generic_search});
}

/// @nodoc
class __$$_loadSabhaReportsCopyWithImpl<$Res>
    extends _$SabhaReportEventCopyWithImpl<$Res>
    implements _$$_loadSabhaReportsCopyWith<$Res> {
  __$$_loadSabhaReportsCopyWithImpl(
      _$_loadSabhaReports _value, $Res Function(_$_loadSabhaReports) _then)
      : super(_value, (v) => _then(v as _$_loadSabhaReports));

  @override
  _$_loadSabhaReports get _value => super._value as _$_loadSabhaReports;

  @override
  $Res call({
    Object? context = freezed,
    Object? page = freezed,
    Object? limit = freezed,
    Object? is_filter = freezed,
    Object? selected_region = freezed,
    Object? selected_center = freezed,
    Object? selected_wing = freezed,
    Object? sabha_year = freezed,
    Object? sabha_week = freezed,
    Object? report_status = freezed,
    Object? generic_search = freezed,
  }) {
    return _then(_$_loadSabhaReports(
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
      sabha_year == freezed
          ? _value.sabha_year
          : sabha_year // ignore: cast_nullable_to_non_nullable
              as String,
      sabha_week == freezed
          ? _value.sabha_week
          : sabha_week // ignore: cast_nullable_to_non_nullable
              as String,
      report_status == freezed
          ? _value.report_status
          : report_status // ignore: cast_nullable_to_non_nullable
              as String,
      generic_search == freezed
          ? _value.generic_search
          : generic_search // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_loadSabhaReports implements _loadSabhaReports {
  const _$_loadSabhaReports(
      this.context,
      this.page,
      this.limit,
      this.is_filter,
      this.selected_region,
      this.selected_center,
      this.selected_wing,
      this.sabha_year,
      this.sabha_week,
      this.report_status,
      this.generic_search);

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
  final String sabha_year;
  @override
  final String sabha_week;
  @override
  final String report_status;
  @override
  final String generic_search;

  @override
  String toString() {
    return 'SabhaReportEvent.loadSabhaReports(context: $context, page: $page, limit: $limit, is_filter: $is_filter, selected_region: $selected_region, selected_center: $selected_center, selected_wing: $selected_wing, sabha_year: $sabha_year, sabha_week: $sabha_week, report_status: $report_status, generic_search: $generic_search)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_loadSabhaReports &&
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
                .equals(other.sabha_year, sabha_year) &&
            const DeepCollectionEquality()
                .equals(other.sabha_week, sabha_week) &&
            const DeepCollectionEquality()
                .equals(other.report_status, report_status) &&
            const DeepCollectionEquality()
                .equals(other.generic_search, generic_search));
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
      const DeepCollectionEquality().hash(sabha_year),
      const DeepCollectionEquality().hash(sabha_week),
      const DeepCollectionEquality().hash(report_status),
      const DeepCollectionEquality().hash(generic_search));

  @JsonKey(ignore: true)
  @override
  _$$_loadSabhaReportsCopyWith<_$_loadSabhaReports> get copyWith =>
      __$$_loadSabhaReportsCopyWithImpl<_$_loadSabhaReports>(this, _$identity);

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
            String sabha_year,
            String sabha_week,
            String report_status,
            String generic_search)
        loadSabhaReports,
  }) {
    return loadSabhaReports(
        context,
        page,
        limit,
        is_filter,
        selected_region,
        selected_center,
        selected_wing,
        sabha_year,
        sabha_week,
        report_status,
        generic_search);
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
            String sabha_year,
            String sabha_week,
            String report_status,
            String generic_search)?
        loadSabhaReports,
  }) {
    return loadSabhaReports?.call(
        context,
        page,
        limit,
        is_filter,
        selected_region,
        selected_center,
        selected_wing,
        sabha_year,
        sabha_week,
        report_status,
        generic_search);
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
            String sabha_year,
            String sabha_week,
            String report_status,
            String generic_search)?
        loadSabhaReports,
    required TResult orElse(),
  }) {
    if (loadSabhaReports != null) {
      return loadSabhaReports(
          context,
          page,
          limit,
          is_filter,
          selected_region,
          selected_center,
          selected_wing,
          sabha_year,
          sabha_week,
          report_status,
          generic_search);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_loadSabhaReports value) loadSabhaReports,
  }) {
    return loadSabhaReports(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_loadSabhaReports value)? loadSabhaReports,
  }) {
    return loadSabhaReports?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_loadSabhaReports value)? loadSabhaReports,
    required TResult orElse(),
  }) {
    if (loadSabhaReports != null) {
      return loadSabhaReports(this);
    }
    return orElse();
  }
}

abstract class _loadSabhaReports implements SabhaReportEvent {
  const factory _loadSabhaReports(
      final BuildContext context,
      final int page,
      final int limit,
      final int is_filter,
      final String selected_region,
      final String selected_center,
      final String selected_wing,
      final String sabha_year,
      final String sabha_week,
      final String report_status,
      final String generic_search) = _$_loadSabhaReports;

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
  String get sabha_year => throw _privateConstructorUsedError;
  @override
  String get sabha_week => throw _privateConstructorUsedError;
  @override
  String get report_status => throw _privateConstructorUsedError;
  @override
  String get generic_search => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_loadSabhaReportsCopyWith<_$_loadSabhaReports> get copyWith =>
      throw _privateConstructorUsedError;
}
