import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import './bloc.dart';

@injectable
class ParamsBloc extends Bloc<ParamsEvent, ParamsState> {
  ParamsBloc() : super(EmptyParamsState()) {
    on<ParamsEvent>((event, emit) async {
      if (event is ResetParamsEvent) {
        emit(EmptyParamsState());
      }

      if (event is SetDeepLinkValue) {
        emit(DeepLinkState(event.value));
      }

      if (event is SelectedFiltersValue) {
        emit(SelectedFiltersState(
            event.strGender, event.strWing, event.strSchoolYear, event.strCenter, event.strRegion));
      }

      if (event is SetRecordSearchValue) {
        emit(RecordSearchState(event.strSearch, event.isSearching));
      }

      if (event is SetRecordIdValue) {
        emit(RecordIdState(event.strRecordId));
      }

      if (event is SetDeActivateStatusValue) {
        emit(DeActivateUserStatusState(event.isUserDeActivated));
      }

      if (event is SetEventValue) {
        emit(EventState(event.myEvent));
      }

      if (event is SetEventRegistrationStatusValue) {
        emit(EventRegistrationStatusState(event.strRegistrationStatus));
      }

      if (event is SetEventUpdateStatusValue) {
        emit(SetEventUpdateStatusState(event.isEventUpdated));
      }

      // if (event is SetQRScanValue) {
      //   emit(QrScanState(event.barcode));
      // }

      if (event is UpdateRegistrationStatusEvent) {
        emit(UpdateRegistrationStatusState(event.registrationType));
      }

      if (event is SetSabhaReportsListingEvent) {
        emit(SetSabhaReportsListingState(event.reportModel));
      }

      if (event is SetSabhaReportFiltersEvent) {
        emit(SelectedSabhaReportFiltersState(
            event.strRegion, event.strCenter, event.strWing, event.strReportStatus, event.strYear, event.strSabhaWeek));
      }

      if (event is GoshthiReportsListingEvent) {
        emit(GoshthiReportsListingState(event.goshthiReportModel));
      }

      if (event is UpdateDashBoardEvent) {
        emit(UpdateDashBoardState(event.needToUpdateList));
      }

      if (event is SabhaReportFiltersEvent) {
        emit(SabhaReportFiltersState(event.strFilterRegion, event.strFilterCenter, event.strFilterWing,
            event.strFilterReportStatus, event.strFilterYear, event.strFilterSabhaWeek));
      }

      if (event is GoshthiReportFiltersEvent) {
        emit(GoshthiReportFiltersState(event.strSelectedRegion, event.strSelectedCenter, event.strSabhaMonth,
            event.strSabhaYear, event.strSabhaGender));
      }

      if (event is BSTReportFiltersEvent) {
        emit(BSTReportFiltersState(
            event.strBSTSelectedWing, event.strBSTSelectedCenter, event.strBSTSelectedRegion, event.strBSTSabhaYear));
      }

      if (event is BSTReportRefreshEvent) {
        emit(BSTReportRefreshState(
          event.isForRefresh,
        ));
      }

      if (event is KSTReportRefreshEvent) {
        emit(KSTReportRefreshState(
          event.isForRefresh,
        ));
      }

      if (event is KSTEducationMentoringListRefreshEvent) {
        emit(KSTEducationMentoringListRefreshState(
          event.isForRefresh,
        ));
      }

      if (event is KST1On1MentoringListRefreshEvent) {
        emit(KST1On1MentoringListRefreshState(
          event.isForRefresh,
        ));
      }

      if (event is CampusHangoutReportRefreshEvent) {
        emit(CampusHangoutReportRefreshState(
          event.isForRefresh,
        ));
      }

      if (event is KSTReportFiltersEvent) {
        emit(KSTReportFiltersState(event.strKSTSelectedWing, event.strKSTSelectedCenter, event.strKSTSelectedRegion,
            event.strKSTSelectedYear));
      }

      if (event is GoshthiAttendanceFiltersEvent) {
        emit(GoshthiAttendanceFiltersState(
            event.strSelectedUserWing,
            event.strSelectedGoshthiDate,
            event.strSelectedGoshthiRegion,
            event.strSelectedGoshthiCenter,
            event.strSelectedGender,
            event.strSelectedGoshthiMonth));
      }

      if (event is NetworkingReportFiltersEvent) {
        emit(NetworkingReportFiltersState(
          event.strNTWRKSelectedRegion,
          event.strNTWRKSelectedCenter,
          event.strSelectedReportingYear,
        ));
      }

      if (event is SabhaReportDetailsEvent) {
        emit(SabhaReportDetailsState(
          event.strSabhaReportId,
          event.strSabhaDate,
          event.strWing,
          event.strCenter,
          event.strRegion,
          event.strSabhaLabel,
        ));
      }

      if (event is GoshthiReportDetailsEvent) {
        emit(GoshthiReportDetailsState(
          event.karyakar_goshti_sabha_id,
          event.strSabhaDate,
          event.strWing,
          event.strCenter,
          event.strRegion,
          event.strSabhaLabel,
          event.strGender,
          event.strGoshthiHeld,
          event.saveState,
        ));
      }

      if (event is SabhaQuestionsProgressEvent) {
        emit(SabhaQuestionsProgressState(event.progress));
      }

      if (event is UpdateGoshthiAttendanceEvent) {
        emit(UpdateGoshthiAttendanceState(event.goshthiAttendanceItems, event.totalRecords));
      }

      if (event is NotificationRedirectionEvent) {
        emit(NotificationRedirectionState(event.strRedirectionType));
      }

      if (event is NetworkingReportDetailsEvent) {
        emit(NetworkingReportDetailsState(
            event.networkReportListDataModel, event.networkingListDataModel, event.interactionLogDataModel));
      }

      if (event is BSTReportDetailsEvent) {
        emit(BSTReportDetailsState(event.bstReportItem, event.manageBSTReportListDataModel));
      }

      if (event is CreateCenterBSTReportEvent) {
        emit(CreateCenterBSTReportState(event.bstCenters));
      }

      if (event is CreateCenterKSTReportEvent) {
        emit(CreateCenterKSTReportState(event.bstCenters));
      }

      if (event is CreateCampusHangoutReportEvent) {
        emit(CreateCampusHangoutReportState(event.hangoutRegions));
      }

      if (event is KSTReportDetailsEvent) {
        emit(KSTReportDetailsState(
          event.kstReportListDataModel,
          event.manageKSTReportListDataModel,
          event.kstEducationMentoringDataModel,
          event.kst1On1MentoringDataModel,
        ));
      }

      if (event is ManageBSTAttendanceFiltersEvent) {
        emit(ManageBSTAttendanceFiltersState(
          event.strSelectedWing,
          event.strSelectedRegion,
          event.strSearchUserId,
          event.strGroup,
          event.strSubGroup,
          event.strSchoolYear,
          event.strFirstName,
          event.strMiddleName,
          event.strLastName,
        ));
      }

      if (event is ManageKSTAttendanceFiltersEvent) {
        emit(ManageKSTAttendanceFiltersState(
          event.strSelectedWing,
          event.strSelectedCenter,
          event.strSelectedRegion,
          event.strSearchUserId,
          event.strGroup,
          event.strSubGroup,
          event.strSchoolYear,
          event.strFirstName,
          event.strMiddleName,
          event.strLastName,
        ));
      }

      if (event is ManageBSTQuizScoreFiltersEvent) {
        emit(ManageBSTQuizScoreFiltersState(
          event.strSelectedWing,
          event.strSelectedRegion,
          event.strSearchUserId,
          event.strGroup,
          event.strSubGroup,
          event.strSchoolYear,
          event.strFirstName,
          event.strMiddleName,
          event.strLastName,
        ));
      }

      if (event is ManageKSTQuizScoreFiltersEvent) {
        emit(ManageKSTQuizScoreFiltersState(
          event.strSelectedWing,
          event.strSelectedCenter,
          event.strSelectedRegion,
          event.strSearchUserId,
          event.strGroup,
          event.strSubGroup,
          event.strSchoolYear,
          event.strFirstName,
          event.strMiddleName,
          event.strLastName,
        ));
      }

      if (event is ManageBSTNiyamAssesmentFiltersEvent) {
        emit(ManageBSTNiyamAssesmentFiltersState(
          event.strSelectedWing,
          event.strSelectedRegion,
          event.strSearchUserId,
          event.strGroup,
          event.strSubGroup,
          event.strSchoolYear,
          event.strFirstName,
          event.strMiddleName,
          event.strLastName,
        ));
      }

      if (event is CampusHangoutFiltersEvent) {
        emit(CampusHangoutFiltersState(
          event.strCHSelectedWing,
          event.strCHSelectedCampus,
          event.strCHSelectedRegion,
          event.strCHSelectedYear,
        ));
      }

      if (event is CampusHangoutDetailsEvent) {
        emit(CampusHangoutDetailsState(
          event.campusHangoutDataModel,
          event.viewHangoutDataModel,
        ));
      }
      if (event is CampusHangoutAttendanceFiltersEvent) {
        emit(CampusHangoutAttendanceFiltersState(
          event.strFSchoolYear,
          event.strFFirstName,
          event.strFMiddleName,
          event.strFLastName,
          event.strFUserId,
        ));
      }
      if (event is SaveEvent) {
        if (event.saveState != null) emit(event.saveState!);
      }
    });
  }
}
