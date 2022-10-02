// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'notification_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NotificationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            NotificationModel? notificationModel, LoadingStatus loadingStatus)
        loadNotifications,
    required TResult Function() loading,
    required TResult Function(LoadingStatus loadingStatus) error,
    required TResult Function(LoadingStatus loadingStatus,
            ReadNotificationModel? readNotificationModel)
        readNotification,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            NotificationModel? notificationModel, LoadingStatus loadingStatus)?
        loadNotifications,
    TResult Function()? loading,
    TResult Function(LoadingStatus loadingStatus)? error,
    TResult Function(LoadingStatus loadingStatus,
            ReadNotificationModel? readNotificationModel)?
        readNotification,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            NotificationModel? notificationModel, LoadingStatus loadingStatus)?
        loadNotifications,
    TResult Function()? loading,
    TResult Function(LoadingStatus loadingStatus)? error,
    TResult Function(LoadingStatus loadingStatus,
            ReadNotificationModel? readNotificationModel)?
        readNotification,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NotificationStateLoadNotification value)
        loadNotifications,
    required TResult Function(_NotificationStateLoading value) loading,
    required TResult Function(_NotificationStateError value) error,
    required TResult Function(_NotificationStateReaadNotificationModel value)
        readNotification,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_NotificationStateLoadNotification value)?
        loadNotifications,
    TResult Function(_NotificationStateLoading value)? loading,
    TResult Function(_NotificationStateError value)? error,
    TResult Function(_NotificationStateReaadNotificationModel value)?
        readNotification,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NotificationStateLoadNotification value)?
        loadNotifications,
    TResult Function(_NotificationStateLoading value)? loading,
    TResult Function(_NotificationStateError value)? error,
    TResult Function(_NotificationStateReaadNotificationModel value)?
        readNotification,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationStateCopyWith<$Res> {
  factory $NotificationStateCopyWith(
          NotificationState value, $Res Function(NotificationState) then) =
      _$NotificationStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$NotificationStateCopyWithImpl<$Res>
    implements $NotificationStateCopyWith<$Res> {
  _$NotificationStateCopyWithImpl(this._value, this._then);

  final NotificationState _value;
  // ignore: unused_field
  final $Res Function(NotificationState) _then;
}

/// @nodoc
abstract class _$$_NotificationStateLoadNotificationCopyWith<$Res> {
  factory _$$_NotificationStateLoadNotificationCopyWith(
          _$_NotificationStateLoadNotification value,
          $Res Function(_$_NotificationStateLoadNotification) then) =
      __$$_NotificationStateLoadNotificationCopyWithImpl<$Res>;
  $Res call(
      {NotificationModel? notificationModel, LoadingStatus loadingStatus});
}

/// @nodoc
class __$$_NotificationStateLoadNotificationCopyWithImpl<$Res>
    extends _$NotificationStateCopyWithImpl<$Res>
    implements _$$_NotificationStateLoadNotificationCopyWith<$Res> {
  __$$_NotificationStateLoadNotificationCopyWithImpl(
      _$_NotificationStateLoadNotification _value,
      $Res Function(_$_NotificationStateLoadNotification) _then)
      : super(_value, (v) => _then(v as _$_NotificationStateLoadNotification));

  @override
  _$_NotificationStateLoadNotification get _value =>
      super._value as _$_NotificationStateLoadNotification;

  @override
  $Res call({
    Object? notificationModel = freezed,
    Object? loadingStatus = freezed,
  }) {
    return _then(_$_NotificationStateLoadNotification(
      notificationModel == freezed
          ? _value.notificationModel
          : notificationModel // ignore: cast_nullable_to_non_nullable
              as NotificationModel?,
      loadingStatus == freezed
          ? _value.loadingStatus
          : loadingStatus // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
    ));
  }
}

/// @nodoc

class _$_NotificationStateLoadNotification
    implements _NotificationStateLoadNotification {
  const _$_NotificationStateLoadNotification(
      this.notificationModel, this.loadingStatus);

  @override
  final NotificationModel? notificationModel;
  @override
  final LoadingStatus loadingStatus;

  @override
  String toString() {
    return 'NotificationState.loadNotifications(notificationModel: $notificationModel, loadingStatus: $loadingStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NotificationStateLoadNotification &&
            const DeepCollectionEquality()
                .equals(other.notificationModel, notificationModel) &&
            const DeepCollectionEquality()
                .equals(other.loadingStatus, loadingStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(notificationModel),
      const DeepCollectionEquality().hash(loadingStatus));

  @JsonKey(ignore: true)
  @override
  _$$_NotificationStateLoadNotificationCopyWith<
          _$_NotificationStateLoadNotification>
      get copyWith => __$$_NotificationStateLoadNotificationCopyWithImpl<
          _$_NotificationStateLoadNotification>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            NotificationModel? notificationModel, LoadingStatus loadingStatus)
        loadNotifications,
    required TResult Function() loading,
    required TResult Function(LoadingStatus loadingStatus) error,
    required TResult Function(LoadingStatus loadingStatus,
            ReadNotificationModel? readNotificationModel)
        readNotification,
  }) {
    return loadNotifications(notificationModel, loadingStatus);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            NotificationModel? notificationModel, LoadingStatus loadingStatus)?
        loadNotifications,
    TResult Function()? loading,
    TResult Function(LoadingStatus loadingStatus)? error,
    TResult Function(LoadingStatus loadingStatus,
            ReadNotificationModel? readNotificationModel)?
        readNotification,
  }) {
    return loadNotifications?.call(notificationModel, loadingStatus);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            NotificationModel? notificationModel, LoadingStatus loadingStatus)?
        loadNotifications,
    TResult Function()? loading,
    TResult Function(LoadingStatus loadingStatus)? error,
    TResult Function(LoadingStatus loadingStatus,
            ReadNotificationModel? readNotificationModel)?
        readNotification,
    required TResult orElse(),
  }) {
    if (loadNotifications != null) {
      return loadNotifications(notificationModel, loadingStatus);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NotificationStateLoadNotification value)
        loadNotifications,
    required TResult Function(_NotificationStateLoading value) loading,
    required TResult Function(_NotificationStateError value) error,
    required TResult Function(_NotificationStateReaadNotificationModel value)
        readNotification,
  }) {
    return loadNotifications(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_NotificationStateLoadNotification value)?
        loadNotifications,
    TResult Function(_NotificationStateLoading value)? loading,
    TResult Function(_NotificationStateError value)? error,
    TResult Function(_NotificationStateReaadNotificationModel value)?
        readNotification,
  }) {
    return loadNotifications?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NotificationStateLoadNotification value)?
        loadNotifications,
    TResult Function(_NotificationStateLoading value)? loading,
    TResult Function(_NotificationStateError value)? error,
    TResult Function(_NotificationStateReaadNotificationModel value)?
        readNotification,
    required TResult orElse(),
  }) {
    if (loadNotifications != null) {
      return loadNotifications(this);
    }
    return orElse();
  }
}

