import 'package:equatable/equatable.dart';
import 'package:flutter_app/models/goshthi_report_attendance_model.dart';
import 'package:flutter_app/models/home_model.dart';
import 'package:flutter_app/models/kst_1on1_mentoring_list_model.dart';
import 'package:flutter_app/models/kst_education_mentoring_list_model.dart';
import 'package:flutter_app/models/manage_bst_report_model.dart';
import 'package:flutter_app/models/manage_kst_report_model.dart';
import 'package:flutter_app/models/networking_interaction_log_model.dart';
import 'package:flutter_app/models/view_hangout_report_model.dart';
import 'package:flutter_app/models/view_network_report_list_model.dart';
import 'package:flutter_app/presentation/bloc/params_state.dart';
import 'package:flutter_app/presentation/reports_page/bst_report_model.dart';
import 'package:flutter_app/presentation/reports_page/campus_hangout_model.dart';
import 'package:flutter_app/presentation/reports_page/goshthi_report_model.dart';
import 'package:flutter_app/presentation/reports_page/kst_report_model.dart';
import 'package:flutter_app/presentation/reports_page/networking_report_model.dart';
import 'package:flutter_app/presentation/reports_page/report_model.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';

abstract class ParamsEvent extends Equatable {}

class ResetParamsEvent extends ParamsEvent {
  ResetParamsEvent();
  @override
  List<Object?> get props => [];
}

class SetDeepLinkValue extends ParamsEvent {
  final String value;
  SetDeepLinkValue(this.value);
  @override
  List<Object?> get props => [value];
}

class SelectedFiltersValue extends ParamsEvent {
  final String strGender;
  final String strWing;
  final String strSchoolYear;
  final String strCenter;
  final String strRegion;

  SelectedFiltersValue(this.strGender, this.strWing, this.strSchoolYear, this.strCenter, this.strRegion);

  @override
  List<Object?> get props => [strGender, strWing, strSchoolYear, strCenter, strRegion];
}

class SetRecordSearchValue extends ParamsEvent {
  final String strSearch;
  final bool isSearching;
  SetRecordSearchValue(this.strSearch, this.isSearching);
  @override
  List<Object?> get props => [strSearch, isSearching];
}

class SetRecordIdValue extends ParamsEvent {
  final String strRecordId;

  SetRecordIdValue(this.strRecordId);
  @override
  List<Object?> get props => [strRecordId];
}

class SetDeActivateStatusValue extends ParamsEvent {
  final bool isUserDeActivated;

  SetDeActivateStatusValue(this.isUserDeActivated);
  @override
  List<Object?> get props => [isUserDeActivated];
}

class SetEventValue extends ParamsEvent {
  final MyEvent myEvent;

  SetEventValue(this.myEvent);
  @override
  List<Object?> get props => [myEvent];
}

class SetEventRegistrationStatusValue extends ParamsEvent {
  final String strRegistrationStatus;

  SetEventRegistrationStatusValue(this.strRegistrationStatus);
  @override
  List<Object?> get props => [strRegistrationStatus];
}

class SetEventUpdateStatusValue extends ParamsEvent {
  final bool isEventUpdated;

  SetEventUpdateStatusValue(this.isEventUpdated);
  @override
  List<Object?> get props => [isEventUpdated];
}

// class SetQRScanValue extends ParamsEvent {
//   final Barcode barcode;
//
//   SetQRScanValue(this.barcode);
//   @override
//   List<Object?> get props => [barcode];
// }

class UpdateRegistrationStatusEvent extends ParamsEvent {
  final String registrationType;

  UpdateRegistrationStatusEvent(this.registrationType);
  @override
  List<Object?> get props => [registrationType];
}

class SetSabhaReportsListingEvent extends ParamsEvent {
  final ReportModel reportModel;

  SetSabhaReportsListingEvent(this.reportModel);
  @override
  List<Object?> get props => [reportModel];
}

class GoshthiReportsListingEvent extends ParamsEvent {
  final GoshthiReportModel? goshthiReportModel;

  GoshthiReportsListingEvent(this.goshthiReportModel);
  @override
  List<Object?> get props => [goshthiReportModel];
}

