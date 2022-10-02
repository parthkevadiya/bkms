// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'view_hangout_report_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CampusHangoutState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoadingStatus loadingStatus) empty,
    required TResult Function(ViewHangoutReportModel? viewHangoutReportModel,
            LoadingStatus loadingStatus)
        viewHangoutReport,
    required TResult Function(
            SubmitCampusHangoutReportModel? submitCampusHangoutReportModel)
        submitCampusHangoutReport,
    required TResult Function(
            CreateCampusHangoutReportModel? createCampusHangoutReportModel)
        createCampusHangoutReport,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(LoadingStatus loadingStatus)? empty,
    TResult Function(ViewHangoutReportModel? viewHangoutReportModel,
            LoadingStatus loadingStatus)?
        viewHangoutReport,
    TResult Function(
            SubmitCampusHangoutReportModel? submitCampusHangoutReportModel)?
        submitCampusHangoutReport,
    TResult Function(
            CreateCampusHangoutReportModel? createCampusHangoutReportModel)?
        createCampusHangoutReport,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoadingStatus loadingStatus)? empty,
    TResult Function(ViewHangoutReportModel? viewHangoutReportModel,
            LoadingStatus loadingStatus)?
        viewHangoutReport,
    TResult Function(
            SubmitCampusHangoutReportModel? submitCampusHangoutReportModel)?
        submitCampusHangoutReport,
    TResult Function(
            CreateCampusHangoutReportModel? createCampusHangoutReportModel)?
        createCampusHangoutReport,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CampusHangoutStateEmpty value) empty,
    required TResult Function(_CampusHangoutStateViewHangoutReport value)
        viewHangoutReport,
    required TResult Function(_ReportStateSubmitCampusHangoutReport value)
        submitCampusHangoutReport,
    required TResult Function(_ReportStateCreateCampusHangoutReport value)
        createCampusHangoutReport,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_CampusHangoutStateEmpty value)? empty,
    TResult Function(_CampusHangoutStateViewHangoutReport value)?
        viewHangoutReport,
    TResult Function(_ReportStateSubmitCampusHangoutReport value)?
        submitCampusHangoutReport,
    TResult Function(_ReportStateCreateCampusHangoutReport value)?
        createCampusHangoutReport,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CampusHangoutStateEmpty value)? empty,
    TResult Function(_CampusHangoutStateViewHangoutReport value)?
        viewHangoutReport,
    TResult Function(_ReportStateSubmitCampusHangoutReport value)?
        submitCampusHangoutReport,
    TResult Function(_ReportStateCreateCampusHangoutReport value)?
        createCampusHangoutReport,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CampusHangoutStateCopyWith<$Res> {
  factory $CampusHangoutStateCopyWith(
          CampusHangoutState value, $Res Function(CampusHangoutState) then) =
      _$CampusHangoutStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$CampusHangoutStateCopyWithImpl<$Res>
    implements $CampusHangoutStateCopyWith<$Res> {
  _$CampusHangoutStateCopyWithImpl(this._value, this._then);

  final CampusHangoutState _value;
  // ignore: unused_field
  final $Res Function(CampusHangoutState) _then;
}

/// @nodoc
abstract class _$$_CampusHangoutStateEmptyCopyWith<$Res> {
  factory _$$_CampusHangoutStateEmptyCopyWith(_$_CampusHangoutStateEmpty value,
          $Res Function(_$_CampusHangoutStateEmpty) then) =
      __$$_CampusHangoutStateEmptyCopyWithImpl<$Res>;
  $Res call({LoadingStatus loadingStatus});
}

/// @nodoc
class __$$_CampusHangoutStateEmptyCopyWithImpl<$Res>
    extends _$CampusHangoutStateCopyWithImpl<$Res>
    implements _$$_CampusHangoutStateEmptyCopyWith<$Res> {
  __$$_CampusHangoutStateEmptyCopyWithImpl(_$_CampusHangoutStateEmpty _value,
      $Res Function(_$_CampusHangoutStateEmpty) _then)
      : super(_value, (v) => _then(v as _$_CampusHangoutStateEmpty));

  @override
  _$_CampusHangoutStateEmpty get _value =>
      super._value as _$_CampusHangoutStateEmpty;

  @override
  $Res call({
    Object? loadingStatus = freezed,
  }) {
    return _then(_$_CampusHangoutStateEmpty(
      loadingStatus == freezed
          ? _value.loadingStatus
          : loadingStatus // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
    ));
  }
}

/// @nodoc

class _$_CampusHangoutStateEmpty implements _CampusHangoutStateEmpty {
  const _$_CampusHangoutStateEmpty(this.loadingStatus);

  @override
  final LoadingStatus loadingStatus;

  @override
  String toString() {
    return 'CampusHangoutState.empty(loadingStatus: $loadingStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CampusHangoutStateEmpty &&
            const DeepCollectionEquality()
                .equals(other.loadingStatus, loadingStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(loadingStatus));

  @JsonKey(ignore: true)
  @override
  _$$_CampusHangoutStateEmptyCopyWith<_$_CampusHangoutStateEmpty>
      get copyWith =>
          __$$_CampusHangoutStateEmptyCopyWithImpl<_$_CampusHangoutStateEmpty>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoadingStatus loadingStatus) empty,
    required TResult Function(ViewHangoutReportModel? viewHangoutReportModel,
            LoadingStatus loadingStatus)
        viewHangoutReport,
    required TResult Function(
            SubmitCampusHangoutReportModel? submitCampusHangoutReportModel)
        submitCampusHangoutReport,
    required TResult Function(
            CreateCampusHangoutReportModel? createCampusHangoutReportModel)
        createCampusHangoutReport,
  }) {
    return empty(loadingStatus);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(LoadingStatus loadingStatus)? empty,
    TResult Function(ViewHangoutReportModel? viewHangoutReportModel,
            LoadingStatus loadingStatus)?
        viewHangoutReport,
    TResult Function(
            SubmitCampusHangoutReportModel? submitCampusHangoutReportModel)?
        submitCampusHangoutReport,
    TResult Function(
            CreateCampusHangoutReportModel? createCampusHangoutReportModel)?
        createCampusHangoutReport,
  }) {
    return empty?.call(loadingStatus);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoadingStatus loadingStatus)? empty,
    TResult Function(ViewHangoutReportModel? viewHangoutReportModel,
            LoadingStatus loadingStatus)?
        viewHangoutReport,
    TResult Function(
            SubmitCampusHangoutReportModel? submitCampusHangoutReportModel)?
        submitCampusHangoutReport,
    TResult Function(
            CreateCampusHangoutReportModel? createCampusHangoutReportModel)?
        createCampusHangoutReport,
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
    required TResult Function(_CampusHangoutStateEmpty value) empty,
    required TResult Function(_CampusHangoutStateViewHangoutReport value)
        viewHangoutReport,
    required TResult Function(_ReportStateSubmitCampusHangoutReport value)
        submitCampusHangoutReport,
    required TResult Function(_ReportStateCreateCampusHangoutReport value)
        createCampusHangoutReport,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_CampusHangoutStateEmpty value)? empty,
    TResult Function(_CampusHangoutStateViewHangoutReport value)?
        viewHangoutReport,
    TResult Function(_ReportStateSubmitCampusHangoutReport value)?
        submitCampusHangoutReport,
    TResult Function(_ReportStateCreateCampusHangoutReport value)?
        createCampusHangoutReport,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CampusHangoutStateEmpty value)? empty,
    TResult Function(_CampusHangoutStateViewHangoutReport value)?
        viewHangoutReport,
    TResult Function(_ReportStateSubmitCampusHangoutReport value)?
        submitCampusHangoutReport,
    TResult Function(_ReportStateCreateCampusHangoutReport value)?
        createCampusHangoutReport,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class _CampusHangoutStateEmpty implements CampusHangoutState {
  const factory _CampusHangoutStateEmpty(final LoadingStatus loadingStatus) =
      _$_CampusHangoutStateEmpty;

  LoadingStatus get loadingStatus => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$_CampusHangoutStateEmptyCopyWith<_$_CampusHangoutStateEmpty>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_CampusHangoutStateViewHangoutReportCopyWith<$Res> {
  factory _$$_CampusHangoutStateViewHangoutReportCopyWith(
          _$_CampusHangoutStateViewHangoutReport value,
          $Res Function(_$_CampusHangoutStateViewHangoutReport) then) =
      __$$_CampusHangoutStateViewHangoutReportCopyWithImpl<$Res>;
  $Res call(
      {ViewHangoutReportModel? viewHangoutReportModel,
      LoadingStatus loadingStatus});
}

/// @nodoc
class __$$_CampusHangoutStateViewHangoutReportCopyWithImpl<$Res>
    extends _$CampusHangoutStateCopyWithImpl<$Res>
    implements _$$_CampusHangoutStateViewHangoutReportCopyWith<$Res> {
  __$$_CampusHangoutStateViewHangoutReportCopyWithImpl(
      _$_CampusHangoutStateViewHangoutReport _value,
      $Res Function(_$_CampusHangoutStateViewHangoutReport) _then)
      : super(
            _value, (v) => _then(v as _$_CampusHangoutStateViewHangoutReport));

  @override
  _$_CampusHangoutStateViewHangoutReport get _value =>
      super._value as _$_CampusHangoutStateViewHangoutReport;

  @override
  $Res call({
    Object? viewHangoutReportModel = freezed,
    Object? loadingStatus = freezed,
  }) {
    return _then(_$_CampusHangoutStateViewHangoutReport(
      viewHangoutReportModel == freezed
          ? _value.viewHangoutReportModel
          : viewHangoutReportModel // ignore: cast_nullable_to_non_nullable
              as ViewHangoutReportModel?,
      loadingStatus == freezed
          ? _value.loadingStatus
          : loadingStatus // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
    ));
  }
}

/// @nodoc

class _$_CampusHangoutStateViewHangoutReport
    implements _CampusHangoutStateViewHangoutReport {
  const _$_CampusHangoutStateViewHangoutReport(
      this.viewHangoutReportModel, this.loadingStatus);

  @override
  final ViewHangoutReportModel? viewHangoutReportModel;
  @override
  final LoadingStatus loadingStatus;

  @override
  String toString() {
    return 'CampusHangoutState.viewHangoutReport(viewHangoutReportModel: $viewHangoutReportModel, loadingStatus: $loadingStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CampusHangoutStateViewHangoutReport &&
            const DeepCollectionEquality()
                .equals(other.viewHangoutReportModel, viewHangoutReportModel) &&
            const DeepCollectionEquality()
                .equals(other.loadingStatus, loadingStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(viewHangoutReportModel),
      const DeepCollectionEquality().hash(loadingStatus));

  @JsonKey(ignore: true)
  @override
  _$$_CampusHangoutStateViewHangoutReportCopyWith<
          _$_CampusHangoutStateViewHangoutReport>
      get copyWith => __$$_CampusHangoutStateViewHangoutReportCopyWithImpl<
          _$_CampusHangoutStateViewHangoutReport>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoadingStatus loadingStatus) empty,
    required TResult Function(ViewHangoutReportModel? viewHangoutReportModel,
            LoadingStatus loadingStatus)
        viewHangoutReport,
    required TResult Function(
            SubmitCampusHangoutReportModel? submitCampusHangoutReportModel)
        submitCampusHangoutReport,
    required TResult Function(
            CreateCampusHangoutReportModel? createCampusHangoutReportModel)
        createCampusHangoutReport,
  }) {
    return viewHangoutReport(viewHangoutReportModel, loadingStatus);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(LoadingStatus loadingStatus)? empty,
    TResult Function(ViewHangoutReportModel? viewHangoutReportModel,
            LoadingStatus loadingStatus)?
        viewHangoutReport,
    TResult Function(
            SubmitCampusHangoutReportModel? submitCampusHangoutReportModel)?
        submitCampusHangoutReport,
    TResult Function(
            CreateCampusHangoutReportModel? createCampusHangoutReportModel)?
        createCampusHangoutReport,
  }) {
    return viewHangoutReport?.call(viewHangoutReportModel, loadingStatus);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoadingStatus loadingStatus)? empty,
    TResult Function(ViewHangoutReportModel? viewHangoutReportModel,
            LoadingStatus loadingStatus)?
        viewHangoutReport,
    TResult Function(
            SubmitCampusHangoutReportModel? submitCampusHangoutReportModel)?
        submitCampusHangoutReport,
    TResult Function(
            CreateCampusHangoutReportModel? createCampusHangoutReportModel)?
        createCampusHangoutReport,
    required TResult orElse(),
  }) {
    if (viewHangoutReport != null) {
      return viewHangoutReport(viewHangoutReportModel, loadingStatus);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CampusHangoutStateEmpty value) empty,
    required TResult Function(_CampusHangoutStateViewHangoutReport value)
        viewHangoutReport,
    required TResult Function(_ReportStateSubmitCampusHangoutReport value)
        submitCampusHangoutReport,
    required TResult Function(_ReportStateCreateCampusHangoutReport value)
        createCampusHangoutReport,
  }) {
    return viewHangoutReport(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_CampusHangoutStateEmpty value)? empty,
    TResult Function(_CampusHangoutStateViewHangoutReport value)?
        viewHangoutReport,
    TResult Function(_ReportStateSubmitCampusHangoutReport value)?
        submitCampusHangoutReport,
    TResult Function(_ReportStateCreateCampusHangoutReport value)?
        createCampusHangoutReport,
  }) {
    return viewHangoutReport?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CampusHangoutStateEmpty value)? empty,
    TResult Function(_CampusHangoutStateViewHangoutReport value)?
        viewHangoutReport,
    TResult Function(_ReportStateSubmitCampusHangoutReport value)?
        submitCampusHangoutReport,
    TResult Function(_ReportStateCreateCampusHangoutReport value)?
        createCampusHangoutReport,
    required TResult orElse(),
  }) {
    if (viewHangoutReport != null) {
      return viewHangoutReport(this);
    }
    return orElse();
  }
}

