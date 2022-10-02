// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'networking_report_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NetworkingReportState {
  LoadingStatus get loadingStatus => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoadingStatus loadingStatus) empty,
    required TResult Function(NetworkingReportModel? networkingReportModel,
            LoadingStatus loadingStatus)
        loadNetworkingReports,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(LoadingStatus loadingStatus)? empty,
    TResult Function(NetworkingReportModel? networkingReportModel,
            LoadingStatus loadingStatus)?
        loadNetworkingReports,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoadingStatus loadingStatus)? empty,
    TResult Function(NetworkingReportModel? networkingReportModel,
            LoadingStatus loadingStatus)?
        loadNetworkingReports,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NetworkingReportEmpty value) empty,
    required TResult Function(_ReportStateLoadNetworkingReports value)
        loadNetworkingReports,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_NetworkingReportEmpty value)? empty,
    TResult Function(_ReportStateLoadNetworkingReports value)?
        loadNetworkingReports,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NetworkingReportEmpty value)? empty,
    TResult Function(_ReportStateLoadNetworkingReports value)?
        loadNetworkingReports,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NetworkingReportStateCopyWith<NetworkingReportState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NetworkingReportStateCopyWith<$Res> {
  factory $NetworkingReportStateCopyWith(NetworkingReportState value,
          $Res Function(NetworkingReportState) then) =
      _$NetworkingReportStateCopyWithImpl<$Res>;
  $Res call({LoadingStatus loadingStatus});
}

