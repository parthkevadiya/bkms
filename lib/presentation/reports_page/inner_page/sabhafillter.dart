import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/media_query/responsive.dart';
import 'package:flutter_app/presentation/bloc/params_bloc.dart';
import 'package:flutter_app/presentation/bloc/params_event.dart';
import 'package:flutter_app/presentation/bloc/params_state.dart';
import 'package:flutter_app/presentation/reports_page/bloc/report_bloc.dart';
import 'package:flutter_app/utils/constant.dart';
import 'package:flutter_app/utils/util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Bloc/sabha_report_bloc.dart';
import '../report_model.dart';

class SabhaFilter extends StatefulWidget {
  bool isFiltered;
  String searchText;
  final Function(
    bool isFiltered,
  ) onSelectFilter;
  SabhaFilter(this.searchText, {Key? key, this.isFiltered = false, required this.onSelectFilter}) : super(key: key);

  @override
  _SabhaFilterState createState() => _SabhaFilterState();
}

class _SabhaFilterState extends State<SabhaFilter> {
  List<RegionsModel?>? _regionItems = [];
  RegionsModel? _selectedRegion;

  List<CentersModel?>? _centerItems = [];
  List<CentersModel?>? _regionWiseCenters = [];
  CentersModel? _selectedCenter;

  List<WingsModel?>? _wingItems = [];
  WingsModel? _selectedWing;

  List<ReportStatusModel?>? _reportStatusItems = [];
  ReportStatusModel? _selectedReportStatus;

  List<int?>? _yearItems = [];
  int? _selectedYear;

  List<String?>? _sabhaWeekItems = [];
  String? _selectedSabhaWeek;

  String strRegion = "";
  String strCenter = "";
  String strWing = "";
  String strReportStatus = "";
  String strYear = "";
  String strSabhaWeek = "";
  int pagekey = 1;
  static const _pageSize = 50;
  bool _isLoading = false;

  void _showLoadingIndicator() {
    setState(() {
      _isLoading = true;
    });
  }

  void _hideLoadingIndicator() {
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();

    final paramsBloc = BlocProvider.of<ParamsBloc>(context).state;
    if (paramsBloc is SabhaReportFiltersState) {
      strRegion = paramsBloc.strFilterRegion;
      strCenter = paramsBloc.strFilterCenter;
      strWing = paramsBloc.strFilterWing;
      strReportStatus = paramsBloc.strFilterReportStatus;
      strYear = paramsBloc.strFilterYear;
      strSabhaWeek = paramsBloc.strFilterSabhaWeek;
    }
  }

