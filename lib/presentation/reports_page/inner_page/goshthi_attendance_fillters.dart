import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/media_query/responsive.dart';
import 'package:flutter_app/models/goshthi_report_attendance_model.dart';
import 'package:flutter_app/presentation/bloc/params_bloc.dart';
import 'package:flutter_app/presentation/bloc/params_event.dart';
import 'package:flutter_app/presentation/bloc/params_state.dart';
import 'package:flutter_app/presentation/reports_page/bloc/report_bloc.dart';
import 'package:flutter_app/utils/constant.dart';
import 'package:flutter_app/utils/util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Bloc/goshthi_report_attendance_bloc.dart';

class GoshthiAttendanceFilter extends StatefulWidget {
  final String strWing;
  final bool isAttendanceHasToVisible;
  final String searchText;
  bool isFiltered;
  String karyakar_goshti_sabha_id;
  final Function(
    bool isFiltered,
  ) onSelectFilter;
  GoshthiAttendanceFilter(this.strWing, this.isAttendanceHasToVisible, this.karyakar_goshti_sabha_id, this.searchText,
      {Key? key, this.isFiltered = false, required this.onSelectFilter})
      : super(key: key);

  @override
  _GoshthiAttendanceFilterState createState() => _GoshthiAttendanceFilterState();
}

class _GoshthiAttendanceFilterState extends State<GoshthiAttendanceFilter> {
  List<GoshthiRegionsModel?>? _regionItems = [];
  GoshthiRegionsModel? _selectedRegion;

  List<GoshthiCentersModel?>? _centerItems = [];
  List<GoshthiCentersModel?>? _regionWiseCenters = [];
  GoshthiCentersModel? _selectedCenter;

  List<GoshthiGoshthiWingModel?>? _wingItems = [];
  GoshthiGoshthiWingModel? _selectedWing;

  List<String?>? _genderItems = [];
  String? _selectedGender;

  String _strGoshthiMonth = "";

  DateTime _goshthiDate = DateTime.now();
  String _strGoshthiDate = "";

  String _strSelectedUserWing = "";
  String _strSelectedGoshthiDate = "";
  String _strSelectedGoshthiRegion = "";
  String _strSelectedGoshthiCenter = "";
  String _strSelectedGender = "";
  String _strSelectedGoshthiMonth = "";

