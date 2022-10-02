// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'record_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RecordState {
  RecordModel? get recordModel => throw _privateConstructorUsedError;
  LoadingStatus get loadingStatus => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            RecordModel? recordModel, LoadingStatus loadingStatus)
        loadRecord,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(RecordModel? recordModel, LoadingStatus loadingStatus)?
        loadRecord,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(RecordModel? recordModel, LoadingStatus loadingStatus)?
        loadRecord,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RecordState value) loadRecord,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_RecordState value)? loadRecord,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RecordState value)? loadRecord,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RecordStateCopyWith<RecordState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecordStateCopyWith<$Res> {
  factory $RecordStateCopyWith(
          RecordState value, $Res Function(RecordState) then) =
      _$RecordStateCopyWithImpl<$Res>;
  $Res call({RecordModel? recordModel, LoadingStatus loadingStatus});
}

/// @nodoc
class _$RecordStateCopyWithImpl<$Res> implements $RecordStateCopyWith<$Res> {
  _$RecordStateCopyWithImpl(this._value, this._then);

  final RecordState _value;
  // ignore: unused_field
  final $Res Function(RecordState) _then;

  @override
  $Res call({
    Object? recordModel = freezed,
    Object? loadingStatus = freezed,
  }) {
    return _then(_value.copyWith(
      recordModel: recordModel == freezed
          ? _value.recordModel
          : recordModel // ignore: cast_nullable_to_non_nullable
              as RecordModel?,
      loadingStatus: loadingStatus == freezed
          ? _value.loadingStatus
          : loadingStatus // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
    ));
  }
}

/// @nodoc
abstract class _$$_RecordStateCopyWith<$Res>
    implements $RecordStateCopyWith<$Res> {
  factory _$$_RecordStateCopyWith(
          _$_RecordState value, $Res Function(_$_RecordState) then) =
      __$$_RecordStateCopyWithImpl<$Res>;
  @override
  $Res call({RecordModel? recordModel, LoadingStatus loadingStatus});
}

/// @nodoc
class __$$_RecordStateCopyWithImpl<$Res> extends _$RecordStateCopyWithImpl<$Res>
    implements _$$_RecordStateCopyWith<$Res> {
  __$$_RecordStateCopyWithImpl(
      _$_RecordState _value, $Res Function(_$_RecordState) _then)
      : super(_value, (v) => _then(v as _$_RecordState));

  @override
  _$_RecordState get _value => super._value as _$_RecordState;

  @override
  $Res call({
    Object? recordModel = freezed,
    Object? loadingStatus = freezed,
  }) {
    return _then(_$_RecordState(
      recordModel == freezed
          ? _value.recordModel
          : recordModel // ignore: cast_nullable_to_non_nullable
              as RecordModel?,
      loadingStatus == freezed
          ? _value.loadingStatus
          : loadingStatus // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
    ));
  }
}

/// @nodoc

class _$_RecordState implements _RecordState {
  const _$_RecordState(this.recordModel, this.loadingStatus);

  @override
  final RecordModel? recordModel;
  @override
  final LoadingStatus loadingStatus;

  @override
  String toString() {
    return 'RecordState.loadRecord(recordModel: $recordModel, loadingStatus: $loadingStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RecordState &&
            const DeepCollectionEquality()
                .equals(other.recordModel, recordModel) &&
            const DeepCollectionEquality()
                .equals(other.loadingStatus, loadingStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(recordModel),
      const DeepCollectionEquality().hash(loadingStatus));

  @JsonKey(ignore: true)
  @override
  _$$_RecordStateCopyWith<_$_RecordState> get copyWith =>
      __$$_RecordStateCopyWithImpl<_$_RecordState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            RecordModel? recordModel, LoadingStatus loadingStatus)
        loadRecord,
  }) {
    return loadRecord(recordModel, loadingStatus);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(RecordModel? recordModel, LoadingStatus loadingStatus)?
        loadRecord,
  }) {
    return loadRecord?.call(recordModel, loadingStatus);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(RecordModel? recordModel, LoadingStatus loadingStatus)?
        loadRecord,
    required TResult orElse(),
  }) {
    if (loadRecord != null) {
      return loadRecord(recordModel, loadingStatus);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RecordState value) loadRecord,
  }) {
    return loadRecord(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_RecordState value)? loadRecord,
  }) {
    return loadRecord?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RecordState value)? loadRecord,
    required TResult orElse(),
  }) {
    if (loadRecord != null) {
      return loadRecord(this);
    }
    return orElse();
  }
}

abstract class _RecordState implements RecordState {
  const factory _RecordState(
          final RecordModel? recordModel, final LoadingStatus loadingStatus) =
      _$_RecordState;