/// @nodoc
class _$NetworkingReportStateCopyWithImpl<$Res>
    implements $NetworkingReportStateCopyWith<$Res> {
  _$NetworkingReportStateCopyWithImpl(this._value, this._then);

  final NetworkingReportState _value;
  // ignore: unused_field
  final $Res Function(NetworkingReportState) _then;

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
abstract class _$$_NetworkingReportEmptyCopyWith<$Res>
    implements $NetworkingReportStateCopyWith<$Res> {
  factory _$$_NetworkingReportEmptyCopyWith(_$_NetworkingReportEmpty value,
          $Res Function(_$_NetworkingReportEmpty) then) =
      __$$_NetworkingReportEmptyCopyWithImpl<$Res>;
  @override
  $Res call({LoadingStatus loadingStatus});
}

/// @nodoc
class __$$_NetworkingReportEmptyCopyWithImpl<$Res>
    extends _$NetworkingReportStateCopyWithImpl<$Res>
    implements _$$_NetworkingReportEmptyCopyWith<$Res> {
  __$$_NetworkingReportEmptyCopyWithImpl(_$_NetworkingReportEmpty _value,
      $Res Function(_$_NetworkingReportEmpty) _then)
      : super(_value, (v) => _then(v as _$_NetworkingReportEmpty));

  @override
  _$_NetworkingReportEmpty get _value =>
      super._value as _$_NetworkingReportEmpty;

  @override
  $Res call({
    Object? loadingStatus = freezed,
  }) {
    return _then(_$_NetworkingReportEmpty(
      loadingStatus == freezed
          ? _value.loadingStatus
          : loadingStatus // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
    ));
  }
}

/// @nodoc

class _$_NetworkingReportEmpty implements _NetworkingReportEmpty {
  const _$_NetworkingReportEmpty(this.loadingStatus);

  @override
  final LoadingStatus loadingStatus;

  @override
  String toString() {
    return 'NetworkingReportState.empty(loadingStatus: $loadingStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NetworkingReportEmpty &&
            const DeepCollectionEquality()
                .equals(other.loadingStatus, loadingStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(loadingStatus));

  @JsonKey(ignore: true)
  @override
  _$$_NetworkingReportEmptyCopyWith<_$_NetworkingReportEmpty> get copyWith =>
      __$$_NetworkingReportEmptyCopyWithImpl<_$_NetworkingReportEmpty>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoadingStatus loadingStatus) empty,
    required TResult Function(NetworkingReportModel? networkingReportModel,
            LoadingStatus loadingStatus)
        loadNetworkingReports,
  }) {
    return empty(loadingStatus);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(LoadingStatus loadingStatus)? empty,
    TResult Function(NetworkingReportModel? networkingReportModel,
            LoadingStatus loadingStatus)?
        loadNetworkingReports,
  }) {
    return empty?.call(loadingStatus);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoadingStatus loadingStatus)? empty,
    TResult Function(NetworkingReportModel? networkingReportModel,
            LoadingStatus loadingStatus)?
        loadNetworkingReports,
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
    required TResult Function(_NetworkingReportEmpty value) empty,
    required TResult Function(_ReportStateLoadNetworkingReports value)
        loadNetworkingReports,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_NetworkingReportEmpty value)? empty,
    TResult Function(_ReportStateLoadNetworkingReports value)?
        loadNetworkingReports,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NetworkingReportEmpty value)? empty,
    TResult Function(_ReportStateLoadNetworkingReports value)?
        loadNetworkingReports,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class _NetworkingReportEmpty implements NetworkingReportState {
  const factory _NetworkingReportEmpty(final LoadingStatus loadingStatus) =
      _$_NetworkingReportEmpty;

  @override
  LoadingStatus get loadingStatus => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_NetworkingReportEmptyCopyWith<_$_NetworkingReportEmpty> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ReportStateLoadNetworkingReportsCopyWith<$Res>
    implements $NetworkingReportStateCopyWith<$Res> {
  factory _$$_ReportStateLoadNetworkingReportsCopyWith(
          _$_ReportStateLoadNetworkingReports value,
          $Res Function(_$_ReportStateLoadNetworkingReports) then) =
      __$$_ReportStateLoadNetworkingReportsCopyWithImpl<$Res>;
  @override
  $Res call(
      {NetworkingReportModel? networkingReportModel,
      LoadingStatus loadingStatus});
}

/// @nodoc
class __$$_ReportStateLoadNetworkingReportsCopyWithImpl<$Res>
    extends _$NetworkingReportStateCopyWithImpl<$Res>
    implements _$$_ReportStateLoadNetworkingReportsCopyWith<$Res> {
  __$$_ReportStateLoadNetworkingReportsCopyWithImpl(
      _$_ReportStateLoadNetworkingReports _value,
      $Res Function(_$_ReportStateLoadNetworkingReports) _then)
      : super(_value, (v) => _then(v as _$_ReportStateLoadNetworkingReports));

  @override
  _$_ReportStateLoadNetworkingReports get _value =>
      super._value as _$_ReportStateLoadNetworkingReports;

  @override
  $Res call({
    Object? networkingReportModel = freezed,
    Object? loadingStatus = freezed,
  }) {
    return _then(_$_ReportStateLoadNetworkingReports(
      networkingReportModel == freezed
          ? _value.networkingReportModel
          : networkingReportModel // ignore: cast_nullable_to_non_nullable
              as NetworkingReportModel?,
      loadingStatus == freezed
          ? _value.loadingStatus
          : loadingStatus // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
    ));
  }
}

/// @nodoc

class _$_ReportStateLoadNetworkingReports
    implements _ReportStateLoadNetworkingReports {
  const _$_ReportStateLoadNetworkingReports(
      this.networkingReportModel, this.loadingStatus);

  @override
  final NetworkingReportModel? networkingReportModel;
  @override
  final LoadingStatus loadingStatus;

  @override
  String toString() {
    return 'NetworkingReportState.loadNetworkingReports(networkingReportModel: $networkingReportModel, loadingStatus: $loadingStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReportStateLoadNetworkingReports &&
            const DeepCollectionEquality()
                .equals(other.networkingReportModel, networkingReportModel) &&
            const DeepCollectionEquality()
                .equals(other.loadingStatus, loadingStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(networkingReportModel),
      const DeepCollectionEquality().hash(loadingStatus));

  @JsonKey(ignore: true)
  @override
  _$$_ReportStateLoadNetworkingReportsCopyWith<
          _$_ReportStateLoadNetworkingReports>
      get copyWith => __$$_ReportStateLoadNetworkingReportsCopyWithImpl<
          _$_ReportStateLoadNetworkingReports>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoadingStatus loadingStatus) empty,
    required TResult Function(NetworkingReportModel? networkingReportModel,
            LoadingStatus loadingStatus)
        loadNetworkingReports,
  }) {
    return loadNetworkingReports(networkingReportModel, loadingStatus);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(LoadingStatus loadingStatus)? empty,
    TResult Function(NetworkingReportModel? networkingReportModel,
            LoadingStatus loadingStatus)?
        loadNetworkingReports,
  }) {
    return loadNetworkingReports?.call(networkingReportModel, loadingStatus);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoadingStatus loadingStatus)? empty,
    TResult Function(NetworkingReportModel? networkingReportModel,
            LoadingStatus loadingStatus)?
        loadNetworkingReports,
    required TResult orElse(),
  }) {
    if (loadNetworkingReports != null) {
      return loadNetworkingReports(networkingReportModel, loadingStatus);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NetworkingReportEmpty value) empty,
    required TResult Function(_ReportStateLoadNetworkingReports value)
        loadNetworkingReports,
  }) {
    return loadNetworkingReports(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_NetworkingReportEmpty value)? empty,
    TResult Function(_ReportStateLoadNetworkingReports value)?
        loadNetworkingReports,
  }) {
    return loadNetworkingReports?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NetworkingReportEmpty value)? empty,
    TResult Function(_ReportStateLoadNetworkingReports value)?
        loadNetworkingReports,
    required TResult orElse(),
  }) {
    if (loadNetworkingReports != null) {
      return loadNetworkingReports(this);
    }
    return orElse();
  }
}

