// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_profile_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserProfileState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserProfileModel? userProfileModel) load,
    required TResult Function() loading,
    required TResult Function() empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(UserProfileModel? userProfileModel)? load,
    TResult Function()? loading,
    TResult Function()? empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserProfileModel? userProfileModel)? load,
    TResult Function()? loading,
    TResult Function()? empty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UserProfileState value) load,
    required TResult Function(_UserProfileLoadingState value) loading,
    required TResult Function(_UserProfileEmptyState value) empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_UserProfileState value)? load,
    TResult Function(_UserProfileLoadingState value)? loading,
    TResult Function(_UserProfileEmptyState value)? empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UserProfileState value)? load,
    TResult Function(_UserProfileLoadingState value)? loading,
    TResult Function(_UserProfileEmptyState value)? empty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileStateCopyWith<$Res> {
  factory $UserProfileStateCopyWith(
          UserProfileState value, $Res Function(UserProfileState) then) =
      _$UserProfileStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$UserProfileStateCopyWithImpl<$Res>
    implements $UserProfileStateCopyWith<$Res> {
  _$UserProfileStateCopyWithImpl(this._value, this._then);

  final UserProfileState _value;
  // ignore: unused_field
  final $Res Function(UserProfileState) _then;
}

/// @nodoc
abstract class _$$_UserProfileStateCopyWith<$Res> {
  factory _$$_UserProfileStateCopyWith(
          _$_UserProfileState value, $Res Function(_$_UserProfileState) then) =
      __$$_UserProfileStateCopyWithImpl<$Res>;
  $Res call({UserProfileModel? userProfileModel});
}

/// @nodoc
class __$$_UserProfileStateCopyWithImpl<$Res>
    extends _$UserProfileStateCopyWithImpl<$Res>
    implements _$$_UserProfileStateCopyWith<$Res> {
  __$$_UserProfileStateCopyWithImpl(
      _$_UserProfileState _value, $Res Function(_$_UserProfileState) _then)
      : super(_value, (v) => _then(v as _$_UserProfileState));

  @override
  _$_UserProfileState get _value => super._value as _$_UserProfileState;

  @override
  $Res call({
    Object? userProfileModel = freezed,
  }) {
    return _then(_$_UserProfileState(
      userProfileModel == freezed
          ? _value.userProfileModel
          : userProfileModel // ignore: cast_nullable_to_non_nullable
              as UserProfileModel?,
    ));
  }
}

/// @nodoc

class _$_UserProfileState implements _UserProfileState {
  const _$_UserProfileState(this.userProfileModel);

  @override
  final UserProfileModel? userProfileModel;

  @override
  String toString() {
    return 'UserProfileState.load(userProfileModel: $userProfileModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserProfileState &&
            const DeepCollectionEquality()
                .equals(other.userProfileModel, userProfileModel));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(userProfileModel));

  @JsonKey(ignore: true)
  @override
  _$$_UserProfileStateCopyWith<_$_UserProfileState> get copyWith =>
      __$$_UserProfileStateCopyWithImpl<_$_UserProfileState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserProfileModel? userProfileModel) load,
    required TResult Function() loading,
    required TResult Function() empty,
  }) {
    return load(userProfileModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(UserProfileModel? userProfileModel)? load,
    TResult Function()? loading,
    TResult Function()? empty,
  }) {
    return load?.call(userProfileModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserProfileModel? userProfileModel)? load,
    TResult Function()? loading,
    TResult Function()? empty,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(userProfileModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UserProfileState value) load,
    required TResult Function(_UserProfileLoadingState value) loading,
    required TResult Function(_UserProfileEmptyState value) empty,
  }) {
    return load(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_UserProfileState value)? load,
    TResult Function(_UserProfileLoadingState value)? loading,
    TResult Function(_UserProfileEmptyState value)? empty,
  }) {
    return load?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UserProfileState value)? load,
    TResult Function(_UserProfileLoadingState value)? loading,
    TResult Function(_UserProfileEmptyState value)? empty,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(this);
    }
    return orElse();
  }
}

abstract class _UserProfileState implements UserProfileState {
  const factory _UserProfileState(final UserProfileModel? userProfileModel) =
      _$_UserProfileState;

  UserProfileModel? get userProfileModel => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$_UserProfileStateCopyWith<_$_UserProfileState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UserProfileLoadingStateCopyWith<$Res> {
  factory _$$_UserProfileLoadingStateCopyWith(_$_UserProfileLoadingState value,
          $Res Function(_$_UserProfileLoadingState) then) =
      __$$_UserProfileLoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_UserProfileLoadingStateCopyWithImpl<$Res>
    extends _$UserProfileStateCopyWithImpl<$Res>
    implements _$$_UserProfileLoadingStateCopyWith<$Res> {
  __$$_UserProfileLoadingStateCopyWithImpl(_$_UserProfileLoadingState _value,
      $Res Function(_$_UserProfileLoadingState) _then)
      : super(_value, (v) => _then(v as _$_UserProfileLoadingState));

  @override
  _$_UserProfileLoadingState get _value =>
      super._value as _$_UserProfileLoadingState;
}

/// @nodoc

class _$_UserProfileLoadingState implements _UserProfileLoadingState {
  const _$_UserProfileLoadingState();

  @override
  String toString() {
    return 'UserProfileState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserProfileLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserProfileModel? userProfileModel) load,
    required TResult Function() loading,
    required TResult Function() empty,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(UserProfileModel? userProfileModel)? load,
    TResult Function()? loading,
    TResult Function()? empty,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserProfileModel? userProfileModel)? load,
    TResult Function()? loading,
    TResult Function()? empty,
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
    required TResult Function(_UserProfileState value) load,
    required TResult Function(_UserProfileLoadingState value) loading,
    required TResult Function(_UserProfileEmptyState value) empty,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_UserProfileState value)? load,
    TResult Function(_UserProfileLoadingState value)? loading,
    TResult Function(_UserProfileEmptyState value)? empty,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UserProfileState value)? load,
    TResult Function(_UserProfileLoadingState value)? loading,
    TResult Function(_UserProfileEmptyState value)? empty,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _UserProfileLoadingState implements UserProfileState {
  const factory _UserProfileLoadingState() = _$_UserProfileLoadingState;
}

/// @nodoc
abstract class _$$_UserProfileEmptyStateCopyWith<$Res> {
  factory _$$_UserProfileEmptyStateCopyWith(_$_UserProfileEmptyState value,
          $Res Function(_$_UserProfileEmptyState) then) =
      __$$_UserProfileEmptyStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_UserProfileEmptyStateCopyWithImpl<$Res>
    extends _$UserProfileStateCopyWithImpl<$Res>
    implements _$$_UserProfileEmptyStateCopyWith<$Res> {
  __$$_UserProfileEmptyStateCopyWithImpl(_$_UserProfileEmptyState _value,
      $Res Function(_$_UserProfileEmptyState) _then)
      : super(_value, (v) => _then(v as _$_UserProfileEmptyState));

  @override
  _$_UserProfileEmptyState get _value =>
      super._value as _$_UserProfileEmptyState;
}

/// @nodoc

class _$_UserProfileEmptyState implements _UserProfileEmptyState {
  const _$_UserProfileEmptyState();

  @override
  String toString() {
    return 'UserProfileState.empty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_UserProfileEmptyState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserProfileModel? userProfileModel) load,
    required TResult Function() loading,
    required TResult Function() empty,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(UserProfileModel? userProfileModel)? load,
    TResult Function()? loading,
    TResult Function()? empty,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserProfileModel? userProfileModel)? load,
    TResult Function()? loading,
    TResult Function()? empty,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UserProfileState value) load,
    required TResult Function(_UserProfileLoadingState value) loading,
    required TResult Function(_UserProfileEmptyState value) empty,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_UserProfileState value)? load,
    TResult Function(_UserProfileLoadingState value)? loading,
    TResult Function(_UserProfileEmptyState value)? empty,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UserProfileState value)? load,
    TResult Function(_UserProfileLoadingState value)? loading,
    TResult Function(_UserProfileEmptyState value)? empty,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class _UserProfileEmptyState implements UserProfileState {
  const factory _UserProfileEmptyState() = _$_UserProfileEmptyState;
}

