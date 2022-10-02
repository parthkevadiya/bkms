// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'kst_report_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$KstReportState {
  LoadingStatus get loadingStatus => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoadingStatus loadingStatus) empty,
    required TResult Function(
            KSTReportModel? kstReportModel, LoadingStatus loadingStatus)
        loadKSTReports,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(LoadingStatus loadingStatus)? empty,
    TResult Function(
            KSTReportModel? kstReportModel, LoadingStatus loadingStatus)?
        loadKSTReports,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoadingStatus loadingStatus)? empty,
    TResult Function(
            KSTReportModel? kstReportModel, LoadingStatus loadingStatus)?
        loadKSTReports,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_KstReportEmpty value) empty,
    required TResult Function(_ReportStateLoadKSTReports value) loadKSTReports,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_KstReportEmpty value)? empty,
    TResult Function(_ReportStateLoadKSTReports value)? loadKSTReports,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_KstReportEmpty value)? empty,
    TResult Function(_ReportStateLoadKSTReports value)? loadKSTReports,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $KstReportStateCopyWith<KstReportState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KstReportStateCopyWith<$Res> {
  factory $KstReportStateCopyWith(
          KstReportState value, $Res Function(KstReportState) then) =
      _$KstReportStateCopyWithImpl<$Res>;
  $Res call({LoadingStatus loadingStatus});
}

