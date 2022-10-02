// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthState {
  LoadingStatus get loadingStatus => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoadingStatus loadingStatus) loading,
    required TResult Function(LoadingStatus loadingStatus)
        fetchRemoteConfigNull,
    required TResult Function(
            LoadingStatus loadingStatus, RemoteConfigModel remoteConfigModel)
        fetchRemoteConfig,
    required TResult Function(LoadingStatus loadingStatus, bool isLoggedIn)
        load,
    required TResult Function(LoadingStatus loadingStatus, bool isLoggedIn)
        loginSuccess,
    required TResult Function(LoadingStatus loadingStatus, bool isSuccess)
        forgetPasswordSuccess,
    required TResult Function(LoadingStatus loadingStatus, bool isSuccess)
        resetPasswordSuccess,
    required TResult Function(LoadingStatus loadingStatus, bool isAvailableBio)
        hasBio,
    required TResult Function(LoadingStatus loadingStatus, String errorMessage)
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(LoadingStatus loadingStatus)? loading,
    TResult Function(LoadingStatus loadingStatus)? fetchRemoteConfigNull,
    TResult Function(
            LoadingStatus loadingStatus, RemoteConfigModel remoteConfigModel)?
        fetchRemoteConfig,
    TResult Function(LoadingStatus loadingStatus, bool isLoggedIn)? load,
    TResult Function(LoadingStatus loadingStatus, bool isLoggedIn)?
        loginSuccess,
    TResult Function(LoadingStatus loadingStatus, bool isSuccess)?
        forgetPasswordSuccess,
    TResult Function(LoadingStatus loadingStatus, bool isSuccess)?
        resetPasswordSuccess,
    TResult Function(LoadingStatus loadingStatus, bool isAvailableBio)? hasBio,
    TResult Function(LoadingStatus loadingStatus, String errorMessage)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoadingStatus loadingStatus)? loading,
    TResult Function(LoadingStatus loadingStatus)? fetchRemoteConfigNull,
    TResult Function(
            LoadingStatus loadingStatus, RemoteConfigModel remoteConfigModel)?
        fetchRemoteConfig,
    TResult Function(LoadingStatus loadingStatus, bool isLoggedIn)? load,
    TResult Function(LoadingStatus loadingStatus, bool isLoggedIn)?
        loginSuccess,
    TResult Function(LoadingStatus loadingStatus, bool isSuccess)?
        forgetPasswordSuccess,
    TResult Function(LoadingStatus loadingStatus, bool isSuccess)?
        resetPasswordSuccess,
    TResult Function(LoadingStatus loadingStatus, bool isAvailableBio)? hasBio,
    TResult Function(LoadingStatus loadingStatus, String errorMessage)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AutStateLoading value) loading,
    required TResult Function(_fetchRemoteConfigNullState value)
        fetchRemoteConfigNull,
    required TResult Function(_fetchRemoteConfigState value) fetchRemoteConfig,
    required TResult Function(_AuthStateLoad value) load,
    required TResult Function(_AuthStateLoginSuccess value) loginSuccess,
    required TResult Function(_AuthStateForgetPasswordSuccess value)
        forgetPasswordSuccess,
    required TResult Function(_AuthStateResetPasswordSuccess value)
        resetPasswordSuccess,
    required TResult Function(_AuthHasBioState value) hasBio,
    required TResult Function(_AuthStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AutStateLoading value)? loading,
    TResult Function(_fetchRemoteConfigNullState value)? fetchRemoteConfigNull,
    TResult Function(_fetchRemoteConfigState value)? fetchRemoteConfig,
    TResult Function(_AuthStateLoad value)? load,
    TResult Function(_AuthStateLoginSuccess value)? loginSuccess,
    TResult Function(_AuthStateForgetPasswordSuccess value)?
        forgetPasswordSuccess,
    TResult Function(_AuthStateResetPasswordSuccess value)?
        resetPasswordSuccess,
    TResult Function(_AuthHasBioState value)? hasBio,
    TResult Function(_AuthStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AutStateLoading value)? loading,
    TResult Function(_fetchRemoteConfigNullState value)? fetchRemoteConfigNull,
    TResult Function(_fetchRemoteConfigState value)? fetchRemoteConfig,
    TResult Function(_AuthStateLoad value)? load,
    TResult Function(_AuthStateLoginSuccess value)? loginSuccess,
    TResult Function(_AuthStateForgetPasswordSuccess value)?
        forgetPasswordSuccess,
    TResult Function(_AuthStateResetPasswordSuccess value)?
        resetPasswordSuccess,
    TResult Function(_AuthHasBioState value)? hasBio,
    TResult Function(_AuthStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthStateCopyWith<AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res>;
  $Res call({LoadingStatus loadingStatus});
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res> implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  final AuthState _value;
  // ignore: unused_field
  final $Res Function(AuthState) _then;

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
abstract class _$$_AutStateLoadingCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$$_AutStateLoadingCopyWith(
          _$_AutStateLoading value, $Res Function(_$_AutStateLoading) then) =
      __$$_AutStateLoadingCopyWithImpl<$Res>;
  @override
  $Res call({LoadingStatus loadingStatus});
}

/// @nodoc
class __$$_AutStateLoadingCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res>
    implements _$$_AutStateLoadingCopyWith<$Res> {
  __$$_AutStateLoadingCopyWithImpl(
      _$_AutStateLoading _value, $Res Function(_$_AutStateLoading) _then)
      : super(_value, (v) => _then(v as _$_AutStateLoading));

  @override
  _$_AutStateLoading get _value => super._value as _$_AutStateLoading;

  @override
  $Res call({
    Object? loadingStatus = freezed,
  }) {
    return _then(_$_AutStateLoading(
      loadingStatus == freezed
          ? _value.loadingStatus
          : loadingStatus // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
    ));
  }
}

/// @nodoc

class _$_AutStateLoading implements _AutStateLoading {
  const _$_AutStateLoading(this.loadingStatus);

  @override
  final LoadingStatus loadingStatus;

  @override
  String toString() {
    return 'AuthState.loading(loadingStatus: $loadingStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AutStateLoading &&
            const DeepCollectionEquality()
                .equals(other.loadingStatus, loadingStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(loadingStatus));

  @JsonKey(ignore: true)
  @override
  _$$_AutStateLoadingCopyWith<_$_AutStateLoading> get copyWith =>
      __$$_AutStateLoadingCopyWithImpl<_$_AutStateLoading>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoadingStatus loadingStatus) loading,
    required TResult Function(LoadingStatus loadingStatus)
        fetchRemoteConfigNull,
    required TResult Function(
            LoadingStatus loadingStatus, RemoteConfigModel remoteConfigModel)
        fetchRemoteConfig,
    required TResult Function(LoadingStatus loadingStatus, bool isLoggedIn)
        load,
    required TResult Function(LoadingStatus loadingStatus, bool isLoggedIn)
        loginSuccess,
    required TResult Function(LoadingStatus loadingStatus, bool isSuccess)
        forgetPasswordSuccess,
    required TResult Function(LoadingStatus loadingStatus, bool isSuccess)
        resetPasswordSuccess,
    required TResult Function(LoadingStatus loadingStatus, bool isAvailableBio)
        hasBio,
    required TResult Function(LoadingStatus loadingStatus, String errorMessage)
        error,
  }) {
    return loading(loadingStatus);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(LoadingStatus loadingStatus)? loading,
    TResult Function(LoadingStatus loadingStatus)? fetchRemoteConfigNull,
    TResult Function(
            LoadingStatus loadingStatus, RemoteConfigModel remoteConfigModel)?
        fetchRemoteConfig,
    TResult Function(LoadingStatus loadingStatus, bool isLoggedIn)? load,
    TResult Function(LoadingStatus loadingStatus, bool isLoggedIn)?
        loginSuccess,
    TResult Function(LoadingStatus loadingStatus, bool isSuccess)?
        forgetPasswordSuccess,
    TResult Function(LoadingStatus loadingStatus, bool isSuccess)?
        resetPasswordSuccess,
    TResult Function(LoadingStatus loadingStatus, bool isAvailableBio)? hasBio,
    TResult Function(LoadingStatus loadingStatus, String errorMessage)? error,
  }) {
    return loading?.call(loadingStatus);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoadingStatus loadingStatus)? loading,
    TResult Function(LoadingStatus loadingStatus)? fetchRemoteConfigNull,
    TResult Function(
            LoadingStatus loadingStatus, RemoteConfigModel remoteConfigModel)?
        fetchRemoteConfig,
    TResult Function(LoadingStatus loadingStatus, bool isLoggedIn)? load,
    TResult Function(LoadingStatus loadingStatus, bool isLoggedIn)?
        loginSuccess,
    TResult Function(LoadingStatus loadingStatus, bool isSuccess)?
        forgetPasswordSuccess,
    TResult Function(LoadingStatus loadingStatus, bool isSuccess)?
        resetPasswordSuccess,
    TResult Function(LoadingStatus loadingStatus, bool isAvailableBio)? hasBio,
    TResult Function(LoadingStatus loadingStatus, String errorMessage)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(loadingStatus);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AutStateLoading value) loading,
    required TResult Function(_fetchRemoteConfigNullState value)
        fetchRemoteConfigNull,
    required TResult Function(_fetchRemoteConfigState value) fetchRemoteConfig,
    required TResult Function(_AuthStateLoad value) load,
    required TResult Function(_AuthStateLoginSuccess value) loginSuccess,
    required TResult Function(_AuthStateForgetPasswordSuccess value)
        forgetPasswordSuccess,
    required TResult Function(_AuthStateResetPasswordSuccess value)
        resetPasswordSuccess,
    required TResult Function(_AuthHasBioState value) hasBio,
    required TResult Function(_AuthStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AutStateLoading value)? loading,
    TResult Function(_fetchRemoteConfigNullState value)? fetchRemoteConfigNull,
    TResult Function(_fetchRemoteConfigState value)? fetchRemoteConfig,
    TResult Function(_AuthStateLoad value)? load,
    TResult Function(_AuthStateLoginSuccess value)? loginSuccess,
    TResult Function(_AuthStateForgetPasswordSuccess value)?
        forgetPasswordSuccess,
    TResult Function(_AuthStateResetPasswordSuccess value)?
        resetPasswordSuccess,
    TResult Function(_AuthHasBioState value)? hasBio,
    TResult Function(_AuthStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AutStateLoading value)? loading,
    TResult Function(_fetchRemoteConfigNullState value)? fetchRemoteConfigNull,
    TResult Function(_fetchRemoteConfigState value)? fetchRemoteConfig,
    TResult Function(_AuthStateLoad value)? load,
    TResult Function(_AuthStateLoginSuccess value)? loginSuccess,
    TResult Function(_AuthStateForgetPasswordSuccess value)?
        forgetPasswordSuccess,
    TResult Function(_AuthStateResetPasswordSuccess value)?
        resetPasswordSuccess,
    TResult Function(_AuthHasBioState value)? hasBio,
    TResult Function(_AuthStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _AutStateLoading implements AuthState {
  const factory _AutStateLoading(final LoadingStatus loadingStatus) =
      _$_AutStateLoading;

  @override
  LoadingStatus get loadingStatus => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_AutStateLoadingCopyWith<_$_AutStateLoading> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_fetchRemoteConfigNullStateCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$$_fetchRemoteConfigNullStateCopyWith(
          _$_fetchRemoteConfigNullState value,
          $Res Function(_$_fetchRemoteConfigNullState) then) =
      __$$_fetchRemoteConfigNullStateCopyWithImpl<$Res>;
  @override
  $Res call({LoadingStatus loadingStatus});
}

/// @nodoc
class __$$_fetchRemoteConfigNullStateCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res>
    implements _$$_fetchRemoteConfigNullStateCopyWith<$Res> {
  __$$_fetchRemoteConfigNullStateCopyWithImpl(
      _$_fetchRemoteConfigNullState _value,
      $Res Function(_$_fetchRemoteConfigNullState) _then)
      : super(_value, (v) => _then(v as _$_fetchRemoteConfigNullState));

  @override
  _$_fetchRemoteConfigNullState get _value =>
      super._value as _$_fetchRemoteConfigNullState;

  @override
  $Res call({
    Object? loadingStatus = freezed,
  }) {
    return _then(_$_fetchRemoteConfigNullState(
      loadingStatus == freezed
          ? _value.loadingStatus
          : loadingStatus // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
    ));
  }
}

/// @nodoc

class _$_fetchRemoteConfigNullState implements _fetchRemoteConfigNullState {
  const _$_fetchRemoteConfigNullState(this.loadingStatus);

  @override
  final LoadingStatus loadingStatus;

  @override
  String toString() {
    return 'AuthState.fetchRemoteConfigNull(loadingStatus: $loadingStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_fetchRemoteConfigNullState &&
            const DeepCollectionEquality()
                .equals(other.loadingStatus, loadingStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(loadingStatus));

  @JsonKey(ignore: true)
  @override
  _$$_fetchRemoteConfigNullStateCopyWith<_$_fetchRemoteConfigNullState>
      get copyWith => __$$_fetchRemoteConfigNullStateCopyWithImpl<
          _$_fetchRemoteConfigNullState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoadingStatus loadingStatus) loading,
    required TResult Function(LoadingStatus loadingStatus)
        fetchRemoteConfigNull,
    required TResult Function(
            LoadingStatus loadingStatus, RemoteConfigModel remoteConfigModel)
        fetchRemoteConfig,
    required TResult Function(LoadingStatus loadingStatus, bool isLoggedIn)
        load,
    required TResult Function(LoadingStatus loadingStatus, bool isLoggedIn)
        loginSuccess,
    required TResult Function(LoadingStatus loadingStatus, bool isSuccess)
        forgetPasswordSuccess,
    required TResult Function(LoadingStatus loadingStatus, bool isSuccess)
        resetPasswordSuccess,
    required TResult Function(LoadingStatus loadingStatus, bool isAvailableBio)
        hasBio,
    required TResult Function(LoadingStatus loadingStatus, String errorMessage)
        error,
  }) {
    return fetchRemoteConfigNull(loadingStatus);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(LoadingStatus loadingStatus)? loading,
    TResult Function(LoadingStatus loadingStatus)? fetchRemoteConfigNull,
    TResult Function(
            LoadingStatus loadingStatus, RemoteConfigModel remoteConfigModel)?
        fetchRemoteConfig,
    TResult Function(LoadingStatus loadingStatus, bool isLoggedIn)? load,
    TResult Function(LoadingStatus loadingStatus, bool isLoggedIn)?
        loginSuccess,
    TResult Function(LoadingStatus loadingStatus, bool isSuccess)?
        forgetPasswordSuccess,
    TResult Function(LoadingStatus loadingStatus, bool isSuccess)?
        resetPasswordSuccess,
    TResult Function(LoadingStatus loadingStatus, bool isAvailableBio)? hasBio,
    TResult Function(LoadingStatus loadingStatus, String errorMessage)? error,
  }) {
    return fetchRemoteConfigNull?.call(loadingStatus);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoadingStatus loadingStatus)? loading,
    TResult Function(LoadingStatus loadingStatus)? fetchRemoteConfigNull,
    TResult Function(
            LoadingStatus loadingStatus, RemoteConfigModel remoteConfigModel)?
        fetchRemoteConfig,
    TResult Function(LoadingStatus loadingStatus, bool isLoggedIn)? load,
    TResult Function(LoadingStatus loadingStatus, bool isLoggedIn)?
        loginSuccess,
    TResult Function(LoadingStatus loadingStatus, bool isSuccess)?
        forgetPasswordSuccess,
    TResult Function(LoadingStatus loadingStatus, bool isSuccess)?
        resetPasswordSuccess,
    TResult Function(LoadingStatus loadingStatus, bool isAvailableBio)? hasBio,
    TResult Function(LoadingStatus loadingStatus, String errorMessage)? error,
    required TResult orElse(),
  }) {
    if (fetchRemoteConfigNull != null) {
      return fetchRemoteConfigNull(loadingStatus);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AutStateLoading value) loading,
    required TResult Function(_fetchRemoteConfigNullState value)
        fetchRemoteConfigNull,
    required TResult Function(_fetchRemoteConfigState value) fetchRemoteConfig,
    required TResult Function(_AuthStateLoad value) load,
    required TResult Function(_AuthStateLoginSuccess value) loginSuccess,
    required TResult Function(_AuthStateForgetPasswordSuccess value)
        forgetPasswordSuccess,
    required TResult Function(_AuthStateResetPasswordSuccess value)
        resetPasswordSuccess,
    required TResult Function(_AuthHasBioState value) hasBio,
    required TResult Function(_AuthStateError value) error,
  }) {
    return fetchRemoteConfigNull(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AutStateLoading value)? loading,
    TResult Function(_fetchRemoteConfigNullState value)? fetchRemoteConfigNull,
    TResult Function(_fetchRemoteConfigState value)? fetchRemoteConfig,
    TResult Function(_AuthStateLoad value)? load,
    TResult Function(_AuthStateLoginSuccess value)? loginSuccess,
    TResult Function(_AuthStateForgetPasswordSuccess value)?
        forgetPasswordSuccess,
    TResult Function(_AuthStateResetPasswordSuccess value)?
        resetPasswordSuccess,
    TResult Function(_AuthHasBioState value)? hasBio,
    TResult Function(_AuthStateError value)? error,
  }) {
    return fetchRemoteConfigNull?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AutStateLoading value)? loading,
    TResult Function(_fetchRemoteConfigNullState value)? fetchRemoteConfigNull,
    TResult Function(_fetchRemoteConfigState value)? fetchRemoteConfig,
    TResult Function(_AuthStateLoad value)? load,
    TResult Function(_AuthStateLoginSuccess value)? loginSuccess,
    TResult Function(_AuthStateForgetPasswordSuccess value)?
        forgetPasswordSuccess,
    TResult Function(_AuthStateResetPasswordSuccess value)?
        resetPasswordSuccess,
    TResult Function(_AuthHasBioState value)? hasBio,
    TResult Function(_AuthStateError value)? error,
    required TResult orElse(),
  }) {
    if (fetchRemoteConfigNull != null) {
      return fetchRemoteConfigNull(this);
    }
    return orElse();
  }
}