abstract class _ReportStateLoadNetworkingReports
    implements NetworkingReportState {
  const factory _ReportStateLoadNetworkingReports(
      final NetworkingReportModel? networkingReportModel,
      final LoadingStatus loadingStatus) = _$_ReportStateLoadNetworkingReports;

  NetworkingReportModel? get networkingReportModel =>
      throw _privateConstructorUsedError;
  @override
  LoadingStatus get loadingStatus => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ReportStateLoadNetworkingReportsCopyWith<
          _$_ReportStateLoadNetworkingReports>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$NetworkingReportEvent {
  BuildContext get context => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;
  String get strNWRKSelectedRegion => throw _privateConstructorUsedError;
  String get strNWRKSelectedCenter => throw _privateConstructorUsedError;
  String get strSelectedReportingYear => throw _privateConstructorUsedError;
  String get generic_search => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            BuildContext context,
            int page,
            int limit,
            String strNWRKSelectedRegion,
            String strNWRKSelectedCenter,
            String strSelectedReportingYear,
            String generic_search)
        loadNetworkingReports,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            BuildContext context,
            int page,
            int limit,
            String strNWRKSelectedRegion,
            String strNWRKSelectedCenter,
            String strSelectedReportingYear,
            String generic_search)?
        loadNetworkingReports,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            BuildContext context,
            int page,
            int limit,
            String strNWRKSelectedRegion,
            String strNWRKSelectedCenter,
            String strSelectedReportingYear,
            String generic_search)?
        loadNetworkingReports,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_loadNetworkingReports value)
        loadNetworkingReports,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_loadNetworkingReports value)? loadNetworkingReports,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_loadNetworkingReports value)? loadNetworkingReports,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NetworkingReportEventCopyWith<NetworkingReportEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NetworkingReportEventCopyWith<$Res> {
  factory $NetworkingReportEventCopyWith(NetworkingReportEvent value,
          $Res Function(NetworkingReportEvent) then) =
      _$NetworkingReportEventCopyWithImpl<$Res>;
  $Res call(
      {BuildContext context,
      int page,
      int limit,
      String strNWRKSelectedRegion,
      String strNWRKSelectedCenter,
      String strSelectedReportingYear,
      String generic_search});
}