  @override
  RecordModel? get recordModel => throw _privateConstructorUsedError;
  @override
  LoadingStatus get loadingStatus => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_RecordStateCopyWith<_$_RecordState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ExportState {
  LoadingStatus get loadingStatus => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            RecordModel? recordModel, LoadingStatus loadingStatus)
        complete,
    required TResult Function(LoadingStatus loadingStatus) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(RecordModel? recordModel, LoadingStatus loadingStatus)?
        complete,
    TResult Function(LoadingStatus loadingStatus)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(RecordModel? recordModel, LoadingStatus loadingStatus)?
        complete,
    TResult Function(LoadingStatus loadingStatus)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ExportCompleteState value) complete,
    required TResult Function(_ExportErrorState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ExportCompleteState value)? complete,
    TResult Function(_ExportErrorState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ExportCompleteState value)? complete,
    TResult Function(_ExportErrorState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ExportStateCopyWith<ExportState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExportStateCopyWith<$Res> {
  factory $ExportStateCopyWith(
          ExportState value, $Res Function(ExportState) then) =
      _$ExportStateCopyWithImpl<$Res>;
  $Res call({LoadingStatus loadingStatus});
}

/// @nodoc
class _$ExportStateCopyWithImpl<$Res> implements $ExportStateCopyWith<$Res> {
  _$ExportStateCopyWithImpl(this._value, this._then);

  final ExportState _value;
  // ignore: unused_field
  final $Res Function(ExportState) _then;

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
abstract class _$$_ExportCompleteStateCopyWith<$Res>
    implements $ExportStateCopyWith<$Res> {
  factory _$$_ExportCompleteStateCopyWith(_$_ExportCompleteState value,
          $Res Function(_$_ExportCompleteState) then) =
      __$$_ExportCompleteStateCopyWithImpl<$Res>;
  @override
  $Res call({RecordModel? recordModel, LoadingStatus loadingStatus});
}

/// @nodoc
class __$$_ExportCompleteStateCopyWithImpl<$Res>
    extends _$ExportStateCopyWithImpl<$Res>
    implements _$$_ExportCompleteStateCopyWith<$Res> {
  __$$_ExportCompleteStateCopyWithImpl(_$_ExportCompleteState _value,
      $Res Function(_$_ExportCompleteState) _then)
      : super(_value, (v) => _then(v as _$_ExportCompleteState));

  @override
  _$_ExportCompleteState get _value => super._value as _$_ExportCompleteState;

  @override
  $Res call({
    Object? recordModel = freezed,
    Object? loadingStatus = freezed,
  }) {
    return _then(_$_ExportCompleteState(
      recordModel == freezed
          ? _value.recordModel
          : recordModel // ignore: cast_nullable_to_non_nullable
              as RecordModel?,
      loadingStatus == freezed
          ? _value.loadingStatus
          : loadingStatus // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
    ));
  }
}

/// @nodoc

class _$_ExportCompleteState implements _ExportCompleteState {
  const _$_ExportCompleteState(this.recordModel, this.loadingStatus);

  @override
  final RecordModel? recordModel;
  @override
  final LoadingStatus loadingStatus;

  @override
  String toString() {
    return 'ExportState.complete(recordModel: $recordModel, loadingStatus: $loadingStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ExportCompleteState &&
            const DeepCollectionEquality()
                .equals(other.recordModel, recordModel) &&
            const DeepCollectionEquality()
                .equals(other.loadingStatus, loadingStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(recordModel),
      const DeepCollectionEquality().hash(loadingStatus));

  @JsonKey(ignore: true)
  @override
  _$$_ExportCompleteStateCopyWith<_$_ExportCompleteState> get copyWith =>
      __$$_ExportCompleteStateCopyWithImpl<_$_ExportCompleteState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            RecordModel? recordModel, LoadingStatus loadingStatus)
        complete,
    required TResult Function(LoadingStatus loadingStatus) error,
  }) {
    return complete(recordModel, loadingStatus);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(RecordModel? recordModel, LoadingStatus loadingStatus)?
        complete,
    TResult Function(LoadingStatus loadingStatus)? error,
  }) {
    return complete?.call(recordModel, loadingStatus);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(RecordModel? recordModel, LoadingStatus loadingStatus)?
        complete,
    TResult Function(LoadingStatus loadingStatus)? error,
    required TResult orElse(),
  }) {
    if (complete != null) {
      return complete(recordModel, loadingStatus);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ExportCompleteState value) complete,
    required TResult Function(_ExportErrorState value) error,
  }) {
    return complete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ExportCompleteState value)? complete,
    TResult Function(_ExportErrorState value)? error,
  }) {
    return complete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ExportCompleteState value)? complete,
    TResult Function(_ExportErrorState value)? error,
    required TResult orElse(),
  }) {
    if (complete != null) {
      return complete(this);
    }
    return orElse();
  }
}