abstract class _fetchRemoteConfigNullState implements AuthState {
  const factory _fetchRemoteConfigNullState(final LoadingStatus loadingStatus) =
      _$_fetchRemoteConfigNullState;

  @override
  LoadingStatus get loadingStatus => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_fetchRemoteConfigNullStateCopyWith<_$_fetchRemoteConfigNullState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_fetchRemoteConfigStateCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$$_fetchRemoteConfigStateCopyWith(_$_fetchRemoteConfigState value,
          $Res Function(_$_fetchRemoteConfigState) then) =
      __$$_fetchRemoteConfigStateCopyWithImpl<$Res>;
  @override
  $Res call({LoadingStatus loadingStatus, RemoteConfigModel remoteConfigModel});
}

/// @nodoc
class __$$_fetchRemoteConfigStateCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res>
    implements _$$_fetchRemoteConfigStateCopyWith<$Res> {
  __$$_fetchRemoteConfigStateCopyWithImpl(_$_fetchRemoteConfigState _value,
      $Res Function(_$_fetchRemoteConfigState) _then)
      : super(_value, (v) => _then(v as _$_fetchRemoteConfigState));

  @override
  _$_fetchRemoteConfigState get _value =>
      super._value as _$_fetchRemoteConfigState;

  @override
  $Res call({
    Object? loadingStatus = freezed,
    Object? remoteConfigModel = freezed,
  }) {
    return _then(_$_fetchRemoteConfigState(
      loadingStatus == freezed
          ? _value.loadingStatus
          : loadingStatus // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
      remoteConfigModel == freezed
          ? _value.remoteConfigModel
          : remoteConfigModel // ignore: cast_nullable_to_non_nullable
              as RemoteConfigModel,
    ));
  }
}

/// @nodoc

class _$_fetchRemoteConfigState implements _fetchRemoteConfigState {
  const _$_fetchRemoteConfigState(this.loadingStatus, this.remoteConfigModel);

  @override
  final LoadingStatus loadingStatus;
  @override
  final RemoteConfigModel remoteConfigModel;

  @override
  String toString() {
    return 'AuthState.fetchRemoteConfig(loadingStatus: $loadingStatus, remoteConfigModel: $remoteConfigModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_fetchRemoteConfigState &&
            const DeepCollectionEquality()
                .equals(other.loadingStatus, loadingStatus) &&
            const DeepCollectionEquality()
                .equals(other.remoteConfigModel, remoteConfigModel));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(loadingStatus),
      const DeepCollectionEquality().hash(remoteConfigModel));

  @JsonKey(ignore: true)
  @override
  _$$_fetchRemoteConfigStateCopyWith<_$_fetchRemoteConfigState> get copyWith =>
      __$$_fetchRemoteConfigStateCopyWithImpl<_$_fetchRemoteConfigState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoadingStatus loadingStatus) loading,
    required TResult Function(LoadingStatus loadingStatus)
        fetchRemoteConfigNull,
    required TResult Function(
            LoadingStatus loadingStatus, RemoteConfigModel remoteConfigModel)
        fetchRemoteConfig,
    required TResult Function(LoadingStatus loadingStatus, bool isLoggedIn)
        load,
    required TResult Function(LoadingStatus loadingStatus, bool isLoggedIn)
        loginSuccess,
    required TResult Function(LoadingStatus loadingStatus, bool isSuccess)
        forgetPasswordSuccess,
    required TResult Function(LoadingStatus loadingStatus, bool isSuccess)
        resetPasswordSuccess,
    required TResult Function(LoadingStatus loadingStatus, bool isAvailableBio)
        hasBio,
    required TResult Function(LoadingStatus loadingStatus, String errorMessage)
        error,
  }) {
    return fetchRemoteConfig(loadingStatus, remoteConfigModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(LoadingStatus loadingStatus)? loading,
    TResult Function(LoadingStatus loadingStatus)? fetchRemoteConfigNull,
    TResult Function(
            LoadingStatus loadingStatus, RemoteConfigModel remoteConfigModel)?
        fetchRemoteConfig,
    TResult Function(LoadingStatus loadingStatus, bool isLoggedIn)? load,
    TResult Function(LoadingStatus loadingStatus, bool isLoggedIn)?
        loginSuccess,
    TResult Function(LoadingStatus loadingStatus, bool isSuccess)?
        forgetPasswordSuccess,
    TResult Function(LoadingStatus loadingStatus, bool isSuccess)?
        resetPasswordSuccess,
    TResult Function(LoadingStatus loadingStatus, bool isAvailableBio)? hasBio,
    TResult Function(LoadingStatus loadingStatus, String errorMessage)? error,
  }) {
    return fetchRemoteConfig?.call(loadingStatus, remoteConfigModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoadingStatus loadingStatus)? loading,
    TResult Function(LoadingStatus loadingStatus)? fetchRemoteConfigNull,
    TResult Function(
            LoadingStatus loadingStatus, RemoteConfigModel remoteConfigModel)?
        fetchRemoteConfig,
    TResult Function(LoadingStatus loadingStatus, bool isLoggedIn)? load,
    TResult Function(LoadingStatus loadingStatus, bool isLoggedIn)?
        loginSuccess,
    TResult Function(LoadingStatus loadingStatus, bool isSuccess)?
        forgetPasswordSuccess,
    TResult Function(LoadingStatus loadingStatus, bool isSuccess)?
        resetPasswordSuccess,
    TResult Function(LoadingStatus loadingStatus, bool isAvailableBio)? hasBio,
    TResult Function(LoadingStatus loadingStatus, String errorMessage)? error,
    required TResult orElse(),
  }) {
    if (fetchRemoteConfig != null) {
      return fetchRemoteConfig(loadingStatus, remoteConfigModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AutStateLoading value) loading,
    required TResult Function(_fetchRemoteConfigNullState value)
        fetchRemoteConfigNull,
    required TResult Function(_fetchRemoteConfigState value) fetchRemoteConfig,
    required TResult Function(_AuthStateLoad value) load,
    required TResult Function(_AuthStateLoginSuccess value) loginSuccess,
    required TResult Function(_AuthStateForgetPasswordSuccess value)
        forgetPasswordSuccess,
    required TResult Function(_AuthStateResetPasswordSuccess value)
        resetPasswordSuccess,
    required TResult Function(_AuthHasBioState value) hasBio,
    required TResult Function(_AuthStateError value) error,
  }) {
    return fetchRemoteConfig(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AutStateLoading value)? loading,
    TResult Function(_fetchRemoteConfigNullState value)? fetchRemoteConfigNull,
    TResult Function(_fetchRemoteConfigState value)? fetchRemoteConfig,
    TResult Function(_AuthStateLoad value)? load,
    TResult Function(_AuthStateLoginSuccess value)? loginSuccess,
    TResult Function(_AuthStateForgetPasswordSuccess value)?
        forgetPasswordSuccess,
    TResult Function(_AuthStateResetPasswordSuccess value)?
        resetPasswordSuccess,
    TResult Function(_AuthHasBioState value)? hasBio,
    TResult Function(_AuthStateError value)? error,
  }) {
    return fetchRemoteConfig?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AutStateLoading value)? loading,
    TResult Function(_fetchRemoteConfigNullState value)? fetchRemoteConfigNull,
    TResult Function(_fetchRemoteConfigState value)? fetchRemoteConfig,
    TResult Function(_AuthStateLoad value)? load,
    TResult Function(_AuthStateLoginSuccess value)? loginSuccess,
    TResult Function(_AuthStateForgetPasswordSuccess value)?
        forgetPasswordSuccess,
    TResult Function(_AuthStateResetPasswordSuccess value)?
        resetPasswordSuccess,
    TResult Function(_AuthHasBioState value)? hasBio,
    TResult Function(_AuthStateError value)? error,
    required TResult orElse(),
  }) {
    if (fetchRemoteConfig != null) {
      return fetchRemoteConfig(this);
    }
    return orElse();
  }
}

