// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'networking_data_update_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NetWorkingDataUpdateState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoadingStatus loadingStatus) empty,
    required TResult Function(
            NetworkingInteractionDetailsModel?
                networkingInteractionDetailsModel)
        networkingInteractionDetails,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(LoadingStatus loadingStatus)? empty,
    TResult Function(
            NetworkingInteractionDetailsModel?
                networkingInteractionDetailsModel)?
        networkingInteractionDetails,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoadingStatus loadingStatus)? empty,
    TResult Function(
            NetworkingInteractionDetailsModel?
                networkingInteractionDetailsModel)?
        networkingInteractionDetails,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NetWorkingDataUpdateEmpty value) empty,
    required TResult Function(_ReportStateNetworkingInteractionDetails value)
        networkingInteractionDetails,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_NetWorkingDataUpdateEmpty value)? empty,
    TResult Function(_ReportStateNetworkingInteractionDetails value)?
        networkingInteractionDetails,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NetWorkingDataUpdateEmpty value)? empty,
    TResult Function(_ReportStateNetworkingInteractionDetails value)?
        networkingInteractionDetails,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NetWorkingDataUpdateStateCopyWith<$Res> {
  factory $NetWorkingDataUpdateStateCopyWith(NetWorkingDataUpdateState value,
          $Res Function(NetWorkingDataUpdateState) then) =
      _$NetWorkingDataUpdateStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$NetWorkingDataUpdateStateCopyWithImpl<$Res>
    implements $NetWorkingDataUpdateStateCopyWith<$Res> {
  _$NetWorkingDataUpdateStateCopyWithImpl(this._value, this._then);

  final NetWorkingDataUpdateState _value;
  // ignore: unused_field
  final $Res Function(NetWorkingDataUpdateState) _then;
}

/// @nodoc
abstract class _$$_NetWorkingDataUpdateEmptyCopyWith<$Res> {
  factory _$$_NetWorkingDataUpdateEmptyCopyWith(
          _$_NetWorkingDataUpdateEmpty value,
          $Res Function(_$_NetWorkingDataUpdateEmpty) then) =
      __$$_NetWorkingDataUpdateEmptyCopyWithImpl<$Res>;
  $Res call({LoadingStatus loadingStatus});
}

/// @nodoc
class __$$_NetWorkingDataUpdateEmptyCopyWithImpl<$Res>
    extends _$NetWorkingDataUpdateStateCopyWithImpl<$Res>
    implements _$$_NetWorkingDataUpdateEmptyCopyWith<$Res> {
  __$$_NetWorkingDataUpdateEmptyCopyWithImpl(
      _$_NetWorkingDataUpdateEmpty _value,
      $Res Function(_$_NetWorkingDataUpdateEmpty) _then)
      : super(_value, (v) => _then(v as _$_NetWorkingDataUpdateEmpty));

  @override
  _$_NetWorkingDataUpdateEmpty get _value =>
      super._value as _$_NetWorkingDataUpdateEmpty;

  @override
  $Res call({
    Object? loadingStatus = freezed,
  }) {
    return _then(_$_NetWorkingDataUpdateEmpty(
      loadingStatus == freezed
          ? _value.loadingStatus
          : loadingStatus // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
    ));
  }
}

/// @nodoc

class _$_NetWorkingDataUpdateEmpty implements _NetWorkingDataUpdateEmpty {
  const _$_NetWorkingDataUpdateEmpty(this.loadingStatus);

  @override
  final LoadingStatus loadingStatus;

  @override
  String toString() {
    return 'NetWorkingDataUpdateState.empty(loadingStatus: $loadingStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NetWorkingDataUpdateEmpty &&
            const DeepCollectionEquality()
                .equals(other.loadingStatus, loadingStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(loadingStatus));

  @JsonKey(ignore: true)
  @override
  _$$_NetWorkingDataUpdateEmptyCopyWith<_$_NetWorkingDataUpdateEmpty>
      get copyWith => __$$_NetWorkingDataUpdateEmptyCopyWithImpl<
          _$_NetWorkingDataUpdateEmpty>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoadingStatus loadingStatus) empty,
    required TResult Function(
            NetworkingInteractionDetailsModel?
                networkingInteractionDetailsModel)
        networkingInteractionDetails,
  }) {
    return empty(loadingStatus);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(LoadingStatus loadingStatus)? empty,
    TResult Function(
            NetworkingInteractionDetailsModel?
                networkingInteractionDetailsModel)?
        networkingInteractionDetails,
  }) {
    return empty?.call(loadingStatus);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoadingStatus loadingStatus)? empty,
    TResult Function(
            NetworkingInteractionDetailsModel?
                networkingInteractionDetailsModel)?
        networkingInteractionDetails,
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
    required TResult Function(_NetWorkingDataUpdateEmpty value) empty,
    required TResult Function(_ReportStateNetworkingInteractionDetails value)
        networkingInteractionDetails,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_NetWorkingDataUpdateEmpty value)? empty,
    TResult Function(_ReportStateNetworkingInteractionDetails value)?
        networkingInteractionDetails,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NetWorkingDataUpdateEmpty value)? empty,
    TResult Function(_ReportStateNetworkingInteractionDetails value)?
        networkingInteractionDetails,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class _NetWorkingDataUpdateEmpty implements NetWorkingDataUpdateState {
  const factory _NetWorkingDataUpdateEmpty(final LoadingStatus loadingStatus) =
      _$_NetWorkingDataUpdateEmpty;

  LoadingStatus get loadingStatus => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$_NetWorkingDataUpdateEmptyCopyWith<_$_NetWorkingDataUpdateEmpty>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ReportStateNetworkingInteractionDetailsCopyWith<$Res> {
  factory _$$_ReportStateNetworkingInteractionDetailsCopyWith(
          _$_ReportStateNetworkingInteractionDetails value,
          $Res Function(_$_ReportStateNetworkingInteractionDetails) then) =
      __$$_ReportStateNetworkingInteractionDetailsCopyWithImpl<$Res>;
  $Res call(
      {NetworkingInteractionDetailsModel? networkingInteractionDetailsModel});
}

/// @nodoc
class __$$_ReportStateNetworkingInteractionDetailsCopyWithImpl<$Res>
    extends _$NetWorkingDataUpdateStateCopyWithImpl<$Res>
    implements _$$_ReportStateNetworkingInteractionDetailsCopyWith<$Res> {
  __$$_ReportStateNetworkingInteractionDetailsCopyWithImpl(
      _$_ReportStateNetworkingInteractionDetails _value,
      $Res Function(_$_ReportStateNetworkingInteractionDetails) _then)
      : super(_value,
            (v) => _then(v as _$_ReportStateNetworkingInteractionDetails));

  @override
  _$_ReportStateNetworkingInteractionDetails get _value =>
      super._value as _$_ReportStateNetworkingInteractionDetails;

  @override
  $Res call({
    Object? networkingInteractionDetailsModel = freezed,
  }) {
    return _then(_$_ReportStateNetworkingInteractionDetails(
      networkingInteractionDetailsModel == freezed
          ? _value.networkingInteractionDetailsModel
          : networkingInteractionDetailsModel // ignore: cast_nullable_to_non_nullable
              as NetworkingInteractionDetailsModel?,
    ));
  }
}

/// @nodoc

class _$_ReportStateNetworkingInteractionDetails
    implements _ReportStateNetworkingInteractionDetails {
  const _$_ReportStateNetworkingInteractionDetails(
      this.networkingInteractionDetailsModel);

  @override
  final NetworkingInteractionDetailsModel? networkingInteractionDetailsModel;

  @override
  String toString() {
    return 'NetWorkingDataUpdateState.networkingInteractionDetails(networkingInteractionDetailsModel: $networkingInteractionDetailsModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReportStateNetworkingInteractionDetails &&
            const DeepCollectionEquality().equals(
                other.networkingInteractionDetailsModel,
                networkingInteractionDetailsModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(networkingInteractionDetailsModel));

  @JsonKey(ignore: true)
  @override
  _$$_ReportStateNetworkingInteractionDetailsCopyWith<
          _$_ReportStateNetworkingInteractionDetails>
      get copyWith => __$$_ReportStateNetworkingInteractionDetailsCopyWithImpl<
          _$_ReportStateNetworkingInteractionDetails>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoadingStatus loadingStatus) empty,
    required TResult Function(
            NetworkingInteractionDetailsModel?
                networkingInteractionDetailsModel)
        networkingInteractionDetails,
  }) {
    return networkingInteractionDetails(networkingInteractionDetailsModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(LoadingStatus loadingStatus)? empty,
    TResult Function(
            NetworkingInteractionDetailsModel?
                networkingInteractionDetailsModel)?
        networkingInteractionDetails,
  }) {
    return networkingInteractionDetails
        ?.call(networkingInteractionDetailsModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoadingStatus loadingStatus)? empty,
    TResult Function(
            NetworkingInteractionDetailsModel?
                networkingInteractionDetailsModel)?
        networkingInteractionDetails,
    required TResult orElse(),
  }) {
    if (networkingInteractionDetails != null) {
      return networkingInteractionDetails(networkingInteractionDetailsModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NetWorkingDataUpdateEmpty value) empty,
    required TResult Function(_ReportStateNetworkingInteractionDetails value)
        networkingInteractionDetails,
  }) {
    return networkingInteractionDetails(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_NetWorkingDataUpdateEmpty value)? empty,
    TResult Function(_ReportStateNetworkingInteractionDetails value)?
        networkingInteractionDetails,
  }) {
    return networkingInteractionDetails?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NetWorkingDataUpdateEmpty value)? empty,
    TResult Function(_ReportStateNetworkingInteractionDetails value)?
        networkingInteractionDetails,
    required TResult orElse(),
  }) {
    if (networkingInteractionDetails != null) {
      return networkingInteractionDetails(this);
    }
    return orElse();
  }
}