abstract class _ExportCompleteState implements ExportState {
  const factory _ExportCompleteState(
          final RecordModel? recordModel, final LoadingStatus loadingStatus) =
      _$_ExportCompleteState;

  RecordModel? get recordModel => throw _privateConstructorUsedError;
  @override
  LoadingStatus get loadingStatus => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ExportCompleteStateCopyWith<_$_ExportCompleteState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ExportErrorStateCopyWith<$Res>
    implements $ExportStateCopyWith<$Res> {
  factory _$$_ExportErrorStateCopyWith(
          _$_ExportErrorState value, $Res Function(_$_ExportErrorState) then) =
      __$$_ExportErrorStateCopyWithImpl<$Res>;
  @override
  $Res call({LoadingStatus loadingStatus});
}

/// @nodoc
class __$$_ExportErrorStateCopyWithImpl<$Res>
    extends _$ExportStateCopyWithImpl<$Res>
    implements _$$_ExportErrorStateCopyWith<$Res> {
  __$$_ExportErrorStateCopyWithImpl(
      _$_ExportErrorState _value, $Res Function(_$_ExportErrorState) _then)
      : super(_value, (v) => _then(v as _$_ExportErrorState));

  @override
  _$_ExportErrorState get _value => super._value as _$_ExportErrorState;

  @override
  $Res call({
    Object? loadingStatus = freezed,
  }) {
    return _then(_$_ExportErrorState(
      loadingStatus == freezed
          ? _value.loadingStatus
          : loadingStatus // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
    ));
  }
}

/// @nodoc

class _$_ExportErrorState implements _ExportErrorState {
  const _$_ExportErrorState(this.loadingStatus);

  @override
  final LoadingStatus loadingStatus;

  @override
  String toString() {
    return 'ExportState.error(loadingStatus: $loadingStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ExportErrorState &&
            const DeepCollectionEquality()
                .equals(other.loadingStatus, loadingStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(loadingStatus));

  @JsonKey(ignore: true)
  @override
  _$$_ExportErrorStateCopyWith<_$_ExportErrorState> get copyWith =>
      __$$_ExportErrorStateCopyWithImpl<_$_ExportErrorState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            RecordModel? recordModel, LoadingStatus loadingStatus)
        complete,
    required TResult Function(LoadingStatus loadingStatus) error,
  }) {
    return error(loadingStatus);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(RecordModel? recordModel, LoadingStatus loadingStatus)?
        complete,
    TResult Function(LoadingStatus loadingStatus)? error,
  }) {
    return error?.call(loadingStatus);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(RecordModel? recordModel, LoadingStatus loadingStatus)?
        complete,
    TResult Function(LoadingStatus loadingStatus)? error,
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
    required TResult Function(_ExportCompleteState value) complete,
    required TResult Function(_ExportErrorState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ExportCompleteState value)? complete,
    TResult Function(_ExportErrorState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ExportCompleteState value)? complete,
    TResult Function(_ExportErrorState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _ExportErrorState implements ExportState {
  const factory _ExportErrorState(final LoadingStatus loadingStatus) =
      _$_ExportErrorState;

  @override
  LoadingStatus get loadingStatus => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ExportErrorStateCopyWith<_$_ExportErrorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RecordEvent {
  BuildContext get context => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get gender => throw _privateConstructorUsedError;
  String get wing => throw _privateConstructorUsedError;
  String get schoolYear => throw _privateConstructorUsedError;
  String get center => throw _privateConstructorUsedError;
  String get region => throw _privateConstructorUsedError;
  String get userGroup => throw _privateConstructorUsedError;
  String get fname => throw _privateConstructorUsedError;
  String get mname => throw _privateConstructorUsedError;
  String get lname => throw _privateConstructorUsedError;
  String get user_id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;
  bool get is_export => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            BuildContext context,
            String name,
            String gender,
            String wing,
            String schoolYear,
            String center,
            String region,
            String userGroup,
            String fname,
            String mname,
            String lname,
            String user_id,
            String email,
            int page,
            int limit,
            bool is_export)
        load,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            BuildContext context,
            String name,
            String gender,
            String wing,
            String schoolYear,
            String center,
            String region,
            String userGroup,
            String fname,
            String mname,
            String lname,
            String user_id,
            String email,
            int page,
            int limit,
            bool is_export)?
        load,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            BuildContext context,
            String name,
            String gender,
            String wing,
            String schoolYear,
            String center,
            String region,
            String userGroup,
            String fname,
            String mname,
            String lname,
            String user_id,
            String email,
            int page,
            int limit,
            bool is_export)?
        load,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_load value) load,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_load value)? load,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_load value)? load,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RecordEventCopyWith<RecordEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecordEventCopyWith<$Res> {
  factory $RecordEventCopyWith(
          RecordEvent value, $Res Function(RecordEvent) then) =
      _$RecordEventCopyWithImpl<$Res>;
  $Res call(
      {BuildContext context,
      String name,
      String gender,
      String wing,
      String schoolYear,
      String center,
      String region,
      String userGroup,
      String fname,
      String mname,
      String lname,
      String user_id,
      String email,
      int page,
      int limit,
      bool is_export});
}