abstract class _CampusHangoutStateViewHangoutReport
    implements CampusHangoutState {
  const factory _CampusHangoutStateViewHangoutReport(
          final ViewHangoutReportModel? viewHangoutReportModel,
          final LoadingStatus loadingStatus) =
      _$_CampusHangoutStateViewHangoutReport;

  ViewHangoutReportModel? get viewHangoutReportModel =>
      throw _privateConstructorUsedError;
  LoadingStatus get loadingStatus => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$_CampusHangoutStateViewHangoutReportCopyWith<
          _$_CampusHangoutStateViewHangoutReport>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ReportStateSubmitCampusHangoutReportCopyWith<$Res> {
  factory _$$_ReportStateSubmitCampusHangoutReportCopyWith(
          _$_ReportStateSubmitCampusHangoutReport value,
          $Res Function(_$_ReportStateSubmitCampusHangoutReport) then) =
      __$$_ReportStateSubmitCampusHangoutReportCopyWithImpl<$Res>;
  $Res call({SubmitCampusHangoutReportModel? submitCampusHangoutReportModel});
}

/// @nodoc
class __$$_ReportStateSubmitCampusHangoutReportCopyWithImpl<$Res>
    extends _$CampusHangoutStateCopyWithImpl<$Res>
    implements _$$_ReportStateSubmitCampusHangoutReportCopyWith<$Res> {
  __$$_ReportStateSubmitCampusHangoutReportCopyWithImpl(
      _$_ReportStateSubmitCampusHangoutReport _value,
      $Res Function(_$_ReportStateSubmitCampusHangoutReport) _then)
      : super(
            _value, (v) => _then(v as _$_ReportStateSubmitCampusHangoutReport));

  @override
  _$_ReportStateSubmitCampusHangoutReport get _value =>
      super._value as _$_ReportStateSubmitCampusHangoutReport;

  @override
  $Res call({
    Object? submitCampusHangoutReportModel = freezed,
  }) {
    return _then(_$_ReportStateSubmitCampusHangoutReport(
      submitCampusHangoutReportModel == freezed
          ? _value.submitCampusHangoutReportModel
          : submitCampusHangoutReportModel // ignore: cast_nullable_to_non_nullable
              as SubmitCampusHangoutReportModel?,
    ));
  }
}

/// @nodoc

class _$_ReportStateSubmitCampusHangoutReport
    implements _ReportStateSubmitCampusHangoutReport {
  const _$_ReportStateSubmitCampusHangoutReport(
      this.submitCampusHangoutReportModel);

  @override
  final SubmitCampusHangoutReportModel? submitCampusHangoutReportModel;

  @override
  String toString() {
    return 'CampusHangoutState.submitCampusHangoutReport(submitCampusHangoutReportModel: $submitCampusHangoutReportModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReportStateSubmitCampusHangoutReport &&
            const DeepCollectionEquality().equals(
                other.submitCampusHangoutReportModel,
                submitCampusHangoutReportModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(submitCampusHangoutReportModel));

  @JsonKey(ignore: true)
  @override
  _$$_ReportStateSubmitCampusHangoutReportCopyWith<
          _$_ReportStateSubmitCampusHangoutReport>
      get copyWith => __$$_ReportStateSubmitCampusHangoutReportCopyWithImpl<
          _$_ReportStateSubmitCampusHangoutReport>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoadingStatus loadingStatus) empty,
    required TResult Function(ViewHangoutReportModel? viewHangoutReportModel,
            LoadingStatus loadingStatus)
        viewHangoutReport,
    required TResult Function(
            SubmitCampusHangoutReportModel? submitCampusHangoutReportModel)
        submitCampusHangoutReport,
    required TResult Function(
            CreateCampusHangoutReportModel? createCampusHangoutReportModel)
        createCampusHangoutReport,
  }) {
    return submitCampusHangoutReport(submitCampusHangoutReportModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(LoadingStatus loadingStatus)? empty,
    TResult Function(ViewHangoutReportModel? viewHangoutReportModel,
            LoadingStatus loadingStatus)?
        viewHangoutReport,
    TResult Function(
            SubmitCampusHangoutReportModel? submitCampusHangoutReportModel)?
        submitCampusHangoutReport,
    TResult Function(
            CreateCampusHangoutReportModel? createCampusHangoutReportModel)?
        createCampusHangoutReport,
  }) {
    return submitCampusHangoutReport?.call(submitCampusHangoutReportModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoadingStatus loadingStatus)? empty,
    TResult Function(ViewHangoutReportModel? viewHangoutReportModel,
            LoadingStatus loadingStatus)?
        viewHangoutReport,
    TResult Function(
            SubmitCampusHangoutReportModel? submitCampusHangoutReportModel)?
        submitCampusHangoutReport,
    TResult Function(
            CreateCampusHangoutReportModel? createCampusHangoutReportModel)?
        createCampusHangoutReport,
    required TResult orElse(),
  }) {
    if (submitCampusHangoutReport != null) {
      return submitCampusHangoutReport(submitCampusHangoutReportModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CampusHangoutStateEmpty value) empty,
    required TResult Function(_CampusHangoutStateViewHangoutReport value)
        viewHangoutReport,
    required TResult Function(_ReportStateSubmitCampusHangoutReport value)
        submitCampusHangoutReport,
    required TResult Function(_ReportStateCreateCampusHangoutReport value)
        createCampusHangoutReport,
  }) {
    return submitCampusHangoutReport(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_CampusHangoutStateEmpty value)? empty,
    TResult Function(_CampusHangoutStateViewHangoutReport value)?
        viewHangoutReport,
    TResult Function(_ReportStateSubmitCampusHangoutReport value)?
        submitCampusHangoutReport,
    TResult Function(_ReportStateCreateCampusHangoutReport value)?
        createCampusHangoutReport,
  }) {
    return submitCampusHangoutReport?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CampusHangoutStateEmpty value)? empty,
    TResult Function(_CampusHangoutStateViewHangoutReport value)?
        viewHangoutReport,
    TResult Function(_ReportStateSubmitCampusHangoutReport value)?
        submitCampusHangoutReport,
    TResult Function(_ReportStateCreateCampusHangoutReport value)?
        createCampusHangoutReport,
    required TResult orElse(),
  }) {
    if (submitCampusHangoutReport != null) {
      return submitCampusHangoutReport(this);
    }
    return orElse();
  }
}

