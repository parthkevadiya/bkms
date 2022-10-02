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
import 'package:flutter_app/presentation/reports_page/bst_report_model.dart';
import 'package:flutter_app/presentation/reports_page/campus_hangout_model.dart';
import 'package:flutter_app/presentation/reports_page/goshthi_report_model.dart';
import 'package:flutter_app/presentation/reports_page/kst_report_model.dart';
import 'package:flutter_app/presentation/reports_page/networking_report_model.dart';
import 'package:flutter_app/presentation/reports_page/report_model.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';

abstract class ParamsState extends Equatable {
  const ParamsState();
}

class EmptyParamsState extends ParamsState {
  @override
  List<Object?> get props => [];
}

class DeepLinkState extends ParamsState {
  final String strDeepLink;

  DeepLinkState(this.strDeepLink);

  @override
  List<Object?> get props => [strDeepLink];
}

class SelectedFiltersState extends ParamsState {
  final String strGender;
  final String strWing;
  final String strSchoolYear;
  final String strCenter;
  final String strRegion;

  SelectedFiltersState(this.strGender, this.strWing, this.strSchoolYear, this.strCenter, this.strRegion);

  @override
  List<Object?> get props => [strGender, strWing, strSchoolYear, strCenter, strRegion];
}

class SelectedSabhaReportFiltersState extends ParamsState {
  final String strRegion;
  final String strCenter;
  final String strWing;
  final String strReportStatus;
  final String strYear;
  final String strSabhaWeek;

  SelectedSabhaReportFiltersState(
      this.strRegion, this.strCenter, this.strWing, this.strReportStatus, this.strYear, this.strSabhaWeek);

  @override
  List<Object?> get props => [strRegion, strCenter, strWing, strReportStatus, strYear, strSabhaWeek];
}

class GoshthiReportFiltersState extends ParamsState {
  final String strSelectedRegion;
  final String strSelectedCenter;
  final String strSabhaMonth;
  final String strSabhaYear;
  final String strSabhaGender;

  GoshthiReportFiltersState(
      this.strSelectedRegion, this.strSelectedCenter, this.strSabhaMonth, this.strSabhaYear, this.strSabhaGender);

  @override
  List<Object?> get props => [strSelectedRegion, strSelectedCenter, strSabhaMonth, strSabhaYear, strSabhaGender];
}

class BSTReportFiltersState extends ParamsState {
  final String strBSTSelectedWing;
  final String strBSTSelectedCenter;
  final String strBSTSelectedRegion;
  final String strBSTSabhaYear;

  BSTReportFiltersState(
      this.strBSTSelectedWing, this.strBSTSelectedCenter, this.strBSTSelectedRegion, this.strBSTSabhaYear);

  @override
  List<Object?> get props => [strBSTSelectedWing, strBSTSelectedCenter, strBSTSelectedRegion, strBSTSabhaYear];
}

class BSTReportRefreshState extends ParamsState {
  final bool isForRefresh;

  BSTReportRefreshState(
    this.isForRefresh,
  );

  @override
  List<Object?> get props => [
        isForRefresh,
      ];
}

class KSTReportRefreshState extends ParamsState {
  final bool isForRefresh;

  KSTReportRefreshState(
    this.isForRefresh,
  );

  @override
  List<Object?> get props => [
        isForRefresh,
      ];
}

class KSTEducationMentoringListRefreshState extends ParamsState {
  final bool isForRefresh;

  KSTEducationMentoringListRefreshState(
    this.isForRefresh,
  );

  @override
  List<Object?> get props => [
        isForRefresh,
      ];
}

class KST1On1MentoringListRefreshState extends ParamsState {
  final bool isForRefresh;

  KST1On1MentoringListRefreshState(
    this.isForRefresh,
  );

  @override
  List<Object?> get props => [
        isForRefresh,
      ];
}

class CampusHangoutReportRefreshState extends ParamsState {
  final bool isForRefresh;

  CampusHangoutReportRefreshState(
    this.isForRefresh,
  );

  @override
  List<Object?> get props => [
        isForRefresh,
      ];
}

class KSTReportFiltersState extends ParamsState {
  final String strKSTSelectedWing;
  final String strKSTSelectedCenter;
  final String strKSTSelectedRegion;
  final String strKSTSelectedYear;

  KSTReportFiltersState(
      this.strKSTSelectedWing, this.strKSTSelectedCenter, this.strKSTSelectedRegion, this.strKSTSelectedYear);

  @override
  List<Object?> get props => [strKSTSelectedWing, strKSTSelectedCenter, strKSTSelectedRegion, strKSTSelectedYear];
}

class CampusHangoutFiltersState extends ParamsState {
  final String strCHSelectedWing;
  final String strCHSelectedCampus;
  final String strCHSelectedRegion;
  final String strCHSelectedYear;

  CampusHangoutFiltersState(
      this.strCHSelectedWing, this.strCHSelectedCampus, this.strCHSelectedRegion, this.strCHSelectedYear);