/// @nodoc
class _$RecordEventCopyWithImpl<$Res> implements $RecordEventCopyWith<$Res> {
  _$RecordEventCopyWithImpl(this._value, this._then);

  final RecordEvent _value;
  // ignore: unused_field
  final $Res Function(RecordEvent) _then;

  @override
  $Res call({
    Object? context = freezed,
    Object? name = freezed,
    Object? gender = freezed,
    Object? wing = freezed,
    Object? schoolYear = freezed,
    Object? center = freezed,
    Object? region = freezed,
    Object? userGroup = freezed,
    Object? fname = freezed,
    Object? mname = freezed,
    Object? lname = freezed,
    Object? user_id = freezed,
    Object? email = freezed,
    Object? page = freezed,
    Object? limit = freezed,
    Object? is_export = freezed,
  }) {
    return _then(_value.copyWith(
      context: context == freezed
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      wing: wing == freezed
          ? _value.wing
          : wing // ignore: cast_nullable_to_non_nullable
              as String,
      schoolYear: schoolYear == freezed
          ? _value.schoolYear
          : schoolYear // ignore: cast_nullable_to_non_nullable
              as String,
      center: center == freezed
          ? _value.center
          : center // ignore: cast_nullable_to_non_nullable
              as String,
      region: region == freezed
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String,
      userGroup: userGroup == freezed
          ? _value.userGroup
          : userGroup // ignore: cast_nullable_to_non_nullable
              as String,
      fname: fname == freezed
          ? _value.fname
          : fname // ignore: cast_nullable_to_non_nullable
              as String,
      mname: mname == freezed
          ? _value.mname
          : mname // ignore: cast_nullable_to_non_nullable
              as String,
      lname: lname == freezed
          ? _value.lname
          : lname // ignore: cast_nullable_to_non_nullable
              as String,
      user_id: user_id == freezed
          ? _value.user_id
          : user_id // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      page: page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      limit: limit == freezed
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      is_export: is_export == freezed
          ? _value.is_export
          : is_export // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_loadCopyWith<$Res> implements $RecordEventCopyWith<$Res> {
  factory _$$_loadCopyWith(_$_load value, $Res Function(_$_load) then) =
      __$$_loadCopyWithImpl<$Res>;
  @override
  $Res call(
      {BuildContext context,
      String name,
      String gender,
      String wing,
      String schoolYear,
      String center,
      String region,
      String userGroup,
      String fname,
      String mname,
      String lname,
      String user_id,
      String email,
      int page,
      int limit,
      bool is_export});
}

/// @nodoc
class __$$_loadCopyWithImpl<$Res> extends _$RecordEventCopyWithImpl<$Res>
    implements _$$_loadCopyWith<$Res> {
  __$$_loadCopyWithImpl(_$_load _value, $Res Function(_$_load) _then)
      : super(_value, (v) => _then(v as _$_load));

  @override
  _$_load get _value => super._value as _$_load;

  @override
  $Res call({
    Object? context = freezed,
    Object? name = freezed,
    Object? gender = freezed,
    Object? wing = freezed,
    Object? schoolYear = freezed,
    Object? center = freezed,
    Object? region = freezed,
    Object? userGroup = freezed,
    Object? fname = freezed,
    Object? mname = freezed,
    Object? lname = freezed,
    Object? user_id = freezed,
    Object? email = freezed,
    Object? page = freezed,
    Object? limit = freezed,
    Object? is_export = freezed,
  }) {
    return _then(_$_load(
      context == freezed
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      wing == freezed
          ? _value.wing
          : wing // ignore: cast_nullable_to_non_nullable
              as String,
      schoolYear == freezed
          ? _value.schoolYear
          : schoolYear // ignore: cast_nullable_to_non_nullable
              as String,
      center == freezed
          ? _value.center
          : center // ignore: cast_nullable_to_non_nullable
              as String,
      region == freezed
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String,
      userGroup == freezed
          ? _value.userGroup
          : userGroup // ignore: cast_nullable_to_non_nullable
              as String,
      fname == freezed
          ? _value.fname
          : fname // ignore: cast_nullable_to_non_nullable
              as String,
      mname == freezed
          ? _value.mname
          : mname // ignore: cast_nullable_to_non_nullable
              as String,
      lname == freezed
          ? _value.lname
          : lname // ignore: cast_nullable_to_non_nullable
              as String,
      user_id == freezed
          ? _value.user_id
          : user_id // ignore: cast_nullable_to_non_nullable
              as String,
      email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      limit == freezed
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      is_export == freezed
          ? _value.is_export
          : is_export // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_load implements _load {
  const _$_load(
      this.context,
      this.name,
      this.gender,
      this.wing,
      this.schoolYear,
      this.center,
      this.region,
      this.userGroup,
      this.fname,
      this.mname,
      this.lname,
      this.user_id,
      this.email,
      this.page,
      this.limit,
      this.is_export);

  @override
  final BuildContext context;
  @override
  final String name;
  @override
  final String gender;
  @override
  final String wing;
  @override
  final String schoolYear;
  @override
  final String center;
  @override
  final String region;
  @override
  final String userGroup;
  @override
  final String fname;
  @override
  final String mname;
  @override
  final String lname;
  @override
  final String user_id;
  @override
  final String email;
  @override
  final int page;
  @override
  final int limit;
  @override
  final bool is_export;

  @override
  String toString() {
    return 'RecordEvent.load(context: $context, name: $name, gender: $gender, wing: $wing, schoolYear: $schoolYear, center: $center, region: $region, userGroup: $userGroup, fname: $fname, mname: $mname, lname: $lname, user_id: $user_id, email: $email, page: $page, limit: $limit, is_export: $is_export)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_load &&
            const DeepCollectionEquality().equals(other.context, context) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.gender, gender) &&
            const DeepCollectionEquality().equals(other.wing, wing) &&
            const DeepCollectionEquality()
                .equals(other.schoolYear, schoolYear) &&
            const DeepCollectionEquality().equals(other.center, center) &&
            const DeepCollectionEquality().equals(other.region, region) &&
            const DeepCollectionEquality().equals(other.userGroup, userGroup) &&
            const DeepCollectionEquality().equals(other.fname, fname) &&
            const DeepCollectionEquality().equals(other.mname, mname) &&
            const DeepCollectionEquality().equals(other.lname, lname) &&
            const DeepCollectionEquality().equals(other.user_id, user_id) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.page, page) &&
            const DeepCollectionEquality().equals(other.limit, limit) &&
            const DeepCollectionEquality().equals(other.is_export, is_export));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(context),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(gender),
      const DeepCollectionEquality().hash(wing),
      const DeepCollectionEquality().hash(schoolYear),
      const DeepCollectionEquality().hash(center),
      const DeepCollectionEquality().hash(region),
      const DeepCollectionEquality().hash(userGroup),
      const DeepCollectionEquality().hash(fname),
      const DeepCollectionEquality().hash(mname),
      const DeepCollectionEquality().hash(lname),
      const DeepCollectionEquality().hash(user_id),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(page),
      const DeepCollectionEquality().hash(limit),
      const DeepCollectionEquality().hash(is_export));

  @JsonKey(ignore: true)
  @override
  _$$_loadCopyWith<_$_load> get copyWith =>
      __$$_loadCopyWithImpl<_$_load>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            BuildContext context,
            String name,
            String gender,
            String wing,
            String schoolYear,
            String center,
            String region,
            String userGroup,
            String fname,
            String mname,
            String lname,
            String user_id,
            String email,
            int page,
            int limit,
            bool is_export)
        load,
  }) {
    return load(context, name, gender, wing, schoolYear, center, region,
        userGroup, fname, mname, lname, user_id, email, page, limit, is_export);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            BuildContext context,
            String name,
            String gender,
            String wing,
            String schoolYear,
            String center,
            String region,
            String userGroup,
            String fname,
            String mname,
            String lname,
            String user_id,
            String email,
            int page,
            int limit,
            bool is_export)?
        load,
  }) {
    return load?.call(context, name, gender, wing, schoolYear, center, region,
        userGroup, fname, mname, lname, user_id, email, page, limit, is_export);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            BuildContext context,
            String name,
            String gender,
            String wing,
            String schoolYear,
            String center,
            String region,
            String userGroup,
            String fname,
            String mname,
            String lname,
            String user_id,
            String email,
            int page,
            int limit,
            bool is_export)?
        load,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(
          context,
          name,
          gender,
          wing,
          schoolYear,
          center,
          region,
          userGroup,
          fname,
          mname,
          lname,
          user_id,
          email,
          page,
          limit,
          is_export);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_load value) load,
  }) {
    return load(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_load value)? load,
  }) {
    return load?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_load value)? load,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(this);
    }
    return orElse();
  }
}