abstract class _ReportStateSubmitCampusHangoutReport
    implements CampusHangoutState {
  const factory _ReportStateSubmitCampusHangoutReport(
          final SubmitCampusHangoutReportModel?
              submitCampusHangoutReportModel) =
      _$_ReportStateSubmitCampusHangoutReport;

  SubmitCampusHangoutReportModel? get submitCampusHangoutReportModel =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$_ReportStateSubmitCampusHangoutReportCopyWith<
          _$_ReportStateSubmitCampusHangoutReport>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ReportStateCreateCampusHangoutReportCopyWith<$Res> {
  factory _$$_ReportStateCreateCampusHangoutReportCopyWith(
          _$_ReportStateCreateCampusHangoutReport value,
          $Res Function(_$_ReportStateCreateCampusHangoutReport) then) =
      __$$_ReportStateCreateCampusHangoutReportCopyWithImpl<$Res>;
  $Res call({CreateCampusHangoutReportModel? createCampusHangoutReportModel});
}

/// @nodoc
class __$$_ReportStateCreateCampusHangoutReportCopyWithImpl<$Res>
    extends _$CampusHangoutStateCopyWithImpl<$Res>
    implements _$$_ReportStateCreateCampusHangoutReportCopyWith<$Res> {
  __$$_ReportStateCreateCampusHangoutReportCopyWithImpl(
      _$_ReportStateCreateCampusHangoutReport _value,
      $Res Function(_$_ReportStateCreateCampusHangoutReport) _then)
      : super(
            _value, (v) => _then(v as _$_ReportStateCreateCampusHangoutReport));

  @override
  _$_ReportStateCreateCampusHangoutReport get _value =>
      super._value as _$_ReportStateCreateCampusHangoutReport;

  @override
  $Res call({
    Object? createCampusHangoutReportModel = freezed,
  }) {
    return _then(_$_ReportStateCreateCampusHangoutReport(
      createCampusHangoutReportModel == freezed
          ? _value.createCampusHangoutReportModel
          : createCampusHangoutReportModel // ignore: cast_nullable_to_non_nullable
              as CreateCampusHangoutReportModel?,
    ));
  }
}

/// @nodoc

class _$_ReportStateCreateCampusHangoutReport
    implements _ReportStateCreateCampusHangoutReport {
  const _$_ReportStateCreateCampusHangoutReport(
      this.createCampusHangoutReportModel);

  @override
  final CreateCampusHangoutReportModel? createCampusHangoutReportModel;

  @override
  String toString() {
    return 'CampusHangoutState.createCampusHangoutReport(createCampusHangoutReportModel: $createCampusHangoutReportModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReportStateCreateCampusHangoutReport &&
            const DeepCollectionEquality().equals(
                other.createCampusHangoutReportModel,
                createCampusHangoutReportModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(createCampusHangoutReportModel));

  @JsonKey(ignore: true)
  @override
  _$$_ReportStateCreateCampusHangoutReportCopyWith<
          _$_ReportStateCreateCampusHangoutReport>
      get copyWith => __$$_ReportStateCreateCampusHangoutReportCopyWithImpl<
          _$_ReportStateCreateCampusHangoutReport>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoadingStatus loadingStatus) empty,
    required TResult Function(ViewHangoutReportModel? viewHangoutReportModel,
            LoadingStatus loadingStatus)
        viewHangoutReport,
    required TResult Function(
            SubmitCampusHangoutReportModel? submitCampusHangoutReportModel)
        submitCampusHangoutReport,
    required TResult Function(
            CreateCampusHangoutReportModel? createCampusHangoutReportModel)
        createCampusHangoutReport,
  }) {
    return createCampusHangoutReport(createCampusHangoutReportModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(LoadingStatus loadingStatus)? empty,
    TResult Function(ViewHangoutReportModel? viewHangoutReportModel,
            LoadingStatus loadingStatus)?
        viewHangoutReport,
    TResult Function(
            SubmitCampusHangoutReportModel? submitCampusHangoutReportModel)?
        submitCampusHangoutReport,
    TResult Function(
            CreateCampusHangoutReportModel? createCampusHangoutReportModel)?
        createCampusHangoutReport,
  }) {
    return createCampusHangoutReport?.call(createCampusHangoutReportModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoadingStatus loadingStatus)? empty,
    TResult Function(ViewHangoutReportModel? viewHangoutReportModel,
            LoadingStatus loadingStatus)?
        viewHangoutReport,
    TResult Function(
            SubmitCampusHangoutReportModel? submitCampusHangoutReportModel)?
        submitCampusHangoutReport,
    TResult Function(
            CreateCampusHangoutReportModel? createCampusHangoutReportModel)?
        createCampusHangoutReport,
    required TResult orElse(),
  }) {
    if (createCampusHangoutReport != null) {
      return createCampusHangoutReport(createCampusHangoutReportModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CampusHangoutStateEmpty value) empty,
    required TResult Function(_CampusHangoutStateViewHangoutReport value)
        viewHangoutReport,
    required TResult Function(_ReportStateSubmitCampusHangoutReport value)
        submitCampusHangoutReport,
    required TResult Function(_ReportStateCreateCampusHangoutReport value)
        createCampusHangoutReport,
  }) {
    return createCampusHangoutReport(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_CampusHangoutStateEmpty value)? empty,
    TResult Function(_CampusHangoutStateViewHangoutReport value)?
        viewHangoutReport,
    TResult Function(_ReportStateSubmitCampusHangoutReport value)?
        submitCampusHangoutReport,
    TResult Function(_ReportStateCreateCampusHangoutReport value)?
        createCampusHangoutReport,
  }) {
    return createCampusHangoutReport?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CampusHangoutStateEmpty value)? empty,
    TResult Function(_CampusHangoutStateViewHangoutReport value)?
        viewHangoutReport,
    TResult Function(_ReportStateSubmitCampusHangoutReport value)?
        submitCampusHangoutReport,
    TResult Function(_ReportStateCreateCampusHangoutReport value)?
        createCampusHangoutReport,
    required TResult orElse(),
  }) {
    if (createCampusHangoutReport != null) {
      return createCampusHangoutReport(this);
    }
    return orElse();
  }
}