abstract class _NotificationStateLoadNotification implements NotificationState {
  const factory _NotificationStateLoadNotification(
      final NotificationModel? notificationModel,
      final LoadingStatus loadingStatus) = _$_NotificationStateLoadNotification;

  NotificationModel? get notificationModel =>
      throw _privateConstructorUsedError;
  LoadingStatus get loadingStatus => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$_NotificationStateLoadNotificationCopyWith<
          _$_NotificationStateLoadNotification>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_NotificationStateLoadingCopyWith<$Res> {
  factory _$$_NotificationStateLoadingCopyWith(
          _$_NotificationStateLoading value,
          $Res Function(_$_NotificationStateLoading) then) =
      __$$_NotificationStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_NotificationStateLoadingCopyWithImpl<$Res>
    extends _$NotificationStateCopyWithImpl<$Res>
    implements _$$_NotificationStateLoadingCopyWith<$Res> {
  __$$_NotificationStateLoadingCopyWithImpl(_$_NotificationStateLoading _value,
      $Res Function(_$_NotificationStateLoading) _then)
      : super(_value, (v) => _then(v as _$_NotificationStateLoading));

  @override
  _$_NotificationStateLoading get _value =>
      super._value as _$_NotificationStateLoading;
}

/// @nodoc

class _$_NotificationStateLoading implements _NotificationStateLoading {
  const _$_NotificationStateLoading();

  @override
  String toString() {
    return 'NotificationState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NotificationStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            NotificationModel? notificationModel, LoadingStatus loadingStatus)
        loadNotifications,
    required TResult Function() loading,
    required TResult Function(LoadingStatus loadingStatus) error,
    required TResult Function(LoadingStatus loadingStatus,
            ReadNotificationModel? readNotificationModel)
        readNotification,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            NotificationModel? notificationModel, LoadingStatus loadingStatus)?
        loadNotifications,
    TResult Function()? loading,
    TResult Function(LoadingStatus loadingStatus)? error,
    TResult Function(LoadingStatus loadingStatus,
            ReadNotificationModel? readNotificationModel)?
        readNotification,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            NotificationModel? notificationModel, LoadingStatus loadingStatus)?
        loadNotifications,
    TResult Function()? loading,
    TResult Function(LoadingStatus loadingStatus)? error,
    TResult Function(LoadingStatus loadingStatus,
            ReadNotificationModel? readNotificationModel)?
        readNotification,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NotificationStateLoadNotification value)
        loadNotifications,
    required TResult Function(_NotificationStateLoading value) loading,
    required TResult Function(_NotificationStateError value) error,
    required TResult Function(_NotificationStateReaadNotificationModel value)
        readNotification,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_NotificationStateLoadNotification value)?
        loadNotifications,
    TResult Function(_NotificationStateLoading value)? loading,
    TResult Function(_NotificationStateError value)? error,
    TResult Function(_NotificationStateReaadNotificationModel value)?
        readNotification,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NotificationStateLoadNotification value)?
        loadNotifications,
    TResult Function(_NotificationStateLoading value)? loading,
    TResult Function(_NotificationStateError value)? error,
    TResult Function(_NotificationStateReaadNotificationModel value)?
        readNotification,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _NotificationStateLoading implements NotificationState {
  const factory _NotificationStateLoading() = _$_NotificationStateLoading;
}