abstract class _load implements RecordEvent {
  const factory _load(
      final BuildContext context,
      final String name,
      final String gender,
      final String wing,
      final String schoolYear,
      final String center,
      final String region,
      final String userGroup,
      final String fname,
      final String mname,
      final String lname,
      final String user_id,
      final String email,
      final int page,
      final int limit,
      final bool is_export) = _$_load;

  @override
  BuildContext get context => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get gender => throw _privateConstructorUsedError;
  @override
  String get wing => throw _privateConstructorUsedError;
  @override
  String get schoolYear => throw _privateConstructorUsedError;
  @override
  String get center => throw _privateConstructorUsedError;
  @override
  String get region => throw _privateConstructorUsedError;
  @override
  String get userGroup => throw _privateConstructorUsedError;
  @override
  String get fname => throw _privateConstructorUsedError;
  @override
  String get mname => throw _privateConstructorUsedError;
  @override
  String get lname => throw _privateConstructorUsedError;
  @override
  String get user_id => throw _privateConstructorUsedError;
  @override
  String get email => throw _privateConstructorUsedError;
  @override
  int get page => throw _privateConstructorUsedError;
  @override
  int get limit => throw _privateConstructorUsedError;
  @override
  bool get is_export => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_loadCopyWith<_$_load> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ExportEvent {
  BuildContext get context => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get gender => throw _privateConstructorUsedError;
  String get wing => throw _privateConstructorUsedError;
  String get schoolYear => throw _privateConstructorUsedError;
  String get center => throw _privateConstructorUsedError;
  String get region => throw _privateConstructorUsedError;
  String get user_group => throw _privateConstructorUsedError;
  String get fname => throw _privateConstructorUsedError;
  String get mname => throw _privateConstructorUsedError;
  String get lname => throw _privateConstructorUsedError;
  String get user_id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;
  bool get is_export => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            BuildContext context,
            String name,
            String gender,
            String wing,
            String schoolYear,
            String center,
            String region,
            String user_group,
            String fname,
            String mname,
            String lname,
            String user_id,
            String email,
            int page,
            int limit,
            bool is_export)
        export,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            BuildContext context,
            String name,
            String gender,
            String wing,
            String schoolYear,
            String center,
            String region,
            String user_group,
            String fname,
            String mname,
            String lname,
            String user_id,
            String email,
            int page,
            int limit,
            bool is_export)?
        export,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            BuildContext context,
            String name,
            String gender,
            String wing,
            String schoolYear,
            String center,
            String region,
            String user_group,
            String fname,
            String mname,
            String lname,
            String user_id,
            String email,
            int page,
            int limit,
            bool is_export)?
        export,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_export value) export,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_export value)? export,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_export value)? export,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ExportEventCopyWith<ExportEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExportEventCopyWith<$Res> {
  factory $ExportEventCopyWith(
          ExportEvent value, $Res Function(ExportEvent) then) =
      _$ExportEventCopyWithImpl<$Res>;
  $Res call(
      {BuildContext context,
      String name,
      String gender,
      String wing,
      String schoolYear,
      String center,
      String region,
      String user_group,
      String fname,
      String mname,
      String lname,
      String user_id,
      String email,
      int page,
      int limit,
      bool is_export});
}

