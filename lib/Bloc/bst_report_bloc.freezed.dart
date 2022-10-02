// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'bst_report_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BSTReportState {
  LoadingStatus get loadingStatus => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoadingStatus loadingStatus) empty,
    required TResult Function(
            BSTReportModel? bstReportModel, LoadingStatus loadingStatus)
        loadBSTReports,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(LoadingStatus loadingStatus)? empty,
    TResult Function(
            BSTReportModel? bstReportModel, LoadingStatus loadingStatus)?
        loadBSTReports,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoadingStatus loadingStatus)? empty,
    TResult Function(
            BSTReportModel? bstReportModel, LoadingStatus loadingStatus)?
        loadBSTReports,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_BSTReportEmpty value) empty,
    required TResult Function(_ReportStateLoadBSTReports value) loadBSTReports,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_BSTReportEmpty value)? empty,
    TResult Function(_ReportStateLoadBSTReports value)? loadBSTReports,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_BSTReportEmpty value)? empty,
    TResult Function(_ReportStateLoadBSTReports value)? loadBSTReports,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BSTReportStateCopyWith<BSTReportState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BSTReportStateCopyWith<$Res> {
  factory $BSTReportStateCopyWith(
          BSTReportState value, $Res Function(BSTReportState) then) =
      _$BSTReportStateCopyWithImpl<$Res>;
  $Res call({LoadingStatus loadingStatus});
}

