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

import '../../../Bloc/karyakar_goshthi_report_bloc.dart';
import '../goshthi_report_model.dart';
import '../report_model.dart';

class GoshthiFilter extends StatefulWidget {
  bool isFiltered;
  String searchText;
  final Function(
    bool isFiltered,
  ) onSelectFilter;
  GoshthiFilter(this.searchText, {Key? key, this.isFiltered = false, required this.onSelectFilter}) : super(key: key);

  @override
  _GoshthiFilterState createState() => _GoshthiFilterState();
}

class _GoshthiFilterState extends State<GoshthiFilter> {
  List<RegionItems?>? _regionItems = [];
  RegionItems? _selectedRegion;

  List<CentersItems?>? _centerItems = [];
  List<CentersItems?>? _regionWiseCenters = [];
  CentersItems? _selectedCenter;

  List<ReportCenterItems?>? _reportCenterItems = [];
  ReportCenterItems? _selectedReportCenter;

  List<String?>? _genderItems = [];
  String? _selectedGender;
  bool _isLoading = false;
  int pageKey = 1;
  int _pageSize = 50;

  List<GoshthiMonthItems?>? _monthItems = [];
  GoshthiMonthItems? _selectedMonth;

  List<int?>? _yearItems = [];
  int? _selectedYear;

  String _strSelectedRegion = "";
  String _strSelectedCenter = "";
  String _strSabhaMonth = "";
  String _strSabhaYear = "";
  String _strSabhaGender = "";

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

