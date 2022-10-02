import 'package:flutter_app/services/setting_service.dart';
import 'package:flutter_app/utils/login_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'setting_bloc.freezed.dart';

@freezed
class SettingState with _$SettingState {
  const factory SettingState(bool bio) = _SettingState;
}

@freezed
class SettingEvent with _$SettingEvent {
  const factory SettingEvent.getbiomatric() = SetBioMatric;

  const factory SettingEvent.setbiomatric(bool bioma) = GetBioMatric;
  const factory SettingEvent.removebiomatric() = removeBioMatric;
}

@Singleton()
class SettingBloc extends Bloc<SettingEvent, SettingState> {
  ISettingService _iSettingService;

  SettingBloc(this._iSettingService)
      : super(SettingState(_iSettingService.bio)) {
    on<SettingEvent>((event, emit) async {
      await event.when(getbiomatric: () async {
        await _iSettingService.getbiomatric();
      }, setbiomatric: (bioma) async {
        await _iSettingService.setbiomatric(bioma);
        emit(state.copyWith(bio: _iSettingService.bio));
      }, removebiomatric: () async {
        await _iSettingService.removebiomatric();
      });
    });
  }
}