/// @nodoc
class _$BSTReportStateCopyWithImpl<$Res>
    implements $BSTReportStateCopyWith<$Res> {
  _$BSTReportStateCopyWithImpl(this._value, this._then);

  final BSTReportState _value;
  // ignore: unused_field
  final $Res Function(BSTReportState) _then;

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
abstract class _$$_BSTReportEmptyCopyWith<$Res>
    implements $BSTReportStateCopyWith<$Res> {
  factory _$$_BSTReportEmptyCopyWith(
          _$_BSTReportEmpty value, $Res Function(_$_BSTReportEmpty) then) =
      __$$_BSTReportEmptyCopyWithImpl<$Res>;
  @override
  $Res call({LoadingStatus loadingStatus});
}

/// @nodoc
class __$$_BSTReportEmptyCopyWithImpl<$Res>
    extends _$BSTReportStateCopyWithImpl<$Res>
    implements _$$_BSTReportEmptyCopyWith<$Res> {
  __$$_BSTReportEmptyCopyWithImpl(
      _$_BSTReportEmpty _value, $Res Function(_$_BSTReportEmpty) _then)
      : super(_value, (v) => _then(v as _$_BSTReportEmpty));

  @override
  _$_BSTReportEmpty get _value => super._value as _$_BSTReportEmpty;

  @override
  $Res call({
    Object? loadingStatus = freezed,
  }) {
    return _then(_$_BSTReportEmpty(
      loadingStatus == freezed
          ? _value.loadingStatus
          : loadingStatus // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
    ));
  }
}

/// @nodoc

class _$_BSTReportEmpty implements _BSTReportEmpty {
  const _$_BSTReportEmpty(this.loadingStatus);

  @override
  final LoadingStatus loadingStatus;

  @override
  String toString() {
    return 'BSTReportState.empty(loadingStatus: $loadingStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BSTReportEmpty &&
            const DeepCollectionEquality()
                .equals(other.loadingStatus, loadingStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(loadingStatus));

  @JsonKey(ignore: true)
  @override
  _$$_BSTReportEmptyCopyWith<_$_BSTReportEmpty> get copyWith =>
      __$$_BSTReportEmptyCopyWithImpl<_$_BSTReportEmpty>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoadingStatus loadingStatus) empty,
    required TResult Function(
            BSTReportModel? bstReportModel, LoadingStatus loadingStatus)
        loadBSTReports,
  }) {
    return empty(loadingStatus);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(LoadingStatus loadingStatus)? empty,
    TResult Function(
            BSTReportModel? bstReportModel, LoadingStatus loadingStatus)?
        loadBSTReports,
  }) {
    return empty?.call(loadingStatus);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoadingStatus loadingStatus)? empty,
    TResult Function(
            BSTReportModel? bstReportModel, LoadingStatus loadingStatus)?
        loadBSTReports,
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
    required TResult Function(_BSTReportEmpty value) empty,
    required TResult Function(_ReportStateLoadBSTReports value) loadBSTReports,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_BSTReportEmpty value)? empty,
    TResult Function(_ReportStateLoadBSTReports value)? loadBSTReports,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_BSTReportEmpty value)? empty,
    TResult Function(_ReportStateLoadBSTReports value)? loadBSTReports,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class _BSTReportEmpty implements BSTReportState {
  const factory _BSTReportEmpty(final LoadingStatus loadingStatus) =
      _$_BSTReportEmpty;

  @override
  LoadingStatus get loadingStatus => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_BSTReportEmptyCopyWith<_$_BSTReportEmpty> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ReportStateLoadBSTReportsCopyWith<$Res>
    implements $BSTReportStateCopyWith<$Res> {
  factory _$$_ReportStateLoadBSTReportsCopyWith(
          _$_ReportStateLoadBSTReports value,
          $Res Function(_$_ReportStateLoadBSTReports) then) =
      __$$_ReportStateLoadBSTReportsCopyWithImpl<$Res>;
  @override
  $Res call({BSTReportModel? bstReportModel, LoadingStatus loadingStatus});
}

/// @nodoc
class __$$_ReportStateLoadBSTReportsCopyWithImpl<$Res>
    extends _$BSTReportStateCopyWithImpl<$Res>
    implements _$$_ReportStateLoadBSTReportsCopyWith<$Res> {
  __$$_ReportStateLoadBSTReportsCopyWithImpl(
      _$_ReportStateLoadBSTReports _value,
      $Res Function(_$_ReportStateLoadBSTReports) _then)
      : super(_value, (v) => _then(v as _$_ReportStateLoadBSTReports));

  @override
  _$_ReportStateLoadBSTReports get _value =>
      super._value as _$_ReportStateLoadBSTReports;

  @override
  $Res call({
    Object? bstReportModel = freezed,
    Object? loadingStatus = freezed,
  }) {
    return _then(_$_ReportStateLoadBSTReports(
      bstReportModel == freezed
          ? _value.bstReportModel
          : bstReportModel // ignore: cast_nullable_to_non_nullable
              as BSTReportModel?,
      loadingStatus == freezed
          ? _value.loadingStatus
          : loadingStatus // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
    ));
  }
}

/// @nodoc

class _$_ReportStateLoadBSTReports implements _ReportStateLoadBSTReports {
  const _$_ReportStateLoadBSTReports(this.bstReportModel, this.loadingStatus);

  @override
  final BSTReportModel? bstReportModel;
  @override
  final LoadingStatus loadingStatus;

  @override
  String toString() {
    return 'BSTReportState.loadBSTReports(bstReportModel: $bstReportModel, loadingStatus: $loadingStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReportStateLoadBSTReports &&
            const DeepCollectionEquality()
                .equals(other.bstReportModel, bstReportModel) &&
            const DeepCollectionEquality()
                .equals(other.loadingStatus, loadingStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(bstReportModel),
      const DeepCollectionEquality().hash(loadingStatus));

  @JsonKey(ignore: true)
  @override
  _$$_ReportStateLoadBSTReportsCopyWith<_$_ReportStateLoadBSTReports>
      get copyWith => __$$_ReportStateLoadBSTReportsCopyWithImpl<
          _$_ReportStateLoadBSTReports>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoadingStatus loadingStatus) empty,
    required TResult Function(
            BSTReportModel? bstReportModel, LoadingStatus loadingStatus)
        loadBSTReports,
  }) {
    return loadBSTReports(bstReportModel, loadingStatus);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(LoadingStatus loadingStatus)? empty,
    TResult Function(
            BSTReportModel? bstReportModel, LoadingStatus loadingStatus)?
        loadBSTReports,
  }) {
    return loadBSTReports?.call(bstReportModel, loadingStatus);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoadingStatus loadingStatus)? empty,
    TResult Function(
            BSTReportModel? bstReportModel, LoadingStatus loadingStatus)?
        loadBSTReports,
    required TResult orElse(),
  }) {
    if (loadBSTReports != null) {
      return loadBSTReports(bstReportModel, loadingStatus);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_BSTReportEmpty value) empty,
    required TResult Function(_ReportStateLoadBSTReports value) loadBSTReports,
  }) {
    return loadBSTReports(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_BSTReportEmpty value)? empty,
    TResult Function(_ReportStateLoadBSTReports value)? loadBSTReports,
  }) {
    return loadBSTReports?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_BSTReportEmpty value)? empty,
    TResult Function(_ReportStateLoadBSTReports value)? loadBSTReports,
    required TResult orElse(),
  }) {
    if (loadBSTReports != null) {
      return loadBSTReports(this);
    }
    return orElse();
  }
}