class SetSabhaReportFiltersEvent extends ParamsEvent {
  final String strRegion;
  final String strCenter;
  final String strWing;
  final String strReportStatus;
  final String strYear;
  final String strSabhaWeek;

  SetSabhaReportFiltersEvent(
      this.strRegion, this.strCenter, this.strWing, this.strReportStatus, this.strYear, this.strSabhaWeek);

  @override
  List<Object?> get props => [strRegion, strCenter, strWing, strReportStatus, strYear, strSabhaWeek];
}

class UpdateDashBoardEvent extends ParamsEvent {
  final bool needToUpdateList;

  UpdateDashBoardEvent(this.needToUpdateList);

  @override
  List<Object?> get props => [needToUpdateList];
}

class SabhaReportFiltersEvent extends ParamsEvent {
  final String strFilterRegion;
  final String strFilterCenter;
  final String strFilterWing;
  final String strFilterReportStatus;
  final String strFilterYear;
  final String strFilterSabhaWeek;

  SabhaReportFiltersEvent(this.strFilterRegion, this.strFilterCenter, this.strFilterWing, this.strFilterReportStatus,
      this.strFilterYear, this.strFilterSabhaWeek);

  @override
  List<Object?> get props =>
      [strFilterRegion, strFilterCenter, strFilterWing, strFilterReportStatus, strFilterYear, strFilterSabhaWeek];
}

class GoshthiReportFiltersEvent extends ParamsEvent {
  final String strSelectedRegion;
  final String strSelectedCenter;
  final String strSabhaMonth;
  final String strSabhaYear;
  final String strSabhaGender;

  GoshthiReportFiltersEvent(
      this.strSelectedRegion, this.strSelectedCenter, this.strSabhaMonth, this.strSabhaYear, this.strSabhaGender);

  @override
  List<Object?> get props => [strSelectedRegion, strSelectedCenter, strSabhaMonth, strSabhaYear, strSabhaGender];
}

class SaveState extends ParamsEvent {
  final ParamsState saveState;
  SaveState(this.saveState);

  @override
  List<Object?> get props => [saveState];
}

class BSTReportFiltersEvent extends ParamsEvent {
  final String strBSTSelectedWing;
  final String strBSTSelectedCenter;
  final String strBSTSelectedRegion;
  final String strBSTSabhaYear;

  BSTReportFiltersEvent(
      this.strBSTSelectedWing, this.strBSTSelectedCenter, this.strBSTSelectedRegion, this.strBSTSabhaYear);

  @override
  List<Object?> get props => [strBSTSelectedWing, strBSTSelectedCenter, strBSTSelectedRegion, strBSTSabhaYear];
}

class BSTReportRefreshEvent extends ParamsEvent {
  final bool isForRefresh;

  BSTReportRefreshEvent(
    this.isForRefresh,
  );

  @override
  List<Object?> get props => [
        isForRefresh,
      ];
}

class KSTReportRefreshEvent extends ParamsEvent {
  final bool isForRefresh;

  KSTReportRefreshEvent(
    this.isForRefresh,
  );

  @override
  List<Object?> get props => [
        isForRefresh,
      ];
}

class KSTEducationMentoringListRefreshEvent extends ParamsEvent {
  final bool isForRefresh;

  KSTEducationMentoringListRefreshEvent(
    this.isForRefresh,
  );

  @override
  List<Object?> get props => [
        isForRefresh,
      ];
}

class KST1On1MentoringListRefreshEvent extends ParamsEvent {
  final bool isForRefresh;

  KST1On1MentoringListRefreshEvent(
    this.isForRefresh,
  );

  @override
  List<Object?> get props => [
        isForRefresh,
      ];
}

class CampusHangoutReportRefreshEvent extends ParamsEvent {
  final bool isForRefresh;

  CampusHangoutReportRefreshEvent(
    this.isForRefresh,
  );

  @override
  List<Object?> get props => [
        isForRefresh,
      ];
}

class KSTReportFiltersEvent extends ParamsEvent {
  final String strKSTSelectedWing;
  final String strKSTSelectedCenter;
  final String strKSTSelectedRegion;
  final String strKSTSelectedYear;