  @override
  Widget build(BuildContext context) {
    //FOR FILL DATA IN DROPDOWN AND DISPLAY SELECTED VALUES
    BlocProvider.of<SabhaReportBloc>(context).state.maybeWhen(
        loadSabhaReports: (reportModel, l) {
          if (reportModel != null) {
            _regionItems = reportModel.sabha_filter!.regions;
            if ((_regionItems != null && _regionItems!.length > 0) &&
                Utils().nullSafeString(reportModel.roleType) != Constant.rtSiteAdmin) {
              final regionIndex = _regionItems!.indexWhere((element) =>
                  element!.id.toString() == Utils().nullSafeString(reportModel.sabha_filter!.user_region_id));
              if (regionIndex >= 0) {
                _selectedRegion = _regionItems![regionIndex]!;
              }
            }

            if (Utils().nullSafeString(strRegion).isNotEmpty) {
              if ((_regionItems != null && _regionItems!.length > 0)) {
                final regionIndex =
                    _regionItems!.indexWhere((element) => element!.id.toString() == Utils().nullSafeString(strRegion));
                if (regionIndex >= 0) {
                  _selectedRegion = _regionItems![regionIndex]!;
                }
              }
            }

            _centerItems = reportModel.sabha_filter!.centers;
            if (_selectedRegion != null) {
              //FOR FILL REGION WISE CENTERS
              _regionWiseCenters = [];
              _selectedCenter = null;

              if (_centerItems != null) {
                for (int v = 0; v < _centerItems!.length; v++) {
                  if (_selectedRegion!.id == int.parse(_centerItems![v]!.RegionId)) {
                    _regionWiseCenters!.add(_centerItems![v]!);
                  }
                }

                if ((_regionWiseCenters != null && _regionWiseCenters!.length > 0) &&
                    Utils().nullSafeString(reportModel.roleType) != Constant.rtSiteAdmin) {
                  final centerIndex = _regionWiseCenters!.indexWhere((element) =>
                      element!.id.toString() == Utils().nullSafeString(reportModel.sabha_filter!.user_center_id));
                  if (centerIndex >= 0) {
                    _selectedCenter = _regionWiseCenters![centerIndex]!;
                  }
                }

                if (Utils().nullSafeString(strCenter).isNotEmpty) {
                  if ((_regionWiseCenters != null && _regionWiseCenters!.length > 0)) {
                    final centerIndex = _regionWiseCenters!
                        .indexWhere((element) => element!.id.toString() == Utils().nullSafeString(strCenter));
                    if (centerIndex >= 0) {
                      _selectedCenter = _regionWiseCenters![centerIndex]!;
                    }
                  }
                }
              }
            }

            _wingItems = reportModel.sabha_filter!.wings;
            if ((_wingItems != null && _wingItems!.length > 0) &&
                Utils().nullSafeString(reportModel.roleType) != Constant.rtSiteAdmin) {
              final wingIndex = _wingItems!
                  .indexWhere((element) => element!.id == Utils().nullSafeInt(reportModel.sabha_filter!.user_wings));
              if (wingIndex >= 0) {
                _selectedWing = _wingItems![wingIndex]!;
              }
            }
            if (Utils().nullSafeString(strWing).isNotEmpty) {
              if ((_wingItems != null && _wingItems!.length > 0)) {
                final wingIndex =
                    _wingItems!.indexWhere((element) => element!.id.toString() == Utils().nullSafeString(strWing));
                if (wingIndex >= 0) {
                  _selectedWing = _wingItems![wingIndex]!;
                }
              }
            }

            _reportStatusItems = reportModel.sabha_filter!.report_status;
            if (Utils().nullSafeString(strReportStatus).isNotEmpty) {
              if ((_reportStatusItems != null && _reportStatusItems!.length > 0)) {
                final reportStatusIndex = _reportStatusItems!
                    .indexWhere((element) => element!.id.toString() == Utils().nullSafeString(strReportStatus));
                if (reportStatusIndex >= 0) {
                  _selectedReportStatus = _reportStatusItems![reportStatusIndex]!;
                }
              }
            }

            _yearItems = reportModel.sabha_filter!.years;
            if (_yearItems != null && _yearItems!.length > 0) {
              final yearIndex = _yearItems!
                  .indexWhere((element) => Utils().nullSafeInt(element).toString() == Utils().getCurrentDate("yyyy"));
              if (yearIndex >= 0) {
                _selectedYear = _yearItems![yearIndex]!;
              }
            }
            if (Utils().nullSafeString(strYear).isNotEmpty) {
              if (_yearItems != null && _yearItems!.length > 0) {
                final yearIndex = _yearItems!.indexWhere(
                    (element) => Utils().nullSafeInt(element).toString() == Utils().nullSafeString(strYear));
                if (yearIndex >= 0) {
                  _selectedYear = _yearItems![yearIndex]!;
                }
              }
            }

            _sabhaWeekItems = reportModel.sabha_filter!.sabha_week;
            if (_sabhaWeekItems != null && _sabhaWeekItems!.length > 0) {
              final sabhaWeekIndex = _sabhaWeekItems!.indexWhere((element) =>
                  Utils().nullSafeString(element) == Utils().nullSafeString(reportModel.sabha_filter!.selected_week));
              if (sabhaWeekIndex >= 0) {
                _selectedSabhaWeek = _sabhaWeekItems![sabhaWeekIndex]!;
              }
            }
            if (Utils().nullSafeString(strSabhaWeek).isNotEmpty) {
              if (_sabhaWeekItems != null && _sabhaWeekItems!.length > 0) {
                final sabhaWeekIndex = _sabhaWeekItems!
                    .indexWhere((element) => Utils().nullSafeString(element) == Utils().nullSafeString(strSabhaWeek));
                if (sabhaWeekIndex >= 0) {
                  _selectedSabhaWeek = _sabhaWeekItems![sabhaWeekIndex]!;
                }
              }
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
                      int isForFilter() {
                        if (strRegion.isEmpty) {
                          return 1;
                        }

                        if (strCenter.isEmpty) {
                          return 1;
                        }

                        if (strWing.isEmpty) {
                          return 1;
                        }

                        if (strReportStatus.isEmpty) {
                          return 1;
                        }

                        if (strYear.isEmpty) {
                          return 1;
                        }

                        if (strSabhaWeek.isEmpty) {
                          return 1;
                        }

                        return 0;
                      }

                      if (widget.isFiltered) {
                        if (widget.searchText.isNotEmpty) {
                          BlocProvider.of<SabhaReportBloc>(context).add(SabhaReportEvent.loadSabhaReports(
                              context,
                              pagekey,
                              _pageSize,
                              isForFilter(),
                              _selectedRegion != null ? Utils().nullSafeString(_selectedRegion!.id.toString()) : "",
                              _selectedCenter != null ? Utils().nullSafeString(_selectedCenter!.id.toString()) : "",
                              _selectedWing != null ? Utils().nullSafeString(_selectedWing!.id.toString()) : "",
                              _selectedYear != null ? Utils().nullSafeString(_selectedYear!.toString()) : "",
                              _selectedSabhaWeek != null ? Utils().nullSafeString(_selectedSabhaWeek) : "",
                              _selectedReportStatus != null
                                  ? Utils().nullSafeString(_selectedReportStatus!.id.toString())
                                  : "",
                              widget.searchText));
                        } else {
                          BlocProvider.of<SabhaReportBloc>(context).add(SabhaReportEvent.loadSabhaReports(
                              context,
                              pagekey,
                              _pageSize,
                              isForFilter(),
                              _selectedRegion != null ? Utils().nullSafeString(_selectedRegion!.id.toString()) : "",
                              _selectedCenter != null ? Utils().nullSafeString(_selectedCenter!.id.toString()) : "",
                              _selectedWing != null ? Utils().nullSafeString(_selectedWing!.id.toString()) : "",
                              _selectedYear != null ? Utils().nullSafeString(_selectedYear!.toString()) : "",
                              _selectedSabhaWeek != null ? Utils().nullSafeString(_selectedSabhaWeek) : "",
                              _selectedReportStatus != null
                                  ? Utils().nullSafeString(_selectedReportStatus!.id.toString())
                                  : "",
                              ""));
                        }
                      }
                      //FOR ADD SELECTED SABHA REPORTS FILTERS
                      if (widget.isFiltered) {
                        BlocProvider.of<ParamsBloc>(context).add(SetSabhaReportFiltersEvent(
                            _selectedRegion != null ? Utils().nullSafeString(_selectedRegion!.id.toString()) : "",
                            _selectedCenter != null ? Utils().nullSafeString(_selectedCenter!.id.toString()) : "",
                            _selectedWing != null ? Utils().nullSafeString(_selectedWing!.id.toString()) : "",
                            _selectedReportStatus != null
                                ? Utils().nullSafeString(_selectedReportStatus!.id.toString())
                                : "",
                            _selectedYear != null ? Utils().nullSafeString(_selectedYear!.toString()) : "",
                            _selectedSabhaWeek != null ? Utils().nullSafeString(_selectedSabhaWeek) : ""));
                        Navigator.pop(context);
                      } else {
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
                  "Sabha Report Filter",
                  style: TextStyle(fontSize: 25.2, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: SafeArea(
                  top: false,
                  left: false,
                  right: false,
                  child: SingleChildScrollView(
                    child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                      SizedBox(
                        height: 18.3,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 14.4),
                        child: Text(
                          "Sabha Week",
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
                              menuMaxHeight: 600,
                              hint: Text('  Choose Sabha Week'),
                              itemHeight: null,
                              isExpanded: true,
                              style: TextStyle(fontSize: 14.4, color: Colors.black),
                              value: _selectedSabhaWeek,
                              icon: Icon(
                                Icons.keyboard_arrow_down,
                                size: 21.6,
                              ),
                              onChanged: (value) {
                                setState(() {
                                  widget.isFiltered = true;
                                  _selectedSabhaWeek = value!;
                                });
                              },
                              items: _sabhaWeekItems!.map((value) {
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
                          decoration: BoxDecoration(color: Color(0xffF2F2F2), borderRadius: BorderRadius.circular(3.6)),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<RegionsModel>(
                              menuMaxHeight: 600,
                              hint: Text('  Choose Region'),
                              isExpanded: true,
                              itemHeight: null,
                              value: _selectedRegion == null ? null : _selectedRegion,
                              icon: Icon(
                                Icons.keyboard_arrow_down,
                                size: 21.6,
                              ),
                              style: TextStyle(fontSize: 14.4, color: Colors.black),
                              onChanged: (value) {
                                setState(() {
                                  widget.isFiltered = true;
                                  _selectedRegion = value!;

                                  //FOR FILL REGION WISE CENTERS
                                  _regionWiseCenters = [];
                                  _selectedCenter = null;

                                  if (_centerItems != null) {
                                    for (int v = 0; v < _centerItems!.length; v++) {
                                      if (_selectedRegion!.id == int.parse(_centerItems![v]!.RegionId)) {
                                        _regionWiseCenters!.add(_centerItems![v]!);
                                      }
                                    }
                                  }
                                });
                              },
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
                          "Center",
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
                            child: DropdownButton<CentersModel>(
                              menuMaxHeight: 250,
                              hint: Text('  Choose Center'),
                              isExpanded: true,
                              itemHeight: null,
                              value: _selectedCenter == null ? null : _selectedCenter,
                              icon: Icon(
                                Icons.keyboard_arrow_down,
                                size: 21.6,
                              ),
                              style: TextStyle(fontSize: 14.4, color: Colors.black),
                              onChanged: (value) {
                                setState(() {
                                  widget.isFiltered = true;
                                  _selectedCenter = value!;
                                });
                              },
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
                          decoration: BoxDecoration(color: Color(0xffF2F2F2), borderRadius: BorderRadius.circular(3.6)),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<WingsModel>(
                              hint: Text('  Choose Wing'),
                              isExpanded: true,
                              itemHeight: null,
                              style: TextStyle(fontSize: 14.4, color: Colors.black),
                              value: _selectedWing == null ? null : _selectedWing,
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
                          "Report Status",
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
                            child: DropdownButton<ReportStatusModel>(
                              hint: Text('  Choose Report Status'),
                              isExpanded: true,
                              itemHeight: null,
                              style: TextStyle(fontSize: 14.4, color: Colors.black),
                              value: _selectedReportStatus == null ? null : _selectedReportStatus,
                              icon: Icon(
                                Icons.keyboard_arrow_down,
                                size: 21.6,
                              ),
                              onChanged: (value) {
                                setState(
                                  () {
                                    widget.isFiltered = true;
                                    _selectedReportStatus = value!;
                                  },
                                );
                              },
                              items: _reportStatusItems!.map(
                                (value) {
                                  return DropdownMenuItem(
                                    child: Padding(
                                      padding: EdgeInsets.all(
                                        7.2,
                                      ),
                                      child: Text(Utils().nullSafeString(value!.value)),
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
                          "Year",
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
                            child: DropdownButton<int>(
                              hint: Text('  Choose Year'),
                              itemHeight: null,
                              isExpanded: true,
                              style: TextStyle(fontSize: 14.4, color: Colors.black),
                              value: _selectedYear,
                              icon: Icon(
                                Icons.keyboard_arrow_down,
                                size: 21.6,
                              ),
                              onChanged: (value) {
                                setState(() {
                                  widget.isFiltered = true;
                                  _selectedYear = value!;
                                });
                              },
                              items: _yearItems!.map((value) {
                                return DropdownMenuItem(
                                  child: Padding(
                                    padding: EdgeInsets.all(
                                      7.2,
                                    ),
                                    child: Text(Utils().nullSafeInt(value).toString()),
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