abstract class _ReportStateNetworkingInteractionDetails
    implements NetWorkingDataUpdateState {
  const factory _ReportStateNetworkingInteractionDetails(
          final NetworkingInteractionDetailsModel?
              networkingInteractionDetailsModel) =
      _$_ReportStateNetworkingInteractionDetails;

  NetworkingInteractionDetailsModel? get networkingInteractionDetailsModel =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$_ReportStateNetworkingInteractionDetailsCopyWith<
          _$_ReportStateNetworkingInteractionDetails>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$NetWorkingDataUpdateEvent {
  BuildContext get context => throw _privateConstructorUsedError;
  String get interect_center_record_id => throw _privateConstructorUsedError;
  String get interect_user_id => throw _privateConstructorUsedError;
  String get interaction_id => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            BuildContext context,
            String interect_center_record_id,
            String interect_user_id,
            String interaction_id)
        networkingInteractionDetails,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(BuildContext context, String interect_center_record_id,
            String interect_user_id, String interaction_id)?
        networkingInteractionDetails,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, String interect_center_record_id,
            String interect_user_id, String interaction_id)?
        networkingInteractionDetails,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_networkingInteractionDetails value)
        networkingInteractionDetails,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_networkingInteractionDetails value)?
        networkingInteractionDetails,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_networkingInteractionDetails value)?
        networkingInteractionDetails,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NetWorkingDataUpdateEventCopyWith<NetWorkingDataUpdateEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NetWorkingDataUpdateEventCopyWith<$Res> {
  factory $NetWorkingDataUpdateEventCopyWith(NetWorkingDataUpdateEvent value,
          $Res Function(NetWorkingDataUpdateEvent) then) =
      _$NetWorkingDataUpdateEventCopyWithImpl<$Res>;
  $Res call(
      {BuildContext context,
      String interect_center_record_id,
      String interect_user_id,
      String interaction_id});
}