abstract class _fetchRemoteConfigState implements AuthState {
  const factory _fetchRemoteConfigState(final LoadingStatus loadingStatus,
      final RemoteConfigModel remoteConfigModel) = _$_fetchRemoteConfigState;

  @override
  LoadingStatus get loadingStatus => throw _privateConstructorUsedError;
  RemoteConfigModel get remoteConfigModel => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_fetchRemoteConfigStateCopyWith<_$_fetchRemoteConfigState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AuthStateLoadCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$$_AuthStateLoadCopyWith(
          _$_AuthStateLoad value, $Res Function(_$_AuthStateLoad) then) =
      __$$_AuthStateLoadCopyWithImpl<$Res>;
  @override
  $Res call({LoadingStatus loadingStatus, bool isLoggedIn});
}

/// @nodoc
class __$$_AuthStateLoadCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements _$$_AuthStateLoadCopyWith<$Res> {
  __$$_AuthStateLoadCopyWithImpl(
      _$_AuthStateLoad _value, $Res Function(_$_AuthStateLoad) _then)
      : super(_value, (v) => _then(v as _$_AuthStateLoad));

  @override
  _$_AuthStateLoad get _value => super._value as _$_AuthStateLoad;

  @override
  $Res call({
    Object? loadingStatus = freezed,
    Object? isLoggedIn = freezed,
  }) {
    return _then(_$_AuthStateLoad(
      loadingStatus == freezed
          ? _value.loadingStatus
          : loadingStatus // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
      isLoggedIn == freezed
          ? _value.isLoggedIn
          : isLoggedIn // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_AuthStateLoad implements _AuthStateLoad {
  const _$_AuthStateLoad(this.loadingStatus, this.isLoggedIn);

  @override
  final LoadingStatus loadingStatus;
  @override
  final bool isLoggedIn;

  @override
  String toString() {
    return 'AuthState.load(loadingStatus: $loadingStatus, isLoggedIn: $isLoggedIn)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthStateLoad &&
            const DeepCollectionEquality()
                .equals(other.loadingStatus, loadingStatus) &&
            const DeepCollectionEquality()
                .equals(other.isLoggedIn, isLoggedIn));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(loadingStatus),
      const DeepCollectionEquality().hash(isLoggedIn));

  @JsonKey(ignore: true)
  @override
  _$$_AuthStateLoadCopyWith<_$_AuthStateLoad> get copyWith =>
      __$$_AuthStateLoadCopyWithImpl<_$_AuthStateLoad>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoadingStatus loadingStatus) loading,
    required TResult Function(LoadingStatus loadingStatus)
        fetchRemoteConfigNull,
    required TResult Function(
            LoadingStatus loadingStatus, RemoteConfigModel remoteConfigModel)
        fetchRemoteConfig,
    required TResult Function(LoadingStatus loadingStatus, bool isLoggedIn)
        load,
    required TResult Function(LoadingStatus loadingStatus, bool isLoggedIn)
        loginSuccess,
    required TResult Function(LoadingStatus loadingStatus, bool isSuccess)
        forgetPasswordSuccess,
    required TResult Function(LoadingStatus loadingStatus, bool isSuccess)
        resetPasswordSuccess,
    required TResult Function(LoadingStatus loadingStatus, bool isAvailableBio)
        hasBio,
    required TResult Function(LoadingStatus loadingStatus, String errorMessage)
        error,
  }) {
    return load(loadingStatus, isLoggedIn);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(LoadingStatus loadingStatus)? loading,
    TResult Function(LoadingStatus loadingStatus)? fetchRemoteConfigNull,
    TResult Function(
            LoadingStatus loadingStatus, RemoteConfigModel remoteConfigModel)?
        fetchRemoteConfig,
    TResult Function(LoadingStatus loadingStatus, bool isLoggedIn)? load,
    TResult Function(LoadingStatus loadingStatus, bool isLoggedIn)?
        loginSuccess,
    TResult Function(LoadingStatus loadingStatus, bool isSuccess)?
        forgetPasswordSuccess,
    TResult Function(LoadingStatus loadingStatus, bool isSuccess)?
        resetPasswordSuccess,
    TResult Function(LoadingStatus loadingStatus, bool isAvailableBio)? hasBio,
    TResult Function(LoadingStatus loadingStatus, String errorMessage)? error,
  }) {
    return load?.call(loadingStatus, isLoggedIn);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoadingStatus loadingStatus)? loading,
    TResult Function(LoadingStatus loadingStatus)? fetchRemoteConfigNull,
    TResult Function(
            LoadingStatus loadingStatus, RemoteConfigModel remoteConfigModel)?
        fetchRemoteConfig,
    TResult Function(LoadingStatus loadingStatus, bool isLoggedIn)? load,
    TResult Function(LoadingStatus loadingStatus, bool isLoggedIn)?
        loginSuccess,
    TResult Function(LoadingStatus loadingStatus, bool isSuccess)?
        forgetPasswordSuccess,
    TResult Function(LoadingStatus loadingStatus, bool isSuccess)?
        resetPasswordSuccess,
    TResult Function(LoadingStatus loadingStatus, bool isAvailableBio)? hasBio,
    TResult Function(LoadingStatus loadingStatus, String errorMessage)? error,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(loadingStatus, isLoggedIn);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AutStateLoading value) loading,
    required TResult Function(_fetchRemoteConfigNullState value)
        fetchRemoteConfigNull,
    required TResult Function(_fetchRemoteConfigState value) fetchRemoteConfig,
    required TResult Function(_AuthStateLoad value) load,
    required TResult Function(_AuthStateLoginSuccess value) loginSuccess,
    required TResult Function(_AuthStateForgetPasswordSuccess value)
        forgetPasswordSuccess,
    required TResult Function(_AuthStateResetPasswordSuccess value)
        resetPasswordSuccess,
    required TResult Function(_AuthHasBioState value) hasBio,
    required TResult Function(_AuthStateError value) error,
  }) {
    return load(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AutStateLoading value)? loading,
    TResult Function(_fetchRemoteConfigNullState value)? fetchRemoteConfigNull,
    TResult Function(_fetchRemoteConfigState value)? fetchRemoteConfig,
    TResult Function(_AuthStateLoad value)? load,
    TResult Function(_AuthStateLoginSuccess value)? loginSuccess,
    TResult Function(_AuthStateForgetPasswordSuccess value)?
        forgetPasswordSuccess,
    TResult Function(_AuthStateResetPasswordSuccess value)?
        resetPasswordSuccess,
    TResult Function(_AuthHasBioState value)? hasBio,
    TResult Function(_AuthStateError value)? error,
  }) {
    return load?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AutStateLoading value)? loading,
    TResult Function(_fetchRemoteConfigNullState value)? fetchRemoteConfigNull,
    TResult Function(_fetchRemoteConfigState value)? fetchRemoteConfig,
    TResult Function(_AuthStateLoad value)? load,
    TResult Function(_AuthStateLoginSuccess value)? loginSuccess,
    TResult Function(_AuthStateForgetPasswordSuccess value)?
        forgetPasswordSuccess,
    TResult Function(_AuthStateResetPasswordSuccess value)?
        resetPasswordSuccess,
    TResult Function(_AuthHasBioState value)? hasBio,
    TResult Function(_AuthStateError value)? error,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(this);
    }
    return orElse();
  }
}

abstract class _AuthStateLoad implements AuthState {
  const factory _AuthStateLoad(
          final LoadingStatus loadingStatus, final bool isLoggedIn) =
      _$_AuthStateLoad;

  @override
  LoadingStatus get loadingStatus => throw _privateConstructorUsedError;
  bool get isLoggedIn => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_AuthStateLoadCopyWith<_$_AuthStateLoad> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AuthStateLoginSuccessCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$$_AuthStateLoginSuccessCopyWith(_$_AuthStateLoginSuccess value,
          $Res Function(_$_AuthStateLoginSuccess) then) =
      __$$_AuthStateLoginSuccessCopyWithImpl<$Res>;
  @override
  $Res call({LoadingStatus loadingStatus, bool isLoggedIn});
}

/// @nodoc
class __$$_AuthStateLoginSuccessCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res>
    implements _$$_AuthStateLoginSuccessCopyWith<$Res> {
  __$$_AuthStateLoginSuccessCopyWithImpl(_$_AuthStateLoginSuccess _value,
      $Res Function(_$_AuthStateLoginSuccess) _then)
      : super(_value, (v) => _then(v as _$_AuthStateLoginSuccess));

  @override
  _$_AuthStateLoginSuccess get _value =>
      super._value as _$_AuthStateLoginSuccess;

  @override
  $Res call({
    Object? loadingStatus = freezed,
    Object? isLoggedIn = freezed,
  }) {
    return _then(_$_AuthStateLoginSuccess(
      loadingStatus == freezed
          ? _value.loadingStatus
          : loadingStatus // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
      isLoggedIn == freezed
          ? _value.isLoggedIn
          : isLoggedIn // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_AuthStateLoginSuccess implements _AuthStateLoginSuccess {
  const _$_AuthStateLoginSuccess(this.loadingStatus, this.isLoggedIn);

  @override
  final LoadingStatus loadingStatus;
  @override
  final bool isLoggedIn;

  @override
  String toString() {
    return 'AuthState.loginSuccess(loadingStatus: $loadingStatus, isLoggedIn: $isLoggedIn)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthStateLoginSuccess &&
            const DeepCollectionEquality()
                .equals(other.loadingStatus, loadingStatus) &&
            const DeepCollectionEquality()
                .equals(other.isLoggedIn, isLoggedIn));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(loadingStatus),
      const DeepCollectionEquality().hash(isLoggedIn));

  @JsonKey(ignore: true)
  @override
  _$$_AuthStateLoginSuccessCopyWith<_$_AuthStateLoginSuccess> get copyWith =>
      __$$_AuthStateLoginSuccessCopyWithImpl<_$_AuthStateLoginSuccess>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoadingStatus loadingStatus) loading,
    required TResult Function(LoadingStatus loadingStatus)
        fetchRemoteConfigNull,
    required TResult Function(
            LoadingStatus loadingStatus, RemoteConfigModel remoteConfigModel)
        fetchRemoteConfig,
    required TResult Function(LoadingStatus loadingStatus, bool isLoggedIn)
        load,
    required TResult Function(LoadingStatus loadingStatus, bool isLoggedIn)
        loginSuccess,
    required TResult Function(LoadingStatus loadingStatus, bool isSuccess)
        forgetPasswordSuccess,
    required TResult Function(LoadingStatus loadingStatus, bool isSuccess)
        resetPasswordSuccess,
    required TResult Function(LoadingStatus loadingStatus, bool isAvailableBio)
        hasBio,
    required TResult Function(LoadingStatus loadingStatus, String errorMessage)
        error,
  }) {
    return loginSuccess(loadingStatus, isLoggedIn);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(LoadingStatus loadingStatus)? loading,
    TResult Function(LoadingStatus loadingStatus)? fetchRemoteConfigNull,
    TResult Function(
            LoadingStatus loadingStatus, RemoteConfigModel remoteConfigModel)?
        fetchRemoteConfig,
    TResult Function(LoadingStatus loadingStatus, bool isLoggedIn)? load,
    TResult Function(LoadingStatus loadingStatus, bool isLoggedIn)?
        loginSuccess,
    TResult Function(LoadingStatus loadingStatus, bool isSuccess)?
        forgetPasswordSuccess,
    TResult Function(LoadingStatus loadingStatus, bool isSuccess)?
        resetPasswordSuccess,
    TResult Function(LoadingStatus loadingStatus, bool isAvailableBio)? hasBio,
    TResult Function(LoadingStatus loadingStatus, String errorMessage)? error,
  }) {
    return loginSuccess?.call(loadingStatus, isLoggedIn);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoadingStatus loadingStatus)? loading,
    TResult Function(LoadingStatus loadingStatus)? fetchRemoteConfigNull,
    TResult Function(
            LoadingStatus loadingStatus, RemoteConfigModel remoteConfigModel)?
        fetchRemoteConfig,
    TResult Function(LoadingStatus loadingStatus, bool isLoggedIn)? load,
    TResult Function(LoadingStatus loadingStatus, bool isLoggedIn)?
        loginSuccess,
    TResult Function(LoadingStatus loadingStatus, bool isSuccess)?
        forgetPasswordSuccess,
    TResult Function(LoadingStatus loadingStatus, bool isSuccess)?
        resetPasswordSuccess,
    TResult Function(LoadingStatus loadingStatus, bool isAvailableBio)? hasBio,
    TResult Function(LoadingStatus loadingStatus, String errorMessage)? error,
    required TResult orElse(),
  }) {
    if (loginSuccess != null) {
      return loginSuccess(loadingStatus, isLoggedIn);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AutStateLoading value) loading,
    required TResult Function(_fetchRemoteConfigNullState value)
        fetchRemoteConfigNull,
    required TResult Function(_fetchRemoteConfigState value) fetchRemoteConfig,
    required TResult Function(_AuthStateLoad value) load,
    required TResult Function(_AuthStateLoginSuccess value) loginSuccess,
    required TResult Function(_AuthStateForgetPasswordSuccess value)
        forgetPasswordSuccess,
    required TResult Function(_AuthStateResetPasswordSuccess value)
        resetPasswordSuccess,
    required TResult Function(_AuthHasBioState value) hasBio,
    required TResult Function(_AuthStateError value) error,
  }) {
    return loginSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AutStateLoading value)? loading,
    TResult Function(_fetchRemoteConfigNullState value)? fetchRemoteConfigNull,
    TResult Function(_fetchRemoteConfigState value)? fetchRemoteConfig,
    TResult Function(_AuthStateLoad value)? load,
    TResult Function(_AuthStateLoginSuccess value)? loginSuccess,
    TResult Function(_AuthStateForgetPasswordSuccess value)?
        forgetPasswordSuccess,
    TResult Function(_AuthStateResetPasswordSuccess value)?
        resetPasswordSuccess,
    TResult Function(_AuthHasBioState value)? hasBio,
    TResult Function(_AuthStateError value)? error,
  }) {
    return loginSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AutStateLoading value)? loading,
    TResult Function(_fetchRemoteConfigNullState value)? fetchRemoteConfigNull,
    TResult Function(_fetchRemoteConfigState value)? fetchRemoteConfig,
    TResult Function(_AuthStateLoad value)? load,
    TResult Function(_AuthStateLoginSuccess value)? loginSuccess,
    TResult Function(_AuthStateForgetPasswordSuccess value)?
        forgetPasswordSuccess,
    TResult Function(_AuthStateResetPasswordSuccess value)?
        resetPasswordSuccess,
    TResult Function(_AuthHasBioState value)? hasBio,
    TResult Function(_AuthStateError value)? error,
    required TResult orElse(),
  }) {
    if (loginSuccess != null) {
      return loginSuccess(this);
    }
    return orElse();
  }
}