/// @nodoc
mixin _$UpdateProfileState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UpdateProfileModel? updateProfileModel) load,
    required TResult Function() empty,
    required TResult Function() loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(UpdateProfileModel? updateProfileModel)? load,
    TResult Function()? empty,
    TResult Function()? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UpdateProfileModel? updateProfileModel)? load,
    TResult Function()? empty,
    TResult Function()? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateProfileState value) load,
    required TResult Function(_UpdateEmptyState value) empty,
    required TResult Function(_UpdateLoadingState value) loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_UpdateProfileState value)? load,
    TResult Function(_UpdateEmptyState value)? empty,
    TResult Function(_UpdateLoadingState value)? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateProfileState value)? load,
    TResult Function(_UpdateEmptyState value)? empty,
    TResult Function(_UpdateLoadingState value)? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateProfileStateCopyWith<$Res> {
  factory $UpdateProfileStateCopyWith(
          UpdateProfileState value, $Res Function(UpdateProfileState) then) =
      _$UpdateProfileStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$UpdateProfileStateCopyWithImpl<$Res>
    implements $UpdateProfileStateCopyWith<$Res> {
  _$UpdateProfileStateCopyWithImpl(this._value, this._then);

  final UpdateProfileState _value;
  // ignore: unused_field
  final $Res Function(UpdateProfileState) _then;
}

/// @nodoc
abstract class _$$_UpdateProfileStateCopyWith<$Res> {
  factory _$$_UpdateProfileStateCopyWith(_$_UpdateProfileState value,
          $Res Function(_$_UpdateProfileState) then) =
      __$$_UpdateProfileStateCopyWithImpl<$Res>;
  $Res call({UpdateProfileModel? updateProfileModel});
}

/// @nodoc
class __$$_UpdateProfileStateCopyWithImpl<$Res>
    extends _$UpdateProfileStateCopyWithImpl<$Res>
    implements _$$_UpdateProfileStateCopyWith<$Res> {
  __$$_UpdateProfileStateCopyWithImpl(
      _$_UpdateProfileState _value, $Res Function(_$_UpdateProfileState) _then)
      : super(_value, (v) => _then(v as _$_UpdateProfileState));

  @override
  _$_UpdateProfileState get _value => super._value as _$_UpdateProfileState;

  @override
  $Res call({
    Object? updateProfileModel = freezed,
  }) {
    return _then(_$_UpdateProfileState(
      updateProfileModel == freezed
          ? _value.updateProfileModel
          : updateProfileModel // ignore: cast_nullable_to_non_nullable
              as UpdateProfileModel?,
    ));
  }
}

/// @nodoc

class _$_UpdateProfileState implements _UpdateProfileState {
  const _$_UpdateProfileState(this.updateProfileModel);

  @override
  final UpdateProfileModel? updateProfileModel;

  @override
  String toString() {
    return 'UpdateProfileState.load(updateProfileModel: $updateProfileModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateProfileState &&
            const DeepCollectionEquality()
                .equals(other.updateProfileModel, updateProfileModel));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(updateProfileModel));

  @JsonKey(ignore: true)
  @override
  _$$_UpdateProfileStateCopyWith<_$_UpdateProfileState> get copyWith =>
      __$$_UpdateProfileStateCopyWithImpl<_$_UpdateProfileState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UpdateProfileModel? updateProfileModel) load,
    required TResult Function() empty,
    required TResult Function() loading,
  }) {
    return load(updateProfileModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(UpdateProfileModel? updateProfileModel)? load,
    TResult Function()? empty,
    TResult Function()? loading,
  }) {
    return load?.call(updateProfileModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UpdateProfileModel? updateProfileModel)? load,
    TResult Function()? empty,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(updateProfileModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateProfileState value) load,
    required TResult Function(_UpdateEmptyState value) empty,
    required TResult Function(_UpdateLoadingState value) loading,
  }) {
    return load(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_UpdateProfileState value)? load,
    TResult Function(_UpdateEmptyState value)? empty,
    TResult Function(_UpdateLoadingState value)? loading,
  }) {
    return load?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateProfileState value)? load,
    TResult Function(_UpdateEmptyState value)? empty,
    TResult Function(_UpdateLoadingState value)? loading,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(this);
    }
    return orElse();
  }
}

abstract class _UpdateProfileState implements UpdateProfileState {
  const factory _UpdateProfileState(
      final UpdateProfileModel? updateProfileModel) = _$_UpdateProfileState;

  UpdateProfileModel? get updateProfileModel =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$_UpdateProfileStateCopyWith<_$_UpdateProfileState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UpdateEmptyStateCopyWith<$Res> {
  factory _$$_UpdateEmptyStateCopyWith(
          _$_UpdateEmptyState value, $Res Function(_$_UpdateEmptyState) then) =
      __$$_UpdateEmptyStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_UpdateEmptyStateCopyWithImpl<$Res>
    extends _$UpdateProfileStateCopyWithImpl<$Res>
    implements _$$_UpdateEmptyStateCopyWith<$Res> {
  __$$_UpdateEmptyStateCopyWithImpl(
      _$_UpdateEmptyState _value, $Res Function(_$_UpdateEmptyState) _then)
      : super(_value, (v) => _then(v as _$_UpdateEmptyState));

  @override
  _$_UpdateEmptyState get _value => super._value as _$_UpdateEmptyState;
}

/// @nodoc

class _$_UpdateEmptyState implements _UpdateEmptyState {
  const _$_UpdateEmptyState();

  @override
  String toString() {
    return 'UpdateProfileState.empty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_UpdateEmptyState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UpdateProfileModel? updateProfileModel) load,
    required TResult Function() empty,
    required TResult Function() loading,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(UpdateProfileModel? updateProfileModel)? load,
    TResult Function()? empty,
    TResult Function()? loading,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UpdateProfileModel? updateProfileModel)? load,
    TResult Function()? empty,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateProfileState value) load,
    required TResult Function(_UpdateEmptyState value) empty,
    required TResult Function(_UpdateLoadingState value) loading,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_UpdateProfileState value)? load,
    TResult Function(_UpdateEmptyState value)? empty,
    TResult Function(_UpdateLoadingState value)? loading,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateProfileState value)? load,
    TResult Function(_UpdateEmptyState value)? empty,
    TResult Function(_UpdateLoadingState value)? loading,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class _UpdateEmptyState implements UpdateProfileState {
  const factory _UpdateEmptyState() = _$_UpdateEmptyState;
}

/// @nodoc
abstract class _$$_UpdateLoadingStateCopyWith<$Res> {
  factory _$$_UpdateLoadingStateCopyWith(_$_UpdateLoadingState value,
          $Res Function(_$_UpdateLoadingState) then) =
      __$$_UpdateLoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_UpdateLoadingStateCopyWithImpl<$Res>
    extends _$UpdateProfileStateCopyWithImpl<$Res>
    implements _$$_UpdateLoadingStateCopyWith<$Res> {
  __$$_UpdateLoadingStateCopyWithImpl(
      _$_UpdateLoadingState _value, $Res Function(_$_UpdateLoadingState) _then)
      : super(_value, (v) => _then(v as _$_UpdateLoadingState));

  @override
  _$_UpdateLoadingState get _value => super._value as _$_UpdateLoadingState;
}

/// @nodoc

class _$_UpdateLoadingState implements _UpdateLoadingState {
  const _$_UpdateLoadingState();

  @override
  String toString() {
    return 'UpdateProfileState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_UpdateLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UpdateProfileModel? updateProfileModel) load,
    required TResult Function() empty,
    required TResult Function() loading,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(UpdateProfileModel? updateProfileModel)? load,
    TResult Function()? empty,
    TResult Function()? loading,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UpdateProfileModel? updateProfileModel)? load,
    TResult Function()? empty,
    TResult Function()? loading,
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
    required TResult Function(_UpdateProfileState value) load,
    required TResult Function(_UpdateEmptyState value) empty,
    required TResult Function(_UpdateLoadingState value) loading,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_UpdateProfileState value)? load,
    TResult Function(_UpdateEmptyState value)? empty,
    TResult Function(_UpdateLoadingState value)? loading,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateProfileState value)? load,
    TResult Function(_UpdateEmptyState value)? empty,
    TResult Function(_UpdateLoadingState value)? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _UpdateLoadingState implements UpdateProfileState {
  const factory _UpdateLoadingState() = _$_UpdateLoadingState;
}

/// @nodoc
mixin _$AddNewRecordState {
  LoadingStatus get loadingStatus => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            AddNewRecordModel? addNewRecordModel, LoadingStatus loadingStatus)
        load,
    required TResult Function(
            UserWiseGroup? userWiseGroup, LoadingStatus loadingStatus)
        userWiseGroup,
    required TResult Function(LoadingStatus loadingStatus) empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            AddNewRecordModel? addNewRecordModel, LoadingStatus loadingStatus)?
        load,
    TResult Function(UserWiseGroup? userWiseGroup, LoadingStatus loadingStatus)?
        userWiseGroup,
    TResult Function(LoadingStatus loadingStatus)? empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            AddNewRecordModel? addNewRecordModel, LoadingStatus loadingStatus)?
        load,
    TResult Function(UserWiseGroup? userWiseGroup, LoadingStatus loadingStatus)?
        userWiseGroup,
    TResult Function(LoadingStatus loadingStatus)? empty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddNewRecordState value) load,
    required TResult Function(_UserWiseGroupState value) userWiseGroup,
    required TResult Function(_EmptyState value) empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AddNewRecordState value)? load,
    TResult Function(_UserWiseGroupState value)? userWiseGroup,
    TResult Function(_EmptyState value)? empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddNewRecordState value)? load,
    TResult Function(_UserWiseGroupState value)? userWiseGroup,
    TResult Function(_EmptyState value)? empty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddNewRecordStateCopyWith<AddNewRecordState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddNewRecordStateCopyWith<$Res> {
  factory $AddNewRecordStateCopyWith(
          AddNewRecordState value, $Res Function(AddNewRecordState) then) =
      _$AddNewRecordStateCopyWithImpl<$Res>;
  $Res call({LoadingStatus loadingStatus});
}

/// @nodoc
class _$AddNewRecordStateCopyWithImpl<$Res>
    implements $AddNewRecordStateCopyWith<$Res> {
  _$AddNewRecordStateCopyWithImpl(this._value, this._then);

  final AddNewRecordState _value;
  // ignore: unused_field
  final $Res Function(AddNewRecordState) _then;

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
abstract class _$$_AddNewRecordStateCopyWith<$Res>
    implements $AddNewRecordStateCopyWith<$Res> {
  factory _$$_AddNewRecordStateCopyWith(_$_AddNewRecordState value,
          $Res Function(_$_AddNewRecordState) then) =
      __$$_AddNewRecordStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {AddNewRecordModel? addNewRecordModel, LoadingStatus loadingStatus});
}

/// @nodoc
class __$$_AddNewRecordStateCopyWithImpl<$Res>
    extends _$AddNewRecordStateCopyWithImpl<$Res>
    implements _$$_AddNewRecordStateCopyWith<$Res> {
  __$$_AddNewRecordStateCopyWithImpl(
      _$_AddNewRecordState _value, $Res Function(_$_AddNewRecordState) _then)
      : super(_value, (v) => _then(v as _$_AddNewRecordState));

  @override
  _$_AddNewRecordState get _value => super._value as _$_AddNewRecordState;

  @override
  $Res call({
    Object? addNewRecordModel = freezed,
    Object? loadingStatus = freezed,
  }) {
    return _then(_$_AddNewRecordState(
      addNewRecordModel == freezed
          ? _value.addNewRecordModel
          : addNewRecordModel // ignore: cast_nullable_to_non_nullable
              as AddNewRecordModel?,
      loadingStatus == freezed
          ? _value.loadingStatus
          : loadingStatus // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
    ));
  }
}

/// @nodoc

class _$_AddNewRecordState implements _AddNewRecordState {
  const _$_AddNewRecordState(this.addNewRecordModel, this.loadingStatus);

  @override
  final AddNewRecordModel? addNewRecordModel;
  @override
  final LoadingStatus loadingStatus;