/// @nodoc
class _$NetWorkingDataUpdateEventCopyWithImpl<$Res>
    implements $NetWorkingDataUpdateEventCopyWith<$Res> {
  _$NetWorkingDataUpdateEventCopyWithImpl(this._value, this._then);

  final NetWorkingDataUpdateEvent _value;
  // ignore: unused_field
  final $Res Function(NetWorkingDataUpdateEvent) _then;

  @override
  $Res call({
    Object? context = freezed,
    Object? interect_center_record_id = freezed,
    Object? interect_user_id = freezed,
    Object? interaction_id = freezed,
  }) {
    return _then(_value.copyWith(
      context: context == freezed
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      interect_center_record_id: interect_center_record_id == freezed
          ? _value.interect_center_record_id
          : interect_center_record_id // ignore: cast_nullable_to_non_nullable
              as String,
      interect_user_id: interect_user_id == freezed
          ? _value.interect_user_id
          : interect_user_id // ignore: cast_nullable_to_non_nullable
              as String,
      interaction_id: interaction_id == freezed
          ? _value.interaction_id
          : interaction_id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_networkingInteractionDetailsCopyWith<$Res>
    implements $NetWorkingDataUpdateEventCopyWith<$Res> {
  factory _$$_networkingInteractionDetailsCopyWith(
          _$_networkingInteractionDetails value,
          $Res Function(_$_networkingInteractionDetails) then) =
      __$$_networkingInteractionDetailsCopyWithImpl<$Res>;
  @override
  $Res call(
      {BuildContext context,
      String interect_center_record_id,
      String interect_user_id,
      String interaction_id});
}

/// @nodoc
class __$$_networkingInteractionDetailsCopyWithImpl<$Res>
    extends _$NetWorkingDataUpdateEventCopyWithImpl<$Res>
    implements _$$_networkingInteractionDetailsCopyWith<$Res> {
  __$$_networkingInteractionDetailsCopyWithImpl(
      _$_networkingInteractionDetails _value,
      $Res Function(_$_networkingInteractionDetails) _then)
      : super(_value, (v) => _then(v as _$_networkingInteractionDetails));

  @override
  _$_networkingInteractionDetails get _value =>
      super._value as _$_networkingInteractionDetails;

  @override
  $Res call({
    Object? context = freezed,
    Object? interect_center_record_id = freezed,
    Object? interect_user_id = freezed,
    Object? interaction_id = freezed,
  }) {
    return _then(_$_networkingInteractionDetails(
      context == freezed
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      interect_center_record_id == freezed
          ? _value.interect_center_record_id
          : interect_center_record_id // ignore: cast_nullable_to_non_nullable
              as String,
      interect_user_id == freezed
          ? _value.interect_user_id
          : interect_user_id // ignore: cast_nullable_to_non_nullable
              as String,
      interaction_id == freezed
          ? _value.interaction_id
          : interaction_id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_networkingInteractionDetails implements _networkingInteractionDetails {
  const _$_networkingInteractionDetails(
      this.context,
      this.interect_center_record_id,
      this.interect_user_id,
      this.interaction_id);

  @override
  final BuildContext context;
  @override
  final String interect_center_record_id;
  @override
  final String interect_user_id;
  @override
  final String interaction_id;

  @override
  String toString() {
    return 'NetWorkingDataUpdateEvent.networkingInteractionDetails(context: $context, interect_center_record_id: $interect_center_record_id, interect_user_id: $interect_user_id, interaction_id: $interaction_id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_networkingInteractionDetails &&
            const DeepCollectionEquality().equals(other.context, context) &&
            const DeepCollectionEquality().equals(
                other.interect_center_record_id, interect_center_record_id) &&
            const DeepCollectionEquality()
                .equals(other.interect_user_id, interect_user_id) &&
            const DeepCollectionEquality()
                .equals(other.interaction_id, interaction_id));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(context),
      const DeepCollectionEquality().hash(interect_center_record_id),
      const DeepCollectionEquality().hash(interect_user_id),
      const DeepCollectionEquality().hash(interaction_id));

  @JsonKey(ignore: true)
  @override
  _$$_networkingInteractionDetailsCopyWith<_$_networkingInteractionDetails>
      get copyWith => __$$_networkingInteractionDetailsCopyWithImpl<
          _$_networkingInteractionDetails>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            BuildContext context,
            String interect_center_record_id,
            String interect_user_id,
            String interaction_id)
        networkingInteractionDetails,
  }) {
    return networkingInteractionDetails(
        context, interect_center_record_id, interect_user_id, interaction_id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(BuildContext context, String interect_center_record_id,
            String interect_user_id, String interaction_id)?
        networkingInteractionDetails,
  }) {
    return networkingInteractionDetails?.call(
        context, interect_center_record_id, interect_user_id, interaction_id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, String interect_center_record_id,
            String interect_user_id, String interaction_id)?
        networkingInteractionDetails,
    required TResult orElse(),
  }) {
    if (networkingInteractionDetails != null) {
      return networkingInteractionDetails(
          context, interect_center_record_id, interect_user_id, interaction_id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_networkingInteractionDetails value)
        networkingInteractionDetails,
  }) {
    return networkingInteractionDetails(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_networkingInteractionDetails value)?
        networkingInteractionDetails,
  }) {
    return networkingInteractionDetails?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_networkingInteractionDetails value)?
        networkingInteractionDetails,
    required TResult orElse(),
  }) {
    if (networkingInteractionDetails != null) {
      return networkingInteractionDetails(this);
    }
    return orElse();
  }
}

abstract class _networkingInteractionDetails
    implements NetWorkingDataUpdateEvent {
  const factory _networkingInteractionDetails(
      final BuildContext context,
      final String interect_center_record_id,
      final String interect_user_id,
      final String interaction_id) = _$_networkingInteractionDetails;

  @override
  BuildContext get context => throw _privateConstructorUsedError;
  @override
  String get interect_center_record_id => throw _privateConstructorUsedError;
  @override
  String get interect_user_id => throw _privateConstructorUsedError;
  @override
  String get interaction_id => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_networkingInteractionDetailsCopyWith<_$_networkingInteractionDetails>
      get copyWith => throw _privateConstructorUsedError;
}