abstract class _AuthStateLoginSuccess implements AuthState {
  const factory _AuthStateLoginSuccess(
          final LoadingStatus loadingStatus, final bool isLoggedIn) =
      _$_AuthStateLoginSuccess;

  @override
  LoadingStatus get loadingStatus => throw _privateConstructorUsedError;
  bool get isLoggedIn => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_AuthStateLoginSuccessCopyWith<_$_AuthStateLoginSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AuthStateForgetPasswordSuccessCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$$_AuthStateForgetPasswordSuccessCopyWith(
          _$_AuthStateForgetPasswordSuccess value,
          $Res Function(_$_AuthStateForgetPasswordSuccess) then) =
      __$$_AuthStateForgetPasswordSuccessCopyWithImpl<$Res>;
  @override
  $Res call({LoadingStatus loadingStatus, bool isSuccess});
}

/// @nodoc
class __$$_AuthStateForgetPasswordSuccessCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res>
    implements _$$_AuthStateForgetPasswordSuccessCopyWith<$Res> {
  __$$_AuthStateForgetPasswordSuccessCopyWithImpl(
      _$_AuthStateForgetPasswordSuccess _value,
      $Res Function(_$_AuthStateForgetPasswordSuccess) _then)
      : super(_value, (v) => _then(v as _$_AuthStateForgetPasswordSuccess));

  @override
  _$_AuthStateForgetPasswordSuccess get _value =>
      super._value as _$_AuthStateForgetPasswordSuccess;

  @override
  $Res call({
    Object? loadingStatus = freezed,
    Object? isSuccess = freezed,
  }) {
    return _then(_$_AuthStateForgetPasswordSuccess(
      loadingStatus == freezed
          ? _value.loadingStatus
          : loadingStatus // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
      isSuccess == freezed
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_AuthStateForgetPasswordSuccess
    implements _AuthStateForgetPasswordSuccess {
  const _$_AuthStateForgetPasswordSuccess(this.loadingStatus, this.isSuccess);

  @override
  final LoadingStatus loadingStatus;
  @override
  final bool isSuccess;

  @override
  String toString() {
    return 'AuthState.forgetPasswordSuccess(loadingStatus: $loadingStatus, isSuccess: $isSuccess)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthStateForgetPasswordSuccess &&
            const DeepCollectionEquality()
                .equals(other.loadingStatus, loadingStatus) &&
            const DeepCollectionEquality().equals(other.isSuccess, isSuccess));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(loadingStatus),
      const DeepCollectionEquality().hash(isSuccess));

  @JsonKey(ignore: true)
  @override
  _$$_AuthStateForgetPasswordSuccessCopyWith<_$_AuthStateForgetPasswordSuccess>
      get copyWith => __$$_AuthStateForgetPasswordSuccessCopyWithImpl<
          _$_AuthStateForgetPasswordSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoadingStatus loadingStatus) loading,
    required TResult Function(LoadingStatus loadingStatus)
        fetchRemoteConfigNull,
    required TResult Function(
            LoadingStatus loadingStatus, RemoteConfigModel remoteConfigModel)
        fetchRemoteConfig,
    required TResult Function(LoadingStatus loadingStatus, bool isLoggedIn)
        load,
    required TResult Function(LoadingStatus loadingStatus, bool isLoggedIn)
        loginSuccess,
    required TResult Function(LoadingStatus loadingStatus, bool isSuccess)
        forgetPasswordSuccess,
    required TResult Function(LoadingStatus loadingStatus, bool isSuccess)
        resetPasswordSuccess,
    required TResult Function(LoadingStatus loadingStatus, bool isAvailableBio)
        hasBio,
    required TResult Function(LoadingStatus loadingStatus, String errorMessage)
        error,
  }) {
    return forgetPasswordSuccess(loadingStatus, isSuccess);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(LoadingStatus loadingStatus)? loading,
    TResult Function(LoadingStatus loadingStatus)? fetchRemoteConfigNull,
    TResult Function(
            LoadingStatus loadingStatus, RemoteConfigModel remoteConfigModel)?
        fetchRemoteConfig,
    TResult Function(LoadingStatus loadingStatus, bool isLoggedIn)? load,
    TResult Function(LoadingStatus loadingStatus, bool isLoggedIn)?
        loginSuccess,
    TResult Function(LoadingStatus loadingStatus, bool isSuccess)?
        forgetPasswordSuccess,
    TResult Function(LoadingStatus loadingStatus, bool isSuccess)?
        resetPasswordSuccess,
    TResult Function(LoadingStatus loadingStatus, bool isAvailableBio)? hasBio,
    TResult Function(LoadingStatus loadingStatus, String errorMessage)? error,
  }) {
    return forgetPasswordSuccess?.call(loadingStatus, isSuccess);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoadingStatus loadingStatus)? loading,
    TResult Function(LoadingStatus loadingStatus)? fetchRemoteConfigNull,
    TResult Function(
            LoadingStatus loadingStatus, RemoteConfigModel remoteConfigModel)?
        fetchRemoteConfig,
    TResult Function(LoadingStatus loadingStatus, bool isLoggedIn)? load,
    TResult Function(LoadingStatus loadingStatus, bool isLoggedIn)?
        loginSuccess,
    TResult Function(LoadingStatus loadingStatus, bool isSuccess)?
        forgetPasswordSuccess,
    TResult Function(LoadingStatus loadingStatus, bool isSuccess)?
        resetPasswordSuccess,
    TResult Function(LoadingStatus loadingStatus, bool isAvailableBio)? hasBio,
    TResult Function(LoadingStatus loadingStatus, String errorMessage)? error,
    required TResult orElse(),
  }) {
    if (forgetPasswordSuccess != null) {
      return forgetPasswordSuccess(loadingStatus, isSuccess);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AutStateLoading value) loading,
    required TResult Function(_fetchRemoteConfigNullState value)
        fetchRemoteConfigNull,
    required TResult Function(_fetchRemoteConfigState value) fetchRemoteConfig,
    required TResult Function(_AuthStateLoad value) load,
    required TResult Function(_AuthStateLoginSuccess value) loginSuccess,
    required TResult Function(_AuthStateForgetPasswordSuccess value)
        forgetPasswordSuccess,
    required TResult Function(_AuthStateResetPasswordSuccess value)
        resetPasswordSuccess,
    required TResult Function(_AuthHasBioState value) hasBio,
    required TResult Function(_AuthStateError value) error,
  }) {
    return forgetPasswordSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AutStateLoading value)? loading,
    TResult Function(_fetchRemoteConfigNullState value)? fetchRemoteConfigNull,
    TResult Function(_fetchRemoteConfigState value)? fetchRemoteConfig,
    TResult Function(_AuthStateLoad value)? load,
    TResult Function(_AuthStateLoginSuccess value)? loginSuccess,
    TResult Function(_AuthStateForgetPasswordSuccess value)?
        forgetPasswordSuccess,
    TResult Function(_AuthStateResetPasswordSuccess value)?
        resetPasswordSuccess,
    TResult Function(_AuthHasBioState value)? hasBio,
    TResult Function(_AuthStateError value)? error,
  }) {
    return forgetPasswordSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AutStateLoading value)? loading,
    TResult Function(_fetchRemoteConfigNullState value)? fetchRemoteConfigNull,
    TResult Function(_fetchRemoteConfigState value)? fetchRemoteConfig,
    TResult Function(_AuthStateLoad value)? load,
    TResult Function(_AuthStateLoginSuccess value)? loginSuccess,
    TResult Function(_AuthStateForgetPasswordSuccess value)?
        forgetPasswordSuccess,
    TResult Function(_AuthStateResetPasswordSuccess value)?
        resetPasswordSuccess,
    TResult Function(_AuthHasBioState value)? hasBio,
    TResult Function(_AuthStateError value)? error,
    required TResult orElse(),
  }) {
    if (forgetPasswordSuccess != null) {
      return forgetPasswordSuccess(this);
    }
    return orElse();
  }
}

abstract class _AuthStateForgetPasswordSuccess implements AuthState {
  const factory _AuthStateForgetPasswordSuccess(
          final LoadingStatus loadingStatus, final bool isSuccess) =
      _$_AuthStateForgetPasswordSuccess;

  @override
  LoadingStatus get loadingStatus => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_AuthStateForgetPasswordSuccessCopyWith<_$_AuthStateForgetPasswordSuccess>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AuthStateResetPasswordSuccessCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$$_AuthStateResetPasswordSuccessCopyWith(
          _$_AuthStateResetPasswordSuccess value,
          $Res Function(_$_AuthStateResetPasswordSuccess) then) =
      __$$_AuthStateResetPasswordSuccessCopyWithImpl<$Res>;
  @override
  $Res call({LoadingStatus loadingStatus, bool isSuccess});
}