    if (paramsBloc is GoshthiReportFiltersState) {
      _strSelectedRegion = paramsBloc.strSelectedRegion;
      _strSelectedCenter = paramsBloc.strSelectedCenter;
      _strSabhaMonth = Utils().nullSafeWithDefaultString(paramsBloc.strSabhaMonth, Utils().getCurrentDate("MMMM"));
      _strSabhaYear = Utils().nullSafeWithDefaultString(paramsBloc.strSabhaYear, Utils().getCurrentDate("yyyy"));
      _strSabhaGender = paramsBloc.strSabhaGender;
    }
  }

  @override
  Widget build(BuildContext context) {
    //FOR FILL DATA IN DROPDOWN AND DISPLAY SELECTED VALUES
    BlocProvider.of<KaryakarGoshthiReportBloc>(context).state.maybeWhen(
        loadGoshthiReports: (reportModel, l) {
          if (reportModel != null) {
            _regionItems = reportModel.sabha_goshthi_filter!.regions;
            if ((_regionItems != null && _regionItems!.length > 0) &&
                Utils().nullSafeString(reportModel.roleType) != Constant.rtSiteAdmin) {
              final regionIndex = _regionItems!.indexWhere((element) =>
                  element!.id.toString() == Utils().nullSafeString(reportModel.sabha_goshthi_filter!.user_region_id));
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

            _centerItems = reportModel.sabha_goshthi_filter!.centers;
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
                      element!.id.toString() ==
                      Utils().nullSafeString(reportModel.sabha_goshthi_filter!.user_center_id));
                  if (centerIndex >= 0) {
                    _selectedCenter = _regionWiseCenters![centerIndex]!;
                  }
                }

                if (Utils().nullSafeString(_strSelectedCenter).isNotEmpty) {
                  if ((_regionWiseCenters != null && _regionWiseCenters!.length > 0)) {
                    final centerIndex = _regionWiseCenters!
                        .indexWhere((element) => element!.id.toString() == Utils().nullSafeString(_strSelectedCenter));
                    if (centerIndex >= 0) {
                      _selectedCenter = _regionWiseCenters![centerIndex]!;
                    }
                  }
                }
              }
            }

            _genderItems = reportModel.sabha_goshthi_filter!.gender;
            if (Utils().nullSafeString(_strSabhaGender).isNotEmpty) {
              if ((_genderItems != null && _genderItems!.length > 0)) {
                final wingIndex =
                    _genderItems!.indexWhere((element) => element! == Utils().nullSafeString(_strSabhaGender));
                if (wingIndex >= 0) {
                  _selectedGender = _genderItems![wingIndex]!;
                }
              }
            }

            _monthItems = reportModel.sabha_goshthi_filter!.months;
            if (_monthItems != null && _monthItems!.length > 0) {
              final monthIndex = _monthItems!.indexWhere(
                  (element) => Utils().nullSafeString(element!.name).toString() == Utils().getCurrentDate("MMMM"));
              if (monthIndex >= 0) {
                _selectedMonth = _monthItems![monthIndex]!;
              }
            }
            if (Utils().nullSafeString(_strSabhaMonth).isNotEmpty) {
              if ((_monthItems != null && _monthItems!.length > 0)) {
                final reportStatusIndex =
                    _monthItems!.indexWhere((element) => element!.name == Utils().nullSafeString(_strSabhaMonth));
                if (reportStatusIndex >= 0) {
                  _selectedMonth = _monthItems![reportStatusIndex]!;
                }
              }
            }

            _yearItems = reportModel.sabha_goshthi_filter!.years;
            if (_yearItems != null && _yearItems!.length > 0) {
              final yearIndex = _yearItems!
                  .indexWhere((element) => Utils().nullSafeInt(element).toString() == Utils().getCurrentDate("yyyy"));
              if (yearIndex >= 0) {
                _selectedYear = _yearItems![yearIndex]!;
              }
            }
            if (Utils().nullSafeString(_strSabhaYear).isNotEmpty) {
              if (_yearItems != null && _yearItems!.length > 0) {
                final yearIndex = _yearItems!.indexWhere(
                    (element) => Utils().nullSafeInt(element).toString() == Utils().nullSafeString(_strSabhaYear));
                if (yearIndex >= 0) {
                  _selectedYear = _yearItems![yearIndex]!;
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
                        if (widget.searchText.isNotEmpty) {
                          _showLoadingIndicator();
                          BlocProvider.of<KaryakarGoshthiReportBloc>(context)
                              .add(KaryakarGoshthiReportEvent.loadGoshthiReports(
                            context,
                            pageKey,
                            _pageSize,
                            _selectedCenter != null ? Utils().nullSafeString(_selectedCenter!.id.toString()) : "",
                            _selectedRegion != null ? Utils().nullSafeString(_selectedRegion!.id.toString()) : "",
                            _selectedMonth != null ? Utils().nullSafeString(_selectedMonth!.name) : "",
                            _selectedYear != null ? Utils().nullSafeString(_selectedYear!.toString()) : "",
                            _selectedGender != null ? Utils().nullSafeString(_selectedGender) : "",
                            widget.searchText,
                          ));

                          BlocProvider.of<ParamsBloc>(context).add(GoshthiReportFiltersEvent(
                            _selectedRegion != null ? Utils().nullSafeString(_selectedRegion!.id.toString()) : "",
                            _selectedCenter != null ? Utils().nullSafeString(_selectedCenter!.id.toString()) : "",
                            _selectedMonth != null ? Utils().nullSafeString(_selectedMonth!.name) : "",
                            _selectedYear != null ? Utils().nullSafeString(_selectedYear!.toString()) : "",
                            _selectedGender != null ? Utils().nullSafeString(_selectedGender) : "",
                          ));
                          Navigator.pop(context);
                        } else {
                          BlocProvider.of<KaryakarGoshthiReportBloc>(context)
                              .add(KaryakarGoshthiReportEvent.loadGoshthiReports(
                            context,
                            pageKey,
                            _pageSize,
                            _selectedCenter != null ? Utils().nullSafeString(_selectedCenter!.id.toString()) : "",
                            _selectedRegion != null ? Utils().nullSafeString(_selectedRegion!.id.toString()) : "",
                            _selectedMonth != null ? Utils().nullSafeString(_selectedMonth!.name) : "",
                            _selectedYear != null ? Utils().nullSafeString(_selectedYear!.toString()) : "",
                            _selectedGender != null ? Utils().nullSafeString(_selectedGender) : "",
                            "",
                          ));

                          BlocProvider.of<ParamsBloc>(context).add(GoshthiReportFiltersEvent(
                            _selectedRegion != null ? Utils().nullSafeString(_selectedRegion!.id.toString()) : "",
                            _selectedCenter != null ? Utils().nullSafeString(_selectedCenter!.id.toString()) : "",
                            _selectedMonth != null ? Utils().nullSafeString(_selectedMonth!.name) : "",
                            _selectedYear != null ? Utils().nullSafeString(_selectedYear!.toString()) : "",
                            _selectedGender != null ? Utils().nullSafeString(_selectedGender) : "",
                          ));
                          Navigator.pop(context);
                        }
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
                  "Goshthi Report Filter",
                  style: TextStyle(fontSize: 25.2, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: SafeArea(
                  top: false,
                  right: false,
                  left: false,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
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
                              child: DropdownButton<RegionItems>(
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
                                    _selectedRegion = value!;
                                    widget.isFiltered = true;
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
                            decoration:
                                BoxDecoration(color: Color(0xffF2F2F2), borderRadius: BorderRadius.circular(3.6)),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<CentersItems>(
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
                                    _selectedCenter = value!;
                                    widget.isFiltered = true;
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
                            decoration:
                                BoxDecoration(color: Color(0xffF2F2F2), borderRadius: BorderRadius.circular(3.6)),
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
                                onChanged: (value) {
                                  setState(() {
                                    _selectedGender = value!;
                                    widget.isFiltered = true;
                                  });
                                },
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
                        Padding(
                          padding: EdgeInsets.only(left: 14.4),
                          child: Text(
                            "Months",
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
                              child: DropdownButton<GoshthiMonthItems>(
                                hint: Text('  Choose Month'),
                                isExpanded: true,
                                itemHeight: null,
                                style: TextStyle(fontSize: 14.4, color: Colors.black),
                                value: _selectedMonth == null ? null : _selectedMonth,
                                icon: Icon(
                                  Icons.keyboard_arrow_down,
                                  size: 21.6,
                                ),
                                onChanged: (value) {
                                  setState(
                                    () {
                                      _selectedMonth = value!;
                                      widget.isFiltered = true;
                                    },
                                  );
                                },
                                items: _monthItems!.map(
                                  (value) {
                                    return DropdownMenuItem(
                                      child: Padding(
                                        padding: EdgeInsets.all(
                                          7.2,
                                        ),
                                        child: Text(Utils().nullSafeString(value!.name)),
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
                            decoration:
                                BoxDecoration(color: Color(0xffF2F2F2), borderRadius: BorderRadius.circular(3.6)),
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
                      ],
                    ),
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