  @override
  List<Object?> get props => [strCHSelectedWing, strCHSelectedCampus, strCHSelectedRegion, strCHSelectedYear];
}

class CampusHangoutAttendanceFiltersState extends ParamsState {
  final String strFSchoolYear;
  final String strFFirstName;
  final String strFMiddleName;
  final String strFLastName;
  final String strFUserId;

  CampusHangoutAttendanceFiltersState(
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

class CampusHangoutDetailsState extends ParamsState {
  final CampusHangoutDataModel? campusHangoutDataModel;
  final ViewHangoutDataModel? viewHangoutDataModel;

  CampusHangoutDetailsState(
    this.campusHangoutDataModel,
    this.viewHangoutDataModel,
  );

  @override
  List<Object?> get props => [
        campusHangoutDataModel,
        viewHangoutDataModel,
      ];
}

class GoshthiAttendanceFiltersState extends ParamsState {
  final String strSelectedUserWing;
  final String strSelectedGoshthiDate;
  final String strSelectedGoshthiRegion;
  final String strSelectedGoshthiCenter;
  final String strSelectedGender;
  final String strSelectedGoshthiMonth;

  GoshthiAttendanceFiltersState(this.strSelectedUserWing, this.strSelectedGoshthiDate, this.strSelectedGoshthiRegion,
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

class NetworkingReportFiltersState extends ParamsState {
  final String strNTWRKSelectedRegion;
  final String strNTWRKSelectedCenter;
  final String strSelectedReportingYear;

  NetworkingReportFiltersState(this.strNTWRKSelectedRegion, this.strNTWRKSelectedCenter, this.strSelectedReportingYear);

  @override
  List<Object?> get props => [strNTWRKSelectedRegion, strNTWRKSelectedCenter, strSelectedReportingYear];
}

class GoshthiReportsListingState extends ParamsState {
  final GoshthiReportModel? goshthiReportModel;

  GoshthiReportsListingState(this.goshthiReportModel);

  @override
  List<Object?> get props => [goshthiReportModel];
}

class RecordSearchState extends ParamsState {
  final String strSearch;
  final bool isSearching;

  RecordSearchState(this.strSearch, this.isSearching);

  @override
  List<Object?> get props => [strSearch, isSearching];
}

class RecordIdState extends ParamsState {
  final String strRecordId;

  RecordIdState(this.strRecordId);

  @override
  List<Object?> get props => [strRecordId];
}

class DeActivateUserStatusState extends ParamsState {
  final bool isUserDeActivated;

  DeActivateUserStatusState(this.isUserDeActivated);

  @override
  List<Object?> get props => [isUserDeActivated];
}

class EventState extends ParamsState {
  final MyEvent myEvent;

  EventState(this.myEvent);

  @override
  List<Object?> get props => [myEvent];
}

class EventRegistrationStatusState extends ParamsState {
  final String strEventStatus;

  EventRegistrationStatusState(this.strEventStatus);

  @override
  List<Object?> get props => [strEventStatus];
}

class SetEventUpdateStatusState extends ParamsState {
  final bool isEventUpdated;

  SetEventUpdateStatusState(this.isEventUpdated);

  @override
  List<Object?> get props => [isEventUpdated];
}

// class QrScanState extends ParamsState {
//   final Barcode barcode;
//
//   QrScanState(this.barcode);
//
//   @override
//   List<Object?> get props => [barcode];
// }

class UpdateRegistrationStatusState extends ParamsState {
  final String registrationType;

  UpdateRegistrationStatusState(this.registrationType);

  @override
  List<Object?> get props => [registrationType];
}

class SetSabhaReportsListingState extends ParamsState {
  final ReportModel reportModel;

  SetSabhaReportsListingState(this.reportModel);

  @override
  List<Object?> get props => [reportModel];
}

class UpdateDashBoardState extends ParamsState {
  final bool needToUpdateList;

  UpdateDashBoardState(this.needToUpdateList);

  @override
  List<Object?> get props => [needToUpdateList];
}

class SabhaReportFiltersState extends ParamsState {
  final String strFilterRegion;
  final String strFilterCenter;
  final String strFilterWing;
  final String strFilterReportStatus;
  final String strFilterYear;
  final String strFilterSabhaWeek;

  SabhaReportFiltersState(this.strFilterRegion, this.strFilterCenter, this.strFilterWing, this.strFilterReportStatus,
      this.strFilterYear, this.strFilterSabhaWeek);

  @override
  List<Object?> get props =>
      [strFilterRegion, strFilterCenter, strFilterWing, strFilterReportStatus, strFilterYear, strFilterSabhaWeek];
}

class SabhaReportDetailsState extends ParamsState {
  final String strSabhaReportId;
  final String strSabhaDate;
  final String strWing;
  final String strCenter;
  final String strRegion;
  final String strSabhaLabel;

  SabhaReportDetailsState(
      this.strSabhaReportId, this.strSabhaDate, this.strWing, this.strCenter, this.strRegion, this.strSabhaLabel);

  @override
  List<Object?> get props => [strSabhaReportId];
}

class GoshthiReportDetailsState extends ParamsState {
  final String karyakar_goshti_sabha_id;
  final String strSabhaDate;
  final String strWing;
  final String strCenter;
  final String strRegion;
  final String strSabhaLabel;
  final String strGender;
  final String strGoshthiHeld;
  ParamsState? saveState;

  GoshthiReportDetailsState(this.karyakar_goshti_sabha_id, this.strSabhaDate, this.strWing, this.strCenter,
      this.strRegion, this.strSabhaLabel, this.strGender, this.strGoshthiHeld, this.saveState);

  @override
  List<Object?> get props => [karyakar_goshti_sabha_id];
}

class SabhaQuestionsProgressState extends ParamsState {
  final double progress;

  SabhaQuestionsProgressState(this.progress);

  @override
  List<Object?> get props => [progress];
}

class UpdateGoshthiAttendanceState extends ParamsState {
  final List<GoshthiAttendanceDataModel?> goshthiAttendanceItems;
  final int totalRecords;

  UpdateGoshthiAttendanceState(this.goshthiAttendanceItems, this.totalRecords);

  @override
  List<Object?> get props => [goshthiAttendanceItems, totalRecords];
}

class NotificationRedirectionState extends ParamsState {
  final String strRedirectionType;

  NotificationRedirectionState(this.strRedirectionType);

  @override
  List<Object?> get props => [strRedirectionType];
}

class NetworkingReportDetailsState extends ParamsState {
  final NetworkReportListDataModel? networkReportListDataModel;
  final NetworkingListDataModel? networkingListDataModel;
  final InteractionLogDataModel? interactionLogDataModel;

  NetworkingReportDetailsState(
    this.networkReportListDataModel,
    this.networkingListDataModel,
    this.interactionLogDataModel,
  );

  @override
  List<Object?> get props => [networkReportListDataModel, networkingListDataModel, interactionLogDataModel];
}

class BSTReportDetailsState extends ParamsState {
  final BSTReportListDataModel? bstReportItem;
  final ManageBSTReportListDataModel? manageBSTReportListDataModel;

  BSTReportDetailsState(
    this.bstReportItem,
    this.manageBSTReportListDataModel,
  );

  @override
  List<Object?> get props => [bstReportItem, manageBSTReportListDataModel];
}

class CreateCenterBSTReportState extends ParamsState {
  final List<BSTCentersItems?>? bstCenters;

  CreateCenterBSTReportState(
    this.bstCenters,
  );

  @override
  List<Object?> get props => [bstCenters];
}

class CreateCenterKSTReportState extends ParamsState {
  final List<KSTCentersItems?>? kstCenters;

  CreateCenterKSTReportState(
    this.kstCenters,
  );

  @override
  List<Object?> get props => [kstCenters];
}

class CreateCampusHangoutReportState extends ParamsState {
  final List<CampusRegionItems?>? hangoutRegions;

  CreateCampusHangoutReportState(
    this.hangoutRegions,
  );

  @override
  List<Object?> get props => [hangoutRegions];
}

class KSTReportDetailsState extends ParamsState {
  final KSTReportListDataModel? kstReportListDataModel;
  final ManageKSTReportListDataModel? manageKSTReportListDataModel;
  final KEMDataModel? kstEducationMentoringDataModel;
  final K1On1MDataModel? kst1On1MentoringDataModel;

  KSTReportDetailsState(
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

class ManageBSTAttendanceFiltersState extends ParamsState {
  final String strSelectedWing;
  final String strSelectedRegion;
  final String strSearchUserId;
  final String strGroup;
  final String strSubGroup;
  final String strSchoolYear;
  final String strFirstName;
  final String strMiddleName;
  final String strLastName;

  ManageBSTAttendanceFiltersState(
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

class ManageKSTAttendanceFiltersState extends ParamsState {
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

  ManageKSTAttendanceFiltersState(
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

class ManageBSTQuizScoreFiltersState extends ParamsState {
  final String strSelectedWing;
  final String strSelectedRegion;
  final String strSearchUserId;
  final String strGroup;
  final String strSubGroup;
  final String strSchoolYear;
  final String strFirstName;
  final String strMiddleName;
  final String strLastName;

  ManageBSTQuizScoreFiltersState(
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

class ManageKSTQuizScoreFiltersState extends ParamsState {
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

  ManageKSTQuizScoreFiltersState(
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

class ManageBSTNiyamAssesmentFiltersState extends ParamsState {
  final String strSelectedWing;
  final String strSelectedRegion;
  final String strSearchUserId;
  final String strGroup;
  final String strSubGroup;
  final String strSchoolYear;
  final String strFirstName;
  final String strMiddleName;
  final String strLastName;

  ManageBSTNiyamAssesmentFiltersState(
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