/// @nodoc
class __$$_AuthStateResetPasswordSuccessCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res>
    implements _$$_AuthStateResetPasswordSuccessCopyWith<$Res> {
  __$$_AuthStateResetPasswordSuccessCopyWithImpl(
      _$_AuthStateResetPasswordSuccess _value,
      $Res Function(_$_AuthStateResetPasswordSuccess) _then)
      : super(_value, (v) => _then(v as _$_AuthStateResetPasswordSuccess));

  @override
  _$_AuthStateResetPasswordSuccess get _value =>
      super._value as _$_AuthStateResetPasswordSuccess;

  @override
  $Res call({
    Object? loadingStatus = freezed,
    Object? isSuccess = freezed,
  }) {
    return _then(_$_AuthStateResetPasswordSuccess(
      loadingStatus == freezed
          ? _value.loadingStatus
          : loadingStatus // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
      isSuccess == freezed
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_AuthStateResetPasswordSuccess
    implements _AuthStateResetPasswordSuccess {
  const _$_AuthStateResetPasswordSuccess(this.loadingStatus, this.isSuccess);

  @override
  final LoadingStatus loadingStatus;
  @override
  final bool isSuccess;

  @override
  String toString() {
    return 'AuthState.resetPasswordSuccess(loadingStatus: $loadingStatus, isSuccess: $isSuccess)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthStateResetPasswordSuccess &&
            const DeepCollectionEquality()
                .equals(other.loadingStatus, loadingStatus) &&
            const DeepCollectionEquality().equals(other.isSuccess, isSuccess));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(loadingStatus),
      const DeepCollectionEquality().hash(isSuccess));

  @JsonKey(ignore: true)
  @override
  _$$_AuthStateResetPasswordSuccessCopyWith<_$_AuthStateResetPasswordSuccess>
      get copyWith => __$$_AuthStateResetPasswordSuccessCopyWithImpl<
          _$_AuthStateResetPasswordSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoadingStatus loadingStatus) loading,
    required TResult Function(LoadingStatus loadingStatus)
        fetchRemoteConfigNull,
    required TResult Function(
            LoadingStatus loadingStatus, RemoteConfigModel remoteConfigModel)
        fetchRemoteConfig,
    required TResult Function(LoadingStatus loadingStatus, bool isLoggedIn)
        load,
    required TResult Function(LoadingStatus loadingStatus, bool isLoggedIn)
        loginSuccess,
    required TResult Function(LoadingStatus loadingStatus, bool isSuccess)
        forgetPasswordSuccess,
    required TResult Function(LoadingStatus loadingStatus, bool isSuccess)
        resetPasswordSuccess,
    required TResult Function(LoadingStatus loadingStatus, bool isAvailableBio)
        hasBio,
    required TResult Function(LoadingStatus loadingStatus, String errorMessage)
        error,
  }) {
    return resetPasswordSuccess(loadingStatus, isSuccess);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(LoadingStatus loadingStatus)? loading,
    TResult Function(LoadingStatus loadingStatus)? fetchRemoteConfigNull,
    TResult Function(
            LoadingStatus loadingStatus, RemoteConfigModel remoteConfigModel)?
        fetchRemoteConfig,
    TResult Function(LoadingStatus loadingStatus, bool isLoggedIn)? load,
    TResult Function(LoadingStatus loadingStatus, bool isLoggedIn)?
        loginSuccess,
    TResult Function(LoadingStatus loadingStatus, bool isSuccess)?
        forgetPasswordSuccess,
    TResult Function(LoadingStatus loadingStatus, bool isSuccess)?
        resetPasswordSuccess,
    TResult Function(LoadingStatus loadingStatus, bool isAvailableBio)? hasBio,
    TResult Function(LoadingStatus loadingStatus, String errorMessage)? error,
  }) {
    return resetPasswordSuccess?.call(loadingStatus, isSuccess);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoadingStatus loadingStatus)? loading,
    TResult Function(LoadingStatus loadingStatus)? fetchRemoteConfigNull,
    TResult Function(
            LoadingStatus loadingStatus, RemoteConfigModel remoteConfigModel)?
        fetchRemoteConfig,
    TResult Function(LoadingStatus loadingStatus, bool isLoggedIn)? load,
    TResult Function(LoadingStatus loadingStatus, bool isLoggedIn)?
        loginSuccess,
    TResult Function(LoadingStatus loadingStatus, bool isSuccess)?
        forgetPasswordSuccess,
    TResult Function(LoadingStatus loadingStatus, bool isSuccess)?
        resetPasswordSuccess,
    TResult Function(LoadingStatus loadingStatus, bool isAvailableBio)? hasBio,
    TResult Function(LoadingStatus loadingStatus, String errorMessage)? error,
    required TResult orElse(),
  }) {
    if (resetPasswordSuccess != null) {
      return resetPasswordSuccess(loadingStatus, isSuccess);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AutStateLoading value) loading,
    required TResult Function(_fetchRemoteConfigNullState value)
        fetchRemoteConfigNull,
    required TResult Function(_fetchRemoteConfigState value) fetchRemoteConfig,
    required TResult Function(_AuthStateLoad value) load,
    required TResult Function(_AuthStateLoginSuccess value) loginSuccess,
    required TResult Function(_AuthStateForgetPasswordSuccess value)
        forgetPasswordSuccess,
    required TResult Function(_AuthStateResetPasswordSuccess value)
        resetPasswordSuccess,
    required TResult Function(_AuthHasBioState value) hasBio,
    required TResult Function(_AuthStateError value) error,
  }) {
    return resetPasswordSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AutStateLoading value)? loading,
    TResult Function(_fetchRemoteConfigNullState value)? fetchRemoteConfigNull,
    TResult Function(_fetchRemoteConfigState value)? fetchRemoteConfig,
    TResult Function(_AuthStateLoad value)? load,
    TResult Function(_AuthStateLoginSuccess value)? loginSuccess,
    TResult Function(_AuthStateForgetPasswordSuccess value)?
        forgetPasswordSuccess,
    TResult Function(_AuthStateResetPasswordSuccess value)?
        resetPasswordSuccess,
    TResult Function(_AuthHasBioState value)? hasBio,
    TResult Function(_AuthStateError value)? error,
  }) {
    return resetPasswordSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AutStateLoading value)? loading,
    TResult Function(_fetchRemoteConfigNullState value)? fetchRemoteConfigNull,
    TResult Function(_fetchRemoteConfigState value)? fetchRemoteConfig,
    TResult Function(_AuthStateLoad value)? load,
    TResult Function(_AuthStateLoginSuccess value)? loginSuccess,
    TResult Function(_AuthStateForgetPasswordSuccess value)?
        forgetPasswordSuccess,
    TResult Function(_AuthStateResetPasswordSuccess value)?
        resetPasswordSuccess,
    TResult Function(_AuthHasBioState value)? hasBio,
    TResult Function(_AuthStateError value)? error,
    required TResult orElse(),
  }) {
    if (resetPasswordSuccess != null) {
      return resetPasswordSuccess(this);
    }
    return orElse();
  }
}

abstract class _AuthStateResetPasswordSuccess implements AuthState {
  const factory _AuthStateResetPasswordSuccess(
          final LoadingStatus loadingStatus, final bool isSuccess) =
      _$_AuthStateResetPasswordSuccess;

  @override
  LoadingStatus get loadingStatus => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_AuthStateResetPasswordSuccessCopyWith<_$_AuthStateResetPasswordSuccess>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AuthHasBioStateCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$$_AuthHasBioStateCopyWith(
          _$_AuthHasBioState value, $Res Function(_$_AuthHasBioState) then) =
      __$$_AuthHasBioStateCopyWithImpl<$Res>;
  @override
  $Res call({LoadingStatus loadingStatus, bool isAvailableBio});
}

/// @nodoc
class __$$_AuthHasBioStateCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res>
    implements _$$_AuthHasBioStateCopyWith<$Res> {
  __$$_AuthHasBioStateCopyWithImpl(
      _$_AuthHasBioState _value, $Res Function(_$_AuthHasBioState) _then)
      : super(_value, (v) => _then(v as _$_AuthHasBioState));

  @override
  _$_AuthHasBioState get _value => super._value as _$_AuthHasBioState;

  @override
  $Res call({
    Object? loadingStatus = freezed,
    Object? isAvailableBio = freezed,
  }) {
    return _then(_$_AuthHasBioState(
      loadingStatus == freezed
          ? _value.loadingStatus
          : loadingStatus // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
      isAvailableBio == freezed
          ? _value.isAvailableBio
          : isAvailableBio // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_AuthHasBioState implements _AuthHasBioState {
  const _$_AuthHasBioState(this.loadingStatus, this.isAvailableBio);

  @override
  final LoadingStatus loadingStatus;
  @override
  final bool isAvailableBio;

  @override
  String toString() {
    return 'AuthState.hasBio(loadingStatus: $loadingStatus, isAvailableBio: $isAvailableBio)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthHasBioState &&
            const DeepCollectionEquality()
                .equals(other.loadingStatus, loadingStatus) &&
            const DeepCollectionEquality()
                .equals(other.isAvailableBio, isAvailableBio));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(loadingStatus),
      const DeepCollectionEquality().hash(isAvailableBio));

  @JsonKey(ignore: true)
  @override
  _$$_AuthHasBioStateCopyWith<_$_AuthHasBioState> get copyWith =>
      __$$_AuthHasBioStateCopyWithImpl<_$_AuthHasBioState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoadingStatus loadingStatus) loading,
    required TResult Function(LoadingStatus loadingStatus)
        fetchRemoteConfigNull,
    required TResult Function(
            LoadingStatus loadingStatus, RemoteConfigModel remoteConfigModel)
        fetchRemoteConfig,
    required TResult Function(LoadingStatus loadingStatus, bool isLoggedIn)
        load,
    required TResult Function(LoadingStatus loadingStatus, bool isLoggedIn)
        loginSuccess,
    required TResult Function(LoadingStatus loadingStatus, bool isSuccess)
        forgetPasswordSuccess,
    required TResult Function(LoadingStatus loadingStatus, bool isSuccess)
        resetPasswordSuccess,
    required TResult Function(LoadingStatus loadingStatus, bool isAvailableBio)
        hasBio,
    required TResult Function(LoadingStatus loadingStatus, String errorMessage)
        error,
  }) {
    return hasBio(loadingStatus, isAvailableBio);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(LoadingStatus loadingStatus)? loading,
    TResult Function(LoadingStatus loadingStatus)? fetchRemoteConfigNull,
    TResult Function(
            LoadingStatus loadingStatus, RemoteConfigModel remoteConfigModel)?
        fetchRemoteConfig,
    TResult Function(LoadingStatus loadingStatus, bool isLoggedIn)? load,
    TResult Function(LoadingStatus loadingStatus, bool isLoggedIn)?
        loginSuccess,
    TResult Function(LoadingStatus loadingStatus, bool isSuccess)?
        forgetPasswordSuccess,
    TResult Function(LoadingStatus loadingStatus, bool isSuccess)?
        resetPasswordSuccess,
    TResult Function(LoadingStatus loadingStatus, bool isAvailableBio)? hasBio,
    TResult Function(LoadingStatus loadingStatus, String errorMessage)? error,
  }) {
    return hasBio?.call(loadingStatus, isAvailableBio);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoadingStatus loadingStatus)? loading,
    TResult Function(LoadingStatus loadingStatus)? fetchRemoteConfigNull,
    TResult Function(
            LoadingStatus loadingStatus, RemoteConfigModel remoteConfigModel)?
        fetchRemoteConfig,
    TResult Function(LoadingStatus loadingStatus, bool isLoggedIn)? load,
    TResult Function(LoadingStatus loadingStatus, bool isLoggedIn)?
        loginSuccess,
    TResult Function(LoadingStatus loadingStatus, bool isSuccess)?
        forgetPasswordSuccess,
    TResult Function(LoadingStatus loadingStatus, bool isSuccess)?
        resetPasswordSuccess,
    TResult Function(LoadingStatus loadingStatus, bool isAvailableBio)? hasBio,
    TResult Function(LoadingStatus loadingStatus, String errorMessage)? error,
    required TResult orElse(),
  }) {
    if (hasBio != null) {
      return hasBio(loadingStatus, isAvailableBio);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AutStateLoading value) loading,
    required TResult Function(_fetchRemoteConfigNullState value)
        fetchRemoteConfigNull,
    required TResult Function(_fetchRemoteConfigState value) fetchRemoteConfig,
    required TResult Function(_AuthStateLoad value) load,
    required TResult Function(_AuthStateLoginSuccess value) loginSuccess,
    required TResult Function(_AuthStateForgetPasswordSuccess value)
        forgetPasswordSuccess,
    required TResult Function(_AuthStateResetPasswordSuccess value)
        resetPasswordSuccess,
    required TResult Function(_AuthHasBioState value) hasBio,
    required TResult Function(_AuthStateError value) error,
  }) {
    return hasBio(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AutStateLoading value)? loading,
    TResult Function(_fetchRemoteConfigNullState value)? fetchRemoteConfigNull,
    TResult Function(_fetchRemoteConfigState value)? fetchRemoteConfig,
    TResult Function(_AuthStateLoad value)? load,
    TResult Function(_AuthStateLoginSuccess value)? loginSuccess,
    TResult Function(_AuthStateForgetPasswordSuccess value)?
        forgetPasswordSuccess,
    TResult Function(_AuthStateResetPasswordSuccess value)?
        resetPasswordSuccess,
    TResult Function(_AuthHasBioState value)? hasBio,
    TResult Function(_AuthStateError value)? error,
  }) {
    return hasBio?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AutStateLoading value)? loading,
    TResult Function(_fetchRemoteConfigNullState value)? fetchRemoteConfigNull,
    TResult Function(_fetchRemoteConfigState value)? fetchRemoteConfig,
    TResult Function(_AuthStateLoad value)? load,
    TResult Function(_AuthStateLoginSuccess value)? loginSuccess,
    TResult Function(_AuthStateForgetPasswordSuccess value)?
        forgetPasswordSuccess,
    TResult Function(_AuthStateResetPasswordSuccess value)?
        resetPasswordSuccess,
    TResult Function(_AuthHasBioState value)? hasBio,
    TResult Function(_AuthStateError value)? error,
    required TResult orElse(),
  }) {
    if (hasBio != null) {
      return hasBio(this);
    }
    return orElse();
  }
}