/// @nodoc
class _$KstReportStateCopyWithImpl<$Res>
    implements $KstReportStateCopyWith<$Res> {
  _$KstReportStateCopyWithImpl(this._value, this._then);

  final KstReportState _value;
  // ignore: unused_field
  final $Res Function(KstReportState) _then;

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
abstract class _$$_KstReportEmptyCopyWith<$Res>
    implements $KstReportStateCopyWith<$Res> {
  factory _$$_KstReportEmptyCopyWith(
          _$_KstReportEmpty value, $Res Function(_$_KstReportEmpty) then) =
      __$$_KstReportEmptyCopyWithImpl<$Res>;
  @override
  $Res call({LoadingStatus loadingStatus});
}

/// @nodoc
class __$$_KstReportEmptyCopyWithImpl<$Res>
    extends _$KstReportStateCopyWithImpl<$Res>
    implements _$$_KstReportEmptyCopyWith<$Res> {
  __$$_KstReportEmptyCopyWithImpl(
      _$_KstReportEmpty _value, $Res Function(_$_KstReportEmpty) _then)
      : super(_value, (v) => _then(v as _$_KstReportEmpty));

  @override
  _$_KstReportEmpty get _value => super._value as _$_KstReportEmpty;

  @override
  $Res call({
    Object? loadingStatus = freezed,
  }) {
    return _then(_$_KstReportEmpty(
      loadingStatus == freezed
          ? _value.loadingStatus
          : loadingStatus // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
    ));
  }
}

/// @nodoc

class _$_KstReportEmpty implements _KstReportEmpty {
  const _$_KstReportEmpty(this.loadingStatus);

  @override
  final LoadingStatus loadingStatus;

  @override
  String toString() {
    return 'KstReportState.empty(loadingStatus: $loadingStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_KstReportEmpty &&
            const DeepCollectionEquality()
                .equals(other.loadingStatus, loadingStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(loadingStatus));

  @JsonKey(ignore: true)
  @override
  _$$_KstReportEmptyCopyWith<_$_KstReportEmpty> get copyWith =>
      __$$_KstReportEmptyCopyWithImpl<_$_KstReportEmpty>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoadingStatus loadingStatus) empty,
    required TResult Function(
            KSTReportModel? kstReportModel, LoadingStatus loadingStatus)
        loadKSTReports,
  }) {
    return empty(loadingStatus);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(LoadingStatus loadingStatus)? empty,
    TResult Function(
            KSTReportModel? kstReportModel, LoadingStatus loadingStatus)?
        loadKSTReports,
  }) {
    return empty?.call(loadingStatus);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoadingStatus loadingStatus)? empty,
    TResult Function(
            KSTReportModel? kstReportModel, LoadingStatus loadingStatus)?
        loadKSTReports,
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
    required TResult Function(_KstReportEmpty value) empty,
    required TResult Function(_ReportStateLoadKSTReports value) loadKSTReports,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_KstReportEmpty value)? empty,
    TResult Function(_ReportStateLoadKSTReports value)? loadKSTReports,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_KstReportEmpty value)? empty,
    TResult Function(_ReportStateLoadKSTReports value)? loadKSTReports,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class _KstReportEmpty implements KstReportState {
  const factory _KstReportEmpty(final LoadingStatus loadingStatus) =
      _$_KstReportEmpty;

  @override
  LoadingStatus get loadingStatus => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_KstReportEmptyCopyWith<_$_KstReportEmpty> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ReportStateLoadKSTReportsCopyWith<$Res>
    implements $KstReportStateCopyWith<$Res> {
  factory _$$_ReportStateLoadKSTReportsCopyWith(
          _$_ReportStateLoadKSTReports value,
          $Res Function(_$_ReportStateLoadKSTReports) then) =
      __$$_ReportStateLoadKSTReportsCopyWithImpl<$Res>;
  @override
  $Res call({KSTReportModel? kstReportModel, LoadingStatus loadingStatus});
}

/// @nodoc
class __$$_ReportStateLoadKSTReportsCopyWithImpl<$Res>
    extends _$KstReportStateCopyWithImpl<$Res>
    implements _$$_ReportStateLoadKSTReportsCopyWith<$Res> {
  __$$_ReportStateLoadKSTReportsCopyWithImpl(
      _$_ReportStateLoadKSTReports _value,
      $Res Function(_$_ReportStateLoadKSTReports) _then)
      : super(_value, (v) => _then(v as _$_ReportStateLoadKSTReports));

  @override
  _$_ReportStateLoadKSTReports get _value =>
      super._value as _$_ReportStateLoadKSTReports;

  @override
  $Res call({
    Object? kstReportModel = freezed,
    Object? loadingStatus = freezed,
  }) {
    return _then(_$_ReportStateLoadKSTReports(
      kstReportModel == freezed
          ? _value.kstReportModel
          : kstReportModel // ignore: cast_nullable_to_non_nullable
              as KSTReportModel?,
      loadingStatus == freezed
          ? _value.loadingStatus
          : loadingStatus // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
    ));
  }
}

/// @nodoc

class _$_ReportStateLoadKSTReports implements _ReportStateLoadKSTReports {
  const _$_ReportStateLoadKSTReports(this.kstReportModel, this.loadingStatus);

  @override
  final KSTReportModel? kstReportModel;
  @override
  final LoadingStatus loadingStatus;

  @override
  String toString() {
    return 'KstReportState.loadKSTReports(kstReportModel: $kstReportModel, loadingStatus: $loadingStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReportStateLoadKSTReports &&
            const DeepCollectionEquality()
                .equals(other.kstReportModel, kstReportModel) &&
            const DeepCollectionEquality()
                .equals(other.loadingStatus, loadingStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(kstReportModel),
      const DeepCollectionEquality().hash(loadingStatus));

  @JsonKey(ignore: true)
  @override
  _$$_ReportStateLoadKSTReportsCopyWith<_$_ReportStateLoadKSTReports>
      get copyWith => __$$_ReportStateLoadKSTReportsCopyWithImpl<
          _$_ReportStateLoadKSTReports>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoadingStatus loadingStatus) empty,
    required TResult Function(
            KSTReportModel? kstReportModel, LoadingStatus loadingStatus)
        loadKSTReports,
  }) {
    return loadKSTReports(kstReportModel, loadingStatus);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(LoadingStatus loadingStatus)? empty,
    TResult Function(
            KSTReportModel? kstReportModel, LoadingStatus loadingStatus)?
        loadKSTReports,
  }) {
    return loadKSTReports?.call(kstReportModel, loadingStatus);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoadingStatus loadingStatus)? empty,
    TResult Function(
            KSTReportModel? kstReportModel, LoadingStatus loadingStatus)?
        loadKSTReports,
    required TResult orElse(),
  }) {
    if (loadKSTReports != null) {
      return loadKSTReports(kstReportModel, loadingStatus);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_KstReportEmpty value) empty,
    required TResult Function(_ReportStateLoadKSTReports value) loadKSTReports,
  }) {
    return loadKSTReports(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_KstReportEmpty value)? empty,
    TResult Function(_ReportStateLoadKSTReports value)? loadKSTReports,
  }) {
    return loadKSTReports?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_KstReportEmpty value)? empty,
    TResult Function(_ReportStateLoadKSTReports value)? loadKSTReports,
    required TResult orElse(),
  }) {
    if (loadKSTReports != null) {
      return loadKSTReports(this);
    }
    return orElse();
  }
}

abstract class _ReportStateLoadKSTReports implements KstReportState {
  const factory _ReportStateLoadKSTReports(final KSTReportModel? kstReportModel,
      final LoadingStatus loadingStatus) = _$_ReportStateLoadKSTReports;