  Future<void> _selectGoshthiDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context, initialDate: _goshthiDate, firstDate: DateTime(1900, 1), lastDate: DateTime(3000, 1));
    if (picked != null && picked != _goshthiDate)
      setState(() {
        _goshthiDate = picked;
        widget.isFiltered = true;

        _strGoshthiDate = Utils().changeDateFormat(_goshthiDate, Constant.defaultDateFormatWeb);
      });
  }

  bool _isLoading = false;

  void _showLoadingIndicator() {
    setState(() {
      _isLoading = true;
    });
  }

  @override
  void initState() {
    super.initState();

    final paramsBloc = BlocProvider.of<ParamsBloc>(context).state;
    if (paramsBloc is GoshthiAttendanceFiltersState) {
      _strSelectedUserWing = paramsBloc.strSelectedUserWing;

      _strSelectedGoshthiDate = Utils().nullSafeWithDefaultString(paramsBloc.strSelectedGoshthiDate,
          Utils().getCurrentDate(Utils().nullSafeString(Constant.defaultDateFormatWeb)));
      _strSelectedGoshthiRegion = paramsBloc.strSelectedGoshthiRegion;
      _strSelectedGoshthiCenter = paramsBloc.strSelectedGoshthiCenter;
      _strSelectedGender = paramsBloc.strSelectedGender;
      _strSelectedGoshthiMonth = paramsBloc.strSelectedGoshthiMonth;
    }
  }

  @override
  Widget build(BuildContext context) {
    //FOR FILL DATA IN DROPDOWN AND DISPLAY SELECTED VALUES
    BlocProvider.of<GoshthiReportAttendanceBloc>(context).state.maybeWhen(
        goshthiReportAttendance: (goshthiReportAttendanceModel, l) {
          if (goshthiReportAttendanceModel != null) {
            _regionItems = goshthiReportAttendanceModel.filter_data!.regions;
            if ((_regionItems != null && _regionItems!.length > 0)) {
              final regionIndex = _regionItems!.indexWhere((element) =>
                  element!.id.toString() == Utils().nullSafeString(goshthiReportAttendanceModel.filter_data!.myregion));
              if (regionIndex >= 0) {
                _selectedRegion = _regionItems![regionIndex]!;
              }
            }

            _centerItems = goshthiReportAttendanceModel.filter_data!.centers;
            if (_selectedRegion != null) {
              //FOR FILL REGION WISE CENTERS
              _regionWiseCenters = [];
              _selectedCenter = null;

              if (_centerItems != null) {
                for (int v = 0; v < _centerItems!.length; v++) {
                  if (_selectedRegion!.id == _centerItems![v]!.RegionId) {
                    _regionWiseCenters!.add(_centerItems![v]!);
                  }
                }

                if ((_regionWiseCenters != null && _regionWiseCenters!.length > 0)) {
                  final centerIndex = _regionWiseCenters!.indexWhere((element) =>
                      element!.id.toString() ==
                      Utils().nullSafeString(goshthiReportAttendanceModel.filter_data!.mycenter));
                  if (centerIndex >= 0) {
                    _selectedCenter = _regionWiseCenters![centerIndex]!;
                  }
                }
              }
            }

            _genderItems = [];
            _genderItems!.add("Male");
            _genderItems!.add("Female");
            if ((_genderItems != null && _genderItems!.length > 0)) {
              final genderIndex = _genderItems!.indexWhere((element) =>
                  element!.toLowerCase() ==
                  Utils().nullSafeString(goshthiReportAttendanceModel.filter_data!.Gender).toLowerCase());
              if (genderIndex >= 0) {
                _selectedGender = _genderItems![genderIndex]!;
              }
            }

            _strGoshthiMonth = Utils().nullSafeString(goshthiReportAttendanceModel.filter_data!.goshthi_month);

            _wingItems = goshthiReportAttendanceModel.filter_data!.goshthi_wing;
            if ((_wingItems != null && _wingItems!.length > 0)) {
              final wingIndex = _wingItems!.indexWhere((element) => element!.id == widget.strWing);
              if (wingIndex >= 0) {
                _selectedWing = _wingItems![wingIndex]!;
              }
            }

            if (Utils().nullSafeString(_strSelectedUserWing).isNotEmpty) {
              if ((_wingItems != null && _wingItems!.length > 0)) {
                final wingIndex = _wingItems!
                    .indexWhere((element) => element!.id.toString() == Utils().nullSafeString(_strSelectedUserWing));
                if (wingIndex >= 0) {
                  _selectedWing = _wingItems![wingIndex]!;
                }
              }
            }

            if (Utils().nullSafeString(_strSelectedGoshthiDate).isNotEmpty) {
              _goshthiDate = Utils().stringToDateTime(_strSelectedGoshthiDate, Constant.defaultDateFormatWeb);
              _strGoshthiDate = Utils().changeDateFormat(_goshthiDate, Constant.defaultDateFormatWeb);
            }
          }
        },
        orElse: () {});

    return StatefulBuilder(
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
                      if (widget.isFiltered) {
                        widget.onSelectFilter(
                          widget.isFiltered,
                        );
                      }
                      if (widget.isFiltered) {
                        if (widget.searchText.isNotEmpty) {
                          _showLoadingIndicator();
                          BlocProvider.of<GoshthiReportAttendanceBloc>(context)
                              .add(GoshthiReportAttendanceEvent.goshthiReportAttendance(
                            context,
                            widget.karyakar_goshti_sabha_id,
                            1.toString(),
                            50.toString(),
                            widget.searchText,
                            _selectedWing != null ? Utils().nullSafeString(_selectedWing!.id.toString()) : "",
                            _selectedCenter != null ? Utils().nullSafeString(_selectedCenter!.id) : "",
                            _selectedRegion != null ? Utils().nullSafeString(_selectedRegion!.id) : "",
                            "2",
                            _selectedGender != null ? Utils().nullSafeString(_selectedGender) : "",
                          ));
                          BlocProvider.of<ParamsBloc>(context).add(GoshthiAttendanceFiltersEvent(
                            _selectedWing != null ? Utils().nullSafeString(_selectedWing!.id.toString()) : "",
                            _strGoshthiDate,
                            _selectedRegion != null ? Utils().nullSafeString(_selectedRegion!.id) : "",
                            _selectedCenter != null ? Utils().nullSafeString(_selectedCenter!.id) : "",
                            _selectedGender != null ? Utils().nullSafeString(_selectedGender) : "",
                            _strGoshthiMonth,
                          ));
                          Navigator.pop(context);
                        } else {
                          _showLoadingIndicator();
                          BlocProvider.of<GoshthiReportAttendanceBloc>(context)
                              .add(GoshthiReportAttendanceEvent.goshthiReportAttendance(
                            context,
                            widget.karyakar_goshti_sabha_id,
                            1.toString(),
                            50.toString(),
                            "",
                            _selectedWing != null ? Utils().nullSafeString(_selectedWing!.id.toString()) : "",
                            _selectedCenter != null ? Utils().nullSafeString(_selectedCenter!.id) : "",
                            _selectedRegion != null ? Utils().nullSafeString(_selectedRegion!.id) : "",
                            "2",
                            _selectedGender != null ? Utils().nullSafeString(_selectedGender) : "",
                          ));
                          BlocProvider.of<ParamsBloc>(context).add(GoshthiAttendanceFiltersEvent(
                            _selectedWing != null ? Utils().nullSafeString(_selectedWing!.id.toString()) : "",
                            _strGoshthiDate,
                            _selectedRegion != null ? Utils().nullSafeString(_selectedRegion!.id) : "",
                            _selectedCenter != null ? Utils().nullSafeString(_selectedCenter!.id) : "",
                            _selectedGender != null ? Utils().nullSafeString(_selectedGender) : "",
                            _strGoshthiMonth,
                          ));
                          Navigator.pop(context);
                        }
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
                  "Goshthi Attendance Filter",
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
                        padding: EdgeInsets.only(top: 7.2, left: 18, right: 18),
                        child: Text(
                          "User Wing",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 5.4,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 18, right: 18),
                        child: Container(
                          decoration: BoxDecoration(color: Color(0xffF2F2F2), borderRadius: BorderRadius.circular(3.6)),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<GoshthiGoshthiWingModel>(
                              hint: Text('  Choose Wing'),
                              isExpanded: true,
                              itemHeight: null,
                              style: TextStyle(fontSize: 14.4, color: Colors.black),
                              value: _selectedWing,
                              icon: Icon(
                                Icons.keyboard_arrow_down,
                                size: 21.6,
                              ),
                              onChanged: (value) {
                                setState(() {
                                  widget.isFiltered = true;
                                  _selectedWing = value!;
                                });
                              },
                              items: _wingItems!.map(
                                (value) {
                                  return DropdownMenuItem(
                                    child: Padding(
                                      padding: EdgeInsets.all(
                                        5.4,
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
                        padding: EdgeInsets.only(top: 7.2, left: 18, right: 18),
                        child: Text(
                          "Goshthi Date",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 18, right: 18),
                        child: RaisedButton(
                          onPressed:
                              () => /*widget.isAttendanceHasToVisible
                            ? _selectGoshthiDate(context)
                            :*/
                                  null,
                          child: Text(
                            Utils().changeDateFormat(_goshthiDate, "dd MMMM yyyy"),
                            style: TextStyle(
                                color: widget.isAttendanceHasToVisible ? Color(0xFF4F4F4F) : Color(0xFF898989)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 18.3,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 14.4),
                        child: Text(
                          "Goshthi Region",
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
                            child: DropdownButton<GoshthiRegionsModel>(
                              hint: Text('  Choose Region'),
                              isExpanded: true,
                              itemHeight: null,
                              value: _selectedRegion,
                              icon: Icon(
                                Icons.keyboard_arrow_down,
                                size: 21.6,
                              ),
                              style: TextStyle(fontSize: 14.4, color: Colors.black),
                              onChanged:
                                  null /*(value) {
                                setState(() {
                                  _selectedRegion = value!;
                                  widget.isFiltered = true;

                                  //FOR FILL REGION WISE CENTERS
                                  _regionWiseCenters = [];
                                  _selectedCenter = null;

                                  if (_centerItems != null) {
                                    for (int v = 0; v < _centerItems!.length; v++) {
                                      if (_selectedRegion!.id == _centerItems![v]!.RegionId) {
                                        _regionWiseCenters!.add(_centerItems![v]!);
                                      }
                                    }
                                  }
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
                          "Goshthi Center",
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
                            child: DropdownButton<GoshthiCentersModel>(
                              hint: Text('  Choose Center'),
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
                                  widget.isFiltered = true;
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
                          "Gender",
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
                            child: DropdownButton<String>(
                              hint: Text('  Choose Gender'),
                              isExpanded: true,
                              itemHeight: null,
                              style: TextStyle(fontSize: 14.4, color: Colors.black),
                              value: _selectedGender == null ? null : _selectedGender,
                              icon: Icon(
                                Icons.keyboard_arrow_down,
                                size: 21.6,
                              ),
                              onChanged: null,
                              items: _genderItems!.map(
                                (value) {
                                  return DropdownMenuItem(
                                    child: Padding(
                                      padding: EdgeInsets.all(
                                        7.2,
                                      ),
                                      child: Text(Utils().nullSafeString(value)),
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
                    ]),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