  KSTReportFiltersEvent(
      this.strKSTSelectedWing, this.strKSTSelectedCenter, this.strKSTSelectedRegion, this.strKSTSelectedYear);

  @override
  List<Object?> get props => [strKSTSelectedWing, strKSTSelectedCenter, strKSTSelectedRegion, strKSTSelectedYear];
}

class CampusHangoutFiltersEvent extends ParamsEvent {
  final String strCHSelectedWing;
  final String strCHSelectedCampus;
  final String strCHSelectedRegion;
  final String strCHSelectedYear;

  CampusHangoutFiltersEvent(
    this.strCHSelectedWing,
    this.strCHSelectedCampus,
    this.strCHSelectedRegion,
    this.strCHSelectedYear,
  );

  @override
  List<Object?> get props => [strCHSelectedWing, strCHSelectedCampus, strCHSelectedRegion, strCHSelectedYear];
}

class CampusHangoutAttendanceFiltersEvent extends ParamsEvent {
  final String strFSchoolYear;
  final String strFFirstName;
  final String strFMiddleName;
  final String strFLastName;
  final String strFUserId;

  CampusHangoutAttendanceFiltersEvent(
    this.strFSchoolYear,
    this.strFFirstName,
    this.strFMiddleName,
    this.strFLastName,
    this.strFUserId,
  );

  @override
  List<Object?> get props => [
        strFSchoolYear,
        strFFirstName,
        strFMiddleName,
        strFLastName,
        strFUserId,
      ];
}

class GoshthiAttendanceFiltersEvent extends ParamsEvent {
  final String strSelectedUserWing;
  final String strSelectedGoshthiDate;
  final String strSelectedGoshthiRegion;
  final String strSelectedGoshthiCenter;
  final String strSelectedGender;
  final String strSelectedGoshthiMonth;

  GoshthiAttendanceFiltersEvent(this.strSelectedUserWing, this.strSelectedGoshthiDate, this.strSelectedGoshthiRegion,
      this.strSelectedGoshthiCenter, this.strSelectedGender, this.strSelectedGoshthiMonth);

  @override
  List<Object?> get props => [
        strSelectedUserWing,
        strSelectedGoshthiDate,
        strSelectedGoshthiRegion,
        strSelectedGoshthiCenter,
        strSelectedGender,
        strSelectedGoshthiMonth
      ];
}

class NetworkingReportFiltersEvent extends ParamsEvent {
  final String strNTWRKSelectedRegion;
  final String strNTWRKSelectedCenter;
  final String strSelectedReportingYear;

  NetworkingReportFiltersEvent(this.strNTWRKSelectedRegion, this.strNTWRKSelectedCenter, this.strSelectedReportingYear);

  @override
  List<Object?> get props => [strNTWRKSelectedRegion, strNTWRKSelectedCenter, strSelectedReportingYear];
}

class GoshthiReportDetailsEvent extends ParamsEvent {
  final String karyakar_goshti_sabha_id;
  final String strSabhaDate;
  final String strWing;
  final String strCenter;
  final String strRegion;
  final String strSabhaLabel;
  final String strGender;
  final String strGoshthiHeld;
  ParamsState? saveState;

  GoshthiReportDetailsEvent(this.karyakar_goshti_sabha_id, this.strSabhaDate, this.strWing, this.strCenter,
      this.strRegion, this.strSabhaLabel, this.strGender, this.strGoshthiHeld, this.saveState);
  @override
  List<Object?> get props => [karyakar_goshti_sabha_id];
}

class SabhaReportDetailsEvent extends ParamsEvent {
  final String strSabhaReportId;
  final String strSabhaDate;
  final String strWing;
  final String strCenter;
  final String strRegion;
  final String strSabhaLabel;

  SabhaReportDetailsEvent(
      this.strSabhaReportId, this.strSabhaDate, this.strWing, this.strCenter, this.strRegion, this.strSabhaLabel);
  @override
  List<Object?> get props => [strSabhaReportId];
}

class SabhaQuestionsProgressEvent extends ParamsEvent {
  final double progress;

  SabhaQuestionsProgressEvent(this.progress);

  @override
  List<Object?> get props => [progress];
}

class UpdateGoshthiAttendanceEvent extends ParamsEvent {
  final List<GoshthiAttendanceDataModel?> goshthiAttendanceItems;
  final int totalRecords;