  KSTReportModel? get kstReportModel => throw _privateConstructorUsedError;
  @override
  LoadingStatus get loadingStatus => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ReportStateLoadKSTReportsCopyWith<_$_ReportStateLoadKSTReports>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$KstReportEvent {
  BuildContext get context => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;
  int get is_filter => throw _privateConstructorUsedError;
  String get selected_wing => throw _privateConstructorUsedError;
  String get selected_center => throw _privateConstructorUsedError;
  String get selected_region => throw _privateConstructorUsedError;
  String get selected_year => throw _privateConstructorUsedError;
  String get generic_search => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            BuildContext context,
            int page,
            int limit,
            int is_filter,
            String selected_wing,
            String selected_center,
            String selected_region,
            String selected_year,
            String generic_search)
        loadKSTReports,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            BuildContext context,
            int page,
            int limit,
            int is_filter,
            String selected_wing,
            String selected_center,
            String selected_region,
            String selected_year,
            String generic_search)?
        loadKSTReports,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            BuildContext context,
            int page,
            int limit,
            int is_filter,
            String selected_wing,
            String selected_center,
            String selected_region,
            String selected_year,
            String generic_search)?
        loadKSTReports,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_loadKSTReports value) loadKSTReports,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_loadKSTReports value)? loadKSTReports,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_loadKSTReports value)? loadKSTReports,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $KstReportEventCopyWith<KstReportEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KstReportEventCopyWith<$Res> {
  factory $KstReportEventCopyWith(
          KstReportEvent value, $Res Function(KstReportEvent) then) =
      _$KstReportEventCopyWithImpl<$Res>;
  $Res call(
      {BuildContext context,
      int page,
      int limit,
      int is_filter,
      String selected_wing,
      String selected_center,
      String selected_region,
      String selected_year,
      String generic_search});
}