/// @nodoc
class _$ExportEventCopyWithImpl<$Res> implements $ExportEventCopyWith<$Res> {
  _$ExportEventCopyWithImpl(this._value, this._then);

  final ExportEvent _value;
  // ignore: unused_field
  final $Res Function(ExportEvent) _then;

  @override
  $Res call({
    Object? context = freezed,
    Object? name = freezed,
    Object? gender = freezed,
    Object? wing = freezed,
    Object? schoolYear = freezed,
    Object? center = freezed,
    Object? region = freezed,
    Object? user_group = freezed,
    Object? fname = freezed,
    Object? mname = freezed,
    Object? lname = freezed,
    Object? user_id = freezed,
    Object? email = freezed,
    Object? page = freezed,
    Object? limit = freezed,
    Object? is_export = freezed,
  }) {
    return _then(_value.copyWith(
      context: context == freezed
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      wing: wing == freezed
          ? _value.wing
          : wing // ignore: cast_nullable_to_non_nullable
              as String,
      schoolYear: schoolYear == freezed
          ? _value.schoolYear
          : schoolYear // ignore: cast_nullable_to_non_nullable
              as String,
      center: center == freezed
          ? _value.center
          : center // ignore: cast_nullable_to_non_nullable
              as String,
      region: region == freezed
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String,
      user_group: user_group == freezed
          ? _value.user_group
          : user_group // ignore: cast_nullable_to_non_nullable
              as String,
      fname: fname == freezed
          ? _value.fname
          : fname // ignore: cast_nullable_to_non_nullable
              as String,
      mname: mname == freezed
          ? _value.mname
          : mname // ignore: cast_nullable_to_non_nullable
              as String,
      lname: lname == freezed
          ? _value.lname
          : lname // ignore: cast_nullable_to_non_nullable
              as String,
      user_id: user_id == freezed
          ? _value.user_id
          : user_id // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      page: page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      limit: limit == freezed
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      is_export: is_export == freezed
          ? _value.is_export
          : is_export // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_exportCopyWith<$Res> implements $ExportEventCopyWith<$Res> {
  factory _$$_exportCopyWith(_$_export value, $Res Function(_$_export) then) =
      __$$_exportCopyWithImpl<$Res>;
  @override
  $Res call(
      {BuildContext context,
      String name,
      String gender,
      String wing,
      String schoolYear,
      String center,
      String region,
      String user_group,
      String fname,
      String mname,
      String lname,
      String user_id,
      String email,
      int page,
      int limit,
      bool is_export});
}

/// @nodoc
class __$$_exportCopyWithImpl<$Res> extends _$ExportEventCopyWithImpl<$Res>
    implements _$$_exportCopyWith<$Res> {
  __$$_exportCopyWithImpl(_$_export _value, $Res Function(_$_export) _then)
      : super(_value, (v) => _then(v as _$_export));

  @override
  _$_export get _value => super._value as _$_export;

  @override
  $Res call({
    Object? context = freezed,
    Object? name = freezed,
    Object? gender = freezed,
    Object? wing = freezed,
    Object? schoolYear = freezed,
    Object? center = freezed,
    Object? region = freezed,
    Object? user_group = freezed,
    Object? fname = freezed,
    Object? mname = freezed,
    Object? lname = freezed,
    Object? user_id = freezed,
    Object? email = freezed,
    Object? page = freezed,
    Object? limit = freezed,
    Object? is_export = freezed,
  }) {
    return _then(_$_export(
      context == freezed
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      wing == freezed
          ? _value.wing
          : wing // ignore: cast_nullable_to_non_nullable
              as String,
      schoolYear == freezed
          ? _value.schoolYear
          : schoolYear // ignore: cast_nullable_to_non_nullable
              as String,
      center == freezed
          ? _value.center
          : center // ignore: cast_nullable_to_non_nullable
              as String,
      region == freezed
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String,
      user_group == freezed
          ? _value.user_group
          : user_group // ignore: cast_nullable_to_non_nullable
              as String,
      fname == freezed
          ? _value.fname
          : fname // ignore: cast_nullable_to_non_nullable
              as String,
      mname == freezed
          ? _value.mname
          : mname // ignore: cast_nullable_to_non_nullable
              as String,
      lname == freezed
          ? _value.lname
          : lname // ignore: cast_nullable_to_non_nullable
              as String,
      user_id == freezed
          ? _value.user_id
          : user_id // ignore: cast_nullable_to_non_nullable
              as String,
      email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      limit == freezed
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      is_export == freezed
          ? _value.is_export
          : is_export // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_export implements _export {
  const _$_export(
      this.context,
      this.name,
      this.gender,
      this.wing,
      this.schoolYear,
      this.center,
      this.region,
      this.user_group,
      this.fname,
      this.mname,
      this.lname,
      this.user_id,
      this.email,
      this.page,
      this.limit,
      this.is_export);

  @override
  final BuildContext context;
  @override
  final String name;
  @override
  final String gender;
  @override
  final String wing;
  @override
  final String schoolYear;
  @override
  final String center;
  @override
  final String region;
  @override
  final String user_group;
  @override
  final String fname;
  @override
  final String mname;
  @override
  final String lname;
  @override
  final String user_id;
  @override
  final String email;
  @override
  final int page;
  @override
  final int limit;
  @override
  final bool is_export;

  @override
  String toString() {
    return 'ExportEvent.export(context: $context, name: $name, gender: $gender, wing: $wing, schoolYear: $schoolYear, center: $center, region: $region, user_group: $user_group, fname: $fname, mname: $mname, lname: $lname, user_id: $user_id, email: $email, page: $page, limit: $limit, is_export: $is_export)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_export &&
            const DeepCollectionEquality().equals(other.context, context) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.gender, gender) &&
            const DeepCollectionEquality().equals(other.wing, wing) &&
            const DeepCollectionEquality()
                .equals(other.schoolYear, schoolYear) &&
            const DeepCollectionEquality().equals(other.center, center) &&
            const DeepCollectionEquality().equals(other.region, region) &&
            const DeepCollectionEquality()
                .equals(other.user_group, user_group) &&
            const DeepCollectionEquality().equals(other.fname, fname) &&
            const DeepCollectionEquality().equals(other.mname, mname) &&
            const DeepCollectionEquality().equals(other.lname, lname) &&
            const DeepCollectionEquality().equals(other.user_id, user_id) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.page, page) &&
            const DeepCollectionEquality().equals(other.limit, limit) &&
            const DeepCollectionEquality().equals(other.is_export, is_export));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(context),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(gender),
      const DeepCollectionEquality().hash(wing),
      const DeepCollectionEquality().hash(schoolYear),
      const DeepCollectionEquality().hash(center),
      const DeepCollectionEquality().hash(region),
      const DeepCollectionEquality().hash(user_group),
      const DeepCollectionEquality().hash(fname),
      const DeepCollectionEquality().hash(mname),
      const DeepCollectionEquality().hash(lname),
      const DeepCollectionEquality().hash(user_id),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(page),
      const DeepCollectionEquality().hash(limit),
      const DeepCollectionEquality().hash(is_export));

  @JsonKey(ignore: true)
  @override
  _$$_exportCopyWith<_$_export> get copyWith =>
      __$$_exportCopyWithImpl<_$_export>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            BuildContext context,
            String name,
            String gender,
            String wing,
            String schoolYear,
            String center,
            String region,
            String user_group,
            String fname,
            String mname,
            String lname,
            String user_id,
            String email,
            int page,
            int limit,
            bool is_export)
        export,
  }) {
    return export(
        context,
        name,
        gender,
        wing,
        schoolYear,
        center,
        region,
        user_group,
        fname,
        mname,
        lname,
        user_id,
        email,
        page,
        limit,
        is_export);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            BuildContext context,
            String name,
            String gender,
            String wing,
            String schoolYear,
            String center,
            String region,
            String user_group,
            String fname,
            String mname,
            String lname,
            String user_id,
            String email,
            int page,
            int limit,
            bool is_export)?
        export,
  }) {
    return export?.call(
        context,
        name,
        gender,
        wing,
        schoolYear,
        center,
        region,
        user_group,
        fname,
        mname,
        lname,
        user_id,
        email,
        page,
        limit,
        is_export);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            BuildContext context,
            String name,
            String gender,
            String wing,
            String schoolYear,
            String center,
            String region,
            String user_group,
            String fname,
            String mname,
            String lname,
            String user_id,
            String email,
            int page,
            int limit,
            bool is_export)?
        export,
    required TResult orElse(),
  }) {
    if (export != null) {
      return export(
          context,
          name,
          gender,
          wing,
          schoolYear,
          center,
          region,
          user_group,
          fname,
          mname,
          lname,
          user_id,
          email,
          page,
          limit,
          is_export);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_export value) export,
  }) {
    return export(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_export value)? export,
  }) {
    return export?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_export value)? export,
    required TResult orElse(),
  }) {
    if (export != null) {
      return export(this);
    }
    return orElse();
  }
}