  @override
  String toString() {
    return 'AddNewRecordState.load(addNewRecordModel: $addNewRecordModel, loadingStatus: $loadingStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddNewRecordState &&
            const DeepCollectionEquality()
                .equals(other.addNewRecordModel, addNewRecordModel) &&
            const DeepCollectionEquality()
                .equals(other.loadingStatus, loadingStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(addNewRecordModel),
      const DeepCollectionEquality().hash(loadingStatus));

  @JsonKey(ignore: true)
  @override
  _$$_AddNewRecordStateCopyWith<_$_AddNewRecordState> get copyWith =>
      __$$_AddNewRecordStateCopyWithImpl<_$_AddNewRecordState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            AddNewRecordModel? addNewRecordModel, LoadingStatus loadingStatus)
        load,
    required TResult Function(
            UserWiseGroup? userWiseGroup, LoadingStatus loadingStatus)
        userWiseGroup,
    required TResult Function(LoadingStatus loadingStatus) empty,
  }) {
    return load(addNewRecordModel, loadingStatus);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            AddNewRecordModel? addNewRecordModel, LoadingStatus loadingStatus)?
        load,
    TResult Function(UserWiseGroup? userWiseGroup, LoadingStatus loadingStatus)?
        userWiseGroup,
    TResult Function(LoadingStatus loadingStatus)? empty,
  }) {
    return load?.call(addNewRecordModel, loadingStatus);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            AddNewRecordModel? addNewRecordModel, LoadingStatus loadingStatus)?
        load,
    TResult Function(UserWiseGroup? userWiseGroup, LoadingStatus loadingStatus)?
        userWiseGroup,
    TResult Function(LoadingStatus loadingStatus)? empty,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(addNewRecordModel, loadingStatus);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddNewRecordState value) load,
    required TResult Function(_UserWiseGroupState value) userWiseGroup,
    required TResult Function(_EmptyState value) empty,
  }) {
    return load(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AddNewRecordState value)? load,
    TResult Function(_UserWiseGroupState value)? userWiseGroup,
    TResult Function(_EmptyState value)? empty,
  }) {
    return load?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddNewRecordState value)? load,
    TResult Function(_UserWiseGroupState value)? userWiseGroup,
    TResult Function(_EmptyState value)? empty,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(this);
    }
    return orElse();
  }
}

abstract class _AddNewRecordState implements AddNewRecordState {
  const factory _AddNewRecordState(final AddNewRecordModel? addNewRecordModel,
      final LoadingStatus loadingStatus) = _$_AddNewRecordState;

  AddNewRecordModel? get addNewRecordModel =>
      throw _privateConstructorUsedError;
  @override
  LoadingStatus get loadingStatus => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_AddNewRecordStateCopyWith<_$_AddNewRecordState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UserWiseGroupStateCopyWith<$Res>
    implements $AddNewRecordStateCopyWith<$Res> {
  factory _$$_UserWiseGroupStateCopyWith(_$_UserWiseGroupState value,
          $Res Function(_$_UserWiseGroupState) then) =
      __$$_UserWiseGroupStateCopyWithImpl<$Res>;
  @override
  $Res call({UserWiseGroup? userWiseGroup, LoadingStatus loadingStatus});
}

/// @nodoc
class __$$_UserWiseGroupStateCopyWithImpl<$Res>
    extends _$AddNewRecordStateCopyWithImpl<$Res>
    implements _$$_UserWiseGroupStateCopyWith<$Res> {
  __$$_UserWiseGroupStateCopyWithImpl(
      _$_UserWiseGroupState _value, $Res Function(_$_UserWiseGroupState) _then)
      : super(_value, (v) => _then(v as _$_UserWiseGroupState));

  @override
  _$_UserWiseGroupState get _value => super._value as _$_UserWiseGroupState;

  @override
  $Res call({
    Object? userWiseGroup = freezed,
    Object? loadingStatus = freezed,
  }) {
    return _then(_$_UserWiseGroupState(
      userWiseGroup == freezed
          ? _value.userWiseGroup
          : userWiseGroup // ignore: cast_nullable_to_non_nullable
              as UserWiseGroup?,
      loadingStatus == freezed
          ? _value.loadingStatus
          : loadingStatus // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
    ));
  }
}

/// @nodoc

class _$_UserWiseGroupState implements _UserWiseGroupState {
  const _$_UserWiseGroupState(this.userWiseGroup, this.loadingStatus);

  @override
  final UserWiseGroup? userWiseGroup;
  @override
  final LoadingStatus loadingStatus;

  @override
  String toString() {
    return 'AddNewRecordState.userWiseGroup(userWiseGroup: $userWiseGroup, loadingStatus: $loadingStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserWiseGroupState &&
            const DeepCollectionEquality()
                .equals(other.userWiseGroup, userWiseGroup) &&
            const DeepCollectionEquality()
                .equals(other.loadingStatus, loadingStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userWiseGroup),
      const DeepCollectionEquality().hash(loadingStatus));

  @JsonKey(ignore: true)
  @override
  _$$_UserWiseGroupStateCopyWith<_$_UserWiseGroupState> get copyWith =>
      __$$_UserWiseGroupStateCopyWithImpl<_$_UserWiseGroupState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            AddNewRecordModel? addNewRecordModel, LoadingStatus loadingStatus)
        load,
    required TResult Function(
            UserWiseGroup? userWiseGroup, LoadingStatus loadingStatus)
        userWiseGroup,
    required TResult Function(LoadingStatus loadingStatus) empty,
  }) {
    return userWiseGroup(this.userWiseGroup, loadingStatus);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            AddNewRecordModel? addNewRecordModel, LoadingStatus loadingStatus)?
        load,
    TResult Function(UserWiseGroup? userWiseGroup, LoadingStatus loadingStatus)?
        userWiseGroup,
    TResult Function(LoadingStatus loadingStatus)? empty,
  }) {
    return userWiseGroup?.call(this.userWiseGroup, loadingStatus);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            AddNewRecordModel? addNewRecordModel, LoadingStatus loadingStatus)?
        load,
    TResult Function(UserWiseGroup? userWiseGroup, LoadingStatus loadingStatus)?
        userWiseGroup,
    TResult Function(LoadingStatus loadingStatus)? empty,
    required TResult orElse(),
  }) {
    if (userWiseGroup != null) {
      return userWiseGroup(this.userWiseGroup, loadingStatus);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddNewRecordState value) load,
    required TResult Function(_UserWiseGroupState value) userWiseGroup,
    required TResult Function(_EmptyState value) empty,
  }) {
    return userWiseGroup(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AddNewRecordState value)? load,
    TResult Function(_UserWiseGroupState value)? userWiseGroup,
    TResult Function(_EmptyState value)? empty,
  }) {
    return userWiseGroup?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddNewRecordState value)? load,
    TResult Function(_UserWiseGroupState value)? userWiseGroup,
    TResult Function(_EmptyState value)? empty,
    required TResult orElse(),
  }) {
    if (userWiseGroup != null) {
      return userWiseGroup(this);
    }
    return orElse();
  }
}

abstract class _UserWiseGroupState implements AddNewRecordState {
  const factory _UserWiseGroupState(final UserWiseGroup? userWiseGroup,
      final LoadingStatus loadingStatus) = _$_UserWiseGroupState;

  UserWiseGroup? get userWiseGroup => throw _privateConstructorUsedError;
  @override
  LoadingStatus get loadingStatus => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_UserWiseGroupStateCopyWith<_$_UserWiseGroupState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_EmptyStateCopyWith<$Res>
    implements $AddNewRecordStateCopyWith<$Res> {
  factory _$$_EmptyStateCopyWith(
          _$_EmptyState value, $Res Function(_$_EmptyState) then) =
      __$$_EmptyStateCopyWithImpl<$Res>;
  @override
  $Res call({LoadingStatus loadingStatus});
}

/// @nodoc
class __$$_EmptyStateCopyWithImpl<$Res>
    extends _$AddNewRecordStateCopyWithImpl<$Res>
    implements _$$_EmptyStateCopyWith<$Res> {
  __$$_EmptyStateCopyWithImpl(
      _$_EmptyState _value, $Res Function(_$_EmptyState) _then)
      : super(_value, (v) => _then(v as _$_EmptyState));

  @override
  _$_EmptyState get _value => super._value as _$_EmptyState;

  @override
  $Res call({
    Object? loadingStatus = freezed,
  }) {
    return _then(_$_EmptyState(
      loadingStatus == freezed
          ? _value.loadingStatus
          : loadingStatus // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
    ));
  }
}

/// @nodoc

class _$_EmptyState implements _EmptyState {
  const _$_EmptyState(this.loadingStatus);

  @override
  final LoadingStatus loadingStatus;