abstract class _ReportStateCreateCampusHangoutReport
    implements CampusHangoutState {
  const factory _ReportStateCreateCampusHangoutReport(
          final CreateCampusHangoutReportModel?
              createCampusHangoutReportModel) =
      _$_ReportStateCreateCampusHangoutReport;

  CreateCampusHangoutReportModel? get createCampusHangoutReportModel =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$_ReportStateCreateCampusHangoutReportCopyWith<
          _$_ReportStateCreateCampusHangoutReport>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CampusHangoutEvent {
  BuildContext get context => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context, String bst_center_report_id,
            int page, int limit, String generic_search)
        viewHangoutReport,
    required TResult Function(
            BuildContext context,
            List<SubmitCampusHangoutReportRequestModel>
                submitCampusHangoutReportRequestModel)
        submitCampusHangoutReport,
    required TResult Function(BuildContext context, String report_region,
            String report_campus, String report_wing)
        createCampusHangoutReport,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(BuildContext context, String bst_center_report_id,
            int page, int limit, String generic_search)?
        viewHangoutReport,
    TResult Function(
            BuildContext context,
            List<SubmitCampusHangoutReportRequestModel>
                submitCampusHangoutReportRequestModel)?
        submitCampusHangoutReport,
    TResult Function(BuildContext context, String report_region,
            String report_campus, String report_wing)?
        createCampusHangoutReport,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, String bst_center_report_id,
            int page, int limit, String generic_search)?
        viewHangoutReport,
    TResult Function(
            BuildContext context,
            List<SubmitCampusHangoutReportRequestModel>
                submitCampusHangoutReportRequestModel)?
        submitCampusHangoutReport,
    TResult Function(BuildContext context, String report_region,
            String report_campus, String report_wing)?
        createCampusHangoutReport,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_viewHangoutReport value) viewHangoutReport,
    required TResult Function(_submitCampusHangoutReport value)
        submitCampusHangoutReport,
    required TResult Function(_createCampusHangoutReport value)
        createCampusHangoutReport,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_viewHangoutReport value)? viewHangoutReport,
    TResult Function(_submitCampusHangoutReport value)?
        submitCampusHangoutReport,
    TResult Function(_createCampusHangoutReport value)?
        createCampusHangoutReport,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_viewHangoutReport value)? viewHangoutReport,
    TResult Function(_submitCampusHangoutReport value)?
        submitCampusHangoutReport,
    TResult Function(_createCampusHangoutReport value)?
        createCampusHangoutReport,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CampusHangoutEventCopyWith<CampusHangoutEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CampusHangoutEventCopyWith<$Res> {
  factory $CampusHangoutEventCopyWith(
          CampusHangoutEvent value, $Res Function(CampusHangoutEvent) then) =
      _$CampusHangoutEventCopyWithImpl<$Res>;
  $Res call({BuildContext context});
}