/// @nodoc
abstract class _$$_NotificationStateErrorCopyWith<$Res> {
  factory _$$_NotificationStateErrorCopyWith(_$_NotificationStateError value,
          $Res Function(_$_NotificationStateError) then) =
      __$$_NotificationStateErrorCopyWithImpl<$Res>;
  $Res call({LoadingStatus loadingStatus});
}

/// @nodoc
class __$$_NotificationStateErrorCopyWithImpl<$Res>
    extends _$NotificationStateCopyWithImpl<$Res>
    implements _$$_NotificationStateErrorCopyWith<$Res> {
  __$$_NotificationStateErrorCopyWithImpl(_$_NotificationStateError _value,
      $Res Function(_$_NotificationStateError) _then)
      : super(_value, (v) => _then(v as _$_NotificationStateError));

  @override
  _$_NotificationStateError get _value =>
      super._value as _$_NotificationStateError;

  @override
  $Res call({
    Object? loadingStatus = freezed,
  }) {
    return _then(_$_NotificationStateError(
      loadingStatus == freezed
          ? _value.loadingStatus
          : loadingStatus // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
    ));
  }
}

/// @nodoc

class _$_NotificationStateError implements _NotificationStateError {
  const _$_NotificationStateError(this.loadingStatus);

  @override
  final LoadingStatus loadingStatus;

