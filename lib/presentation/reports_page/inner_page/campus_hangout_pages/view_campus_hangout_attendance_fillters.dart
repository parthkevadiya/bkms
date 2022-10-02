import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/media_query/responsive.dart';
import 'package:flutter_app/models/campus_hangout_report_details_model.dart';
import 'package:flutter_app/models/region_wise_campus_model.dart';
import 'package:flutter_app/models/submit_campus_hangout_attendance_model.dart';
import 'package:flutter_app/presentation/bloc/params_bloc.dart';
import 'package:flutter_app/presentation/bloc/params_event.dart';
import 'package:flutter_app/presentation/bloc/params_state.dart';
import 'package:flutter_app/presentation/reports_page/bloc/report_bloc.dart';
import 'package:flutter_app/utils/util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VSCHAFilter extends StatefulWidget {
  final CampusHangoutReportDetailsModel? campusHangoutReportDetailsModel;

  const VSCHAFilter(this.campusHangoutReportDetailsModel, {Key? key}) : super(key: key);

  @override
  _VSCHAFilterState createState() => _VSCHAFilterState();
}

class _VSCHAFilterState extends State<VSCHAFilter> {
  List<VSchoolListModel?>? _schoolYearItems = [];
  VSchoolListModel? _selectedSchoolYear;

  String _strFSchoolYear = "";
  String _strFFirstName = "";
  String _strFMiddleName = "";
  String _strFLastName = "";
  String _strFUserId = "";

  TextEditingController _firstName = TextEditingController();
  late FocusNode _focusNodeFirstName;
  bool? firstNameError;

  TextEditingController _middleName = TextEditingController();
  late FocusNode _focusNodeMiddleName;
  bool? middleNameError;

  TextEditingController _lastName = TextEditingController();
  late FocusNode _focusNodeLastName;
  bool? lastNameError;

  TextEditingController _userId = TextEditingController();
  late FocusNode _focusNodeUserId;
  bool? userIdError;

  @override
  void initState() {
    super.initState();

    _focusNodeFirstName = FocusNode();
    _focusNodeMiddleName = FocusNode();
    _focusNodeLastName = FocusNode();
    _focusNodeUserId = FocusNode();

    final paramsBloc = BlocProvider.of<ParamsBloc>(context).state;
    if (paramsBloc is CampusHangoutAttendanceFiltersState) {
      _strFSchoolYear = paramsBloc.strFSchoolYear;
      _strFFirstName = paramsBloc.strFFirstName;
      _strFMiddleName = paramsBloc.strFMiddleName;
      _strFLastName = paramsBloc.strFLastName;
      _strFUserId = paramsBloc.strFUserId;
    }

    //FOR FILL DATA IN DROPDOWN AND DISPLAY SELECTED VALUES
    if (widget.campusHangoutReportDetailsModel != null) {
      _schoolYearItems = widget.campusHangoutReportDetailsModel!.school_list;

      if (Utils().nullSafeString(_strFSchoolYear).isNotEmpty) {
        if ((_schoolYearItems != null && _schoolYearItems!.length > 0)) {
          final regionIndex = _schoolYearItems!
              .indexWhere((element) => element!.id.toString() == Utils().nullSafeString(_strFSchoolYear));
          if (regionIndex >= 0) {
            _selectedSchoolYear = _schoolYearItems![regionIndex]!;
          }
        }
      }

      if (Utils().nullSafeString(_strFUserId).isNotEmpty) {
        if (_userId.text.toString().isEmpty) {
          _userId.text = _strFUserId;
        }
      }
      if (Utils().nullSafeString(_strFFirstName).isNotEmpty) {
        if (_firstName.text.toString().isEmpty) {
          _firstName.text = _strFFirstName;
        }
      }
      if (Utils().nullSafeString(_strFMiddleName).isNotEmpty) {
        if (_middleName.text.toString().isEmpty) {
          _middleName.text = _strFMiddleName;
        }
      }
      if (Utils().nullSafeString(_strFLastName).isNotEmpty) {
        if (_lastName.text.toString().isEmpty) {
          _lastName.text = _strFLastName;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Container(
            height: 695.4,
            child: SingleChildScrollView(
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
                          BlocProvider.of<ParamsBloc>(context).add(CampusHangoutAttendanceFiltersEvent(
                            _selectedSchoolYear != null
                                ? Utils().nullSafeString(_selectedSchoolYear!.id.toString())
                                : "",
                            _firstName.text.toString(),
                            _middleName.text.toString(),
                            _lastName.text.toString(),
                            _userId.text.toString(),
                          ));
                          Navigator.pop(context);
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
                      "Campus Hangout Attendance Filter",
                      style: TextStyle(fontSize: 25.2, fontWeight: FontWeight.bold),
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
                      decoration: BoxDecoration(color: Color(0xffF2F2F2), borderRadius: BorderRadius.circular(3.6)),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<VSchoolListModel>(
                          hint: Text('  Choose School Year'),
                          isExpanded: true,
                          itemHeight: null,
                          value: _selectedSchoolYear == null ? null : _selectedSchoolYear,
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            size: 21.6,
                          ),
                          style: TextStyle(fontSize: 14.4, color: Colors.black),
                          onChanged: (value) {
                            setState(() {
                              _selectedSchoolYear = value!;
                            });
                          },
                          items: _schoolYearItems!.map(
                            (value) {
                              return DropdownMenuItem(
                                child: Padding(
                                  padding: EdgeInsets.all(
                                    7.2,
                                  ),
                                  child: Text(Utils().nullSafeWithDefaultString(
                                      value!.school_display_name, Utils().nullSafeString(value.school_value))),
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
                              /*(value.isEmpty)
                                  ? ReportTypeError = true
                                  : ReportTypeError = false;*/
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
                              /*(value.isEmpty)
                                  ? ReportTypeError = true
                                  : ReportTypeError = false;*/
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
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
