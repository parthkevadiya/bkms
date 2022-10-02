// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:connectivity_plus/connectivity_plus.dart' as _i3;
import 'package:firebase_remote_config/firebase_remote_config.dart' as _i24;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i29;

import 'Bloc/bst_data_update_bloc.dart' as _i34;
import 'Bloc/bst_report_bloc.dart' as _i35;
import 'Bloc/campus_hangout_bloc.dart' as _i38;
import 'Bloc/campus_hangout_data_update_bloc.dart' as _i36;
import 'Bloc/goshthi_data_update_bloc.dart' as _i39;
import 'Bloc/goshthi_report_attendance_bloc.dart' as _i40;
import 'Bloc/karyakar_goshthi_report_bloc.dart' as _i14;
import 'Bloc/kst_data_update_bloc.dart' as _i13;
import 'Bloc/kst_report_bloc.dart' as _i15;
import 'Bloc/manage_bst_attendance_report_bloc.dart' as _i16;
import 'Bloc/manage_kst_reports_bloc.dart' as _i17;
import 'Bloc/manage_niyam_report_bloc.dart' as _i18;
import 'Bloc/networking_data_update_bloc.dart' as _i19;
import 'Bloc/networking_report_bloc.dart' as _i20;
import 'Bloc/sabha_report_bloc.dart' as _i26;
import 'Bloc/sabha_report_question_bloc.dart' as _i27;
import 'Bloc/view_hangout_report_bloc.dart' as _i37;
import 'Bloc/view_networking_report_list_bloc.dart' as _i32;
import 'presentation/auth/auth_bloc.dart' as _i33;
import 'presentation/bloc/params_bloc.dart' as _i22;
import 'presentation/bloc/setting_bloc.dart' as _i28;
import 'presentation/bloc/user_profile_bloc.dart' as _i31;
import 'presentation/homepage/bloc/homepage_bloc.dart' as _i41;
import 'presentation/notification/bloc/notification_bloc.dart' as _i21;
import 'presentation/records_page/bloc/record_bloc.dart' as _i23;
import 'presentation/reports_page/bloc/report_bloc.dart' as _i25;
import 'presentation/survey/bloc/survey_bloc.dart' as _i30;
import 'register_module.dart' as _i42;
import 'services/auth_service.dart' as _i4;
import 'services/forgot_password_service.dart' as _i5;
import 'services/home_service.dart' as _i6;
import 'services/notification_service.dart' as _i7;
import 'services/record_service.dart' as _i8;
import 'services/report_all_service.dart' as _i9;
import 'services/setting_service.dart' as _i10;
import 'services/survey_service.dart' as _i11;
import 'services/user_profile_service.dart'
    as _i12; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.factory<_i3.Connectivity>(() => registerModule.connection);
  gh.singleton<_i4.IAuthService>(_i4.AuthService());
  gh.singleton<_i5.IForgotPasswordService>(_i5.ForgotPasswordService());
  gh.singleton<_i6.IHomeService>(_i6.HomeService());
  gh.singleton<_i7.INotificationService>(_i7.NotificationService());
  gh.singleton<_i8.IRecordService>(_i8.RecordService());
  gh.singleton<_i9.IReportService>(_i9.ReportService());
  gh.singleton<_i10.ISettingService>(_i10.SettingService());
  gh.singleton<_i11.ISurveyService>(_i11.SurveyService());
  gh.singleton<_i12.IUserProfileService>(_i12.UserProfileService());
  gh.singleton<_i13.KSTDataUpdateBloc>(
      _i13.KSTDataUpdateBloc(get<_i9.IReportService>()));
  gh.singleton<_i14.KaryakarGoshthiReportBloc>(
      _i14.KaryakarGoshthiReportBloc(get<_i9.IReportService>()));
  gh.singleton<_i15.KstReportBloc>(
      _i15.KstReportBloc(get<_i9.IReportService>()));
  gh.singleton<_i16.ManageBstAttendanceReportBloc>(
      _i16.ManageBstAttendanceReportBloc(get<_i9.IReportService>()));
  gh.singleton<_i17.ManageKSTReportBloc>(
      _i17.ManageKSTReportBloc(get<_i9.IReportService>()));
  gh.singleton<_i18.ManageNiyamReportBloc>(
      _i18.ManageNiyamReportBloc(get<_i9.IReportService>()));
  gh.singleton<_i19.NetWorkingDataUpdateBloc>(
      _i19.NetWorkingDataUpdateBloc(get<_i9.IReportService>()));
  gh.singleton<_i20.NetworkingReportBloc>(
      _i20.NetworkingReportBloc(get<_i9.IReportService>()));
  gh.factory<_i21.NotificationBloc>(
      () => _i21.NotificationBloc(get<_i7.INotificationService>()));
  gh.factory<_i22.ParamsBloc>(() => _i22.ParamsBloc());
  gh.singleton<_i23.RecordBloc>(_i23.RecordBloc(get<_i8.IRecordService>()));
  gh.factory<_i24.RemoteConfig>(() => registerModule.remoteConfig);
  gh.factory<_i25.ReportBloc>(() => _i25.ReportBloc(get<_i9.IReportService>()));
  gh.singleton<_i26.SabhaReportBloc>(
      _i26.SabhaReportBloc(get<_i9.IReportService>()));
  gh.singleton<_i27.SabhaReportQuestionAttendanceBloc>(
      _i27.SabhaReportQuestionAttendanceBloc(get<_i9.IReportService>()));
  gh.singleton<_i28.SettingBloc>(_i28.SettingBloc(get<_i10.ISettingService>()));
  await gh.factoryAsync<_i29.SharedPreferences>(() => registerModule.prefs,
      preResolve: true);
  gh.factory<_i30.SurveyBloc>(
      () => _i30.SurveyBloc(get<_i11.ISurveyService>()));
  gh.singleton<_i31.UpdateProfileBloc>(
      _i31.UpdateProfileBloc(get<_i12.IUserProfileService>()));
  gh.singleton<_i31.UserProfileBloc>(
      _i31.UserProfileBloc(get<_i12.IUserProfileService>()));
  gh.singleton<_i32.ViewNetworkingReportBloc>(
      _i32.ViewNetworkingReportBloc(get<_i9.IReportService>()));
  gh.singleton<_i31.AddNewRecordBloc>(
      _i31.AddNewRecordBloc(get<_i12.IUserProfileService>()));
  gh.factory<_i33.AuthBloc>(() =>
      _i33.AuthBloc(get<_i4.IAuthService>(), get<_i10.ISettingService>()));
  gh.singleton<_i34.BSTDataUpdateBloc>(
      _i34.BSTDataUpdateBloc(get<_i9.IReportService>()));
  gh.singleton<_i35.BSTReportBloc>(
      _i35.BSTReportBloc(get<_i9.IReportService>()));
  gh.singleton<_i36.CampusHangOutDataUpdateBloc>(
      _i36.CampusHangOutDataUpdateBloc(get<_i9.IReportService>()));
  gh.factory<_i37.CampusHangoutBloc>(
      () => _i37.CampusHangoutBloc(get<_i9.IReportService>()));
  gh.singleton<_i38.CampusHangoutReportBloc>(
      _i38.CampusHangoutReportBloc(get<_i9.IReportService>()));
  gh.singleton<_i31.DeactivateUserBloc>(
      _i31.DeactivateUserBloc(get<_i12.IUserProfileService>()));
  gh.singleton<_i31.EventDetailBloc>(
      _i31.EventDetailBloc(get<_i12.IUserProfileService>()));
  gh.singleton<_i23.ExportBloc>(_i23.ExportBloc(get<_i8.IRecordService>()));
  gh.singleton<_i39.GoshthiDataUpdateBloc>(
      _i39.GoshthiDataUpdateBloc(get<_i9.IReportService>()));
  gh.singleton<_i40.GoshthiReportAttendanceBloc>(
      _i40.GoshthiReportAttendanceBloc(get<_i9.IReportService>()));
  gh.factory<_i41.HomeBloc>(() =>
      _i41.HomeBloc(get<_i6.IHomeService>(), get<_i12.IUserProfileService>()));
  return get;
}

class _$RegisterModule extends _i42.RegisterModule {}