/// @nodoc
class _$CampusHangoutEventCopyWithImpl<$Res>
    implements $CampusHangoutEventCopyWith<$Res> {
  _$CampusHangoutEventCopyWithImpl(this._value, this._then);

  final CampusHangoutEvent _value;
  // ignore: unused_field
  final $Res Function(CampusHangoutEvent) _then;

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
abstract class _$$_viewHangoutReportCopyWith<$Res>
    implements $CampusHangoutEventCopyWith<$Res> {
  factory _$$_viewHangoutReportCopyWith(_$_viewHangoutReport value,
          $Res Function(_$_viewHangoutReport) then) =
      __$$_viewHangoutReportCopyWithImpl<$Res>;
  @override
  $Res call(
      {BuildContext context,
      String bst_center_report_id,
      int page,
      int limit,
      String generic_search});
}

/// @nodoc
class __$$_viewHangoutReportCopyWithImpl<$Res>
    extends _$CampusHangoutEventCopyWithImpl<$Res>
    implements _$$_viewHangoutReportCopyWith<$Res> {
  __$$_viewHangoutReportCopyWithImpl(
      _$_viewHangoutReport _value, $Res Function(_$_viewHangoutReport) _then)
      : super(_value, (v) => _then(v as _$_viewHangoutReport));

  @override
  _$_viewHangoutReport get _value => super._value as _$_viewHangoutReport;

  @override
  $Res call({
    Object? context = freezed,
    Object? bst_center_report_id = freezed,
    Object? page = freezed,
    Object? limit = freezed,
    Object? generic_search = freezed,
  }) {
    return _then(_$_viewHangoutReport(
      context == freezed
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      bst_center_report_id == freezed
          ? _value.bst_center_report_id
          : bst_center_report_id // ignore: cast_nullable_to_non_nullable
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

class _$_viewHangoutReport implements _viewHangoutReport {
  const _$_viewHangoutReport(this.context, this.bst_center_report_id, this.page,
      this.limit, this.generic_search);

  @override
  final BuildContext context;
  @override
  final String bst_center_report_id;
  @override
  final int page;
  @override
  final int limit;
  @override
  final String generic_search;

  @override
  String toString() {
    return 'CampusHangoutEvent.viewHangoutReport(context: $context, bst_center_report_id: $bst_center_report_id, page: $page, limit: $limit, generic_search: $generic_search)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_viewHangoutReport &&
            const DeepCollectionEquality().equals(other.context, context) &&
            const DeepCollectionEquality()
                .equals(other.bst_center_report_id, bst_center_report_id) &&
            const DeepCollectionEquality().equals(other.page, page) &&
            const DeepCollectionEquality().equals(other.limit, limit) &&
            const DeepCollectionEquality()
                .equals(other.generic_search, generic_search));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(context),
      const DeepCollectionEquality().hash(bst_center_report_id),
      const DeepCollectionEquality().hash(page),
      const DeepCollectionEquality().hash(limit),
      const DeepCollectionEquality().hash(generic_search));

  @JsonKey(ignore: true)
  @override
  _$$_viewHangoutReportCopyWith<_$_viewHangoutReport> get copyWith =>
      __$$_viewHangoutReportCopyWithImpl<_$_viewHangoutReport>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context, String bst_center_report_id,
            int page, int limit, String generic_search)
        viewHangoutReport,
    required TResult Function(
            BuildContext context,
            List<SubmitCampusHangoutReportRequestModel>
                submitCampusHangoutReportRequestModel)
        submitCampusHangoutReport,
    required TResult Function(BuildContext context, String report_region,
            String report_campus, String report_wing)
        createCampusHangoutReport,
  }) {
    return viewHangoutReport(
        context, bst_center_report_id, page, limit, generic_search);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(BuildContext context, String bst_center_report_id,
            int page, int limit, String generic_search)?
        viewHangoutReport,
    TResult Function(
            BuildContext context,
            List<SubmitCampusHangoutReportRequestModel>
                submitCampusHangoutReportRequestModel)?
        submitCampusHangoutReport,
    TResult Function(BuildContext context, String report_region,
            String report_campus, String report_wing)?
        createCampusHangoutReport,
  }) {
    return viewHangoutReport?.call(
        context, bst_center_report_id, page, limit, generic_search);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, String bst_center_report_id,
            int page, int limit, String generic_search)?
        viewHangoutReport,
    TResult Function(
            BuildContext context,
            List<SubmitCampusHangoutReportRequestModel>
                submitCampusHangoutReportRequestModel)?
        submitCampusHangoutReport,
    TResult Function(BuildContext context, String report_region,
            String report_campus, String report_wing)?
        createCampusHangoutReport,
    required TResult orElse(),
  }) {
    if (viewHangoutReport != null) {
      return viewHangoutReport(
          context, bst_center_report_id, page, limit, generic_search);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_viewHangoutReport value) viewHangoutReport,
    required TResult Function(_submitCampusHangoutReport value)
        submitCampusHangoutReport,
    required TResult Function(_createCampusHangoutReport value)
        createCampusHangoutReport,
  }) {
    return viewHangoutReport(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_viewHangoutReport value)? viewHangoutReport,
    TResult Function(_submitCampusHangoutReport value)?
        submitCampusHangoutReport,
    TResult Function(_createCampusHangoutReport value)?
        createCampusHangoutReport,
  }) {
    return viewHangoutReport?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_viewHangoutReport value)? viewHangoutReport,
    TResult Function(_submitCampusHangoutReport value)?
        submitCampusHangoutReport,
    TResult Function(_createCampusHangoutReport value)?
        createCampusHangoutReport,
    required TResult orElse(),
  }) {
    if (viewHangoutReport != null) {
      return viewHangoutReport(this);
    }
    return orElse();
  }
}