  @override
  String toString() {
    return 'AddNewRecordState.empty(loadingStatus: $loadingStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EmptyState &&
            const DeepCollectionEquality()
                .equals(other.loadingStatus, loadingStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(loadingStatus));

  @JsonKey(ignore: true)
  @override
  _$$_EmptyStateCopyWith<_$_EmptyState> get copyWith =>
      __$$_EmptyStateCopyWithImpl<_$_EmptyState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            AddNewRecordModel? addNewRecordModel, LoadingStatus loadingStatus)
        load,
    required TResult Function(
            UserWiseGroup? userWiseGroup, LoadingStatus loadingStatus)
        userWiseGroup,
    required TResult Function(LoadingStatus loadingStatus) empty,
  }) {
    return empty(loadingStatus);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            AddNewRecordModel? addNewRecordModel, LoadingStatus loadingStatus)?
        load,
    TResult Function(UserWiseGroup? userWiseGroup, LoadingStatus loadingStatus)?
        userWiseGroup,
    TResult Function(LoadingStatus loadingStatus)? empty,
  }) {
    return empty?.call(loadingStatus);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            AddNewRecordModel? addNewRecordModel, LoadingStatus loadingStatus)?
        load,
    TResult Function(UserWiseGroup? userWiseGroup, LoadingStatus loadingStatus)?
        userWiseGroup,
    TResult Function(LoadingStatus loadingStatus)? empty,
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
    required TResult Function(_AddNewRecordState value) load,
    required TResult Function(_UserWiseGroupState value) userWiseGroup,
    required TResult Function(_EmptyState value) empty,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AddNewRecordState value)? load,
    TResult Function(_UserWiseGroupState value)? userWiseGroup,
    TResult Function(_EmptyState value)? empty,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddNewRecordState value)? load,
    TResult Function(_UserWiseGroupState value)? userWiseGroup,
    TResult Function(_EmptyState value)? empty,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class _EmptyState implements AddNewRecordState {
  const factory _EmptyState(final LoadingStatus loadingStatus) = _$_EmptyState;

  @override
  LoadingStatus get loadingStatus => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_EmptyStateCopyWith<_$_EmptyState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DeactivateUserState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DeactivateUserModel? deactivateUserModel)
        deactivate,
    required TResult Function() loading,
    required TResult Function() empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(DeactivateUserModel? deactivateUserModel)? deactivate,
    TResult Function()? loading,
    TResult Function()? empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DeactivateUserModel? deactivateUserModel)? deactivate,
    TResult Function()? loading,
    TResult Function()? empty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DeactivateUserDeactivateState value) deactivate,
    required TResult Function(_DeactivateUserLoadingState value) loading,
    required TResult Function(_DeactivateUserEmptyState value) empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_DeactivateUserDeactivateState value)? deactivate,
    TResult Function(_DeactivateUserLoadingState value)? loading,
    TResult Function(_DeactivateUserEmptyState value)? empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DeactivateUserDeactivateState value)? deactivate,
    TResult Function(_DeactivateUserLoadingState value)? loading,
    TResult Function(_DeactivateUserEmptyState value)? empty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeactivateUserStateCopyWith<$Res> {
  factory $DeactivateUserStateCopyWith(
          DeactivateUserState value, $Res Function(DeactivateUserState) then) =
      _$DeactivateUserStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$DeactivateUserStateCopyWithImpl<$Res>
    implements $DeactivateUserStateCopyWith<$Res> {
  _$DeactivateUserStateCopyWithImpl(this._value, this._then);

  final DeactivateUserState _value;
  // ignore: unused_field
  final $Res Function(DeactivateUserState) _then;
}

/// @nodoc
abstract class _$$_DeactivateUserDeactivateStateCopyWith<$Res> {
  factory _$$_DeactivateUserDeactivateStateCopyWith(
          _$_DeactivateUserDeactivateState value,
          $Res Function(_$_DeactivateUserDeactivateState) then) =
      __$$_DeactivateUserDeactivateStateCopyWithImpl<$Res>;
  $Res call({DeactivateUserModel? deactivateUserModel});
}

/// @nodoc
class __$$_DeactivateUserDeactivateStateCopyWithImpl<$Res>
    extends _$DeactivateUserStateCopyWithImpl<$Res>
    implements _$$_DeactivateUserDeactivateStateCopyWith<$Res> {
  __$$_DeactivateUserDeactivateStateCopyWithImpl(
      _$_DeactivateUserDeactivateState _value,
      $Res Function(_$_DeactivateUserDeactivateState) _then)
      : super(_value, (v) => _then(v as _$_DeactivateUserDeactivateState));

  @override
  _$_DeactivateUserDeactivateState get _value =>
      super._value as _$_DeactivateUserDeactivateState;

  @override
  $Res call({
    Object? deactivateUserModel = freezed,
  }) {
    return _then(_$_DeactivateUserDeactivateState(
      deactivateUserModel == freezed
          ? _value.deactivateUserModel
          : deactivateUserModel // ignore: cast_nullable_to_non_nullable
              as DeactivateUserModel?,
    ));
  }
}

/// @nodoc

class _$_DeactivateUserDeactivateState
    implements _DeactivateUserDeactivateState {
  const _$_DeactivateUserDeactivateState(this.deactivateUserModel);

  @override
  final DeactivateUserModel? deactivateUserModel;

  @override
  String toString() {
    return 'DeactivateUserState.deactivate(deactivateUserModel: $deactivateUserModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeactivateUserDeactivateState &&
            const DeepCollectionEquality()
                .equals(other.deactivateUserModel, deactivateUserModel));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(deactivateUserModel));

  @JsonKey(ignore: true)
  @override
  _$$_DeactivateUserDeactivateStateCopyWith<_$_DeactivateUserDeactivateState>
      get copyWith => __$$_DeactivateUserDeactivateStateCopyWithImpl<
          _$_DeactivateUserDeactivateState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DeactivateUserModel? deactivateUserModel)
        deactivate,
    required TResult Function() loading,
    required TResult Function() empty,
  }) {
    return deactivate(deactivateUserModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(DeactivateUserModel? deactivateUserModel)? deactivate,
    TResult Function()? loading,
    TResult Function()? empty,
  }) {
    return deactivate?.call(deactivateUserModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DeactivateUserModel? deactivateUserModel)? deactivate,
    TResult Function()? loading,
    TResult Function()? empty,
    required TResult orElse(),
  }) {
    if (deactivate != null) {
      return deactivate(deactivateUserModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DeactivateUserDeactivateState value) deactivate,
    required TResult Function(_DeactivateUserLoadingState value) loading,
    required TResult Function(_DeactivateUserEmptyState value) empty,
  }) {
    return deactivate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_DeactivateUserDeactivateState value)? deactivate,
    TResult Function(_DeactivateUserLoadingState value)? loading,
    TResult Function(_DeactivateUserEmptyState value)? empty,
  }) {
    return deactivate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DeactivateUserDeactivateState value)? deactivate,
    TResult Function(_DeactivateUserLoadingState value)? loading,
    TResult Function(_DeactivateUserEmptyState value)? empty,
    required TResult orElse(),
  }) {
    if (deactivate != null) {
      return deactivate(this);
    }
    return orElse();
  }
}

abstract class _DeactivateUserDeactivateState implements DeactivateUserState {
  const factory _DeactivateUserDeactivateState(
          final DeactivateUserModel? deactivateUserModel) =
      _$_DeactivateUserDeactivateState;

  DeactivateUserModel? get deactivateUserModel =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$_DeactivateUserDeactivateStateCopyWith<_$_DeactivateUserDeactivateState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_DeactivateUserLoadingStateCopyWith<$Res> {
  factory _$$_DeactivateUserLoadingStateCopyWith(
          _$_DeactivateUserLoadingState value,
          $Res Function(_$_DeactivateUserLoadingState) then) =
      __$$_DeactivateUserLoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_DeactivateUserLoadingStateCopyWithImpl<$Res>
    extends _$DeactivateUserStateCopyWithImpl<$Res>
    implements _$$_DeactivateUserLoadingStateCopyWith<$Res> {
  __$$_DeactivateUserLoadingStateCopyWithImpl(
      _$_DeactivateUserLoadingState _value,
      $Res Function(_$_DeactivateUserLoadingState) _then)
      : super(_value, (v) => _then(v as _$_DeactivateUserLoadingState));

  @override
  _$_DeactivateUserLoadingState get _value =>
      super._value as _$_DeactivateUserLoadingState;
}

/// @nodoc

class _$_DeactivateUserLoadingState implements _DeactivateUserLoadingState {
  const _$_DeactivateUserLoadingState();

  @override
  String toString() {
    return 'DeactivateUserState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeactivateUserLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DeactivateUserModel? deactivateUserModel)
        deactivate,
    required TResult Function() loading,
    required TResult Function() empty,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(DeactivateUserModel? deactivateUserModel)? deactivate,
    TResult Function()? loading,
    TResult Function()? empty,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DeactivateUserModel? deactivateUserModel)? deactivate,
    TResult Function()? loading,
    TResult Function()? empty,
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
    required TResult Function(_DeactivateUserDeactivateState value) deactivate,
    required TResult Function(_DeactivateUserLoadingState value) loading,
    required TResult Function(_DeactivateUserEmptyState value) empty,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_DeactivateUserDeactivateState value)? deactivate,
    TResult Function(_DeactivateUserLoadingState value)? loading,
    TResult Function(_DeactivateUserEmptyState value)? empty,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DeactivateUserDeactivateState value)? deactivate,
    TResult Function(_DeactivateUserLoadingState value)? loading,
    TResult Function(_DeactivateUserEmptyState value)? empty,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _DeactivateUserLoadingState implements DeactivateUserState {
  const factory _DeactivateUserLoadingState() = _$_DeactivateUserLoadingState;
}

/// @nodoc
abstract class _$$_DeactivateUserEmptyStateCopyWith<$Res> {
  factory _$$_DeactivateUserEmptyStateCopyWith(
          _$_DeactivateUserEmptyState value,
          $Res Function(_$_DeactivateUserEmptyState) then) =
      __$$_DeactivateUserEmptyStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_DeactivateUserEmptyStateCopyWithImpl<$Res>
    extends _$DeactivateUserStateCopyWithImpl<$Res>
    implements _$$_DeactivateUserEmptyStateCopyWith<$Res> {
  __$$_DeactivateUserEmptyStateCopyWithImpl(_$_DeactivateUserEmptyState _value,
      $Res Function(_$_DeactivateUserEmptyState) _then)
      : super(_value, (v) => _then(v as _$_DeactivateUserEmptyState));

  @override
  _$_DeactivateUserEmptyState get _value =>
      super._value as _$_DeactivateUserEmptyState;
}

/// @nodoc

class _$_DeactivateUserEmptyState implements _DeactivateUserEmptyState {
  const _$_DeactivateUserEmptyState();

  @override
  String toString() {
    return 'DeactivateUserState.empty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeactivateUserEmptyState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DeactivateUserModel? deactivateUserModel)
        deactivate,
    required TResult Function() loading,
    required TResult Function() empty,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(DeactivateUserModel? deactivateUserModel)? deactivate,
    TResult Function()? loading,
    TResult Function()? empty,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DeactivateUserModel? deactivateUserModel)? deactivate,
    TResult Function()? loading,
    TResult Function()? empty,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DeactivateUserDeactivateState value) deactivate,
    required TResult Function(_DeactivateUserLoadingState value) loading,
    required TResult Function(_DeactivateUserEmptyState value) empty,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_DeactivateUserDeactivateState value)? deactivate,
    TResult Function(_DeactivateUserLoadingState value)? loading,
    TResult Function(_DeactivateUserEmptyState value)? empty,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DeactivateUserDeactivateState value)? deactivate,
    TResult Function(_DeactivateUserLoadingState value)? loading,
    TResult Function(_DeactivateUserEmptyState value)? empty,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class _DeactivateUserEmptyState implements DeactivateUserState {
  const factory _DeactivateUserEmptyState() = _$_DeactivateUserEmptyState;
}