abstract class _AuthHasBioState implements AuthState {
  const factory _AuthHasBioState(
          final LoadingStatus loadingStatus, final bool isAvailableBio) =
      _$_AuthHasBioState;

  @override
  LoadingStatus get loadingStatus => throw _privateConstructorUsedError;
  bool get isAvailableBio => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_AuthHasBioStateCopyWith<_$_AuthHasBioState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AuthStateErrorCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$$_AuthStateErrorCopyWith(
          _$_AuthStateError value, $Res Function(_$_AuthStateError) then) =
      __$$_AuthStateErrorCopyWithImpl<$Res>;
  @override
  $Res call({LoadingStatus loadingStatus, String errorMessage});
}

/// @nodoc
class __$$_AuthStateErrorCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res>
    implements _$$_AuthStateErrorCopyWith<$Res> {
  __$$_AuthStateErrorCopyWithImpl(
      _$_AuthStateError _value, $Res Function(_$_AuthStateError) _then)
      : super(_value, (v) => _then(v as _$_AuthStateError));

  @override
  _$_AuthStateError get _value => super._value as _$_AuthStateError;

  @override
  $Res call({
    Object? loadingStatus = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_$_AuthStateError(
      loadingStatus == freezed
          ? _value.loadingStatus
          : loadingStatus // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
      errorMessage == freezed
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AuthStateError implements _AuthStateError {
  const _$_AuthStateError(this.loadingStatus, this.errorMessage);

  @override
  final LoadingStatus loadingStatus;
  @override
  final String errorMessage;

  @override
  String toString() {
    return 'AuthState.error(loadingStatus: $loadingStatus, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthStateError &&
            const DeepCollectionEquality()
                .equals(other.loadingStatus, loadingStatus) &&
            const DeepCollectionEquality()
                .equals(other.errorMessage, errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(loadingStatus),
      const DeepCollectionEquality().hash(errorMessage));

  @JsonKey(ignore: true)
  @override
  _$$_AuthStateErrorCopyWith<_$_AuthStateError> get copyWith =>
      __$$_AuthStateErrorCopyWithImpl<_$_AuthStateError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoadingStatus loadingStatus) loading,
    required TResult Function(LoadingStatus loadingStatus)
        fetchRemoteConfigNull,
    required TResult Function(
            LoadingStatus loadingStatus, RemoteConfigModel remoteConfigModel)
        fetchRemoteConfig,
    required TResult Function(LoadingStatus loadingStatus, bool isLoggedIn)
        load,
    required TResult Function(LoadingStatus loadingStatus, bool isLoggedIn)
        loginSuccess,
    required TResult Function(LoadingStatus loadingStatus, bool isSuccess)
        forgetPasswordSuccess,
    required TResult Function(LoadingStatus loadingStatus, bool isSuccess)
        resetPasswordSuccess,
    required TResult Function(LoadingStatus loadingStatus, bool isAvailableBio)
        hasBio,
    required TResult Function(LoadingStatus loadingStatus, String errorMessage)
        error,
  }) {
    return error(loadingStatus, errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(LoadingStatus loadingStatus)? loading,
    TResult Function(LoadingStatus loadingStatus)? fetchRemoteConfigNull,
    TResult Function(
            LoadingStatus loadingStatus, RemoteConfigModel remoteConfigModel)?
        fetchRemoteConfig,
    TResult Function(LoadingStatus loadingStatus, bool isLoggedIn)? load,
    TResult Function(LoadingStatus loadingStatus, bool isLoggedIn)?
        loginSuccess,
    TResult Function(LoadingStatus loadingStatus, bool isSuccess)?
        forgetPasswordSuccess,
    TResult Function(LoadingStatus loadingStatus, bool isSuccess)?
        resetPasswordSuccess,
    TResult Function(LoadingStatus loadingStatus, bool isAvailableBio)? hasBio,
    TResult Function(LoadingStatus loadingStatus, String errorMessage)? error,
  }) {
    return error?.call(loadingStatus, errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoadingStatus loadingStatus)? loading,
    TResult Function(LoadingStatus loadingStatus)? fetchRemoteConfigNull,
    TResult Function(
            LoadingStatus loadingStatus, RemoteConfigModel remoteConfigModel)?
        fetchRemoteConfig,
    TResult Function(LoadingStatus loadingStatus, bool isLoggedIn)? load,
    TResult Function(LoadingStatus loadingStatus, bool isLoggedIn)?
        loginSuccess,
    TResult Function(LoadingStatus loadingStatus, bool isSuccess)?
        forgetPasswordSuccess,
    TResult Function(LoadingStatus loadingStatus, bool isSuccess)?
        resetPasswordSuccess,
    TResult Function(LoadingStatus loadingStatus, bool isAvailableBio)? hasBio,
    TResult Function(LoadingStatus loadingStatus, String errorMessage)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(loadingStatus, errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AutStateLoading value) loading,
    required TResult Function(_fetchRemoteConfigNullState value)
        fetchRemoteConfigNull,
    required TResult Function(_fetchRemoteConfigState value) fetchRemoteConfig,
    required TResult Function(_AuthStateLoad value) load,
    required TResult Function(_AuthStateLoginSuccess value) loginSuccess,
    required TResult Function(_AuthStateForgetPasswordSuccess value)
        forgetPasswordSuccess,
    required TResult Function(_AuthStateResetPasswordSuccess value)
        resetPasswordSuccess,
    required TResult Function(_AuthHasBioState value) hasBio,
    required TResult Function(_AuthStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AutStateLoading value)? loading,
    TResult Function(_fetchRemoteConfigNullState value)? fetchRemoteConfigNull,
    TResult Function(_fetchRemoteConfigState value)? fetchRemoteConfig,
    TResult Function(_AuthStateLoad value)? load,
    TResult Function(_AuthStateLoginSuccess value)? loginSuccess,
    TResult Function(_AuthStateForgetPasswordSuccess value)?
        forgetPasswordSuccess,
    TResult Function(_AuthStateResetPasswordSuccess value)?
        resetPasswordSuccess,
    TResult Function(_AuthHasBioState value)? hasBio,
    TResult Function(_AuthStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AutStateLoading value)? loading,
    TResult Function(_fetchRemoteConfigNullState value)? fetchRemoteConfigNull,
    TResult Function(_fetchRemoteConfigState value)? fetchRemoteConfig,
    TResult Function(_AuthStateLoad value)? load,
    TResult Function(_AuthStateLoginSuccess value)? loginSuccess,
    TResult Function(_AuthStateForgetPasswordSuccess value)?
        forgetPasswordSuccess,
    TResult Function(_AuthStateResetPasswordSuccess value)?
        resetPasswordSuccess,
    TResult Function(_AuthHasBioState value)? hasBio,
    TResult Function(_AuthStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _AuthStateError implements AuthState {
  const factory _AuthStateError(
          final LoadingStatus loadingStatus, final String errorMessage) =
      _$_AuthStateError;

  @override
  LoadingStatus get loadingStatus => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_AuthStateErrorCopyWith<_$_AuthStateError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AuthEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function() hasBio,
    required TResult Function(LoginRequestModel loginRequestModel) logIn,
    required TResult Function(
            ForgotPasswordRequestModel forgotPasswordRequestModel)
        forgotPassword,
    required TResult Function(
            ResetPasswordRequestModel resetPasswordRequestModel)
        resetPassword,
    required TResult Function() fetchRemoteConfig,
    required TResult Function() logOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? load,
    TResult Function()? hasBio,
    TResult Function(LoginRequestModel loginRequestModel)? logIn,
    TResult Function(ForgotPasswordRequestModel forgotPasswordRequestModel)?
        forgotPassword,
    TResult Function(ResetPasswordRequestModel resetPasswordRequestModel)?
        resetPassword,
    TResult Function()? fetchRemoteConfig,
    TResult Function()? logOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function()? hasBio,
    TResult Function(LoginRequestModel loginRequestModel)? logIn,
    TResult Function(ForgotPasswordRequestModel forgotPasswordRequestModel)?
        forgotPassword,
    TResult Function(ResetPasswordRequestModel resetPasswordRequestModel)?
        resetPassword,
    TResult Function()? fetchRemoteConfig,
    TResult Function()? logOut,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
    required TResult Function(_HasBio value) hasBio,
    required TResult Function(_LogIn value) logIn,
    required TResult Function(_ForgotPassword value) forgotPassword,
    required TResult Function(_ResetPassword value) resetPassword,
    required TResult Function(_FetchRemoteConfig value) fetchRemoteConfig,
    required TResult Function(_LogOut value) logOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_HasBio value)? hasBio,
    TResult Function(_LogIn value)? logIn,
    TResult Function(_ForgotPassword value)? forgotPassword,
    TResult Function(_ResetPassword value)? resetPassword,
    TResult Function(_FetchRemoteConfig value)? fetchRemoteConfig,
    TResult Function(_LogOut value)? logOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_HasBio value)? hasBio,
    TResult Function(_LogIn value)? logIn,
    TResult Function(_ForgotPassword value)? forgotPassword,
    TResult Function(_ResetPassword value)? resetPassword,
    TResult Function(_FetchRemoteConfig value)? fetchRemoteConfig,
    TResult Function(_LogOut value)? logOut,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthEventCopyWithImpl<$Res> implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  final AuthEvent _value;
  // ignore: unused_field
  final $Res Function(AuthEvent) _then;
}

/// @nodoc
abstract class _$$_LoadCopyWith<$Res> {
  factory _$$_LoadCopyWith(_$_Load value, $Res Function(_$_Load) then) =
      __$$_LoadCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoadCopyWithImpl<$Res> extends _$AuthEventCopyWithImpl<$Res>
    implements _$$_LoadCopyWith<$Res> {
  __$$_LoadCopyWithImpl(_$_Load _value, $Res Function(_$_Load) _then)
      : super(_value, (v) => _then(v as _$_Load));

  @override
  _$_Load get _value => super._value as _$_Load;
}

/// @nodoc

class _$_Load implements _Load {
  const _$_Load();

  @override
  String toString() {
    return 'AuthEvent.load()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Load);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function() hasBio,
    required TResult Function(LoginRequestModel loginRequestModel) logIn,
    required TResult Function(
            ForgotPasswordRequestModel forgotPasswordRequestModel)
        forgotPassword,
    required TResult Function(
            ResetPasswordRequestModel resetPasswordRequestModel)
        resetPassword,
    required TResult Function() fetchRemoteConfig,
    required TResult Function() logOut,
  }) {
    return load();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? load,
    TResult Function()? hasBio,
    TResult Function(LoginRequestModel loginRequestModel)? logIn,
    TResult Function(ForgotPasswordRequestModel forgotPasswordRequestModel)?
        forgotPassword,
    TResult Function(ResetPasswordRequestModel resetPasswordRequestModel)?
        resetPassword,
    TResult Function()? fetchRemoteConfig,
    TResult Function()? logOut,
  }) {
    return load?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function()? hasBio,
    TResult Function(LoginRequestModel loginRequestModel)? logIn,
    TResult Function(ForgotPasswordRequestModel forgotPasswordRequestModel)?
        forgotPassword,
    TResult Function(ResetPasswordRequestModel resetPasswordRequestModel)?
        resetPassword,
    TResult Function()? fetchRemoteConfig,
    TResult Function()? logOut,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
    required TResult Function(_HasBio value) hasBio,
    required TResult Function(_LogIn value) logIn,
    required TResult Function(_ForgotPassword value) forgotPassword,
    required TResult Function(_ResetPassword value) resetPassword,
    required TResult Function(_FetchRemoteConfig value) fetchRemoteConfig,
    required TResult Function(_LogOut value) logOut,
  }) {
    return load(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_HasBio value)? hasBio,
    TResult Function(_LogIn value)? logIn,
    TResult Function(_ForgotPassword value)? forgotPassword,
    TResult Function(_ResetPassword value)? resetPassword,
    TResult Function(_FetchRemoteConfig value)? fetchRemoteConfig,
    TResult Function(_LogOut value)? logOut,
  }) {
    return load?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_HasBio value)? hasBio,
    TResult Function(_LogIn value)? logIn,
    TResult Function(_ForgotPassword value)? forgotPassword,
    TResult Function(_ResetPassword value)? resetPassword,
    TResult Function(_FetchRemoteConfig value)? fetchRemoteConfig,
    TResult Function(_LogOut value)? logOut,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(this);
    }
    return orElse();
  }
}