  UpdateGoshthiAttendanceEvent(this.goshthiAttendanceItems, this.totalRecords);

  @override
  List<Object?> get props => [goshthiAttendanceItems, totalRecords];
}

class NotificationRedirectionEvent extends ParamsEvent {
  final String strRedirectionType;

  NotificationRedirectionEvent(this.strRedirectionType);

  @override
  List<Object?> get props => [strRedirectionType];
}

class NetworkingReportDetailsEvent extends ParamsEvent {
  final NetworkReportListDataModel? networkReportListDataModel;
  final NetworkingListDataModel? networkingListDataModel;
  final InteractionLogDataModel? interactionLogDataModel;

  NetworkingReportDetailsEvent(
    this.networkReportListDataModel,
    this.networkingListDataModel,
    this.interactionLogDataModel,
  );

  @override
  List<Object?> get props => [networkReportListDataModel, networkingListDataModel, interactionLogDataModel];
}

class BSTReportDetailsEvent extends ParamsEvent {
  final BSTReportListDataModel? bstReportItem;
  final ManageBSTReportListDataModel? manageBSTReportListDataModel;

  BSTReportDetailsEvent(
    this.bstReportItem,
    this.manageBSTReportListDataModel,
  );

  @override
  List<Object?> get props => [bstReportItem, manageBSTReportListDataModel];
}

class CreateCenterBSTReportEvent extends ParamsEvent {
  final List<BSTCentersItems?>? bstCenters;

  CreateCenterBSTReportEvent(
    this.bstCenters,
  );

  @override
  List<Object?> get props => [bstCenters];
}

class CreateCenterKSTReportEvent extends ParamsEvent {
  final List<KSTCentersItems?>? bstCenters;

  CreateCenterKSTReportEvent(
    this.bstCenters,
  );

  @override
  List<Object?> get props => [bstCenters];
}

class CreateCampusHangoutReportEvent extends ParamsEvent {
  final List<CampusRegionItems?>? hangoutRegions;

  CreateCampusHangoutReportEvent(
    this.hangoutRegions,
  );

  @override
  List<Object?> get props => [hangoutRegions];
}

class KSTReportDetailsEvent extends ParamsEvent {
  final KSTReportListDataModel? kstReportListDataModel;
  final ManageKSTReportListDataModel? manageKSTReportListDataModel;
  final KEMDataModel? kstEducationMentoringDataModel;
  final K1On1MDataModel? kst1On1MentoringDataModel;

  KSTReportDetailsEvent(
    this.kstReportListDataModel,
    this.manageKSTReportListDataModel,
    this.kstEducationMentoringDataModel,
    this.kst1On1MentoringDataModel,
  );

  @override
  List<Object?> get props => [
        kstReportListDataModel,
        manageKSTReportListDataModel,
        kstEducationMentoringDataModel,
        kst1On1MentoringDataModel,
      ];
}

class CampusHangoutDetailsEvent extends ParamsEvent {
  final CampusHangoutDataModel? campusHangoutDataModel;
  final ViewHangoutDataModel? viewHangoutDataModel;

  CampusHangoutDetailsEvent(
    this.campusHangoutDataModel,
    this.viewHangoutDataModel,
  );

  @override
  List<Object?> get props => [
        campusHangoutDataModel,
        viewHangoutDataModel,
      ];
}

class ManageBSTAttendanceFiltersEvent extends ParamsEvent {
  final String strSelectedWing;
  final String strSelectedRegion;
  final String strSelectedCenter;
  final String strSearchUserId;
  final String strGroup;
  final String strSubGroup;
  final String strSchoolYear;
  final String strFirstName;
  final String strMiddleName;
  final String strLastName;

  ManageBSTAttendanceFiltersEvent(
    this.strSelectedWing,
    this.strSelectedRegion,
    this.strSelectedCenter,
    this.strSearchUserId,
    this.strGroup,
    this.strSubGroup,
    this.strSchoolYear,
    this.strFirstName,
    this.strMiddleName,
    this.strLastName,
  );