abstract class _ReportStateLoadBSTReports implements BSTReportState {
  const factory _ReportStateLoadBSTReports(final BSTReportModel? bstReportModel,
      final LoadingStatus loadingStatus) = _$_ReportStateLoadBSTReports;

  BSTReportModel? get bstReportModel => throw _privateConstructorUsedError;
  @override
  LoadingStatus get loadingStatus => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ReportStateLoadBSTReportsCopyWith<_$_ReportStateLoadBSTReports>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BSTReportEvent {
  BuildContext get context => throw _privateConstructorUsedError;
  String get strBSTSelectedWing => throw _privateConstructorUsedError;
  String get strBSTSelectedCenter => throw _privateConstructorUsedError;
  String get strBSTSelectedRegion => throw _privateConstructorUsedError;
  String get strBSTSabhaYear => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;
  String get generic_search => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            BuildContext context,
            String strBSTSelectedWing,
            String strBSTSelectedCenter,
            String strBSTSelectedRegion,
            String strBSTSabhaYear,
            int page,
            int limit,
            String generic_search)
        loadBSTReports,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            BuildContext context,
            String strBSTSelectedWing,
            String strBSTSelectedCenter,
            String strBSTSelectedRegion,
            String strBSTSabhaYear,
            int page,
            int limit,
            String generic_search)?
        loadBSTReports,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            BuildContext context,
            String strBSTSelectedWing,
            String strBSTSelectedCenter,
            String strBSTSelectedRegion,
            String strBSTSabhaYear,
            int page,
            int limit,
            String generic_search)?
        loadBSTReports,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_loadBSTReports value) loadBSTReports,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_loadBSTReports value)? loadBSTReports,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_loadBSTReports value)? loadBSTReports,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BSTReportEventCopyWith<BSTReportEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BSTReportEventCopyWith<$Res> {
  factory $BSTReportEventCopyWith(
          BSTReportEvent value, $Res Function(BSTReportEvent) then) =
      _$BSTReportEventCopyWithImpl<$Res>;
  $Res call(
      {BuildContext context,
      String strBSTSelectedWing,
      String strBSTSelectedCenter,
      String strBSTSelectedRegion,
      String strBSTSabhaYear,
      int page,
      int limit,
      String generic_search});
}

