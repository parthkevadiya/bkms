import 'package:flutter_app/presentation/survey/survey_model.dart';
import 'package:injectable/injectable.dart';

abstract class ISurveyService {
  SurveyModel get surveyModel;

  Future<void> data(SurveyModel surveyModel);
}

@Singleton(as: ISurveyService)
class SurveyService implements ISurveyService {
  SurveyModel _surveyModel = SurveyModel();

  @override
  SurveyModel get surveyModel => this._surveyModel;

  @override
  Future<void> data(SurveyModel surveyModel) async {
    _surveyModel = surveyModel;
  }
}