  @override
  List<Object?> get props => [
        strSelectedWing,
        strSelectedRegion,
        strSearchUserId,
        strGroup,
        strSubGroup,
        strSchoolYear,
        strFirstName,
        strMiddleName,
        strLastName,
      ];
}

class ManageKSTAttendanceFiltersEvent extends ParamsEvent {
  final String strSelectedWing;
  final String strSelectedCenter;
  final String strSelectedRegion;
  final String strSearchUserId;
  final String strGroup;
  final String strSubGroup;
  final String strSchoolYear;
  final String strFirstName;
  final String strMiddleName;
  final String strLastName;

  ManageKSTAttendanceFiltersEvent(
    this.strSelectedWing,
    this.strSelectedCenter,
    this.strSelectedRegion,
    this.strSearchUserId,
    this.strGroup,
    this.strSubGroup,
    this.strSchoolYear,
    this.strFirstName,
    this.strMiddleName,
    this.strLastName,
  );

  @override
  List<Object?> get props => [
        strSelectedWing,
        strSelectedCenter,
        strSelectedRegion,
        strSearchUserId,
        strGroup,
        strSubGroup,
        strSchoolYear,
        strFirstName,
        strMiddleName,
        strLastName,
      ];
}

class ManageBSTQuizScoreFiltersEvent extends ParamsEvent {
  final String strSelectedWing;
  final String strSelectedRegion;
  final String strSearchUserId;
  final String strGroup;
  final String strSubGroup;
  final String strSchoolYear;
  final String strFirstName;
  final String strMiddleName;
  final String strLastName;

  ManageBSTQuizScoreFiltersEvent(
    this.strSelectedWing,
    this.strSelectedRegion,
    this.strSearchUserId,
    this.strGroup,
    this.strSubGroup,
    this.strSchoolYear,
    this.strFirstName,
    this.strMiddleName,
    this.strLastName,
  );

  @override
  List<Object?> get props => [
        strSelectedWing,
        strSelectedRegion,
        strSearchUserId,
        strGroup,
        strSubGroup,
        strSchoolYear,
        strFirstName,
        strMiddleName,
        strLastName,
      ];
}

class ManageKSTQuizScoreFiltersEvent extends ParamsEvent {
  final String strSelectedWing;
  final String strSelectedCenter;
  final String strSelectedRegion;
  final String strSearchUserId;
  final String strGroup;
  final String strSubGroup;
  final String strSchoolYear;
  final String strFirstName;
  final String strMiddleName;
  final String strLastName;

  ManageKSTQuizScoreFiltersEvent(
    this.strSelectedWing,
    this.strSelectedCenter,
    this.strSelectedRegion,
    this.strSearchUserId,
    this.strGroup,
    this.strSubGroup,
    this.strSchoolYear,
    this.strFirstName,
    this.strMiddleName,
    this.strLastName,
  );

  @override
  List<Object?> get props => [
        strSelectedWing,
        strSelectedCenter,
        strSelectedRegion,
        strSearchUserId,
        strGroup,
        strSubGroup,
        strSchoolYear,
        strFirstName,
        strMiddleName,
        strLastName,
      ];
}

class ManageBSTNiyamAssesmentFiltersEvent extends ParamsEvent {
  final String strSelectedWing;
  final String strSelectedRegion;
  final String strSelectedCenter;
  final String strSearchUserId;
  final String strGroup;
  final String strSubGroup;
  final String strSchoolYear;
  final String strFirstName;
  final String strMiddleName;
  final String strLastName;

  ManageBSTNiyamAssesmentFiltersEvent(
    this.strSelectedWing,
    this.strSelectedRegion,
    this.strSelectedCenter,
    this.strSearchUserId,
    this.strGroup,
    this.strSubGroup,
    this.strSchoolYear,
    this.strFirstName,
    this.strMiddleName,
    this.strLastName,
  );

  @override
  List<Object?> get props => [
        strSelectedWing,
        strSelectedRegion,
        strSearchUserId,
        strGroup,
        strSubGroup,
        strSchoolYear,
        strFirstName,
        strMiddleName,
        strLastName,
      ];
}

class SaveEvent extends ParamsEvent {
  ParamsState? saveState;
  SaveEvent(this.saveState);

  @override
  List<Object?> get props => [saveState];
}
