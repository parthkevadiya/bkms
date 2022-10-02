class Constant {
  static const String BASE_URL = 'https://bkdev.baps-dev.de/bkms-api'; //Live
  //static const String BASE_URL = 'http://192.168.10.14/bkms_api/public';//Local
  static const String PREFIX = "bkms-api";

  static const String defaultDateFormat = "yyyy-MM-dd";
  static const String defaultDateFormatWeb = "MM/dd/yyyy";
  // static const String defaultPlaceholderImage =
  //     "https://img.favpng.com/8/15/14/buddhist-temple-computer-icons-buddhism-clip-art-png-favpng-5G49CGTVYT3KMugQvTYG2kUDG.jpg";
  static const String defaultAttachmentImage = "https://static.thenounproject.com/png/586281-200.png";

  //FOR PREFERENCES
  static const String spACCESS_TOKEN = "spACCESS_TOKEN";
  static const String spLOGIN_MODEL_CLASS = "spLOGIN_MODEL_CLASS";

  //FOR EVENT STATUS
  static const String eNotReadyYet = "0";
  static const String eReadyToBeCompleted = "1";
  static const String eCompleted = "2";

  //FOR EVENT REGISTRATION TYPES
  static const String ertBasicRegistration = "0";
  static const String ertLiabilityForm = "1";
  static const String ertRegistrationFee = "2";
  static const String ertTransportationDetails = "3";
  static const String ertCheckIn = "4";

  //FOR EVENT REGISTRATION STATUS
  static const String erPending = "0";
  static const String erCompleted = "1";

  //FOR ROLE TYPES
  static const String rtLocal = "1";
  static const String rtRegional = "2";
  static const String rtNorthAmerican = "3";
  static const String rtSiteAdmin = "4";
  static const String rtIndividual = "5";

  //FOR REPORTS COMPLETION STATUS
  static const String rcsInCompleted = "0";
  static const String rcsCompleted = "1";

  //FOR LIABILITY FORM
  static const int lINFINITE = -1;

  //FOR TRANSPORT TYPES
  static const int ttDRIVING = 1;
  static const int ttFLYING = 2;

  //FOR PAYMENT METHODS
  static const int pmCARD = 0;
  // static const int pmPAYPAL = 1;
  static const int pmAPPLY_PAY = 1;
  static const int pmGOOGLE_PAY = 2;

  //FOR PAYMENT STATUS
  static const String psSUCCESS = "1";
  static const String psFAILURE = "0";

  //FOR EVENT STATUS
  static const String esSIT_NOT_FOUND = "0";
  static const String psSIT_FOUND = "1";

  //FOR EVENT REGISTRATION STEP AVAILABILITY STATUS
  static const String erfsGONE = "0";
  static const String erssVISIBLE = "1";

  //FOR BASIC REGISTRATION FORM TYPES
  static const String brfmtDEFAULT = "0";
  static const String brfmtKISHORE_KISHORI = "1";
  static const String brfmtBAL_BALIKA = "2";
  static const String brfmtRAM = "4";
  static const String brfmtYOGI_CUP = "6";
  static const String brfmtYOGI_CUP_NE = "7";
  static const String brfmtB_YOG_YOGNA = "8";
  static const String brfmtK_YOG_YOGNA = "9";

  //FOR BASIC REGISTRATION FORM QUESTION/ANSWER TYPES
  static const String brftMULTI_SELECT = "multi_select";
  static const String brftCHECKBOX = "checkbox";
  static const String brftSELECT = "select";
  static const String brftRADIO = "radio";
  static const String brftDROPDOWN = "dropdown";
  static const String brftTEXTBOX = "textbox";
  static const String brftNUMERIC_TEXTBOX = "numeric_textbox";
  static const String brftTEXTAREA = "textarea";
  static const String brftEMAIL = "email";
  static const String brftTELEPHONE = "telephone";
  static const String brftDATE = "date";
  static const String brftFILE = "file";

  //FOR PAYPAL PAYMENT
  static const String tokenizationKey = 'sandbox_8hxpnkht_kzdtzv2btm4p7s5j';

  //FOR STRIPE PAYMENT GATEWAY
  static const String stripeClientSecret =
      'sk_test_51LApHcJYa07i9hKObM6M9ixnuygBXQAQgXVT4l3udXwtKobAbjI6z0xMB1ZXBT2K07mor7FzfYlIgpnnMMCxRTPc00mS8wuuAv';
  static const String stripeClientPublishable =
      'pk_test_51LApHcJYa07i9hKOzSC1mJn5nNjiGyjZ7rTC53iUFrdFURAv5CBX2Daf4dYfMi558tSeCeFXwGtaTwJtBjCfBnAQ00ztgFxdFE'; //FOR STRIPE PAYMENT GATEWAY
  // static const String stripeClientSecret =
  //     'sk_test_51JSxw1SImk9CNXSN94SAUvGU6zSyi3aPKZTL3N1f1WIFcCTIxJAtBCeUNIPUkj4dTN0NymPzPYXC9qZ0Z37O3gll00FLO2AWQE';
  // static const String stripeClientPublishable =
  //     'pk_test_51JSxw1SImk9CNXSNKi27JcvXf069pTGki7IU1u8lHHSMQf00cHzSmXYCynxq9P33NyOJKW8GMHJffavypnvRQMb100uDHLd1Yx';
  static const String stripeMerchantId = 'Test';
  static const String stripePayMode = 'test';
  static const String stripeCurrency = 'usd';
  static const String stripeCountryCode = 'US';

  //FOR NAVIGATION MENU
  static const String nmProfile = "Profile";
  static const String nmReports = "Reports";
  static const String nmHome = "Home";
  static const String nmRecords = "Records";
  static const String nmNotifications = "Notifications";

  //FOR NOTIFICATION REDIRECTION TYPE
  static const String nrtEventInvite = "0";
  static const String nrtSurveyInvite = "1";

  //FOR FCM PUSH NOTIFICATION
  static const String fcmApidKey = 'AIzaSyAHAsf51D0A407EklG1bs-5wA7EbyfNFg0';
  static const String fcmAppId = '1:448618578101:ios:2bc5c1fe2ec336f8ac3efc';
  static const String fcmSenderId = '448618578101';
  static const String fcmProjectId = 'react-native-firebase-testing';
  static const String fcmVApidKey =
      'BGpdLRsMJKvFDD9odfPk92uBg-JbQbyoiZdah0XlUyrjG4SDgUsE1iC_kdRgt4Kn0CO7K3RTswPZt61NNuO0XoA';
  static const String fcmSubscribe = 'subscribe';
  static const String fcmUnsubscribe = 'unsubscribe';
  static const String fcmGetApnsToken = 'get_apns_token';

  //FOR MANAGE BST REPORT STATUS
  static const String mbstrsComplete = "Complete";
  static const String mbstrsIncomplete = "Incomplete";

  //FOR ATTENDANCE STATUS
  static const String asPresent = "present";
  static const String asAbsent = "absent";
  static const String asLate = "late";

  //FOR FILTERS
  static const String fDEFAULT_FILTER_ID = "";
  static const int fDEFAULT_FILTER_ID_INT = -1;
}

