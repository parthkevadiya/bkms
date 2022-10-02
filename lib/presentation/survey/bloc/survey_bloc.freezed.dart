// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'survey_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SurveyState {
  SurveyModel get surveyModel => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SurveyStateCopyWith<SurveyState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SurveyStateCopyWith<$Res> {
  factory $SurveyStateCopyWith(
          SurveyState value, $Res Function(SurveyState) then) =
      _$SurveyStateCopyWithImpl<$Res>;
  $Res call({SurveyModel surveyModel});
}

/// @nodoc
class _$SurveyStateCopyWithImpl<$Res> implements $SurveyStateCopyWith<$Res> {
  _$SurveyStateCopyWithImpl(this._value, this._then);

  final SurveyState _value;
  // ignore: unused_field
  final $Res Function(SurveyState) _then;

  @override
  $Res call({
    Object? surveyModel = freezed,
  }) {
    return _then(_value.copyWith(
      surveyModel: surveyModel == freezed
          ? _value.surveyModel
          : surveyModel // ignore: cast_nullable_to_non_nullable
              as SurveyModel,
    ));
  }
}

/// @nodoc
abstract class _$$_SurveyStateCopyWith<$Res>
    implements $SurveyStateCopyWith<$Res> {
  factory _$$_SurveyStateCopyWith(
          _$_SurveyState value, $Res Function(_$_SurveyState) then) =
      __$$_SurveyStateCopyWithImpl<$Res>;
  @override
  $Res call({SurveyModel surveyModel});
}

/// @nodoc
class __$$_SurveyStateCopyWithImpl<$Res> extends _$SurveyStateCopyWithImpl<$Res>
    implements _$$_SurveyStateCopyWith<$Res> {
  __$$_SurveyStateCopyWithImpl(
      _$_SurveyState _value, $Res Function(_$_SurveyState) _then)
      : super(_value, (v) => _then(v as _$_SurveyState));

  @override
  _$_SurveyState get _value => super._value as _$_SurveyState;

  @override
  $Res call({
    Object? surveyModel = freezed,
  }) {
    return _then(_$_SurveyState(
      surveyModel == freezed
          ? _value.surveyModel
          : surveyModel // ignore: cast_nullable_to_non_nullable
              as SurveyModel,
    ));
  }
}

/// @nodoc

class _$_SurveyState implements _SurveyState {
  const _$_SurveyState(this.surveyModel);

  @override
  final SurveyModel surveyModel;

  @override
  String toString() {
    return 'SurveyState(surveyModel: $surveyModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SurveyState &&
            const DeepCollectionEquality()
                .equals(other.surveyModel, surveyModel));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(surveyModel));

  @JsonKey(ignore: true)
  @override
  _$$_SurveyStateCopyWith<_$_SurveyState> get copyWith =>
      __$$_SurveyStateCopyWithImpl<_$_SurveyState>(this, _$identity);
}

abstract class _SurveyState implements SurveyState {
  const factory _SurveyState(final SurveyModel surveyModel) = _$_SurveyState;

  @override
  SurveyModel get surveyModel => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_SurveyStateCopyWith<_$_SurveyState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SurveyEvent {
  SurveyModel get surveyModel => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SurveyModel surveyModel) data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(SurveyModel surveyModel)? data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SurveyModel surveyModel)? data,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_data value) data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_data value)? data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_data value)? data,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SurveyEventCopyWith<SurveyEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SurveyEventCopyWith<$Res> {
  factory $SurveyEventCopyWith(
          SurveyEvent value, $Res Function(SurveyEvent) then) =
      _$SurveyEventCopyWithImpl<$Res>;
  $Res call({SurveyModel surveyModel});
}

/// @nodoc
class _$SurveyEventCopyWithImpl<$Res> implements $SurveyEventCopyWith<$Res> {
  _$SurveyEventCopyWithImpl(this._value, this._then);

  final SurveyEvent _value;
  // ignore: unused_field
  final $Res Function(SurveyEvent) _then;

  @override
  $Res call({
    Object? surveyModel = freezed,
  }) {
    return _then(_value.copyWith(
      surveyModel: surveyModel == freezed
          ? _value.surveyModel
          : surveyModel // ignore: cast_nullable_to_non_nullable
              as SurveyModel,
    ));
  }
}

/// @nodoc
abstract class _$$_dataCopyWith<$Res> implements $SurveyEventCopyWith<$Res> {
  factory _$$_dataCopyWith(_$_data value, $Res Function(_$_data) then) =
      __$$_dataCopyWithImpl<$Res>;
  @override
  $Res call({SurveyModel surveyModel});
}

/// @nodoc
class __$$_dataCopyWithImpl<$Res> extends _$SurveyEventCopyWithImpl<$Res>
    implements _$$_dataCopyWith<$Res> {
  __$$_dataCopyWithImpl(_$_data _value, $Res Function(_$_data) _then)
      : super(_value, (v) => _then(v as _$_data));

  @override
  _$_data get _value => super._value as _$_data;

  @override
  $Res call({
    Object? surveyModel = freezed,
  }) {
    return _then(_$_data(
      surveyModel == freezed
          ? _value.surveyModel
          : surveyModel // ignore: cast_nullable_to_non_nullable
              as SurveyModel,
    ));
  }
}

/// @nodoc

class _$_data implements _data {
  const _$_data(this.surveyModel);

  @override
  final SurveyModel surveyModel;

  @override
  String toString() {
    return 'SurveyEvent.data(surveyModel: $surveyModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_data &&
            const DeepCollectionEquality()
                .equals(other.surveyModel, surveyModel));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(surveyModel));

  @JsonKey(ignore: true)
  @override
  _$$_dataCopyWith<_$_data> get copyWith =>
      __$$_dataCopyWithImpl<_$_data>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SurveyModel surveyModel) data,
  }) {
    return data(surveyModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(SurveyModel surveyModel)? data,
  }) {
    return data?.call(surveyModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SurveyModel surveyModel)? data,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(surveyModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_data value) data,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_data value)? data,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_data value)? data,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class _data implements SurveyEvent {
  const factory _data(final SurveyModel surveyModel) = _$_data;

  @override
  SurveyModel get surveyModel => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_dataCopyWith<_$_data> get copyWith => throw _privateConstructorUsedError;
}