/// @nodoc
mixin _$EventDetailState {
  LoadingStatus get loadingStatus => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            EventDetailModel? eventDetailModel, LoadingStatus loadingStatus)
        load,
    required TResult Function(LoadingStatus loadingStatus) empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            EventDetailModel? eventDetailModel, LoadingStatus loadingStatus)?
        load,
    TResult Function(LoadingStatus loadingStatus)? empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            EventDetailModel? eventDetailModel, LoadingStatus loadingStatus)?
        load,
    TResult Function(LoadingStatus loadingStatus)? empty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EventDetailState value) load,
    required TResult Function(_EventEmptyState value) empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_EventDetailState value)? load,
    TResult Function(_EventEmptyState value)? empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EventDetailState value)? load,
    TResult Function(_EventEmptyState value)? empty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EventDetailStateCopyWith<EventDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventDetailStateCopyWith<$Res> {
  factory $EventDetailStateCopyWith(
          EventDetailState value, $Res Function(EventDetailState) then) =
      _$EventDetailStateCopyWithImpl<$Res>;
  $Res call({LoadingStatus loadingStatus});
}

/// @nodoc
class _$EventDetailStateCopyWithImpl<$Res>
    implements $EventDetailStateCopyWith<$Res> {
  _$EventDetailStateCopyWithImpl(this._value, this._then);

  final EventDetailState _value;
  // ignore: unused_field
  final $Res Function(EventDetailState) _then;

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
abstract class _$$_EventDetailStateCopyWith<$Res>
    implements $EventDetailStateCopyWith<$Res> {
  factory _$$_EventDetailStateCopyWith(
          _$_EventDetailState value, $Res Function(_$_EventDetailState) then) =
      __$$_EventDetailStateCopyWithImpl<$Res>;
  @override
  $Res call({EventDetailModel? eventDetailModel, LoadingStatus loadingStatus});
}

/// @nodoc
class __$$_EventDetailStateCopyWithImpl<$Res>
    extends _$EventDetailStateCopyWithImpl<$Res>
    implements _$$_EventDetailStateCopyWith<$Res> {
  __$$_EventDetailStateCopyWithImpl(
      _$_EventDetailState _value, $Res Function(_$_EventDetailState) _then)
      : super(_value, (v) => _then(v as _$_EventDetailState));

  @override
  _$_EventDetailState get _value => super._value as _$_EventDetailState;

  @override
  $Res call({
    Object? eventDetailModel = freezed,
    Object? loadingStatus = freezed,
  }) {
    return _then(_$_EventDetailState(
      eventDetailModel == freezed
          ? _value.eventDetailModel
          : eventDetailModel // ignore: cast_nullable_to_non_nullable
              as EventDetailModel?,
      loadingStatus == freezed
          ? _value.loadingStatus
          : loadingStatus // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
    ));
  }
}

/// @nodoc

class _$_EventDetailState implements _EventDetailState {
  const _$_EventDetailState(this.eventDetailModel, this.loadingStatus);

  @override
  final EventDetailModel? eventDetailModel;
  @override
  final LoadingStatus loadingStatus;

  @override
  String toString() {
    return 'EventDetailState.load(eventDetailModel: $eventDetailModel, loadingStatus: $loadingStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EventDetailState &&
            const DeepCollectionEquality()
                .equals(other.eventDetailModel, eventDetailModel) &&
            const DeepCollectionEquality()
                .equals(other.loadingStatus, loadingStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(eventDetailModel),
      const DeepCollectionEquality().hash(loadingStatus));

  @JsonKey(ignore: true)
  @override
  _$$_EventDetailStateCopyWith<_$_EventDetailState> get copyWith =>
      __$$_EventDetailStateCopyWithImpl<_$_EventDetailState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            EventDetailModel? eventDetailModel, LoadingStatus loadingStatus)
        load,
    required TResult Function(LoadingStatus loadingStatus) empty,
  }) {
    return load(eventDetailModel, loadingStatus);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            EventDetailModel? eventDetailModel, LoadingStatus loadingStatus)?
        load,
    TResult Function(LoadingStatus loadingStatus)? empty,
  }) {
    return load?.call(eventDetailModel, loadingStatus);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            EventDetailModel? eventDetailModel, LoadingStatus loadingStatus)?
        load,
    TResult Function(LoadingStatus loadingStatus)? empty,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(eventDetailModel, loadingStatus);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EventDetailState value) load,
    required TResult Function(_EventEmptyState value) empty,
  }) {
    return load(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_EventDetailState value)? load,
    TResult Function(_EventEmptyState value)? empty,
  }) {
    return load?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EventDetailState value)? load,
    TResult Function(_EventEmptyState value)? empty,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(this);
    }
    return orElse();
  }
}

abstract class _EventDetailState implements EventDetailState {
  const factory _EventDetailState(final EventDetailModel? eventDetailModel,
      final LoadingStatus loadingStatus) = _$_EventDetailState;

  EventDetailModel? get eventDetailModel => throw _privateConstructorUsedError;
  @override
  LoadingStatus get loadingStatus => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_EventDetailStateCopyWith<_$_EventDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_EventEmptyStateCopyWith<$Res>
    implements $EventDetailStateCopyWith<$Res> {
  factory _$$_EventEmptyStateCopyWith(
          _$_EventEmptyState value, $Res Function(_$_EventEmptyState) then) =
      __$$_EventEmptyStateCopyWithImpl<$Res>;
  @override
  $Res call({LoadingStatus loadingStatus});
}

/// @nodoc
class __$$_EventEmptyStateCopyWithImpl<$Res>
    extends _$EventDetailStateCopyWithImpl<$Res>
    implements _$$_EventEmptyStateCopyWith<$Res> {
  __$$_EventEmptyStateCopyWithImpl(
      _$_EventEmptyState _value, $Res Function(_$_EventEmptyState) _then)
      : super(_value, (v) => _then(v as _$_EventEmptyState));

  @override
  _$_EventEmptyState get _value => super._value as _$_EventEmptyState;

  @override
  $Res call({
    Object? loadingStatus = freezed,
  }) {
    return _then(_$_EventEmptyState(
      loadingStatus == freezed
          ? _value.loadingStatus
          : loadingStatus // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
    ));
  }
}

/// @nodoc

class _$_EventEmptyState implements _EventEmptyState {
  const _$_EventEmptyState(this.loadingStatus);

  @override
  final LoadingStatus loadingStatus;

  @override
  String toString() {
    return 'EventDetailState.empty(loadingStatus: $loadingStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EventEmptyState &&
            const DeepCollectionEquality()
                .equals(other.loadingStatus, loadingStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(loadingStatus));

  @JsonKey(ignore: true)
  @override
  _$$_EventEmptyStateCopyWith<_$_EventEmptyState> get copyWith =>
      __$$_EventEmptyStateCopyWithImpl<_$_EventEmptyState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            EventDetailModel? eventDetailModel, LoadingStatus loadingStatus)
        load,
    required TResult Function(LoadingStatus loadingStatus) empty,
  }) {
    return empty(loadingStatus);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            EventDetailModel? eventDetailModel, LoadingStatus loadingStatus)?
        load,
    TResult Function(LoadingStatus loadingStatus)? empty,
  }) {
    return empty?.call(loadingStatus);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            EventDetailModel? eventDetailModel, LoadingStatus loadingStatus)?
        load,
    TResult Function(LoadingStatus loadingStatus)? empty,
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
    required TResult Function(_EventDetailState value) load,
    required TResult Function(_EventEmptyState value) empty,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_EventDetailState value)? load,
    TResult Function(_EventEmptyState value)? empty,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EventDetailState value)? load,
    TResult Function(_EventEmptyState value)? empty,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class _EventEmptyState implements EventDetailState {
  const factory _EventEmptyState(final LoadingStatus loadingStatus) =
      _$_EventEmptyState;

  @override
  LoadingStatus get loadingStatus => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_EventEmptyStateCopyWith<_$_EventEmptyState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UserProfileEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context, String strRecordId) load,
    required TResult Function(UserProfileModel userProfileModel) edit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(BuildContext context, String strRecordId)? load,
    TResult Function(UserProfileModel userProfileModel)? edit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, String strRecordId)? load,
    TResult Function(UserProfileModel userProfileModel)? edit,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_load value) load,
    required TResult Function(_edit value) edit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_load value)? load,
    TResult Function(_edit value)? edit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_load value)? load,
    TResult Function(_edit value)? edit,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileEventCopyWith<$Res> {
  factory $UserProfileEventCopyWith(
          UserProfileEvent value, $Res Function(UserProfileEvent) then) =
      _$UserProfileEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$UserProfileEventCopyWithImpl<$Res>
    implements $UserProfileEventCopyWith<$Res> {
  _$UserProfileEventCopyWithImpl(this._value, this._then);

  final UserProfileEvent _value;
  // ignore: unused_field
  final $Res Function(UserProfileEvent) _then;
}

/// @nodoc
abstract class _$$_loadCopyWith<$Res> {
  factory _$$_loadCopyWith(_$_load value, $Res Function(_$_load) then) =
      __$$_loadCopyWithImpl<$Res>;
  $Res call({BuildContext context, String strRecordId});
}

/// @nodoc
class __$$_loadCopyWithImpl<$Res> extends _$UserProfileEventCopyWithImpl<$Res>
    implements _$$_loadCopyWith<$Res> {
  __$$_loadCopyWithImpl(_$_load _value, $Res Function(_$_load) _then)
      : super(_value, (v) => _then(v as _$_load));

  @override
  _$_load get _value => super._value as _$_load;

  @override
  $Res call({
    Object? context = freezed,
    Object? strRecordId = freezed,
  }) {
    return _then(_$_load(
      context == freezed
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      strRecordId == freezed
          ? _value.strRecordId
          : strRecordId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_load implements _load {
  const _$_load(this.context, this.strRecordId);

  @override
  final BuildContext context;
  @override
  final String strRecordId;

  @override
  String toString() {
    return 'UserProfileEvent.load(context: $context, strRecordId: $strRecordId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_load &&
            const DeepCollectionEquality().equals(other.context, context) &&
            const DeepCollectionEquality()
                .equals(other.strRecordId, strRecordId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(context),
      const DeepCollectionEquality().hash(strRecordId));

  @JsonKey(ignore: true)
  @override
  _$$_loadCopyWith<_$_load> get copyWith =>
      __$$_loadCopyWithImpl<_$_load>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context, String strRecordId) load,
    required TResult Function(UserProfileModel userProfileModel) edit,
  }) {
    return load(context, strRecordId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(BuildContext context, String strRecordId)? load,
    TResult Function(UserProfileModel userProfileModel)? edit,
  }) {
    return load?.call(context, strRecordId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, String strRecordId)? load,
    TResult Function(UserProfileModel userProfileModel)? edit,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(context, strRecordId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_load value) load,
    required TResult Function(_edit value) edit,
  }) {
    return load(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_load value)? load,
    TResult Function(_edit value)? edit,
  }) {
    return load?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_load value)? load,
    TResult Function(_edit value)? edit,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(this);
    }
    return orElse();
  }
}