abstract class _Load implements AuthEvent {
  const factory _Load() = _$_Load;
}

/// @nodoc
abstract class _$$_HasBioCopyWith<$Res> {
  factory _$$_HasBioCopyWith(_$_HasBio value, $Res Function(_$_HasBio) then) =
      __$$_HasBioCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_HasBioCopyWithImpl<$Res> extends _$AuthEventCopyWithImpl<$Res>
    implements _$$_HasBioCopyWith<$Res> {
  __$$_HasBioCopyWithImpl(_$_HasBio _value, $Res Function(_$_HasBio) _then)
      : super(_value, (v) => _then(v as _$_HasBio));

  @override
  _$_HasBio get _value => super._value as _$_HasBio;
}

/// @nodoc

class _$_HasBio implements _HasBio {
  const _$_HasBio();

  @override
  String toString() {
    return 'AuthEvent.hasBio()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_HasBio);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function() hasBio,
    required TResult Function(LoginRequestModel loginRequestModel) logIn,
    required TResult Function(
            ForgotPasswordRequestModel forgotPasswordRequestModel)
        forgotPassword,
    required TResult Function(
            ResetPasswordRequestModel resetPasswordRequestModel)
        resetPassword,
    required TResult Function() fetchRemoteConfig,
    required TResult Function() logOut,
  }) {
    return hasBio();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? load,
    TResult Function()? hasBio,
    TResult Function(LoginRequestModel loginRequestModel)? logIn,
    TResult Function(ForgotPasswordRequestModel forgotPasswordRequestModel)?
        forgotPassword,
    TResult Function(ResetPasswordRequestModel resetPasswordRequestModel)?
        resetPassword,
    TResult Function()? fetchRemoteConfig,
    TResult Function()? logOut,
  }) {
    return hasBio?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function()? hasBio,
    TResult Function(LoginRequestModel loginRequestModel)? logIn,
    TResult Function(ForgotPasswordRequestModel forgotPasswordRequestModel)?
        forgotPassword,
    TResult Function(ResetPasswordRequestModel resetPasswordRequestModel)?
        resetPassword,
    TResult Function()? fetchRemoteConfig,
    TResult Function()? logOut,
    required TResult orElse(),
  }) {
    if (hasBio != null) {
      return hasBio();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
    required TResult Function(_HasBio value) hasBio,
    required TResult Function(_LogIn value) logIn,
    required TResult Function(_ForgotPassword value) forgotPassword,
    required TResult Function(_ResetPassword value) resetPassword,
    required TResult Function(_FetchRemoteConfig value) fetchRemoteConfig,
    required TResult Function(_LogOut value) logOut,
  }) {
    return hasBio(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_HasBio value)? hasBio,
    TResult Function(_LogIn value)? logIn,
    TResult Function(_ForgotPassword value)? forgotPassword,
    TResult Function(_ResetPassword value)? resetPassword,
    TResult Function(_FetchRemoteConfig value)? fetchRemoteConfig,
    TResult Function(_LogOut value)? logOut,
  }) {
    return hasBio?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_HasBio value)? hasBio,
    TResult Function(_LogIn value)? logIn,
    TResult Function(_ForgotPassword value)? forgotPassword,
    TResult Function(_ResetPassword value)? resetPassword,
    TResult Function(_FetchRemoteConfig value)? fetchRemoteConfig,
    TResult Function(_LogOut value)? logOut,
    required TResult orElse(),
  }) {
    if (hasBio != null) {
      return hasBio(this);
    }
    return orElse();
  }
}

abstract class _HasBio implements AuthEvent {
  const factory _HasBio() = _$_HasBio;
}

/// @nodoc
abstract class _$$_LogInCopyWith<$Res> {
  factory _$$_LogInCopyWith(_$_LogIn value, $Res Function(_$_LogIn) then) =
      __$$_LogInCopyWithImpl<$Res>;
  $Res call({LoginRequestModel loginRequestModel});
}

/// @nodoc
class __$$_LogInCopyWithImpl<$Res> extends _$AuthEventCopyWithImpl<$Res>
    implements _$$_LogInCopyWith<$Res> {
  __$$_LogInCopyWithImpl(_$_LogIn _value, $Res Function(_$_LogIn) _then)
      : super(_value, (v) => _then(v as _$_LogIn));

  @override
  _$_LogIn get _value => super._value as _$_LogIn;

  @override
  $Res call({
    Object? loginRequestModel = freezed,
  }) {
    return _then(_$_LogIn(
      loginRequestModel == freezed
          ? _value.loginRequestModel
          : loginRequestModel // ignore: cast_nullable_to_non_nullable
              as LoginRequestModel,
    ));
  }
}

/// @nodoc

class _$_LogIn implements _LogIn {
  const _$_LogIn(this.loginRequestModel);

  @override
  final LoginRequestModel loginRequestModel;

  @override
  String toString() {
    return 'AuthEvent.logIn(loginRequestModel: $loginRequestModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LogIn &&
            const DeepCollectionEquality()
                .equals(other.loginRequestModel, loginRequestModel));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(loginRequestModel));

  @JsonKey(ignore: true)
  @override
  _$$_LogInCopyWith<_$_LogIn> get copyWith =>
      __$$_LogInCopyWithImpl<_$_LogIn>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function() hasBio,
    required TResult Function(LoginRequestModel loginRequestModel) logIn,
    required TResult Function(
            ForgotPasswordRequestModel forgotPasswordRequestModel)
        forgotPassword,
    required TResult Function(
            ResetPasswordRequestModel resetPasswordRequestModel)
        resetPassword,
    required TResult Function() fetchRemoteConfig,
    required TResult Function() logOut,
  }) {
    return logIn(loginRequestModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? load,
    TResult Function()? hasBio,
    TResult Function(LoginRequestModel loginRequestModel)? logIn,
    TResult Function(ForgotPasswordRequestModel forgotPasswordRequestModel)?
        forgotPassword,
    TResult Function(ResetPasswordRequestModel resetPasswordRequestModel)?
        resetPassword,
    TResult Function()? fetchRemoteConfig,
    TResult Function()? logOut,
  }) {
    return logIn?.call(loginRequestModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function()? hasBio,
    TResult Function(LoginRequestModel loginRequestModel)? logIn,
    TResult Function(ForgotPasswordRequestModel forgotPasswordRequestModel)?
        forgotPassword,
    TResult Function(ResetPasswordRequestModel resetPasswordRequestModel)?
        resetPassword,
    TResult Function()? fetchRemoteConfig,
    TResult Function()? logOut,
    required TResult orElse(),
  }) {
    if (logIn != null) {
      return logIn(loginRequestModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
    required TResult Function(_HasBio value) hasBio,
    required TResult Function(_LogIn value) logIn,
    required TResult Function(_ForgotPassword value) forgotPassword,
    required TResult Function(_ResetPassword value) resetPassword,
    required TResult Function(_FetchRemoteConfig value) fetchRemoteConfig,
    required TResult Function(_LogOut value) logOut,
  }) {
    return logIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_HasBio value)? hasBio,
    TResult Function(_LogIn value)? logIn,
    TResult Function(_ForgotPassword value)? forgotPassword,
    TResult Function(_ResetPassword value)? resetPassword,
    TResult Function(_FetchRemoteConfig value)? fetchRemoteConfig,
    TResult Function(_LogOut value)? logOut,
  }) {
    return logIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_HasBio value)? hasBio,
    TResult Function(_LogIn value)? logIn,
    TResult Function(_ForgotPassword value)? forgotPassword,
    TResult Function(_ResetPassword value)? resetPassword,
    TResult Function(_FetchRemoteConfig value)? fetchRemoteConfig,
    TResult Function(_LogOut value)? logOut,
    required TResult orElse(),
  }) {
    if (logIn != null) {
      return logIn(this);
    }
    return orElse();
  }
}

abstract class _LogIn implements AuthEvent {
  const factory _LogIn(final LoginRequestModel loginRequestModel) = _$_LogIn;

  LoginRequestModel get loginRequestModel => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$_LogInCopyWith<_$_LogIn> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ForgotPasswordCopyWith<$Res> {
  factory _$$_ForgotPasswordCopyWith(
          _$_ForgotPassword value, $Res Function(_$_ForgotPassword) then) =
      __$$_ForgotPasswordCopyWithImpl<$Res>;
  $Res call({ForgotPasswordRequestModel forgotPasswordRequestModel});
}

/// @nodoc
class __$$_ForgotPasswordCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res>
    implements _$$_ForgotPasswordCopyWith<$Res> {
  __$$_ForgotPasswordCopyWithImpl(
      _$_ForgotPassword _value, $Res Function(_$_ForgotPassword) _then)
      : super(_value, (v) => _then(v as _$_ForgotPassword));

  @override
  _$_ForgotPassword get _value => super._value as _$_ForgotPassword;

  @override
  $Res call({
    Object? forgotPasswordRequestModel = freezed,
  }) {
    return _then(_$_ForgotPassword(
      forgotPasswordRequestModel == freezed
          ? _value.forgotPasswordRequestModel
          : forgotPasswordRequestModel // ignore: cast_nullable_to_non_nullable
              as ForgotPasswordRequestModel,
    ));
  }
}

/// @nodoc

class _$_ForgotPassword implements _ForgotPassword {
  const _$_ForgotPassword(this.forgotPasswordRequestModel);

  @override
  final ForgotPasswordRequestModel forgotPasswordRequestModel;

  @override
  String toString() {
    return 'AuthEvent.forgotPassword(forgotPasswordRequestModel: $forgotPasswordRequestModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ForgotPassword &&
            const DeepCollectionEquality().equals(
                other.forgotPasswordRequestModel, forgotPasswordRequestModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(forgotPasswordRequestModel));

  @JsonKey(ignore: true)
  @override
  _$$_ForgotPasswordCopyWith<_$_ForgotPassword> get copyWith =>
      __$$_ForgotPasswordCopyWithImpl<_$_ForgotPassword>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function() hasBio,
    required TResult Function(LoginRequestModel loginRequestModel) logIn,
    required TResult Function(
            ForgotPasswordRequestModel forgotPasswordRequestModel)
        forgotPassword,
    required TResult Function(
            ResetPasswordRequestModel resetPasswordRequestModel)
        resetPassword,
    required TResult Function() fetchRemoteConfig,
    required TResult Function() logOut,
  }) {
    return forgotPassword(forgotPasswordRequestModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? load,
    TResult Function()? hasBio,
    TResult Function(LoginRequestModel loginRequestModel)? logIn,
    TResult Function(ForgotPasswordRequestModel forgotPasswordRequestModel)?
        forgotPassword,
    TResult Function(ResetPasswordRequestModel resetPasswordRequestModel)?
        resetPassword,
    TResult Function()? fetchRemoteConfig,
    TResult Function()? logOut,
  }) {
    return forgotPassword?.call(forgotPasswordRequestModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function()? hasBio,
    TResult Function(LoginRequestModel loginRequestModel)? logIn,
    TResult Function(ForgotPasswordRequestModel forgotPasswordRequestModel)?
        forgotPassword,
    TResult Function(ResetPasswordRequestModel resetPasswordRequestModel)?
        resetPassword,
    TResult Function()? fetchRemoteConfig,
    TResult Function()? logOut,
    required TResult orElse(),
  }) {
    if (forgotPassword != null) {
      return forgotPassword(forgotPasswordRequestModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
    required TResult Function(_HasBio value) hasBio,
    required TResult Function(_LogIn value) logIn,
    required TResult Function(_ForgotPassword value) forgotPassword,
    required TResult Function(_ResetPassword value) resetPassword,
    required TResult Function(_FetchRemoteConfig value) fetchRemoteConfig,
    required TResult Function(_LogOut value) logOut,
  }) {
    return forgotPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_HasBio value)? hasBio,
    TResult Function(_LogIn value)? logIn,
    TResult Function(_ForgotPassword value)? forgotPassword,
    TResult Function(_ResetPassword value)? resetPassword,
    TResult Function(_FetchRemoteConfig value)? fetchRemoteConfig,
    TResult Function(_LogOut value)? logOut,
  }) {
    return forgotPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_HasBio value)? hasBio,
    TResult Function(_LogIn value)? logIn,
    TResult Function(_ForgotPassword value)? forgotPassword,
    TResult Function(_ResetPassword value)? resetPassword,
    TResult Function(_FetchRemoteConfig value)? fetchRemoteConfig,
    TResult Function(_LogOut value)? logOut,
    required TResult orElse(),
  }) {
    if (forgotPassword != null) {
      return forgotPassword(this);
    }
    return orElse();
  }
}