  @override
  String toString() {
    return 'NotificationState.error(loadingStatus: $loadingStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NotificationStateError &&
            const DeepCollectionEquality()
                .equals(other.loadingStatus, loadingStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(loadingStatus));

  @JsonKey(ignore: true)
  @override
  _$$_NotificationStateErrorCopyWith<_$_NotificationStateError> get copyWith =>
      __$$_NotificationStateErrorCopyWithImpl<_$_NotificationStateError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            NotificationModel? notificationModel, LoadingStatus loadingStatus)
        loadNotifications,
    required TResult Function() loading,
    required TResult Function(LoadingStatus loadingStatus) error,
    required TResult Function(LoadingStatus loadingStatus,
            ReadNotificationModel? readNotificationModel)
        readNotification,
  }) {
    return error(loadingStatus);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            NotificationModel? notificationModel, LoadingStatus loadingStatus)?
        loadNotifications,
    TResult Function()? loading,
    TResult Function(LoadingStatus loadingStatus)? error,
    TResult Function(LoadingStatus loadingStatus,
            ReadNotificationModel? readNotificationModel)?
        readNotification,
  }) {
    return error?.call(loadingStatus);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            NotificationModel? notificationModel, LoadingStatus loadingStatus)?
        loadNotifications,
    TResult Function()? loading,
    TResult Function(LoadingStatus loadingStatus)? error,
    TResult Function(LoadingStatus loadingStatus,
            ReadNotificationModel? readNotificationModel)?
        readNotification,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(loadingStatus);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NotificationStateLoadNotification value)
        loadNotifications,
    required TResult Function(_NotificationStateLoading value) loading,
    required TResult Function(_NotificationStateError value) error,
    required TResult Function(_NotificationStateReaadNotificationModel value)
        readNotification,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_NotificationStateLoadNotification value)?
        loadNotifications,
    TResult Function(_NotificationStateLoading value)? loading,
    TResult Function(_NotificationStateError value)? error,
    TResult Function(_NotificationStateReaadNotificationModel value)?
        readNotification,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NotificationStateLoadNotification value)?
        loadNotifications,
    TResult Function(_NotificationStateLoading value)? loading,
    TResult Function(_NotificationStateError value)? error,
    TResult Function(_NotificationStateReaadNotificationModel value)?
        readNotification,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _NotificationStateError implements NotificationState {
  const factory _NotificationStateError(final LoadingStatus loadingStatus) =
      _$_NotificationStateError;

  LoadingStatus get loadingStatus => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$_NotificationStateErrorCopyWith<_$_NotificationStateError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_NotificationStateReaadNotificationModelCopyWith<$Res> {
  factory _$$_NotificationStateReaadNotificationModelCopyWith(
          _$_NotificationStateReaadNotificationModel value,
          $Res Function(_$_NotificationStateReaadNotificationModel) then) =
      __$$_NotificationStateReaadNotificationModelCopyWithImpl<$Res>;
  $Res call(
      {LoadingStatus loadingStatus,
      ReadNotificationModel? readNotificationModel});
}

/// @nodoc
class __$$_NotificationStateReaadNotificationModelCopyWithImpl<$Res>
    extends _$NotificationStateCopyWithImpl<$Res>
    implements _$$_NotificationStateReaadNotificationModelCopyWith<$Res> {
  __$$_NotificationStateReaadNotificationModelCopyWithImpl(
      _$_NotificationStateReaadNotificationModel _value,
      $Res Function(_$_NotificationStateReaadNotificationModel) _then)
      : super(_value,
            (v) => _then(v as _$_NotificationStateReaadNotificationModel));

  @override
  _$_NotificationStateReaadNotificationModel get _value =>
      super._value as _$_NotificationStateReaadNotificationModel;

  @override
  $Res call({
    Object? loadingStatus = freezed,
    Object? readNotificationModel = freezed,
  }) {
    return _then(_$_NotificationStateReaadNotificationModel(
      loadingStatus == freezed
          ? _value.loadingStatus
          : loadingStatus // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
      readNotificationModel == freezed
          ? _value.readNotificationModel
          : readNotificationModel // ignore: cast_nullable_to_non_nullable
              as ReadNotificationModel?,
    ));
  }
}

/// @nodoc

class _$_NotificationStateReaadNotificationModel
    implements _NotificationStateReaadNotificationModel {
  const _$_NotificationStateReaadNotificationModel(
      this.loadingStatus, this.readNotificationModel);

  @override
  final LoadingStatus loadingStatus;
  @override
  final ReadNotificationModel? readNotificationModel;

  @override
  String toString() {
    return 'NotificationState.readNotification(loadingStatus: $loadingStatus, readNotificationModel: $readNotificationModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NotificationStateReaadNotificationModel &&
            const DeepCollectionEquality()
                .equals(other.loadingStatus, loadingStatus) &&
            const DeepCollectionEquality()
                .equals(other.readNotificationModel, readNotificationModel));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(loadingStatus),
      const DeepCollectionEquality().hash(readNotificationModel));

  @JsonKey(ignore: true)
  @override
  _$$_NotificationStateReaadNotificationModelCopyWith<
          _$_NotificationStateReaadNotificationModel>
      get copyWith => __$$_NotificationStateReaadNotificationModelCopyWithImpl<
          _$_NotificationStateReaadNotificationModel>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            NotificationModel? notificationModel, LoadingStatus loadingStatus)
        loadNotifications,
    required TResult Function() loading,
    required TResult Function(LoadingStatus loadingStatus) error,
    required TResult Function(LoadingStatus loadingStatus,
            ReadNotificationModel? readNotificationModel)
        readNotification,
  }) {
    return readNotification(loadingStatus, readNotificationModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            NotificationModel? notificationModel, LoadingStatus loadingStatus)?
        loadNotifications,
    TResult Function()? loading,
    TResult Function(LoadingStatus loadingStatus)? error,
    TResult Function(LoadingStatus loadingStatus,
            ReadNotificationModel? readNotificationModel)?
        readNotification,
  }) {
    return readNotification?.call(loadingStatus, readNotificationModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            NotificationModel? notificationModel, LoadingStatus loadingStatus)?
        loadNotifications,
    TResult Function()? loading,
    TResult Function(LoadingStatus loadingStatus)? error,
    TResult Function(LoadingStatus loadingStatus,
            ReadNotificationModel? readNotificationModel)?
        readNotification,
    required TResult orElse(),
  }) {
    if (readNotification != null) {
      return readNotification(loadingStatus, readNotificationModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NotificationStateLoadNotification value)
        loadNotifications,
    required TResult Function(_NotificationStateLoading value) loading,
    required TResult Function(_NotificationStateError value) error,
    required TResult Function(_NotificationStateReaadNotificationModel value)
        readNotification,
  }) {
    return readNotification(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_NotificationStateLoadNotification value)?
        loadNotifications,
    TResult Function(_NotificationStateLoading value)? loading,
    TResult Function(_NotificationStateError value)? error,
    TResult Function(_NotificationStateReaadNotificationModel value)?
        readNotification,
  }) {
    return readNotification?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NotificationStateLoadNotification value)?
        loadNotifications,
    TResult Function(_NotificationStateLoading value)? loading,
    TResult Function(_NotificationStateError value)? error,
    TResult Function(_NotificationStateReaadNotificationModel value)?
        readNotification,
    required TResult orElse(),
  }) {
    if (readNotification != null) {
      return readNotification(this);
    }
    return orElse();
  }
}