abstract class _load implements UserProfileEvent {
  const factory _load(final BuildContext context, final String strRecordId) =
      _$_load;

  BuildContext get context => throw _privateConstructorUsedError;
  String get strRecordId => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$_loadCopyWith<_$_load> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_editCopyWith<$Res> {
  factory _$$_editCopyWith(_$_edit value, $Res Function(_$_edit) then) =
      __$$_editCopyWithImpl<$Res>;
  $Res call({UserProfileModel userProfileModel});
}

/// @nodoc
class __$$_editCopyWithImpl<$Res> extends _$UserProfileEventCopyWithImpl<$Res>
    implements _$$_editCopyWith<$Res> {
  __$$_editCopyWithImpl(_$_edit _value, $Res Function(_$_edit) _then)
      : super(_value, (v) => _then(v as _$_edit));

  @override
  _$_edit get _value => super._value as _$_edit;

  @override
  $Res call({
    Object? userProfileModel = freezed,
  }) {
    return _then(_$_edit(
      userProfileModel == freezed
          ? _value.userProfileModel
          : userProfileModel // ignore: cast_nullable_to_non_nullable
              as UserProfileModel,
    ));
  }
}

/// @nodoc

class _$_edit implements _edit {
  const _$_edit(this.userProfileModel);

  @override
  final UserProfileModel userProfileModel;

  @override
  String toString() {
    return 'UserProfileEvent.edit(userProfileModel: $userProfileModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_edit &&
            const DeepCollectionEquality()
                .equals(other.userProfileModel, userProfileModel));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(userProfileModel));

  @JsonKey(ignore: true)
  @override
  _$$_editCopyWith<_$_edit> get copyWith =>
      __$$_editCopyWithImpl<_$_edit>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context, String strRecordId) load,
    required TResult Function(UserProfileModel userProfileModel) edit,
  }) {
    return edit(userProfileModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(BuildContext context, String strRecordId)? load,
    TResult Function(UserProfileModel userProfileModel)? edit,
  }) {
    return edit?.call(userProfileModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, String strRecordId)? load,
    TResult Function(UserProfileModel userProfileModel)? edit,
    required TResult orElse(),
  }) {
    if (edit != null) {
      return edit(userProfileModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_load value) load,
    required TResult Function(_edit value) edit,
  }) {
    return edit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_load value)? load,
    TResult Function(_edit value)? edit,
  }) {
    return edit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_load value)? load,
    TResult Function(_edit value)? edit,
    required TResult orElse(),
  }) {
    if (edit != null) {
      return edit(this);
    }
    return orElse();
  }
}

abstract class _edit implements UserProfileEvent {
  const factory _edit(final UserProfileModel userProfileModel) = _$_edit;

  UserProfileModel get userProfileModel => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$_editCopyWith<_$_edit> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UpdateProfileEvent {
  UpdateProfileRequestModel get updateProfileRequestModel =>
      throw _privateConstructorUsedError;
  String get token => throw _privateConstructorUsedError;
  BuildContext get context => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            UpdateProfileRequestModel updateProfileRequestModel,
            String token,
            BuildContext context)
        updateProfile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(UpdateProfileRequestModel updateProfileRequestModel,
            String token, BuildContext context)?
        updateProfile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UpdateProfileRequestModel updateProfileRequestModel,
            String token, BuildContext context)?
        updateProfile,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_updateProfile value) updateProfile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_updateProfile value)? updateProfile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_updateProfile value)? updateProfile,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UpdateProfileEventCopyWith<UpdateProfileEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateProfileEventCopyWith<$Res> {
  factory $UpdateProfileEventCopyWith(
          UpdateProfileEvent value, $Res Function(UpdateProfileEvent) then) =
      _$UpdateProfileEventCopyWithImpl<$Res>;
  $Res call(
      {UpdateProfileRequestModel updateProfileRequestModel,
      String token,
      BuildContext context});
}

/// @nodoc
class _$UpdateProfileEventCopyWithImpl<$Res>
    implements $UpdateProfileEventCopyWith<$Res> {
  _$UpdateProfileEventCopyWithImpl(this._value, this._then);

  final UpdateProfileEvent _value;
  // ignore: unused_field
  final $Res Function(UpdateProfileEvent) _then;

  @override
  $Res call({
    Object? updateProfileRequestModel = freezed,
    Object? token = freezed,
    Object? context = freezed,
  }) {
    return _then(_value.copyWith(
      updateProfileRequestModel: updateProfileRequestModel == freezed
          ? _value.updateProfileRequestModel
          : updateProfileRequestModel // ignore: cast_nullable_to_non_nullable
              as UpdateProfileRequestModel,
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      context: context == freezed
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
    ));
  }
}

/// @nodoc
abstract class _$$_updateProfileCopyWith<$Res>
    implements $UpdateProfileEventCopyWith<$Res> {
  factory _$$_updateProfileCopyWith(
          _$_updateProfile value, $Res Function(_$_updateProfile) then) =
      __$$_updateProfileCopyWithImpl<$Res>;
  @override
  $Res call(
      {UpdateProfileRequestModel updateProfileRequestModel,
      String token,
      BuildContext context});
}

/// @nodoc
class __$$_updateProfileCopyWithImpl<$Res>
    extends _$UpdateProfileEventCopyWithImpl<$Res>
    implements _$$_updateProfileCopyWith<$Res> {
  __$$_updateProfileCopyWithImpl(
      _$_updateProfile _value, $Res Function(_$_updateProfile) _then)
      : super(_value, (v) => _then(v as _$_updateProfile));

  @override
  _$_updateProfile get _value => super._value as _$_updateProfile;

  @override
  $Res call({
    Object? updateProfileRequestModel = freezed,
    Object? token = freezed,
    Object? context = freezed,
  }) {
    return _then(_$_updateProfile(
      updateProfileRequestModel == freezed
          ? _value.updateProfileRequestModel
          : updateProfileRequestModel // ignore: cast_nullable_to_non_nullable
              as UpdateProfileRequestModel,
      token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      context == freezed
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
    ));
  }
}

/// @nodoc

class _$_updateProfile implements _updateProfile {
  const _$_updateProfile(
      this.updateProfileRequestModel, this.token, this.context);

  @override
  final UpdateProfileRequestModel updateProfileRequestModel;
  @override
  final String token;
  @override
  final BuildContext context;

  @override
  String toString() {
    return 'UpdateProfileEvent.updateProfile(updateProfileRequestModel: $updateProfileRequestModel, token: $token, context: $context)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_updateProfile &&
            const DeepCollectionEquality().equals(
                other.updateProfileRequestModel, updateProfileRequestModel) &&
            const DeepCollectionEquality().equals(other.token, token) &&
            const DeepCollectionEquality().equals(other.context, context));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(updateProfileRequestModel),
      const DeepCollectionEquality().hash(token),
      const DeepCollectionEquality().hash(context));

  @JsonKey(ignore: true)
  @override
  _$$_updateProfileCopyWith<_$_updateProfile> get copyWith =>
      __$$_updateProfileCopyWithImpl<_$_updateProfile>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            UpdateProfileRequestModel updateProfileRequestModel,
            String token,
            BuildContext context)
        updateProfile,
  }) {
    return updateProfile(updateProfileRequestModel, token, context);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(UpdateProfileRequestModel updateProfileRequestModel,
            String token, BuildContext context)?
        updateProfile,
  }) {
    return updateProfile?.call(updateProfileRequestModel, token, context);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UpdateProfileRequestModel updateProfileRequestModel,
            String token, BuildContext context)?
        updateProfile,
    required TResult orElse(),
  }) {
    if (updateProfile != null) {
      return updateProfile(updateProfileRequestModel, token, context);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_updateProfile value) updateProfile,
  }) {
    return updateProfile(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_updateProfile value)? updateProfile,
  }) {
    return updateProfile?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_updateProfile value)? updateProfile,
    required TResult orElse(),
  }) {
    if (updateProfile != null) {
      return updateProfile(this);
    }
    return orElse();
  }
}

abstract class _updateProfile implements UpdateProfileEvent {
  const factory _updateProfile(
      final UpdateProfileRequestModel updateProfileRequestModel,
      final String token,
      final BuildContext context) = _$_updateProfile;

  @override
  UpdateProfileRequestModel get updateProfileRequestModel =>
      throw _privateConstructorUsedError;
  @override
  String get token => throw _privateConstructorUsedError;
  @override
  BuildContext get context => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_updateProfileCopyWith<_$_updateProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AddNewRecordEvent {
  String get token => throw _privateConstructorUsedError;
  BuildContext get context => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AddNewRecordRequestModel addNewRecordRequestModel,
            String token, BuildContext context)
        addNewRecord,
    required TResult Function(UserWiseGroupRequest userWiseGroupRequest,
            String token, BuildContext context)
        userWiseGroup,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(AddNewRecordRequestModel addNewRecordRequestModel,
            String token, BuildContext context)?
        addNewRecord,
    TResult Function(UserWiseGroupRequest userWiseGroupRequest, String token,
            BuildContext context)?
        userWiseGroup,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AddNewRecordRequestModel addNewRecordRequestModel,
            String token, BuildContext context)?
        addNewRecord,
    TResult Function(UserWiseGroupRequest userWiseGroupRequest, String token,
            BuildContext context)?
        userWiseGroup,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_addNewRecord value) addNewRecord,
    required TResult Function(_userWiseGroupEvent value) userWiseGroup,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_addNewRecord value)? addNewRecord,
    TResult Function(_userWiseGroupEvent value)? userWiseGroup,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_addNewRecord value)? addNewRecord,
    TResult Function(_userWiseGroupEvent value)? userWiseGroup,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddNewRecordEventCopyWith<AddNewRecordEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddNewRecordEventCopyWith<$Res> {
  factory $AddNewRecordEventCopyWith(
          AddNewRecordEvent value, $Res Function(AddNewRecordEvent) then) =
      _$AddNewRecordEventCopyWithImpl<$Res>;
  $Res call({String token, BuildContext context});
}