String getArrKey(String key, int id) {
  return key + id.toString();
}

String getControllerKey(String key, int id) {
  return key + id.toString();
}

class ErrorMessages {
  static final networkFail = "No Internet Connection!";
  static final serverFail = "Exception from Remote Server";
  static final internalFail = "Something Went Wrong!";
  static final dataFail = "Data not in Correct Format";
  static final tokenExpiry = "Your session is expired, please login again.";
  static final NoToken = "Your session is expired, please login again.";
}

class LogConstants {
  //print which api is called
  static final api = true; // default : true
  //print header(including token) with api. has no effect if api == false
  static final header = false; // default : false
  //print response fetching time for all api
  static final apiCallTime = true; // default : true
  //print specific module response fetching time
  static final specificCallTime = false; // default : false
  //print api response data (after converted by chopper)
  static final responseData = true; // default : true
  //prints very first as response arrives (use when chopper fails to convert response as per required dart object)
  static final rawResponseData = true; // default : false
  //print expiry time for token everytime when token expiry time is checked in app.
  static final tokenExpiry = false; //default : false
  //print remote config data
  static final remoteConfig = false; //default : false
}

class CirPercentTextSize {
  static final double textSize = 0.0225;
}

class CommonMessage {
  static final String event = "No events at this time.";
  static final String survey = "No Surveys at this time.";
  static final String birthDate = "No upcoming birthdays at this time.";
  static final String record = "No records found.";
  static final String notification = "No notification found.";
  static final String sabha = "No sabha report at this time.";
  static final String network = "No networking report at this time.";
  static final String goshthi = "No goshthi Report at this time.";
  static final String bst = "No bst report at this time.";
  static final String kst = "No kst report at this time.";
  static final String campus = "No campus hangouts at this time.";
  static final String report = "No reports found.";
  static final String sabhaReportAttendance = "No attendance found.";
}