/// @nodoc
class _$BSTReportEventCopyWithImpl<$Res>
    implements $BSTReportEventCopyWith<$Res> {
  _$BSTReportEventCopyWithImpl(this._value, this._then);

  final BSTReportEvent _value;
  // ignore: unused_field
  final $Res Function(BSTReportEvent) _then;

  @override
  $Res call({
    Object? context = freezed,
    Object? strBSTSelectedWing = freezed,
    Object? strBSTSelectedCenter = freezed,
    Object? strBSTSelectedRegion = freezed,
    Object? strBSTSabhaYear = freezed,
    Object? page = freezed,
    Object? limit = freezed,
    Object? generic_search = freezed,
  }) {
    return _then(_value.copyWith(
      context: context == freezed
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      strBSTSelectedWing: strBSTSelectedWing == freezed
          ? _value.strBSTSelectedWing
          : strBSTSelectedWing // ignore: cast_nullable_to_non_nullable
              as String,
      strBSTSelectedCenter: strBSTSelectedCenter == freezed
          ? _value.strBSTSelectedCenter
          : strBSTSelectedCenter // ignore: cast_nullable_to_non_nullable
              as String,
      strBSTSelectedRegion: strBSTSelectedRegion == freezed
          ? _value.strBSTSelectedRegion
          : strBSTSelectedRegion // ignore: cast_nullable_to_non_nullable
              as String,
      strBSTSabhaYear: strBSTSabhaYear == freezed
          ? _value.strBSTSabhaYear
          : strBSTSabhaYear // ignore: cast_nullable_to_non_nullable
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
abstract class _$$_loadBSTReportsCopyWith<$Res>
    implements $BSTReportEventCopyWith<$Res> {
  factory _$$_loadBSTReportsCopyWith(
          _$_loadBSTReports value, $Res Function(_$_loadBSTReports) then) =
      __$$_loadBSTReportsCopyWithImpl<$Res>;
  @override
  $Res call(
      {BuildContext context,
      String strBSTSelectedWing,
      String strBSTSelectedCenter,
      String strBSTSelectedRegion,
      String strBSTSabhaYear,
      int page,
      int limit,
      String generic_search});
}

/// @nodoc
class __$$_loadBSTReportsCopyWithImpl<$Res>
    extends _$BSTReportEventCopyWithImpl<$Res>
    implements _$$_loadBSTReportsCopyWith<$Res> {
  __$$_loadBSTReportsCopyWithImpl(
      _$_loadBSTReports _value, $Res Function(_$_loadBSTReports) _then)
      : super(_value, (v) => _then(v as _$_loadBSTReports));

  @override
  _$_loadBSTReports get _value => super._value as _$_loadBSTReports;

  @override
  $Res call({
    Object? context = freezed,
    Object? strBSTSelectedWing = freezed,
    Object? strBSTSelectedCenter = freezed,
    Object? strBSTSelectedRegion = freezed,
    Object? strBSTSabhaYear = freezed,
    Object? page = freezed,
    Object? limit = freezed,
    Object? generic_search = freezed,
  }) {
    return _then(_$_loadBSTReports(
      context == freezed
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      strBSTSelectedWing == freezed
          ? _value.strBSTSelectedWing
          : strBSTSelectedWing // ignore: cast_nullable_to_non_nullable
              as String,
      strBSTSelectedCenter == freezed
          ? _value.strBSTSelectedCenter
          : strBSTSelectedCenter // ignore: cast_nullable_to_non_nullable
              as String,
      strBSTSelectedRegion == freezed
          ? _value.strBSTSelectedRegion
          : strBSTSelectedRegion // ignore: cast_nullable_to_non_nullable
              as String,
      strBSTSabhaYear == freezed
          ? _value.strBSTSabhaYear
          : strBSTSabhaYear // ignore: cast_nullable_to_non_nullable
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

class _$_loadBSTReports implements _loadBSTReports {
  const _$_loadBSTReports(
      this.context,
      this.strBSTSelectedWing,
      this.strBSTSelectedCenter,
      this.strBSTSelectedRegion,
      this.strBSTSabhaYear,
      this.page,
      this.limit,
      this.generic_search);

  @override
  final BuildContext context;
  @override
  final String strBSTSelectedWing;
  @override
  final String strBSTSelectedCenter;
  @override
  final String strBSTSelectedRegion;
  @override
  final String strBSTSabhaYear;
  @override
  final int page;
  @override
  final int limit;
  @override
  final String generic_search;

  @override
  String toString() {
    return 'BSTReportEvent.loadBSTReports(context: $context, strBSTSelectedWing: $strBSTSelectedWing, strBSTSelectedCenter: $strBSTSelectedCenter, strBSTSelectedRegion: $strBSTSelectedRegion, strBSTSabhaYear: $strBSTSabhaYear, page: $page, limit: $limit, generic_search: $generic_search)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_loadBSTReports &&
            const DeepCollectionEquality().equals(other.context, context) &&
            const DeepCollectionEquality()
                .equals(other.strBSTSelectedWing, strBSTSelectedWing) &&
            const DeepCollectionEquality()
                .equals(other.strBSTSelectedCenter, strBSTSelectedCenter) &&
            const DeepCollectionEquality()
                .equals(other.strBSTSelectedRegion, strBSTSelectedRegion) &&
            const DeepCollectionEquality()
                .equals(other.strBSTSabhaYear, strBSTSabhaYear) &&
            const DeepCollectionEquality().equals(other.page, page) &&
            const DeepCollectionEquality().equals(other.limit, limit) &&
            const DeepCollectionEquality()
                .equals(other.generic_search, generic_search));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(context),
      const DeepCollectionEquality().hash(strBSTSelectedWing),
      const DeepCollectionEquality().hash(strBSTSelectedCenter),
      const DeepCollectionEquality().hash(strBSTSelectedRegion),
      const DeepCollectionEquality().hash(strBSTSabhaYear),
      const DeepCollectionEquality().hash(page),
      const DeepCollectionEquality().hash(limit),
      const DeepCollectionEquality().hash(generic_search));

  @JsonKey(ignore: true)
  @override
  _$$_loadBSTReportsCopyWith<_$_loadBSTReports> get copyWith =>
      __$$_loadBSTReportsCopyWithImpl<_$_loadBSTReports>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            BuildContext context,
            String strBSTSelectedWing,
            String strBSTSelectedCenter,
            String strBSTSelectedRegion,
            String strBSTSabhaYear,
            int page,
            int limit,
            String generic_search)
        loadBSTReports,
  }) {
    return loadBSTReports(context, strBSTSelectedWing, strBSTSelectedCenter,
        strBSTSelectedRegion, strBSTSabhaYear, page, limit, generic_search);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            BuildContext context,
            String strBSTSelectedWing,
            String strBSTSelectedCenter,
            String strBSTSelectedRegion,
            String strBSTSabhaYear,
            int page,
            int limit,
            String generic_search)?
        loadBSTReports,
  }) {
    return loadBSTReports?.call(
        context,
        strBSTSelectedWing,
        strBSTSelectedCenter,
        strBSTSelectedRegion,
        strBSTSabhaYear,
        page,
        limit,
        generic_search);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            BuildContext context,
            String strBSTSelectedWing,
            String strBSTSelectedCenter,
            String strBSTSelectedRegion,
            String strBSTSabhaYear,
            int page,
            int limit,
            String generic_search)?
        loadBSTReports,
    required TResult orElse(),
  }) {
    if (loadBSTReports != null) {
      return loadBSTReports(context, strBSTSelectedWing, strBSTSelectedCenter,
          strBSTSelectedRegion, strBSTSabhaYear, page, limit, generic_search);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_loadBSTReports value) loadBSTReports,
  }) {
    return loadBSTReports(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_loadBSTReports value)? loadBSTReports,
  }) {
    return loadBSTReports?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_loadBSTReports value)? loadBSTReports,
    required TResult orElse(),
  }) {
    if (loadBSTReports != null) {
      return loadBSTReports(this);
    }
    return orElse();
  }
}

abstract class _loadBSTReports implements BSTReportEvent {
  const factory _loadBSTReports(
      final BuildContext context,
      final String strBSTSelectedWing,
      final String strBSTSelectedCenter,
      final String strBSTSelectedRegion,
      final String strBSTSabhaYear,
      final int page,
      final int limit,
      final String generic_search) = _$_loadBSTReports;

  @override
  BuildContext get context => throw _privateConstructorUsedError;
  @override
  String get strBSTSelectedWing => throw _privateConstructorUsedError;
  @override
  String get strBSTSelectedCenter => throw _privateConstructorUsedError;
  @override
  String get strBSTSelectedRegion => throw _privateConstructorUsedError;
  @override
  String get strBSTSabhaYear => throw _privateConstructorUsedError;
  @override
  int get page => throw _privateConstructorUsedError;
  @override
  int get limit => throw _privateConstructorUsedError;
  @override
  String get generic_search => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_loadBSTReportsCopyWith<_$_loadBSTReports> get copyWith =>
      throw _privateConstructorUsedError;
}