abstract class _ForgotPassword implements AuthEvent {
  const factory _ForgotPassword(
          final ForgotPasswordRequestModel forgotPasswordRequestModel) =
      _$_ForgotPassword;

  ForgotPasswordRequestModel get forgotPasswordRequestModel =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$_ForgotPasswordCopyWith<_$_ForgotPassword> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ResetPasswordCopyWith<$Res> {
  factory _$$_ResetPasswordCopyWith(
          _$_ResetPassword value, $Res Function(_$_ResetPassword) then) =
      __$$_ResetPasswordCopyWithImpl<$Res>;
  $Res call({ResetPasswordRequestModel resetPasswordRequestModel});
}

/// @nodoc
class __$$_ResetPasswordCopyWithImpl<$Res> extends _$AuthEventCopyWithImpl<$Res>
    implements _$$_ResetPasswordCopyWith<$Res> {
  __$$_ResetPasswordCopyWithImpl(
      _$_ResetPassword _value, $Res Function(_$_ResetPassword) _then)
      : super(_value, (v) => _then(v as _$_ResetPassword));

  @override
  _$_ResetPassword get _value => super._value as _$_ResetPassword;

  @override
  $Res call({
    Object? resetPasswordRequestModel = freezed,
  }) {
    return _then(_$_ResetPassword(
      resetPasswordRequestModel == freezed
          ? _value.resetPasswordRequestModel
          : resetPasswordRequestModel // ignore: cast_nullable_to_non_nullable
              as ResetPasswordRequestModel,
    ));
  }
}

/// @nodoc

class _$_ResetPassword implements _ResetPassword {
  const _$_ResetPassword(this.resetPasswordRequestModel);

  @override
  final ResetPasswordRequestModel resetPasswordRequestModel;

  @override
  String toString() {
    return 'AuthEvent.resetPassword(resetPasswordRequestModel: $resetPasswordRequestModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ResetPassword &&
            const DeepCollectionEquality().equals(
                other.resetPasswordRequestModel, resetPasswordRequestModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(resetPasswordRequestModel));

  @JsonKey(ignore: true)
  @override
  _$$_ResetPasswordCopyWith<_$_ResetPassword> get copyWith =>
      __$$_ResetPasswordCopyWithImpl<_$_ResetPassword>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function() hasBio,
    required TResult Function(LoginRequestModel loginRequestModel) logIn,
    required TResult Function(
            ForgotPasswordRequestModel forgotPasswordRequestModel)
        forgotPassword,
    required TResult Function(
            ResetPasswordRequestModel resetPasswordRequestModel)
        resetPassword,
    required TResult Function() fetchRemoteConfig,
    required TResult Function() logOut,
  }) {
    return resetPassword(resetPasswordRequestModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? load,
    TResult Function()? hasBio,
    TResult Function(LoginRequestModel loginRequestModel)? logIn,
    TResult Function(ForgotPasswordRequestModel forgotPasswordRequestModel)?
        forgotPassword,
    TResult Function(ResetPasswordRequestModel resetPasswordRequestModel)?
        resetPassword,
    TResult Function()? fetchRemoteConfig,
    TResult Function()? logOut,
  }) {
    return resetPassword?.call(resetPasswordRequestModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function()? hasBio,
    TResult Function(LoginRequestModel loginRequestModel)? logIn,
    TResult Function(ForgotPasswordRequestModel forgotPasswordRequestModel)?
        forgotPassword,
    TResult Function(ResetPasswordRequestModel resetPasswordRequestModel)?
        resetPassword,
    TResult Function()? fetchRemoteConfig,
    TResult Function()? logOut,
    required TResult orElse(),
  }) {
    if (resetPassword != null) {
      return resetPassword(resetPasswordRequestModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
    required TResult Function(_HasBio value) hasBio,
    required TResult Function(_LogIn value) logIn,
    required TResult Function(_ForgotPassword value) forgotPassword,
    required TResult Function(_ResetPassword value) resetPassword,
    required TResult Function(_FetchRemoteConfig value) fetchRemoteConfig,
    required TResult Function(_LogOut value) logOut,
  }) {
    return resetPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_HasBio value)? hasBio,
    TResult Function(_LogIn value)? logIn,
    TResult Function(_ForgotPassword value)? forgotPassword,
    TResult Function(_ResetPassword value)? resetPassword,
    TResult Function(_FetchRemoteConfig value)? fetchRemoteConfig,
    TResult Function(_LogOut value)? logOut,
  }) {
    return resetPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_HasBio value)? hasBio,
    TResult Function(_LogIn value)? logIn,
    TResult Function(_ForgotPassword value)? forgotPassword,
    TResult Function(_ResetPassword value)? resetPassword,
    TResult Function(_FetchRemoteConfig value)? fetchRemoteConfig,
    TResult Function(_LogOut value)? logOut,
    required TResult orElse(),
  }) {
    if (resetPassword != null) {
      return resetPassword(this);
    }
    return orElse();
  }
}

abstract class _ResetPassword implements AuthEvent {
  const factory _ResetPassword(
          final ResetPasswordRequestModel resetPasswordRequestModel) =
      _$_ResetPassword;

  ResetPasswordRequestModel get resetPasswordRequestModel =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$_ResetPasswordCopyWith<_$_ResetPassword> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FetchRemoteConfigCopyWith<$Res> {
  factory _$$_FetchRemoteConfigCopyWith(_$_FetchRemoteConfig value,
          $Res Function(_$_FetchRemoteConfig) then) =
      __$$_FetchRemoteConfigCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_FetchRemoteConfigCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res>
    implements _$$_FetchRemoteConfigCopyWith<$Res> {
  __$$_FetchRemoteConfigCopyWithImpl(
      _$_FetchRemoteConfig _value, $Res Function(_$_FetchRemoteConfig) _then)
      : super(_value, (v) => _then(v as _$_FetchRemoteConfig));

  @override
  _$_FetchRemoteConfig get _value => super._value as _$_FetchRemoteConfig;
}

/// @nodoc

class _$_FetchRemoteConfig implements _FetchRemoteConfig {
  const _$_FetchRemoteConfig();

  @override
  String toString() {
    return 'AuthEvent.fetchRemoteConfig()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_FetchRemoteConfig);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function() hasBio,
    required TResult Function(LoginRequestModel loginRequestModel) logIn,
    required TResult Function(
            ForgotPasswordRequestModel forgotPasswordRequestModel)
        forgotPassword,
    required TResult Function(
            ResetPasswordRequestModel resetPasswordRequestModel)
        resetPassword,
    required TResult Function() fetchRemoteConfig,
    required TResult Function() logOut,
  }) {
    return fetchRemoteConfig();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? load,
    TResult Function()? hasBio,
    TResult Function(LoginRequestModel loginRequestModel)? logIn,
    TResult Function(ForgotPasswordRequestModel forgotPasswordRequestModel)?
        forgotPassword,
    TResult Function(ResetPasswordRequestModel resetPasswordRequestModel)?
        resetPassword,
    TResult Function()? fetchRemoteConfig,
    TResult Function()? logOut,
  }) {
    return fetchRemoteConfig?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function()? hasBio,
    TResult Function(LoginRequestModel loginRequestModel)? logIn,
    TResult Function(ForgotPasswordRequestModel forgotPasswordRequestModel)?
        forgotPassword,
    TResult Function(ResetPasswordRequestModel resetPasswordRequestModel)?
        resetPassword,
    TResult Function()? fetchRemoteConfig,
    TResult Function()? logOut,
    required TResult orElse(),
  }) {
    if (fetchRemoteConfig != null) {
      return fetchRemoteConfig();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
    required TResult Function(_HasBio value) hasBio,
    required TResult Function(_LogIn value) logIn,
    required TResult Function(_ForgotPassword value) forgotPassword,
    required TResult Function(_ResetPassword value) resetPassword,
    required TResult Function(_FetchRemoteConfig value) fetchRemoteConfig,
    required TResult Function(_LogOut value) logOut,
  }) {
    return fetchRemoteConfig(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_HasBio value)? hasBio,
    TResult Function(_LogIn value)? logIn,
    TResult Function(_ForgotPassword value)? forgotPassword,
    TResult Function(_ResetPassword value)? resetPassword,
    TResult Function(_FetchRemoteConfig value)? fetchRemoteConfig,
    TResult Function(_LogOut value)? logOut,
  }) {
    return fetchRemoteConfig?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_HasBio value)? hasBio,
    TResult Function(_LogIn value)? logIn,
    TResult Function(_ForgotPassword value)? forgotPassword,
    TResult Function(_ResetPassword value)? resetPassword,
    TResult Function(_FetchRemoteConfig value)? fetchRemoteConfig,
    TResult Function(_LogOut value)? logOut,
    required TResult orElse(),
  }) {
    if (fetchRemoteConfig != null) {
      return fetchRemoteConfig(this);
    }
    return orElse();
  }
}

abstract class _FetchRemoteConfig implements AuthEvent {
  const factory _FetchRemoteConfig() = _$_FetchRemoteConfig;
}

/// @nodoc
abstract class _$$_LogOutCopyWith<$Res> {
  factory _$$_LogOutCopyWith(_$_LogOut value, $Res Function(_$_LogOut) then) =
      __$$_LogOutCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LogOutCopyWithImpl<$Res> extends _$AuthEventCopyWithImpl<$Res>
    implements _$$_LogOutCopyWith<$Res> {
  __$$_LogOutCopyWithImpl(_$_LogOut _value, $Res Function(_$_LogOut) _then)
      : super(_value, (v) => _then(v as _$_LogOut));

  @override
  _$_LogOut get _value => super._value as _$_LogOut;
}

/// @nodoc

class _$_LogOut implements _LogOut {
  const _$_LogOut();

  @override
  String toString() {
    return 'AuthEvent.logOut()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_LogOut);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function() hasBio,
    required TResult Function(LoginRequestModel loginRequestModel) logIn,
    required TResult Function(
            ForgotPasswordRequestModel forgotPasswordRequestModel)
        forgotPassword,
    required TResult Function(
            ResetPasswordRequestModel resetPasswordRequestModel)
        resetPassword,
    required TResult Function() fetchRemoteConfig,
    required TResult Function() logOut,
  }) {
    return logOut();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? load,
    TResult Function()? hasBio,
    TResult Function(LoginRequestModel loginRequestModel)? logIn,
    TResult Function(ForgotPasswordRequestModel forgotPasswordRequestModel)?
        forgotPassword,
    TResult Function(ResetPasswordRequestModel resetPasswordRequestModel)?
        resetPassword,
    TResult Function()? fetchRemoteConfig,
    TResult Function()? logOut,
  }) {
    return logOut?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function()? hasBio,
    TResult Function(LoginRequestModel loginRequestModel)? logIn,
    TResult Function(ForgotPasswordRequestModel forgotPasswordRequestModel)?
        forgotPassword,
    TResult Function(ResetPasswordRequestModel resetPasswordRequestModel)?
        resetPassword,
    TResult Function()? fetchRemoteConfig,
    TResult Function()? logOut,
    required TResult orElse(),
  }) {
    if (logOut != null) {
      return logOut();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
    required TResult Function(_HasBio value) hasBio,
    required TResult Function(_LogIn value) logIn,
    required TResult Function(_ForgotPassword value) forgotPassword,
    required TResult Function(_ResetPassword value) resetPassword,
    required TResult Function(_FetchRemoteConfig value) fetchRemoteConfig,
    required TResult Function(_LogOut value) logOut,
  }) {
    return logOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_HasBio value)? hasBio,
    TResult Function(_LogIn value)? logIn,
    TResult Function(_ForgotPassword value)? forgotPassword,
    TResult Function(_ResetPassword value)? resetPassword,
    TResult Function(_FetchRemoteConfig value)? fetchRemoteConfig,
    TResult Function(_LogOut value)? logOut,
  }) {
    return logOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_HasBio value)? hasBio,
    TResult Function(_LogIn value)? logIn,
    TResult Function(_ForgotPassword value)? forgotPassword,
    TResult Function(_ResetPassword value)? resetPassword,
    TResult Function(_FetchRemoteConfig value)? fetchRemoteConfig,
    TResult Function(_LogOut value)? logOut,
    required TResult orElse(),
  }) {
    if (logOut != null) {
      return logOut(this);
    }
    return orElse();
  }
}

abstract class _LogOut implements AuthEvent {
  const factory _LogOut() = _$_LogOut;
}