abstract class _NotificationStateReaadNotificationModel
    implements NotificationState {
  const factory _NotificationStateReaadNotificationModel(
          final LoadingStatus loadingStatus,
          final ReadNotificationModel? readNotificationModel) =
      _$_NotificationStateReaadNotificationModel;

  LoadingStatus get loadingStatus => throw _privateConstructorUsedError;
  ReadNotificationModel? get readNotificationModel =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$_NotificationStateReaadNotificationModelCopyWith<
          _$_NotificationStateReaadNotificationModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$NotificationEvent {
  BuildContext get context => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context) loadNotifications,
    required TResult Function(BuildContext context,
            ReadNotificationRequestModel readNotificationRequestModel)
        readNotification,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(BuildContext context)? loadNotifications,
    TResult Function(BuildContext context,
            ReadNotificationRequestModel readNotificationRequestModel)?
        readNotification,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context)? loadNotifications,
    TResult Function(BuildContext context,
            ReadNotificationRequestModel readNotificationRequestModel)?
        readNotification,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_loadNotifications value) loadNotifications,
    required TResult Function(_readNotification value) readNotification,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_loadNotifications value)? loadNotifications,
    TResult Function(_readNotification value)? readNotification,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_loadNotifications value)? loadNotifications,
    TResult Function(_readNotification value)? readNotification,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NotificationEventCopyWith<NotificationEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationEventCopyWith<$Res> {
  factory $NotificationEventCopyWith(
          NotificationEvent value, $Res Function(NotificationEvent) then) =
      _$NotificationEventCopyWithImpl<$Res>;
  $Res call({BuildContext context});
}