/// @nodoc
class _$AddNewRecordEventCopyWithImpl<$Res>
    implements $AddNewRecordEventCopyWith<$Res> {
  _$AddNewRecordEventCopyWithImpl(this._value, this._then);

  final AddNewRecordEvent _value;
  // ignore: unused_field
  final $Res Function(AddNewRecordEvent) _then;

  @override
  $Res call({
    Object? token = freezed,
    Object? context = freezed,
  }) {
    return _then(_value.copyWith(
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      context: context == freezed
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
    ));
  }
}

/// @nodoc
abstract class _$$_addNewRecordCopyWith<$Res>
    implements $AddNewRecordEventCopyWith<$Res> {
  factory _$$_addNewRecordCopyWith(
          _$_addNewRecord value, $Res Function(_$_addNewRecord) then) =
      __$$_addNewRecordCopyWithImpl<$Res>;
  @override
  $Res call(
      {AddNewRecordRequestModel addNewRecordRequestModel,
      String token,
      BuildContext context});
}

/// @nodoc
class __$$_addNewRecordCopyWithImpl<$Res>
    extends _$AddNewRecordEventCopyWithImpl<$Res>
    implements _$$_addNewRecordCopyWith<$Res> {
  __$$_addNewRecordCopyWithImpl(
      _$_addNewRecord _value, $Res Function(_$_addNewRecord) _then)
      : super(_value, (v) => _then(v as _$_addNewRecord));

  @override
  _$_addNewRecord get _value => super._value as _$_addNewRecord;

  @override
  $Res call({
    Object? addNewRecordRequestModel = freezed,
    Object? token = freezed,
    Object? context = freezed,
  }) {
    return _then(_$_addNewRecord(
      addNewRecordRequestModel == freezed
          ? _value.addNewRecordRequestModel
          : addNewRecordRequestModel // ignore: cast_nullable_to_non_nullable
              as AddNewRecordRequestModel,
      token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      context == freezed
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
    ));
  }
}

/// @nodoc

class _$_addNewRecord implements _addNewRecord {
  const _$_addNewRecord(
      this.addNewRecordRequestModel, this.token, this.context);

  @override
  final AddNewRecordRequestModel addNewRecordRequestModel;
  @override
  final String token;
  @override
  final BuildContext context;

  @override
  String toString() {
    return 'AddNewRecordEvent.addNewRecord(addNewRecordRequestModel: $addNewRecordRequestModel, token: $token, context: $context)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_addNewRecord &&
            const DeepCollectionEquality().equals(
                other.addNewRecordRequestModel, addNewRecordRequestModel) &&
            const DeepCollectionEquality().equals(other.token, token) &&
            const DeepCollectionEquality().equals(other.context, context));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(addNewRecordRequestModel),
      const DeepCollectionEquality().hash(token),
      const DeepCollectionEquality().hash(context));

  @JsonKey(ignore: true)
  @override
  _$$_addNewRecordCopyWith<_$_addNewRecord> get copyWith =>
      __$$_addNewRecordCopyWithImpl<_$_addNewRecord>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AddNewRecordRequestModel addNewRecordRequestModel,
            String token, BuildContext context)
        addNewRecord,
    required TResult Function(UserWiseGroupRequest userWiseGroupRequest,
            String token, BuildContext context)
        userWiseGroup,
  }) {
    return addNewRecord(addNewRecordRequestModel, token, context);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(AddNewRecordRequestModel addNewRecordRequestModel,
            String token, BuildContext context)?
        addNewRecord,
    TResult Function(UserWiseGroupRequest userWiseGroupRequest, String token,
            BuildContext context)?
        userWiseGroup,
  }) {
    return addNewRecord?.call(addNewRecordRequestModel, token, context);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AddNewRecordRequestModel addNewRecordRequestModel,
            String token, BuildContext context)?
        addNewRecord,
    TResult Function(UserWiseGroupRequest userWiseGroupRequest, String token,
            BuildContext context)?
        userWiseGroup,
    required TResult orElse(),
  }) {
    if (addNewRecord != null) {
      return addNewRecord(addNewRecordRequestModel, token, context);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_addNewRecord value) addNewRecord,
    required TResult Function(_userWiseGroupEvent value) userWiseGroup,
  }) {
    return addNewRecord(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_addNewRecord value)? addNewRecord,
    TResult Function(_userWiseGroupEvent value)? userWiseGroup,
  }) {
    return addNewRecord?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_addNewRecord value)? addNewRecord,
    TResult Function(_userWiseGroupEvent value)? userWiseGroup,
    required TResult orElse(),
  }) {
    if (addNewRecord != null) {
      return addNewRecord(this);
    }
    return orElse();
  }
}

abstract class _addNewRecord implements AddNewRecordEvent {
  const factory _addNewRecord(
      final AddNewRecordRequestModel addNewRecordRequestModel,
      final String token,
      final BuildContext context) = _$_addNewRecord;

  AddNewRecordRequestModel get addNewRecordRequestModel =>
      throw _privateConstructorUsedError;
  @override
  String get token => throw _privateConstructorUsedError;
  @override
  BuildContext get context => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_addNewRecordCopyWith<_$_addNewRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_userWiseGroupEventCopyWith<$Res>
    implements $AddNewRecordEventCopyWith<$Res> {
  factory _$$_userWiseGroupEventCopyWith(_$_userWiseGroupEvent value,
          $Res Function(_$_userWiseGroupEvent) then) =
      __$$_userWiseGroupEventCopyWithImpl<$Res>;
  @override
  $Res call(
      {UserWiseGroupRequest userWiseGroupRequest,
      String token,
      BuildContext context});
}

/// @nodoc
class __$$_userWiseGroupEventCopyWithImpl<$Res>
    extends _$AddNewRecordEventCopyWithImpl<$Res>
    implements _$$_userWiseGroupEventCopyWith<$Res> {
  __$$_userWiseGroupEventCopyWithImpl(
      _$_userWiseGroupEvent _value, $Res Function(_$_userWiseGroupEvent) _then)
      : super(_value, (v) => _then(v as _$_userWiseGroupEvent));

  @override
  _$_userWiseGroupEvent get _value => super._value as _$_userWiseGroupEvent;

  @override
  $Res call({
    Object? userWiseGroupRequest = freezed,
    Object? token = freezed,
    Object? context = freezed,
  }) {
    return _then(_$_userWiseGroupEvent(
      userWiseGroupRequest == freezed
          ? _value.userWiseGroupRequest
          : userWiseGroupRequest // ignore: cast_nullable_to_non_nullable
              as UserWiseGroupRequest,
      token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      context == freezed
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
    ));
  }
}

/// @nodoc

class _$_userWiseGroupEvent implements _userWiseGroupEvent {
  const _$_userWiseGroupEvent(
      this.userWiseGroupRequest, this.token, this.context);

  @override
  final UserWiseGroupRequest userWiseGroupRequest;
  @override
  final String token;
  @override
  final BuildContext context;

  @override
  String toString() {
    return 'AddNewRecordEvent.userWiseGroup(userWiseGroupRequest: $userWiseGroupRequest, token: $token, context: $context)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_userWiseGroupEvent &&
            const DeepCollectionEquality()
                .equals(other.userWiseGroupRequest, userWiseGroupRequest) &&
            const DeepCollectionEquality().equals(other.token, token) &&
            const DeepCollectionEquality().equals(other.context, context));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userWiseGroupRequest),
      const DeepCollectionEquality().hash(token),
      const DeepCollectionEquality().hash(context));

  @JsonKey(ignore: true)
  @override
  _$$_userWiseGroupEventCopyWith<_$_userWiseGroupEvent> get copyWith =>
      __$$_userWiseGroupEventCopyWithImpl<_$_userWiseGroupEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AddNewRecordRequestModel addNewRecordRequestModel,
            String token, BuildContext context)
        addNewRecord,
    required TResult Function(UserWiseGroupRequest userWiseGroupRequest,
            String token, BuildContext context)
        userWiseGroup,
  }) {
    return userWiseGroup(userWiseGroupRequest, token, context);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(AddNewRecordRequestModel addNewRecordRequestModel,
            String token, BuildContext context)?
        addNewRecord,
    TResult Function(UserWiseGroupRequest userWiseGroupRequest, String token,
            BuildContext context)?
        userWiseGroup,
  }) {
    return userWiseGroup?.call(userWiseGroupRequest, token, context);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AddNewRecordRequestModel addNewRecordRequestModel,
            String token, BuildContext context)?
        addNewRecord,
    TResult Function(UserWiseGroupRequest userWiseGroupRequest, String token,
            BuildContext context)?
        userWiseGroup,
    required TResult orElse(),
  }) {
    if (userWiseGroup != null) {
      return userWiseGroup(userWiseGroupRequest, token, context);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_addNewRecord value) addNewRecord,
    required TResult Function(_userWiseGroupEvent value) userWiseGroup,
  }) {
    return userWiseGroup(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_addNewRecord value)? addNewRecord,
    TResult Function(_userWiseGroupEvent value)? userWiseGroup,
  }) {
    return userWiseGroup?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_addNewRecord value)? addNewRecord,
    TResult Function(_userWiseGroupEvent value)? userWiseGroup,
    required TResult orElse(),
  }) {
    if (userWiseGroup != null) {
      return userWiseGroup(this);
    }
    return orElse();
  }
}

abstract class _userWiseGroupEvent implements AddNewRecordEvent {
  const factory _userWiseGroupEvent(
      final UserWiseGroupRequest userWiseGroupRequest,
      final String token,
      final BuildContext context) = _$_userWiseGroupEvent;