abstract class _viewHangoutReport implements CampusHangoutEvent {
  const factory _viewHangoutReport(
      final BuildContext context,
      final String bst_center_report_id,
      final int page,
      final int limit,
      final String generic_search) = _$_viewHangoutReport;

  @override
  BuildContext get context => throw _privateConstructorUsedError;
  String get bst_center_report_id => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;
  String get generic_search => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_viewHangoutReportCopyWith<_$_viewHangoutReport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_submitCampusHangoutReportCopyWith<$Res>
    implements $CampusHangoutEventCopyWith<$Res> {
  factory _$$_submitCampusHangoutReportCopyWith(
          _$_submitCampusHangoutReport value,
          $Res Function(_$_submitCampusHangoutReport) then) =
      __$$_submitCampusHangoutReportCopyWithImpl<$Res>;
  @override
  $Res call(
      {BuildContext context,
      List<SubmitCampusHangoutReportRequestModel>
          submitCampusHangoutReportRequestModel});
}

/// @nodoc
class __$$_submitCampusHangoutReportCopyWithImpl<$Res>
    extends _$CampusHangoutEventCopyWithImpl<$Res>
    implements _$$_submitCampusHangoutReportCopyWith<$Res> {
  __$$_submitCampusHangoutReportCopyWithImpl(
      _$_submitCampusHangoutReport _value,
      $Res Function(_$_submitCampusHangoutReport) _then)
      : super(_value, (v) => _then(v as _$_submitCampusHangoutReport));

  @override
  _$_submitCampusHangoutReport get _value =>
      super._value as _$_submitCampusHangoutReport;

  @override
  $Res call({
    Object? context = freezed,
    Object? submitCampusHangoutReportRequestModel = freezed,
  }) {
    return _then(_$_submitCampusHangoutReport(
      context == freezed
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      submitCampusHangoutReportRequestModel == freezed
          ? _value._submitCampusHangoutReportRequestModel
          : submitCampusHangoutReportRequestModel // ignore: cast_nullable_to_non_nullable
              as List<SubmitCampusHangoutReportRequestModel>,
    ));
  }
}

/// @nodoc

class _$_submitCampusHangoutReport implements _submitCampusHangoutReport {
  const _$_submitCampusHangoutReport(
      this.context,
      final List<SubmitCampusHangoutReportRequestModel>
          submitCampusHangoutReportRequestModel)
      : _submitCampusHangoutReportRequestModel =
            submitCampusHangoutReportRequestModel;