/// @nodoc
class _$NotificationEventCopyWithImpl<$Res>
    implements $NotificationEventCopyWith<$Res> {
  _$NotificationEventCopyWithImpl(this._value, this._then);

  final NotificationEvent _value;
  // ignore: unused_field
  final $Res Function(NotificationEvent) _then;

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
abstract class _$$_loadNotificationsCopyWith<$Res>
    implements $NotificationEventCopyWith<$Res> {
  factory _$$_loadNotificationsCopyWith(_$_loadNotifications value,
          $Res Function(_$_loadNotifications) then) =
      __$$_loadNotificationsCopyWithImpl<$Res>;
  @override
  $Res call({BuildContext context});
}

/// @nodoc
class __$$_loadNotificationsCopyWithImpl<$Res>
    extends _$NotificationEventCopyWithImpl<$Res>
    implements _$$_loadNotificationsCopyWith<$Res> {
  __$$_loadNotificationsCopyWithImpl(
      _$_loadNotifications _value, $Res Function(_$_loadNotifications) _then)
      : super(_value, (v) => _then(v as _$_loadNotifications));

  @override
  _$_loadNotifications get _value => super._value as _$_loadNotifications;

  @override
  $Res call({
    Object? context = freezed,
  }) {
    return _then(_$_loadNotifications(
      context == freezed
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
    ));
  }
}

/// @nodoc

class _$_loadNotifications implements _loadNotifications {
  const _$_loadNotifications(this.context);

  @override
  final BuildContext context;

  @override
  String toString() {
    return 'NotificationEvent.loadNotifications(context: $context)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_loadNotifications &&
            const DeepCollectionEquality().equals(other.context, context));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(context));

  @JsonKey(ignore: true)
  @override
  _$$_loadNotificationsCopyWith<_$_loadNotifications> get copyWith =>
      __$$_loadNotificationsCopyWithImpl<_$_loadNotifications>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context) loadNotifications,
    required TResult Function(BuildContext context,
            ReadNotificationRequestModel readNotificationRequestModel)
        readNotification,
  }) {
    return loadNotifications(context);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(BuildContext context)? loadNotifications,
    TResult Function(BuildContext context,
            ReadNotificationRequestModel readNotificationRequestModel)?
        readNotification,
  }) {
    return loadNotifications?.call(context);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context)? loadNotifications,
    TResult Function(BuildContext context,
            ReadNotificationRequestModel readNotificationRequestModel)?
        readNotification,
    required TResult orElse(),
  }) {
    if (loadNotifications != null) {
      return loadNotifications(context);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_loadNotifications value) loadNotifications,
    required TResult Function(_readNotification value) readNotification,
  }) {
    return loadNotifications(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_loadNotifications value)? loadNotifications,
    TResult Function(_readNotification value)? readNotification,
  }) {
    return loadNotifications?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_loadNotifications value)? loadNotifications,
    TResult Function(_readNotification value)? readNotification,
    required TResult orElse(),
  }) {
    if (loadNotifications != null) {
      return loadNotifications(this);
    }
    return orElse();
  }
}

