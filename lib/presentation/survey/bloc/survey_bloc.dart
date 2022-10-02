import 'package:flutter_app/presentation/survey/survey_model.dart';
import 'package:flutter_app/services/survey_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'survey_bloc.freezed.dart';

@freezed
class SurveyState with _$SurveyState {
  const factory SurveyState(SurveyModel surveyModel) = _SurveyState;
}

@freezed
class SurveyEvent with _$SurveyEvent {
  const factory SurveyEvent.data(SurveyModel surveyModel) = _data;
}

@injectable
class SurveyBloc extends Bloc<SurveyEvent, SurveyState> {
  ISurveyService _iSurveyService;

  SurveyBloc(this._iSurveyService)
      : super(SurveyState(_iSurveyService.surveyModel)) {
    on<SurveyEvent>((event, emit) async {
      await event.when(
        data: (surveyModel) async {
          await _iSurveyService.data(surveyModel);
          emit(state.copyWith(surveyModel: _iSurveyService.surveyModel));
        },
      );
    });
  }
  // @override
  // Stream<SurveyState> mapEventToState(SurveyEvent event) async {
  //
  // }
}