  @override
  final BuildContext context;
  final List<SubmitCampusHangoutReportRequestModel>
      _submitCampusHangoutReportRequestModel;
  @override
  List<SubmitCampusHangoutReportRequestModel>
      get submitCampusHangoutReportRequestModel {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_submitCampusHangoutReportRequestModel);
  }

  @override
  String toString() {
    return 'CampusHangoutEvent.submitCampusHangoutReport(context: $context, submitCampusHangoutReportRequestModel: $submitCampusHangoutReportRequestModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_submitCampusHangoutReport &&
            const DeepCollectionEquality().equals(other.context, context) &&
            const DeepCollectionEquality().equals(
                other._submitCampusHangoutReportRequestModel,
                _submitCampusHangoutReportRequestModel));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(context),
      const DeepCollectionEquality()
          .hash(_submitCampusHangoutReportRequestModel));

  @JsonKey(ignore: true)
  @override
  _$$_submitCampusHangoutReportCopyWith<_$_submitCampusHangoutReport>
      get copyWith => __$$_submitCampusHangoutReportCopyWithImpl<
          _$_submitCampusHangoutReport>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context, String bst_center_report_id,
            int page, int limit, String generic_search)
        viewHangoutReport,
    required TResult Function(
            BuildContext context,
            List<SubmitCampusHangoutReportRequestModel>
                submitCampusHangoutReportRequestModel)
        submitCampusHangoutReport,
    required TResult Function(BuildContext context, String report_region,
            String report_campus, String report_wing)
        createCampusHangoutReport,
  }) {
    return submitCampusHangoutReport(
        context, submitCampusHangoutReportRequestModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(BuildContext context, String bst_center_report_id,
            int page, int limit, String generic_search)?
        viewHangoutReport,
    TResult Function(
            BuildContext context,
            List<SubmitCampusHangoutReportRequestModel>
                submitCampusHangoutReportRequestModel)?
        submitCampusHangoutReport,
    TResult Function(BuildContext context, String report_region,
            String report_campus, String report_wing)?
        createCampusHangoutReport,
  }) {
    return submitCampusHangoutReport?.call(
        context, submitCampusHangoutReportRequestModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, String bst_center_report_id,
            int page, int limit, String generic_search)?
        viewHangoutReport,
    TResult Function(
            BuildContext context,
            List<SubmitCampusHangoutReportRequestModel>
                submitCampusHangoutReportRequestModel)?
        submitCampusHangoutReport,
    TResult Function(BuildContext context, String report_region,
            String report_campus, String report_wing)?
        createCampusHangoutReport,
    required TResult orElse(),
  }) {
    if (submitCampusHangoutReport != null) {
      return submitCampusHangoutReport(
          context, submitCampusHangoutReportRequestModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_viewHangoutReport value) viewHangoutReport,
    required TResult Function(_submitCampusHangoutReport value)
        submitCampusHangoutReport,
    required TResult Function(_createCampusHangoutReport value)
        createCampusHangoutReport,
  }) {
    return submitCampusHangoutReport(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_viewHangoutReport value)? viewHangoutReport,
    TResult Function(_submitCampusHangoutReport value)?
        submitCampusHangoutReport,
    TResult Function(_createCampusHangoutReport value)?
        createCampusHangoutReport,
  }) {
    return submitCampusHangoutReport?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_viewHangoutReport value)? viewHangoutReport,
    TResult Function(_submitCampusHangoutReport value)?
        submitCampusHangoutReport,
    TResult Function(_createCampusHangoutReport value)?
        createCampusHangoutReport,
    required TResult orElse(),
  }) {
    if (submitCampusHangoutReport != null) {
      return submitCampusHangoutReport(this);
    }
    return orElse();
  }
}

abstract class _submitCampusHangoutReport implements CampusHangoutEvent {
  const factory _submitCampusHangoutReport(
      final BuildContext context,
      final List<SubmitCampusHangoutReportRequestModel>
          submitCampusHangoutReportRequestModel) = _$_submitCampusHangoutReport;