/// @nodoc
class _$KstReportEventCopyWithImpl<$Res>
    implements $KstReportEventCopyWith<$Res> {
  _$KstReportEventCopyWithImpl(this._value, this._then);

  final KstReportEvent _value;
  // ignore: unused_field
  final $Res Function(KstReportEvent) _then;

  @override
  $Res call({
    Object? context = freezed,
    Object? page = freezed,
    Object? limit = freezed,
    Object? is_filter = freezed,
    Object? selected_wing = freezed,
    Object? selected_center = freezed,
    Object? selected_region = freezed,
    Object? selected_year = freezed,
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
      selected_wing: selected_wing == freezed
          ? _value.selected_wing
          : selected_wing // ignore: cast_nullable_to_non_nullable
              as String,
      selected_center: selected_center == freezed
          ? _value.selected_center
          : selected_center // ignore: cast_nullable_to_non_nullable
              as String,
      selected_region: selected_region == freezed
          ? _value.selected_region
          : selected_region // ignore: cast_nullable_to_non_nullable
              as String,
      selected_year: selected_year == freezed
          ? _value.selected_year
          : selected_year // ignore: cast_nullable_to_non_nullable
              as String,
      generic_search: generic_search == freezed
          ? _value.generic_search
          : generic_search // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_loadKSTReportsCopyWith<$Res>
    implements $KstReportEventCopyWith<$Res> {
  factory _$$_loadKSTReportsCopyWith(
          _$_loadKSTReports value, $Res Function(_$_loadKSTReports) then) =
      __$$_loadKSTReportsCopyWithImpl<$Res>;
  @override
  $Res call(
      {BuildContext context,
      int page,
      int limit,
      int is_filter,
      String selected_wing,
      String selected_center,
      String selected_region,
      String selected_year,
      String generic_search});
}

/// @nodoc
class __$$_loadKSTReportsCopyWithImpl<$Res>
    extends _$KstReportEventCopyWithImpl<$Res>
    implements _$$_loadKSTReportsCopyWith<$Res> {
  __$$_loadKSTReportsCopyWithImpl(
      _$_loadKSTReports _value, $Res Function(_$_loadKSTReports) _then)
      : super(_value, (v) => _then(v as _$_loadKSTReports));

  @override
  _$_loadKSTReports get _value => super._value as _$_loadKSTReports;

  @override
  $Res call({
    Object? context = freezed,
    Object? page = freezed,
    Object? limit = freezed,
    Object? is_filter = freezed,
    Object? selected_wing = freezed,
    Object? selected_center = freezed,
    Object? selected_region = freezed,
    Object? selected_year = freezed,
    Object? generic_search = freezed,
  }) {
    return _then(_$_loadKSTReports(
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
      selected_wing == freezed
          ? _value.selected_wing
          : selected_wing // ignore: cast_nullable_to_non_nullable
              as String,
      selected_center == freezed
          ? _value.selected_center
          : selected_center // ignore: cast_nullable_to_non_nullable
              as String,
      selected_region == freezed
          ? _value.selected_region
          : selected_region // ignore: cast_nullable_to_non_nullable
              as String,
      selected_year == freezed
          ? _value.selected_year
          : selected_year // ignore: cast_nullable_to_non_nullable
              as String,
      generic_search == freezed
          ? _value.generic_search
          : generic_search // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_loadKSTReports implements _loadKSTReports {
  const _$_loadKSTReports(
      this.context,
      this.page,
      this.limit,
      this.is_filter,
      this.selected_wing,
      this.selected_center,
      this.selected_region,
      this.selected_year,
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
  final String selected_wing;
  @override
  final String selected_center;
  @override
  final String selected_region;
  @override
  final String selected_year;
  @override
  final String generic_search;

  @override
  String toString() {
    return 'KstReportEvent.loadKSTReports(context: $context, page: $page, limit: $limit, is_filter: $is_filter, selected_wing: $selected_wing, selected_center: $selected_center, selected_region: $selected_region, selected_year: $selected_year, generic_search: $generic_search)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_loadKSTReports &&
            const DeepCollectionEquality().equals(other.context, context) &&
            const DeepCollectionEquality().equals(other.page, page) &&
            const DeepCollectionEquality().equals(other.limit, limit) &&
            const DeepCollectionEquality().equals(other.is_filter, is_filter) &&
            const DeepCollectionEquality()
                .equals(other.selected_wing, selected_wing) &&
            const DeepCollectionEquality()
                .equals(other.selected_center, selected_center) &&
            const DeepCollectionEquality()
                .equals(other.selected_region, selected_region) &&
            const DeepCollectionEquality()
                .equals(other.selected_year, selected_year) &&
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
      const DeepCollectionEquality().hash(selected_wing),
      const DeepCollectionEquality().hash(selected_center),
      const DeepCollectionEquality().hash(selected_region),
      const DeepCollectionEquality().hash(selected_year),
      const DeepCollectionEquality().hash(generic_search));

  @JsonKey(ignore: true)
  @override
  _$$_loadKSTReportsCopyWith<_$_loadKSTReports> get copyWith =>
      __$$_loadKSTReportsCopyWithImpl<_$_loadKSTReports>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            BuildContext context,
            int page,
            int limit,
            int is_filter,
            String selected_wing,
            String selected_center,
            String selected_region,
            String selected_year,
            String generic_search)
        loadKSTReports,
  }) {
    return loadKSTReports(context, page, limit, is_filter, selected_wing,
        selected_center, selected_region, selected_year, generic_search);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            BuildContext context,
            int page,
            int limit,
            int is_filter,
            String selected_wing,
            String selected_center,
            String selected_region,
            String selected_year,
            String generic_search)?
        loadKSTReports,
  }) {
    return loadKSTReports?.call(context, page, limit, is_filter, selected_wing,
        selected_center, selected_region, selected_year, generic_search);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            BuildContext context,
            int page,
            int limit,
            int is_filter,
            String selected_wing,
            String selected_center,
            String selected_region,
            String selected_year,
            String generic_search)?
        loadKSTReports,
    required TResult orElse(),
  }) {
    if (loadKSTReports != null) {
      return loadKSTReports(context, page, limit, is_filter, selected_wing,
          selected_center, selected_region, selected_year, generic_search);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_loadKSTReports value) loadKSTReports,
  }) {
    return loadKSTReports(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_loadKSTReports value)? loadKSTReports,
  }) {
    return loadKSTReports?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_loadKSTReports value)? loadKSTReports,
    required TResult orElse(),
  }) {
    if (loadKSTReports != null) {
      return loadKSTReports(this);
    }
    return orElse();
  }
}

abstract class _loadKSTReports implements KstReportEvent {
  const factory _loadKSTReports(
      final BuildContext context,
      final int page,
      final int limit,
      final int is_filter,
      final String selected_wing,
      final String selected_center,
      final String selected_region,
      final String selected_year,
      final String generic_search) = _$_loadKSTReports;

  @override
  BuildContext get context => throw _privateConstructorUsedError;
  @override
  int get page => throw _privateConstructorUsedError;
  @override
  int get limit => throw _privateConstructorUsedError;
  @override
  int get is_filter => throw _privateConstructorUsedError;
  @override
  String get selected_wing => throw _privateConstructorUsedError;
  @override
  String get selected_center => throw _privateConstructorUsedError;
  @override
  String get selected_region => throw _privateConstructorUsedError;
  @override
  String get selected_year => throw _privateConstructorUsedError;
  @override
  String get generic_search => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_loadKSTReportsCopyWith<_$_loadKSTReports> get copyWith =>
      throw _privateConstructorUsedError;
}