  UserWiseGroupRequest get userWiseGroupRequest =>
      throw _privateConstructorUsedError;
  @override
  String get token => throw _privateConstructorUsedError;
  @override
  BuildContext get context => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_userWiseGroupEventCopyWith<_$_userWiseGroupEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DeactivateUserEvent {
  DeactivateUserRequestModel get deactivateUserRequestModel =>
      throw _privateConstructorUsedError;
  String get token => throw _privateConstructorUsedError;
  BuildContext get context => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            DeactivateUserRequestModel deactivateUserRequestModel,
            String token,
            BuildContext context)
        deactivateUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(DeactivateUserRequestModel deactivateUserRequestModel,
            String token, BuildContext context)?
        deactivateUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DeactivateUserRequestModel deactivateUserRequestModel,
            String token, BuildContext context)?
        deactivateUser,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_deactivateUser value) deactivateUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_deactivateUser value)? deactivateUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_deactivateUser value)? deactivateUser,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DeactivateUserEventCopyWith<DeactivateUserEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeactivateUserEventCopyWith<$Res> {
  factory $DeactivateUserEventCopyWith(
          DeactivateUserEvent value, $Res Function(DeactivateUserEvent) then) =
      _$DeactivateUserEventCopyWithImpl<$Res>;
  $Res call(
      {DeactivateUserRequestModel deactivateUserRequestModel,
      String token,
      BuildContext context});
}

/// @nodoc
class _$DeactivateUserEventCopyWithImpl<$Res>
    implements $DeactivateUserEventCopyWith<$Res> {
  _$DeactivateUserEventCopyWithImpl(this._value, this._then);

  final DeactivateUserEvent _value;
  // ignore: unused_field
  final $Res Function(DeactivateUserEvent) _then;

  @override
  $Res call({
    Object? deactivateUserRequestModel = freezed,
    Object? token = freezed,
    Object? context = freezed,
  }) {
    return _then(_value.copyWith(
      deactivateUserRequestModel: deactivateUserRequestModel == freezed
          ? _value.deactivateUserRequestModel
          : deactivateUserRequestModel // ignore: cast_nullable_to_non_nullable
              as DeactivateUserRequestModel,
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      context: context == freezed
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
    ));
  }
}

/// @nodoc
abstract class _$$_deactivateUserCopyWith<$Res>
    implements $DeactivateUserEventCopyWith<$Res> {
  factory _$$_deactivateUserCopyWith(
          _$_deactivateUser value, $Res Function(_$_deactivateUser) then) =
      __$$_deactivateUserCopyWithImpl<$Res>;
  @override
  $Res call(
      {DeactivateUserRequestModel deactivateUserRequestModel,
      String token,
      BuildContext context});
}

/// @nodoc
class __$$_deactivateUserCopyWithImpl<$Res>
    extends _$DeactivateUserEventCopyWithImpl<$Res>
    implements _$$_deactivateUserCopyWith<$Res> {
  __$$_deactivateUserCopyWithImpl(
      _$_deactivateUser _value, $Res Function(_$_deactivateUser) _then)
      : super(_value, (v) => _then(v as _$_deactivateUser));

  @override
  _$_deactivateUser get _value => super._value as _$_deactivateUser;

  @override
  $Res call({
    Object? deactivateUserRequestModel = freezed,
    Object? token = freezed,
    Object? context = freezed,
  }) {
    return _then(_$_deactivateUser(
      deactivateUserRequestModel == freezed
          ? _value.deactivateUserRequestModel
          : deactivateUserRequestModel // ignore: cast_nullable_to_non_nullable
              as DeactivateUserRequestModel,
      token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      context == freezed
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
    ));
  }
}

/// @nodoc

class _$_deactivateUser implements _deactivateUser {
  const _$_deactivateUser(
      this.deactivateUserRequestModel, this.token, this.context);

  @override
  final DeactivateUserRequestModel deactivateUserRequestModel;
  @override
  final String token;
  @override
  final BuildContext context;

  @override
  String toString() {
    return 'DeactivateUserEvent.deactivateUser(deactivateUserRequestModel: $deactivateUserRequestModel, token: $token, context: $context)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_deactivateUser &&
            const DeepCollectionEquality().equals(
                other.deactivateUserRequestModel, deactivateUserRequestModel) &&
            const DeepCollectionEquality().equals(other.token, token) &&
            const DeepCollectionEquality().equals(other.context, context));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(deactivateUserRequestModel),
      const DeepCollectionEquality().hash(token),
      const DeepCollectionEquality().hash(context));

  @JsonKey(ignore: true)
  @override
  _$$_deactivateUserCopyWith<_$_deactivateUser> get copyWith =>
      __$$_deactivateUserCopyWithImpl<_$_deactivateUser>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            DeactivateUserRequestModel deactivateUserRequestModel,
            String token,
            BuildContext context)
        deactivateUser,
  }) {
    return deactivateUser(deactivateUserRequestModel, token, context);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(DeactivateUserRequestModel deactivateUserRequestModel,
            String token, BuildContext context)?
        deactivateUser,
  }) {
    return deactivateUser?.call(deactivateUserRequestModel, token, context);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DeactivateUserRequestModel deactivateUserRequestModel,
            String token, BuildContext context)?
        deactivateUser,
    required TResult orElse(),
  }) {
    if (deactivateUser != null) {
      return deactivateUser(deactivateUserRequestModel, token, context);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_deactivateUser value) deactivateUser,
  }) {
    return deactivateUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_deactivateUser value)? deactivateUser,
  }) {
    return deactivateUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_deactivateUser value)? deactivateUser,
    required TResult orElse(),
  }) {
    if (deactivateUser != null) {
      return deactivateUser(this);
    }
    return orElse();
  }
}

abstract class _deactivateUser implements DeactivateUserEvent {
  const factory _deactivateUser(
      final DeactivateUserRequestModel deactivateUserRequestModel,
      final String token,
      final BuildContext context) = _$_deactivateUser;

  @override
  DeactivateUserRequestModel get deactivateUserRequestModel =>
      throw _privateConstructorUsedError;
  @override
  String get token => throw _privateConstructorUsedError;
  @override
  BuildContext get context => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_deactivateUserCopyWith<_$_deactivateUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$EventDetailEvent {
  int? get eventId => throw _privateConstructorUsedError;
  BuildContext get context => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? eventId, BuildContext context) eventDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int? eventId, BuildContext context)? eventDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? eventId, BuildContext context)? eventDetail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EventDetail value) eventDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_EventDetail value)? eventDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EventDetail value)? eventDetail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EventDetailEventCopyWith<EventDetailEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventDetailEventCopyWith<$Res> {
  factory $EventDetailEventCopyWith(
          EventDetailEvent value, $Res Function(EventDetailEvent) then) =
      _$EventDetailEventCopyWithImpl<$Res>;
  $Res call({int? eventId, BuildContext context});
}

/// @nodoc
class _$EventDetailEventCopyWithImpl<$Res>
    implements $EventDetailEventCopyWith<$Res> {
  _$EventDetailEventCopyWithImpl(this._value, this._then);

  final EventDetailEvent _value;
  // ignore: unused_field
  final $Res Function(EventDetailEvent) _then;

  @override
  $Res call({
    Object? eventId = freezed,
    Object? context = freezed,
  }) {
    return _then(_value.copyWith(
      eventId: eventId == freezed
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as int?,
      context: context == freezed
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
    ));
  }
}

/// @nodoc
abstract class _$$_EventDetailCopyWith<$Res>
    implements $EventDetailEventCopyWith<$Res> {
  factory _$$_EventDetailCopyWith(
          _$_EventDetail value, $Res Function(_$_EventDetail) then) =
      __$$_EventDetailCopyWithImpl<$Res>;
  @override
  $Res call({int? eventId, BuildContext context});
}

/// @nodoc
class __$$_EventDetailCopyWithImpl<$Res>
    extends _$EventDetailEventCopyWithImpl<$Res>
    implements _$$_EventDetailCopyWith<$Res> {
  __$$_EventDetailCopyWithImpl(
      _$_EventDetail _value, $Res Function(_$_EventDetail) _then)
      : super(_value, (v) => _then(v as _$_EventDetail));

  @override
  _$_EventDetail get _value => super._value as _$_EventDetail;

  @override
  $Res call({
    Object? eventId = freezed,
    Object? context = freezed,
  }) {
    return _then(_$_EventDetail(
      eventId == freezed
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as int?,
      context == freezed
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
    ));
  }
}

/// @nodoc

class _$_EventDetail implements _EventDetail {
  const _$_EventDetail(this.eventId, this.context);

  @override
  final int? eventId;
  @override
  final BuildContext context;

  @override
  String toString() {
    return 'EventDetailEvent.eventDetail(eventId: $eventId, context: $context)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EventDetail &&
            const DeepCollectionEquality().equals(other.eventId, eventId) &&
            const DeepCollectionEquality().equals(other.context, context));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(eventId),
      const DeepCollectionEquality().hash(context));

  @JsonKey(ignore: true)
  @override
  _$$_EventDetailCopyWith<_$_EventDetail> get copyWith =>
      __$$_EventDetailCopyWithImpl<_$_EventDetail>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? eventId, BuildContext context) eventDetail,
  }) {
    return eventDetail(eventId, context);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int? eventId, BuildContext context)? eventDetail,
  }) {
    return eventDetail?.call(eventId, context);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? eventId, BuildContext context)? eventDetail,
    required TResult orElse(),
  }) {
    if (eventDetail != null) {
      return eventDetail(eventId, context);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EventDetail value) eventDetail,
  }) {
    return eventDetail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_EventDetail value)? eventDetail,
  }) {
    return eventDetail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EventDetail value)? eventDetail,
    required TResult orElse(),
  }) {
    if (eventDetail != null) {
      return eventDetail(this);
    }
    return orElse();
  }
}

abstract class _EventDetail implements EventDetailEvent {
  const factory _EventDetail(final int? eventId, final BuildContext context) =
      _$_EventDetail;

  @override
  int? get eventId => throw _privateConstructorUsedError;
  @override
  BuildContext get context => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_EventDetailCopyWith<_$_EventDetail> get copyWith =>
      throw _privateConstructorUsedError;
}