  @override
  BuildContext get context => throw _privateConstructorUsedError;
  List<SubmitCampusHangoutReportRequestModel>
      get submitCampusHangoutReportRequestModel =>
          throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_submitCampusHangoutReportCopyWith<_$_submitCampusHangoutReport>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_createCampusHangoutReportCopyWith<$Res>
    implements $CampusHangoutEventCopyWith<$Res> {
  factory _$$_createCampusHangoutReportCopyWith(
          _$_createCampusHangoutReport value,
          $Res Function(_$_createCampusHangoutReport) then) =
      __$$_createCampusHangoutReportCopyWithImpl<$Res>;
  @override
  $Res call(
      {BuildContext context,
      String report_region,
      String report_campus,
      String report_wing});
}

/// @nodoc
class __$$_createCampusHangoutReportCopyWithImpl<$Res>
    extends _$CampusHangoutEventCopyWithImpl<$Res>
    implements _$$_createCampusHangoutReportCopyWith<$Res> {
  __$$_createCampusHangoutReportCopyWithImpl(
      _$_createCampusHangoutReport _value,
      $Res Function(_$_createCampusHangoutReport) _then)
      : super(_value, (v) => _then(v as _$_createCampusHangoutReport));

  @override
  _$_createCampusHangoutReport get _value =>
      super._value as _$_createCampusHangoutReport;

  @override
  $Res call({
    Object? context = freezed,
    Object? report_region = freezed,
    Object? report_campus = freezed,
    Object? report_wing = freezed,
  }) {
    return _then(_$_createCampusHangoutReport(
      context == freezed
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      report_region == freezed
          ? _value.report_region
          : report_region // ignore: cast_nullable_to_non_nullable
              as String,
      report_campus == freezed
          ? _value.report_campus
          : report_campus // ignore: cast_nullable_to_non_nullable
              as String,
      report_wing == freezed
          ? _value.report_wing
          : report_wing // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_createCampusHangoutReport implements _createCampusHangoutReport {
  const _$_createCampusHangoutReport(
      this.context, this.report_region, this.report_campus, this.report_wing);

  @override
  final BuildContext context;
  @override
  final String report_region;
  @override
  final String report_campus;
  @override
  final String report_wing;

  @override
  String toString() {
    return 'CampusHangoutEvent.createCampusHangoutReport(context: $context, report_region: $report_region, report_campus: $report_campus, report_wing: $report_wing)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_createCampusHangoutReport &&
            const DeepCollectionEquality().equals(other.context, context) &&
            const DeepCollectionEquality()
                .equals(other.report_region, report_region) &&
            const DeepCollectionEquality()
                .equals(other.report_campus, report_campus) &&
            const DeepCollectionEquality()
                .equals(other.report_wing, report_wing));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(context),
      const DeepCollectionEquality().hash(report_region),
      const DeepCollectionEquality().hash(report_campus),
      const DeepCollectionEquality().hash(report_wing));

  @JsonKey(ignore: true)
  @override
  _$$_createCampusHangoutReportCopyWith<_$_createCampusHangoutReport>
      get copyWith => __$$_createCampusHangoutReportCopyWithImpl<
          _$_createCampusHangoutReport>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context, String bst_center_report_id,
            int page, int limit, String generic_search)
        viewHangoutReport,
    required TResult Function(
            BuildContext context,
            List<SubmitCampusHangoutReportRequestModel>
                submitCampusHangoutReportRequestModel)
        submitCampusHangoutReport,
    required TResult Function(BuildContext context, String report_region,
            String report_campus, String report_wing)
        createCampusHangoutReport,
  }) {
    return createCampusHangoutReport(
        context, report_region, report_campus, report_wing);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(BuildContext context, String bst_center_report_id,
            int page, int limit, String generic_search)?
        viewHangoutReport,
    TResult Function(
            BuildContext context,
            List<SubmitCampusHangoutReportRequestModel>
                submitCampusHangoutReportRequestModel)?
        submitCampusHangoutReport,
    TResult Function(BuildContext context, String report_region,
            String report_campus, String report_wing)?
        createCampusHangoutReport,
  }) {
    return createCampusHangoutReport?.call(
        context, report_region, report_campus, report_wing);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, String bst_center_report_id,
            int page, int limit, String generic_search)?
        viewHangoutReport,
    TResult Function(
            BuildContext context,
            List<SubmitCampusHangoutReportRequestModel>
                submitCampusHangoutReportRequestModel)?
        submitCampusHangoutReport,
    TResult Function(BuildContext context, String report_region,
            String report_campus, String report_wing)?
        createCampusHangoutReport,
    required TResult orElse(),
  }) {
    if (createCampusHangoutReport != null) {
      return createCampusHangoutReport(
          context, report_region, report_campus, report_wing);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_viewHangoutReport value) viewHangoutReport,
    required TResult Function(_submitCampusHangoutReport value)
        submitCampusHangoutReport,
    required TResult Function(_createCampusHangoutReport value)
        createCampusHangoutReport,
  }) {
    return createCampusHangoutReport(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_viewHangoutReport value)? viewHangoutReport,
    TResult Function(_submitCampusHangoutReport value)?
        submitCampusHangoutReport,
    TResult Function(_createCampusHangoutReport value)?
        createCampusHangoutReport,
  }) {
    return createCampusHangoutReport?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_viewHangoutReport value)? viewHangoutReport,
    TResult Function(_submitCampusHangoutReport value)?
        submitCampusHangoutReport,
    TResult Function(_createCampusHangoutReport value)?
        createCampusHangoutReport,
    required TResult orElse(),
  }) {
    if (createCampusHangoutReport != null) {
      return createCampusHangoutReport(this);
    }
    return orElse();
  }
}

abstract class _createCampusHangoutReport implements CampusHangoutEvent {
  const factory _createCampusHangoutReport(
      final BuildContext context,
      final String report_region,
      final String report_campus,
      final String report_wing) = _$_createCampusHangoutReport;

  @override
  BuildContext get context => throw _privateConstructorUsedError;
  String get report_region => throw _privateConstructorUsedError;
  String get report_campus => throw _privateConstructorUsedError;
  String get report_wing => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_createCampusHangoutReportCopyWith<_$_createCampusHangoutReport>
      get copyWith => throw _privateConstructorUsedError;
}