abstract class _export implements ExportEvent {
  const factory _export(
      final BuildContext context,
      final String name,
      final String gender,
      final String wing,
      final String schoolYear,
      final String center,
      final String region,
      final String user_group,
      final String fname,
      final String mname,
      final String lname,
      final String user_id,
      final String email,
      final int page,
      final int limit,
      final bool is_export) = _$_export;

  @override
  BuildContext get context => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get gender => throw _privateConstructorUsedError;
  @override
  String get wing => throw _privateConstructorUsedError;
  @override
  String get schoolYear => throw _privateConstructorUsedError;
  @override
  String get center => throw _privateConstructorUsedError;
  @override
  String get region => throw _privateConstructorUsedError;
  @override
  String get user_group => throw _privateConstructorUsedError;
  @override
  String get fname => throw _privateConstructorUsedError;
  @override
  String get mname => throw _privateConstructorUsedError;
  @override
  String get lname => throw _privateConstructorUsedError;
  @override
  String get user_id => throw _privateConstructorUsedError;
  @override
  String get email => throw _privateConstructorUsedError;
  @override
  int get page => throw _privateConstructorUsedError;
  @override
  int get limit => throw _privateConstructorUsedError;
  @override
  bool get is_export => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_exportCopyWith<_$_export> get copyWith =>
      throw _privateConstructorUsedError;
}
