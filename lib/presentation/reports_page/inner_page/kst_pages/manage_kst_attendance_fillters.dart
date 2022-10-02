import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/manage_kst_attendance_model.dart';
import 'package:flutter_app/presentation/bloc/params_bloc.dart';
import 'package:flutter_app/presentation/bloc/params_event.dart';
import 'package:flutter_app/presentation/bloc/params_state.dart';
import 'package:flutter_app/utils/util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../Bloc/manage_kst_reports_bloc.dart';
import '../../../../Bloc/manage_niyam_report_bloc.dart';
import '../../../../utils/login_status.dart';

class ManageKSTAttendanceFilter extends StatefulWidget {
  bool isCallBackFilter;
  final Function(
    bool callBackFilter,
    String selectedWing,
    String selectedCenter,
    String selectedRegion,
    String selectedSearchUserId,
    String selectedUserGroup,
    String selectedSubGroup,
    String selectedSchoolYear,
    String firstName,
    String middleName,
    String lastName,
  ) onSelectFilter;
  ManageKSTAttendanceFilter({
    Key? key,
    required this.onSelectFilter,
    required this.isCallBackFilter,
  }) : super(key: key);

  @override
  _ManageKSTAttendanceFilterState createState() => _ManageKSTAttendanceFilterState();
}

class _ManageKSTAttendanceFilterState extends State<ManageKSTAttendanceFilter> {
  String _strReportType = "";
  String _strYear = "";
  String _strUserId = "";
  String _strFirstName = "";
  String _strMiddleName = "";
  String _strLastName = "";
  bool callBackFilter = false;

  List<MKSTAWingsModel?>? _wingItems = [];
  MKSTAWingsModel? _selectedWing;

  List<MKSTARegionsModel?>? _regionItems = [];
  MKSTARegionsModel? _selectedRegion;

  List<MKSTACentersModel?>? _centerItems = [];
  List<MKSTACentersModel?>? _regionWiseCenters = [];
  MKSTACentersModel? _selectedCenter;

  List<MKSTAGroupListModel?>? _userGroupItems = [];
  MKSTAGroupListModel? _selectedUserGroup;

  List<String?>? _subGroupItems = [];
  String? _selectedSubGroup;

  List<MKSTASchoolListModel?>? _schoolYearItems = [];
  MKSTASchoolListModel? _selectedSchoolYear;

  String _strSelectedWing = "";
  String _strSelectedCenter = "";
  String _strSelectedRegion = "";
  String _strSelectedSearchUserId = "";
  String _strSelectedGroup = "";
  String _strSelectedSubGroup = "";
  String _strSelectedSchoolYear = "";
  String _strSelectedFirstName = "";
  String _strSelectedMiddleName = "";
  String _strSelectedLastName = "";

  TextEditingController _reportType = TextEditingController();
  late FocusNode _focusNodeReportType;
  bool? reportTypeError;

  TextEditingController _year = TextEditingController();
  late FocusNode _focusNodeYear;
  bool? yearError;

  TextEditingController _userId = TextEditingController();
  late FocusNode _focusNodeUserId;
  bool? userIdError;

  TextEditingController _firstName = TextEditingController();
  late FocusNode _focusNodeFirstName;
  bool? firstNameError;

  TextEditingController _middleName = TextEditingController();
  late FocusNode _focusNodeMiddleName;
  bool? middleNameError;

  TextEditingController _lastName = TextEditingController();
  late FocusNode _focusNodeLastName;
  bool? lastNameError;