/// @nodoc
class _$NetworkingReportEventCopyWithImpl<$Res>
    implements $NetworkingReportEventCopyWith<$Res> {
  _$NetworkingReportEventCopyWithImpl(this._value, this._then);

  final NetworkingReportEvent _value;
  // ignore: unused_field
  final $Res Function(NetworkingReportEvent) _then;

  @override
  $Res call({
    Object? context = freezed,
    Object? page = freezed,
    Object? limit = freezed,
    Object? strNWRKSelectedRegion = freezed,
    Object? strNWRKSelectedCenter = freezed,
    Object? strSelectedReportingYear = freezed,
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
      strNWRKSelectedRegion: strNWRKSelectedRegion == freezed
          ? _value.strNWRKSelectedRegion
          : strNWRKSelectedRegion // ignore: cast_nullable_to_non_nullable
              as String,
      strNWRKSelectedCenter: strNWRKSelectedCenter == freezed
          ? _value.strNWRKSelectedCenter
          : strNWRKSelectedCenter // ignore: cast_nullable_to_non_nullable
              as String,
      strSelectedReportingYear: strSelectedReportingYear == freezed
          ? _value.strSelectedReportingYear
          : strSelectedReportingYear // ignore: cast_nullable_to_non_nullable
              as String,
      generic_search: generic_search == freezed
          ? _value.generic_search
          : generic_search // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_loadNetworkingReportsCopyWith<$Res>
    implements $NetworkingReportEventCopyWith<$Res> {
  factory _$$_loadNetworkingReportsCopyWith(_$_loadNetworkingReports value,
          $Res Function(_$_loadNetworkingReports) then) =
      __$$_loadNetworkingReportsCopyWithImpl<$Res>;
  @override
  $Res call(
      {BuildContext context,
      int page,
      int limit,
      String strNWRKSelectedRegion,
      String strNWRKSelectedCenter,
      String strSelectedReportingYear,
      String generic_search});
}

/// @nodoc
class __$$_loadNetworkingReportsCopyWithImpl<$Res>
    extends _$NetworkingReportEventCopyWithImpl<$Res>
    implements _$$_loadNetworkingReportsCopyWith<$Res> {
  __$$_loadNetworkingReportsCopyWithImpl(_$_loadNetworkingReports _value,
      $Res Function(_$_loadNetworkingReports) _then)
      : super(_value, (v) => _then(v as _$_loadNetworkingReports));

  @override
  _$_loadNetworkingReports get _value =>
      super._value as _$_loadNetworkingReports;

  @override
  $Res call({
    Object? context = freezed,
    Object? page = freezed,
    Object? limit = freezed,
    Object? strNWRKSelectedRegion = freezed,
    Object? strNWRKSelectedCenter = freezed,
    Object? strSelectedReportingYear = freezed,
    Object? generic_search = freezed,
  }) {
    return _then(_$_loadNetworkingReports(
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
      strNWRKSelectedRegion == freezed
          ? _value.strNWRKSelectedRegion
          : strNWRKSelectedRegion // ignore: cast_nullable_to_non_nullable
              as String,
      strNWRKSelectedCenter == freezed
          ? _value.strNWRKSelectedCenter
          : strNWRKSelectedCenter // ignore: cast_nullable_to_non_nullable
              as String,
      strSelectedReportingYear == freezed
          ? _value.strSelectedReportingYear
          : strSelectedReportingYear // ignore: cast_nullable_to_non_nullable
              as String,
      generic_search == freezed
          ? _value.generic_search
          : generic_search // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_loadNetworkingReports implements _loadNetworkingReports {
  const _$_loadNetworkingReports(
      this.context,
      this.page,
      this.limit,
      this.strNWRKSelectedRegion,
      this.strNWRKSelectedCenter,
      this.strSelectedReportingYear,
      this.generic_search);

  @override
  final BuildContext context;
  @override
  final int page;
  @override
  final int limit;
  @override
  final String strNWRKSelectedRegion;
  @override
  final String strNWRKSelectedCenter;
  @override
  final String strSelectedReportingYear;
  @override
  final String generic_search;

  @override
  String toString() {
    return 'NetworkingReportEvent.loadNetworkingReports(context: $context, page: $page, limit: $limit, strNWRKSelectedRegion: $strNWRKSelectedRegion, strNWRKSelectedCenter: $strNWRKSelectedCenter, strSelectedReportingYear: $strSelectedReportingYear, generic_search: $generic_search)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_loadNetworkingReports &&
            const DeepCollectionEquality().equals(other.context, context) &&
            const DeepCollectionEquality().equals(other.page, page) &&
            const DeepCollectionEquality().equals(other.limit, limit) &&
            const DeepCollectionEquality()
                .equals(other.strNWRKSelectedRegion, strNWRKSelectedRegion) &&
            const DeepCollectionEquality()
                .equals(other.strNWRKSelectedCenter, strNWRKSelectedCenter) &&
            const DeepCollectionEquality().equals(
                other.strSelectedReportingYear, strSelectedReportingYear) &&
            const DeepCollectionEquality()
                .equals(other.generic_search, generic_search));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(context),
      const DeepCollectionEquality().hash(page),
      const DeepCollectionEquality().hash(limit),
      const DeepCollectionEquality().hash(strNWRKSelectedRegion),
      const DeepCollectionEquality().hash(strNWRKSelectedCenter),
      const DeepCollectionEquality().hash(strSelectedReportingYear),
      const DeepCollectionEquality().hash(generic_search));

  @JsonKey(ignore: true)
  @override
  _$$_loadNetworkingReportsCopyWith<_$_loadNetworkingReports> get copyWith =>
      __$$_loadNetworkingReportsCopyWithImpl<_$_loadNetworkingReports>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            BuildContext context,
            int page,
            int limit,
            String strNWRKSelectedRegion,
            String strNWRKSelectedCenter,
            String strSelectedReportingYear,
            String generic_search)
        loadNetworkingReports,
  }) {
    return loadNetworkingReports(context, page, limit, strNWRKSelectedRegion,
        strNWRKSelectedCenter, strSelectedReportingYear, generic_search);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            BuildContext context,
            int page,
            int limit,
            String strNWRKSelectedRegion,
            String strNWRKSelectedCenter,
            String strSelectedReportingYear,
            String generic_search)?
        loadNetworkingReports,
  }) {
    return loadNetworkingReports?.call(
        context,
        page,
        limit,
        strNWRKSelectedRegion,
        strNWRKSelectedCenter,
        strSelectedReportingYear,
        generic_search);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            BuildContext context,
            int page,
            int limit,
            String strNWRKSelectedRegion,
            String strNWRKSelectedCenter,
            String strSelectedReportingYear,
            String generic_search)?
        loadNetworkingReports,
    required TResult orElse(),
  }) {
    if (loadNetworkingReports != null) {
      return loadNetworkingReports(context, page, limit, strNWRKSelectedRegion,
          strNWRKSelectedCenter, strSelectedReportingYear, generic_search);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_loadNetworkingReports value)
        loadNetworkingReports,
  }) {
    return loadNetworkingReports(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_loadNetworkingReports value)? loadNetworkingReports,
  }) {
    return loadNetworkingReports?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_loadNetworkingReports value)? loadNetworkingReports,
    required TResult orElse(),
  }) {
    if (loadNetworkingReports != null) {
      return loadNetworkingReports(this);
    }
    return orElse();
  }
}

abstract class _loadNetworkingReports implements NetworkingReportEvent {
  const factory _loadNetworkingReports(
      final BuildContext context,
      final int page,
      final int limit,
      final String strNWRKSelectedRegion,
      final String strNWRKSelectedCenter,
      final String strSelectedReportingYear,
      final String generic_search) = _$_loadNetworkingReports;

  @override
  BuildContext get context => throw _privateConstructorUsedError;
  @override
  int get page => throw _privateConstructorUsedError;
  @override
  int get limit => throw _privateConstructorUsedError;
  @override
  String get strNWRKSelectedRegion => throw _privateConstructorUsedError;
  @override
  String get strNWRKSelectedCenter => throw _privateConstructorUsedError;
  @override
  String get strSelectedReportingYear => throw _privateConstructorUsedError;
  @override
  String get generic_search => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_loadNetworkingReportsCopyWith<_$_loadNetworkingReports> get copyWith =>
      throw _privateConstructorUsedError;
}