abstract class _loadNotifications implements NotificationEvent {
  const factory _loadNotifications(final BuildContext context) =
      _$_loadNotifications;

  @override
  BuildContext get context => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_loadNotificationsCopyWith<_$_loadNotifications> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_readNotificationCopyWith<$Res>
    implements $NotificationEventCopyWith<$Res> {
  factory _$$_readNotificationCopyWith(
          _$_readNotification value, $Res Function(_$_readNotification) then) =
      __$$_readNotificationCopyWithImpl<$Res>;
  @override
  $Res call(
      {BuildContext context,
      ReadNotificationRequestModel readNotificationRequestModel});
}

/// @nodoc
class __$$_readNotificationCopyWithImpl<$Res>
    extends _$NotificationEventCopyWithImpl<$Res>
    implements _$$_readNotificationCopyWith<$Res> {
  __$$_readNotificationCopyWithImpl(
      _$_readNotification _value, $Res Function(_$_readNotification) _then)
      : super(_value, (v) => _then(v as _$_readNotification));

  @override
  _$_readNotification get _value => super._value as _$_readNotification;

  @override
  $Res call({
    Object? context = freezed,
    Object? readNotificationRequestModel = freezed,
  }) {
    return _then(_$_readNotification(
      context == freezed
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      readNotificationRequestModel == freezed
          ? _value.readNotificationRequestModel
          : readNotificationRequestModel // ignore: cast_nullable_to_non_nullable
              as ReadNotificationRequestModel,
    ));
  }
}

/// @nodoc

class _$_readNotification implements _readNotification {
  const _$_readNotification(this.context, this.readNotificationRequestModel);

  @override
  final BuildContext context;
  @override
  final ReadNotificationRequestModel readNotificationRequestModel;

  @override
  String toString() {
    return 'NotificationEvent.readNotification(context: $context, readNotificationRequestModel: $readNotificationRequestModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_readNotification &&
            const DeepCollectionEquality().equals(other.context, context) &&
            const DeepCollectionEquality().equals(
                other.readNotificationRequestModel,
                readNotificationRequestModel));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(context),
      const DeepCollectionEquality().hash(readNotificationRequestModel));

  @JsonKey(ignore: true)
  @override
  _$$_readNotificationCopyWith<_$_readNotification> get copyWith =>
      __$$_readNotificationCopyWithImpl<_$_readNotification>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context) loadNotifications,
    required TResult Function(BuildContext context,
            ReadNotificationRequestModel readNotificationRequestModel)
        readNotification,
  }) {
    return readNotification(context, readNotificationRequestModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(BuildContext context)? loadNotifications,
    TResult Function(BuildContext context,
            ReadNotificationRequestModel readNotificationRequestModel)?
        readNotification,
  }) {
    return readNotification?.call(context, readNotificationRequestModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context)? loadNotifications,
    TResult Function(BuildContext context,
            ReadNotificationRequestModel readNotificationRequestModel)?
        readNotification,
    required TResult orElse(),
  }) {
    if (readNotification != null) {
      return readNotification(context, readNotificationRequestModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_loadNotifications value) loadNotifications,
    required TResult Function(_readNotification value) readNotification,
  }) {
    return readNotification(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_loadNotifications value)? loadNotifications,
    TResult Function(_readNotification value)? readNotification,
  }) {
    return readNotification?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_loadNotifications value)? loadNotifications,
    TResult Function(_readNotification value)? readNotification,
    required TResult orElse(),
  }) {
    if (readNotification != null) {
      return readNotification(this);
    }
    return orElse();
  }
}

abstract class _readNotification implements NotificationEvent {
  const factory _readNotification(final BuildContext context,
          final ReadNotificationRequestModel readNotificationRequestModel) =
      _$_readNotification;

  @override
  BuildContext get context => throw _privateConstructorUsedError;
  ReadNotificationRequestModel get readNotificationRequestModel =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_readNotificationCopyWith<_$_readNotification> get copyWith =>
      throw _privateConstructorUsedError;
}