  @override
  void initState() {
    super.initState();

    _focusNodeReportType = FocusNode();
    _focusNodeYear = FocusNode();
    _focusNodeUserId = FocusNode();
    _focusNodeFirstName = FocusNode();
    _focusNodeMiddleName = FocusNode();
    _focusNodeLastName = FocusNode();

    final paramsBloc = BlocProvider.of<ParamsBloc>(context).state;
    if (paramsBloc is ManageKSTAttendanceFiltersState) {
      _strSelectedWing = paramsBloc.strSelectedWing;
      _strSelectedCenter = paramsBloc.strSelectedCenter;
      _strSelectedRegion = paramsBloc.strSelectedRegion;
      _strSelectedSearchUserId = paramsBloc.strSearchUserId;
      _strSelectedGroup = paramsBloc.strGroup;
      _strSelectedSubGroup = paramsBloc.strSubGroup;
      _strSelectedSchoolYear = Utils().nullSafeString(paramsBloc.strSchoolYear);
      _strSelectedFirstName = paramsBloc.strFirstName;
      _strSelectedMiddleName = paramsBloc.strMiddleName;
      _strSelectedLastName = paramsBloc.strLastName;
    }

    //FOR FILL DATA IN DROPDOWN AND DISPLAY SELECTED VALUES
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ManageKSTReportBloc>(context).state.maybeWhen(
        manageKSTAttendance: (manageKSTAttendanceModel, l) {
          if (manageKSTAttendanceModel != null) {
            _wingItems = manageKSTAttendanceModel.kst_attendance_filter!.wings;
            if ((_wingItems != null && _wingItems!.length > 0)) {
              final regionIndex = _wingItems!.indexWhere((element) =>
                  element!.id.toString() ==
                  Utils().nullSafeString(
                      manageKSTAttendanceModel.kst_attendance_filter!.kst_manage_report_data!.report_wing_id));
              if (regionIndex >= 0) {
                _selectedWing = _wingItems![regionIndex]!;
              }
            }

            if (Utils().nullSafeString(_strSelectedWing).isNotEmpty) {
              if ((_wingItems != null && _wingItems!.length > 0)) {
                final regionIndex = _wingItems!
                    .indexWhere((element) => element!.id.toString() == Utils().nullSafeString(_strSelectedWing));
                if (regionIndex >= 0) {
                  _selectedWing = _wingItems![regionIndex]!;
                }
              }
            }

            _regionItems = manageKSTAttendanceModel.kst_attendance_filter!.regions;
            if ((_regionItems != null && _regionItems!.length > 0)) {
              final regionIndex = _regionItems!.indexWhere((element) =>
                  element!.id.toString() ==
                  Utils().nullSafeString(
                      manageKSTAttendanceModel.kst_attendance_filter!.kst_manage_report_data!.region_id));
              if (regionIndex >= 0) {
                _selectedRegion = _regionItems![regionIndex]!;
              }
            }

            if (Utils().nullSafeString(_strSelectedRegion).isNotEmpty) {
              if ((_regionItems != null && _regionItems!.length > 0)) {
                final regionIndex = _regionItems!
                    .indexWhere((element) => element!.id.toString() == Utils().nullSafeString(_strSelectedRegion));
                if (regionIndex >= 0) {
                  _selectedRegion = _regionItems![regionIndex]!;
                }
              }
            }

            _centerItems = manageKSTAttendanceModel.kst_attendance_filter!.centers;
            if (_selectedRegion != null) {
              //FOR FILL REGION WISE CENTERS
              _regionWiseCenters = [];
              _selectedCenter = null;

              if (_centerItems != null) {
                for (int v = 0; v < _centerItems!.length; v++) {
                  if (_selectedRegion!.id.toString() == _centerItems![v]!.RegionId) {
                    _regionWiseCenters!.add(_centerItems![v]!);
                  }
                }

                if ((_regionWiseCenters != null && _regionWiseCenters!.length > 0)) {
                  final centerIndex = _regionWiseCenters!.indexWhere((element) =>
                      element!.id.toString() ==
                      Utils().nullSafeString(
                          manageKSTAttendanceModel.kst_attendance_filter!.kst_manage_report_data!.host_center_id));
                  if (centerIndex >= 0) {
                    _selectedCenter = _regionWiseCenters![centerIndex]!;
                  }
                }
              }
            }

            _userGroupItems = manageKSTAttendanceModel.kst_attendance_filter!.grouplist;
            if (Utils().nullSafeString(_strSelectedGroup).isNotEmpty) {
              if (_userGroupItems != null && _userGroupItems!.length > 0) {
                final userGroupIndex = _userGroupItems!.indexWhere(
                    (element) => element!.group_name.toString() == Utils().nullSafeString(_strSelectedGroup));
                if (userGroupIndex >= 0) {
                  _selectedUserGroup = _userGroupItems![userGroupIndex]!;
                }
              }
            }

            _schoolYearItems = manageKSTAttendanceModel.kst_attendance_filter!.school_list;
            if (Utils().nullSafeString(_strSelectedSchoolYear).isNotEmpty) {
              if (_schoolYearItems != null && _schoolYearItems!.length > 0) {
                final yearIndex = _schoolYearItems!
                    .indexWhere((element) => element!.id.toString() == Utils().nullSafeString(_strSelectedSchoolYear));
                if (yearIndex >= 0) {
                  _selectedSchoolYear = _schoolYearItems![yearIndex]!;
                }
              }
            }

            _strReportType =
                Utils().nullSafeString(manageKSTAttendanceModel.kst_attendance_filter!.kst_manage_report_data!.name);
            _reportType.text = _strReportType;

            _strYear = Utils()
                .nullSafeString(manageKSTAttendanceModel.kst_attendance_filter!.kst_manage_report_data!.report_year);
            _year.text = _strYear;

            if (Utils().nullSafeString(_strSelectedSearchUserId).isNotEmpty) {
              if (_userId.text.toString().isEmpty) {
                _strUserId = _strSelectedSearchUserId;
                _userId.text = _strUserId;
              }
            }
            if (Utils().nullSafeString(_strSelectedFirstName).isNotEmpty) {
              if (_firstName.text.toString().isEmpty) {
                _strFirstName = _strSelectedFirstName;
                _firstName.text = _strFirstName;
              }
            }
            if (Utils().nullSafeString(_strSelectedMiddleName).isNotEmpty) {
              if (_middleName.text.toString().isEmpty) {
                _strMiddleName = _strSelectedMiddleName;
                _middleName.text = _strMiddleName;
              }
            }
            if (Utils().nullSafeString(_strSelectedLastName).isNotEmpty) {
              if (_lastName.text.toString().isEmpty) {
                _strLastName = _strSelectedLastName;
                _lastName.text = _strLastName;
              }
            }
          }
        },
        orElse: () {});
    return MultiBlocListener(
        listeners: [
          BlocListener<ManageNiyamReportBloc, ManageNiyamReportState>(
            listener: (context, state) {
              state.maybeWhen(
                  userGroupWiseSubGroup: (userGroupWiseSubGroupModel, l) {
                    if (l == LoadingStatus.Done) {
                      if (userGroupWiseSubGroupModel != null) {
                        if (userGroupWiseSubGroupModel.subgroups != null) {
                          setState(() {
                            _subGroupItems = userGroupWiseSubGroupModel.subgroups;
                          });
                        }
                      }
                    }
                  },
                  orElse: () {});
            },
          ),
        ],
        child: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              height: 695.4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CupertinoButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.arrow_back_ios,
                              size: 18,
                            ),
                            Text(
                              "Cancel",
                              style: TextStyle(fontSize: 16.2),
                            ),
                          ],
                        ),
                      ),
                      CupertinoButton(
                        onPressed: () {
                          //FOR ADD SELECTED SABHA REPORTS FILTERS
                          if (callBackFilter) {
                            BlocProvider.of<ParamsBloc>(context).add(ManageKSTAttendanceFiltersEvent(
                              _selectedWing != null ? Utils().nullSafeString(_selectedWing!.id.toString()) : "",
                              _selectedCenter != null ? Utils().nullSafeString(_selectedCenter!.id.toString()) : "",
                              _selectedRegion != null ? Utils().nullSafeString(_selectedRegion!.id.toString()) : "",
                              _userId.text.toString(),
                              _selectedUserGroup != null
                                  ? Utils().nullSafeString(_selectedUserGroup!.group_name.toString())
                                  : "",
                              _selectedSubGroup != null ? Utils().nullSafeString(_selectedSubGroup!.toString()) : "",
                              _selectedSchoolYear != null
                                  ? Utils().nullSafeString(_selectedSchoolYear!.id.toString())
                                  : "",
                              _firstName.text.toString(),
                              _middleName.text.toString(),
                              _lastName.text.toString(),
                            ));
                          }
                          if (callBackFilter) {
                            widget.onSelectFilter(
                              callBackFilter,
                              _selectedWing != null ? Utils().nullSafeString(_selectedWing!.id.toString()) : "",
                              _selectedCenter != null ? Utils().nullSafeString(_selectedCenter!.id.toString()) : "",
                              /*_selectedRegion != null ? Utils().nullSafeString(_selectedRegion!.id.toString()) : */ "",
                              _userId.text.toString(),
                              _selectedUserGroup != null
                                  ? Utils().nullSafeString(_selectedUserGroup!.group_name.toString())
                                  : "",
                              _selectedSubGroup != null ? Utils().nullSafeString(_selectedSubGroup!.toString()) : "",
                              _selectedSchoolYear != null
                                  ? Utils().nullSafeString(_selectedSchoolYear!.id.toString())
                                  : "",
                              _firstName.text.toString(),
                              _middleName.text.toString(),
                              _lastName.text.toString(),
                            );
                            Navigator.pop(context);
                          }
                        },
                        child: Text(
                          "Done",
                          style: TextStyle(fontSize: 16.2, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 14.4, top: 7.2),
                    child: Text(
                      "Manage Attendance Filters",
                      style: TextStyle(fontSize: 25.2, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: SafeArea(
                      top: false,
                      right: false,
                      left: false,
                      child: SingleChildScrollView(
                        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                          SizedBox(
                            height: 18.3,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 14.4, right: 14.4),
                            child: Text(
                              "Report Type",
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 14.4, right: 14.4),
                            child: Column(
                              children: [
                                TextField(
                                  style: TextStyle(color: Colors.grey),
                                  enabled: false,
                                  onChanged: (value) {
                                    setState(() {
                                      reportTypeError = false;
                                      callBackFilter = true;
                                      /*(value.isEmpty)
                                    ? ReportTypeError = true
                                    : ReportTypeError = false;*/
                                    });
                                  },
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.text,
                                  focusNode: _focusNodeReportType,
                                  controller: _reportType,
                                  decoration: InputDecoration(
                                    hintText: "Report Type",
                                    suffixIcon: (reportTypeError == true)
                                        ? Padding(
                                            padding: EdgeInsets.only(left: 28.8),
                                            child: Icon(
                                              Icons.warning_amber_outlined,
                                              color: Colors.red,
                                              size: 18,
                                            ),
                                          )
                                        : SizedBox(),
                                  ),
                                ),
                                (reportTypeError == true)
                                    ? Padding(
                                        padding: EdgeInsets.only(bottom: 7.2),
                                        child: Row(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(7.2),
                                                color: Color(0x1FEB5757),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(3.6),
                                                child: Text(
                                                  "Please enter Report Type!",
                                                  style: TextStyle(color: Color(0xffEB5757), fontSize: 13.68),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : SizedBox(),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 18.3,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 14.4, right: 14.4),
                            child: Text(
                              "Year",
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 14.4, right: 14.4),
                            child: Column(
                              children: [
                                TextField(
                                  style: TextStyle(color: Colors.grey),
                                  enabled: false,
                                  onChanged: (value) {
                                    setState(() {
                                      callBackFilter = true;

                                      /*(value.isEmpty)
                                    ? ReportTypeError = true
                                    : ReportTypeError = false;*/
                                    });
                                  },
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.text,
                                  focusNode: _focusNodeYear,
                                  controller: _year,
                                  decoration: InputDecoration(
                                    hintText: "Year",
                                    suffixIcon: (yearError == true)
                                        ? Padding(
                                            padding: EdgeInsets.only(left: 28.8),
                                            child: Icon(
                                              Icons.warning_amber_outlined,
                                              color: Colors.red,
                                              size: 18,
                                            ),
                                          )
                                        : SizedBox(),
                                  ),
                                ),
                                (yearError == true)
                                    ? Padding(
                                        padding: EdgeInsets.only(bottom: 7.2),
                                        child: Row(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(7.2),
                                                color: Color(0x1FEB5757),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(3.6),
                                                child: Text(
                                                  "Please enter Year!",
                                                  style: TextStyle(color: Color(0xffEB5757), fontSize: 13.68),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : SizedBox(),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 18.3,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 14.4),
                            child: Text(
                              "Wing",
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Divider(
                            thickness: 1,
                            height: 29.28,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 14.4, right: 14.4),
                            child: Container(
                              decoration:
                                  BoxDecoration(color: Color(0xffF2F2F2), borderRadius: BorderRadius.circular(3.6)),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<MKSTAWingsModel>(
                                  hint: Text('  Choose Wing'),
                                  isExpanded: true,
                                  itemHeight: null,
                                  value: _selectedWing,
                                  icon: Icon(
                                    Icons.keyboard_arrow_down,
                                    size: 21.6,
                                  ),
                                  style: TextStyle(fontSize: 14.4, color: Colors.black),
                                  onChanged:
                                      null /*(val) {
                                    setState(() {
                                      callBackFilter = true;
                                      _selectedWing = val;
                                    });
                                  }*/
                                  ,
                                  items: _wingItems!.map(
                                    (value) {
                                      return DropdownMenuItem(
                                        child: Padding(
                                          padding: EdgeInsets.all(
                                            7.2,
                                          ),
                                          child: Text(Utils().nullSafeString(value!.wingName)),
                                        ),
                                        value: value,
                                      );
                                    },
                                  ).toList(),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 18.3,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 14.4),
                            child: Text(
                              "Region",
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Divider(
                            thickness: 1,
                            height: 29.28,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 14.4, right: 14.4),
                            child: Container(
                              decoration:
                                  BoxDecoration(color: Color(0xffF2F2F2), borderRadius: BorderRadius.circular(3.6)),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<MKSTARegionsModel>(
                                  hint: Text('  Choose Region'),
                                  isExpanded: true,
                                  itemHeight: null,
                                  value: _selectedRegion == null ? null : _selectedRegion,
                                  icon: Icon(
                                    Icons.keyboard_arrow_down,
                                    size: 21.6,
                                  ),
                                  style: TextStyle(fontSize: 14.4, color: Colors.black),
                                  onChanged:
                                      null /*(val) {
                                    setState(() {
                                      callBackFilter = true;
                                      _selectedRegion = val;
                                    });
                                  }*/
                                  ,
                                  items: _regionItems!.map(
                                    (value) {
                                      return DropdownMenuItem(
                                        child: Padding(
                                          padding: EdgeInsets.all(
                                            7.2,
                                          ),
                                          child: Text(Utils().nullSafeString(value!.RegionName)),
                                        ),
                                        value: value,
                                      );
                                    },
                                  ).toList(),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 18.3,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 14.4),
                            child: Text(
                              "Host Center",
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Divider(
                            thickness: 1,
                            height: 29.28,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 14.4, right: 14.4),
                            child: Container(
                              decoration:
                                  BoxDecoration(color: Color(0xffF2F2F2), borderRadius: BorderRadius.circular(3.6)),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<MKSTACentersModel>(
                                  hint: Text('  Choose Host Center'),
                                  isExpanded: true,
                                  itemHeight: null,
                                  value: _selectedCenter == null ? null : _selectedCenter,
                                  icon: Icon(
                                    Icons.keyboard_arrow_down,
                                    size: 21.6,
                                  ),
                                  style: TextStyle(fontSize: 14.4, color: Colors.black),
                                  onChanged:
                                      null /*(value) {
                                    setState(() {
                                      callBackFilter = true;
                                      _selectedCenter = value;
                                    });
                                  }*/
                                  ,
                                  items: _regionWiseCenters!.map(
                                    (value) {
                                      return DropdownMenuItem(
                                        child: Padding(
                                          padding: EdgeInsets.all(
                                            7.2,
                                          ),
                                          child: Text(Utils().nullSafeString(value!.CenterName)),
                                        ),
                                        value: value,
                                      );
                                    },
                                  ).toList(),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 18.3,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 14.4, right: 14.4),
                            child: Text(
                              "User Id",
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 14.4, right: 14.4),
                            child: Column(
                              children: [
                                TextField(
                                  onChanged: (value) {
                                    setState(() {
                                      callBackFilter = true;
                                    });
                                  },
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.number,
                                  focusNode: _focusNodeUserId,
                                  controller: _userId,
                                  decoration: InputDecoration(
                                    hintText: "User Id",
                                    suffixIcon: (userIdError == true)
                                        ? Padding(
                                            padding: EdgeInsets.only(left: 28.8),
                                            child: Icon(
                                              Icons.warning_amber_outlined,
                                              color: Colors.red,
                                              size: 18,
                                            ),
                                          )
                                        : SizedBox(),
                                  ),
                                ),
                                (userIdError == true)
                                    ? Padding(
                                        padding: EdgeInsets.only(bottom: 7.2),
                                        child: Row(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(7.2),
                                                color: Color(0x1FEB5757),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(3.6),
                                                child: Text(
                                                  "Please enter User Id!",
                                                  style: TextStyle(color: Color(0xffEB5757), fontSize: 13.68),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : SizedBox(),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 18.3,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 14.4),
                            child: Text(
                              "User Group",
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Divider(
                            thickness: 1,
                            height: 29.28,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 14.4, right: 14.4),
                            child: Container(
                              decoration:
                                  BoxDecoration(color: Color(0xffF2F2F2), borderRadius: BorderRadius.circular(3.6)),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<MKSTAGroupListModel>(
                                  hint: Text('  Choose User Group'),
                                  itemHeight: null,
                                  isExpanded: true,
                                  style: TextStyle(fontSize: 14.4, color: Colors.black),
                                  value: _selectedUserGroup,
                                  icon: Icon(
                                    Icons.keyboard_arrow_down,
                                    size: 21.6,
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedUserGroup = value!;
                                      callBackFilter = true;

                                      _subGroupItems = [];
                                      _selectedSubGroup = null;

                                      //FOR GET USER GROUP WISE SUB-GROUPS
                                      BlocProvider.of<ManageNiyamReportBloc>(context).add(
                                        ManageNiyamReportEvent.userGroupWiseSubGroup(
                                          context,
                                          Utils().nullSafeString(_selectedCenter!.id.toString()),
                                          Utils().nullSafeString(_selectedUserGroup!.wingName),
                                          Utils().nullSafeString(
                                            _selectedUserGroup!.group_name,
                                          ),
                                        ),
                                      );
                                    });
                                  },
                                  items: _userGroupItems!.map((value) {
                                    return DropdownMenuItem(
                                      child: Padding(
                                        padding: EdgeInsets.all(
                                          7.2,
                                        ),
                                        child: Text(Utils().nullSafeString(value!.group_name)),
                                      ),
                                      value: value,
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 18.3,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 14.4),
                            child: Text(
                              "Sub Group",
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Divider(
                            thickness: 1,
                            height: 29.28,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 14.4, right: 14.4),
                            child: Container(
                              decoration:
                                  BoxDecoration(color: Color(0xffF2F2F2), borderRadius: BorderRadius.circular(3.6)),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  hint: Text('  Choose Sub Group'),
                                  itemHeight: null,
                                  isExpanded: true,
                                  style: TextStyle(fontSize: 14.4, color: Colors.black),
                                  value: _selectedSubGroup == null ? null : _selectedSubGroup,
                                  icon: Icon(
                                    Icons.keyboard_arrow_down,
                                    size: 21.6,
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      callBackFilter = true;
                                      _selectedSubGroup = value;
                                    });
                                  },
                                  items: _subGroupItems!.map((value) {
                                    return DropdownMenuItem(
                                      child: Padding(
                                        padding: EdgeInsets.all(
                                          7.2,
                                        ),
                                        child: Text(Utils().nullSafeString(value)),
                                      ),
                                      value: value,
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 18.3,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 14.4),
                            child: Text(
                              "School Year",
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Divider(
                            thickness: 1,
                            height: 29.28,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 14.4, right: 14.4),
                            child: Container(
                              decoration:
                                  BoxDecoration(color: Color(0xffF2F2F2), borderRadius: BorderRadius.circular(3.6)),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<MKSTASchoolListModel>(
                                  hint: Text('  Choose School Year'),
                                  itemHeight: null,
                                  isExpanded: true,
                                  style: TextStyle(fontSize: 14.4, color: Colors.black),
                                  value: _selectedSchoolYear == null ? null : _selectedSchoolYear,
                                  icon: Icon(
                                    Icons.keyboard_arrow_down,
                                    size: 21.6,
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      callBackFilter = true;
                                      _selectedSchoolYear = value;
                                    });
                                  },
                                  items: _schoolYearItems!.map((value) {
                                    return DropdownMenuItem(
                                      child: Padding(
                                        padding: EdgeInsets.all(
                                          7.2,
                                        ),
                                        child: Text(Utils().nullSafeString(value!.school_display_name)),
                                      ),
                                      value: value,
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 18.3,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 14.4, right: 14.4),
                            child: Text(
                              "First Name",
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 14.4, right: 14.4),
                            child: Column(
                              children: [
                                TextField(
                                  onChanged: (value) {
                                    setState(() {
                                      callBackFilter = true;
                                    });
                                  },
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.text,
                                  focusNode: _focusNodeFirstName,
                                  controller: _firstName,
                                  decoration: InputDecoration(
                                    hintText: "First Name",
                                    suffixIcon: (firstNameError == true)
                                        ? Padding(
                                            padding: EdgeInsets.only(left: 28.8),
                                            child: Icon(
                                              Icons.warning_amber_outlined,
                                              color: Colors.red,
                                              size: 18,
                                            ),
                                          )
                                        : SizedBox(),
                                  ),
                                ),
                                (firstNameError == true)
                                    ? Padding(
                                        padding: EdgeInsets.only(bottom: 7.2),
                                        child: Row(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(7.2),
                                                color: Color(0x1FEB5757),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(3.6),
                                                child: Text(
                                                  "Please enter First Name!",
                                                  style: TextStyle(color: Color(0xffEB5757), fontSize: 13.68),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : SizedBox(),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 18.3,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 14.4, right: 14.4),
                            child: Text(
                              "Middle Name",
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 14.4, right: 14.4),
                            child: Column(
                              children: [
                                TextField(
                                  onChanged: (value) {
                                    setState(() {
                                      /*(value.isEmpty)
                                    ? ReportTypeError = true
                                    : ReportTypeError = false;*/
                                      callBackFilter = true;
                                    });
                                  },
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.text,
                                  focusNode: _focusNodeMiddleName,
                                  controller: _middleName,
                                  decoration: InputDecoration(
                                    hintText: "Middle Name",
                                    suffixIcon: (middleNameError == true)
                                        ? Padding(
                                            padding: EdgeInsets.only(left: 28.8),
                                            child: Icon(
                                              Icons.warning_amber_outlined,
                                              color: Colors.red,
                                              size: 18,
                                            ),
                                          )
                                        : SizedBox(),
                                  ),
                                ),
                                (middleNameError == true)
                                    ? Padding(
                                        padding: EdgeInsets.only(bottom: 7.2),
                                        child: Row(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(7.2),
                                                color: Color(0x1FEB5757),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(3.6),
                                                child: Text(
                                                  "Please enter Middle Name!",
                                                  style: TextStyle(color: Color(0xffEB5757), fontSize: 13.68),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : SizedBox(),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 18.3,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 14.4, right: 14.4),
                            child: Text(
                              "Last Name",
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 14.4, right: 14.4),
                            child: Column(
                              children: [
                                TextField(
                                  onChanged: (value) {
                                    setState(() {
                                      /*(value.isEmpty)
                                    ? ReportTypeError = true
                                    : ReportTypeError = false;*/
                                      callBackFilter = true;
                                    });
                                  },
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.text,
                                  focusNode: _focusNodeLastName,
                                  controller: _lastName,
                                  decoration: InputDecoration(
                                    hintText: "Last Name",
                                    suffixIcon: (lastNameError == true)
                                        ? Padding(
                                            padding: EdgeInsets.only(left: 28.8),
                                            child: Icon(
                                              Icons.warning_amber_outlined,
                                              color: Colors.red,
                                              size: 18,
                                            ),
                                          )
                                        : SizedBox(),
                                  ),
                                ),
                                (lastNameError == true)
                                    ? Padding(
                                        padding: EdgeInsets.only(bottom: 7.2),
                                        child: Row(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(7.2),
                                                color: Color(0x1FEB5757),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(3.6),
                                                child: Text(
                                                  "Please enter Last Name!",
                                                  style: TextStyle(color: Color(0xffEB5757), fontSize: 13.68),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : SizedBox(),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 18.3,
                          ),
                          Padding(padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom)),
                        ]),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ));
  }
}
