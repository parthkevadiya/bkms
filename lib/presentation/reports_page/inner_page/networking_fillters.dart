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

import '../../../Bloc/networking_report_bloc.dart';
import '../networking_report_model.dart';

class NetworkingFilter extends StatefulWidget {
  bool isFiltered;
  String searchText;
  final Function(
    bool isFiltered,
  ) onSelectFilter;
  NetworkingFilter(
    this.searchText, {
    Key? key,
    this.isFiltered = false,
    required this.onSelectFilter,
  }) : super(key: key);

  @override
  _NetworkingFilterState createState() => _NetworkingFilterState();
}

class _NetworkingFilterState extends State<NetworkingFilter> {
  List<NTWRKRegionsModel?>? _regionItems = [];
  NTWRKRegionsModel? _selectedRegion;

  List<NTWRKCentersModel?>? _centerItems = [];
  List<NTWRKCentersModel?>? _regionWiseCenters = [];
  NTWRKCentersModel? _selectedCenter;
  int pageKey = 1;
  static const _pageSize = 50;

  List<int?>? _yearItems = [];
  int? _selectedYear;
  bool _isLoading = false;

  String strNTWRKSelectedRegion = "";
  String strNTWRKSelectedCenter = "";
  String strSelectedReportingYear = Utils().getCurrentDate("yyyy");

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
    if (paramsBloc is NetworkingReportFiltersState) {
      strNTWRKSelectedRegion = paramsBloc.strNTWRKSelectedRegion;
      strNTWRKSelectedCenter = paramsBloc.strNTWRKSelectedCenter;
      strSelectedReportingYear =
          Utils().nullSafeWithDefaultString(paramsBloc.strSelectedReportingYear, Utils().getCurrentDate("yyyy"));
    }
  }

  @override
  Widget build(BuildContext context) {
    //FOR FILL DATA IN DROPDOWN AND DISPLAY SELECTED VALUES
    BlocProvider.of<NetworkingReportBloc>(context).state.maybeWhen(
        loadNetworkingReports: (reportModel, l) {
          if (reportModel != null) {
            _regionItems = reportModel.filter_data!.regions;
            if ((_regionItems != null && _regionItems!.length > 0) &&
                Utils().nullSafeString(reportModel.roleType) != Constant.rtSiteAdmin) {
              final regionIndex = _regionItems!.indexWhere((element) =>
                  element!.id.toString() == Utils().nullSafeString(reportModel.filter_data!.user_region_id));
              if (regionIndex >= 0) {
                _selectedRegion = _regionItems![regionIndex]!;
              }
            }

            if (Utils().nullSafeString(strNTWRKSelectedRegion).isNotEmpty) {
              if ((_regionItems != null && _regionItems!.length > 0)) {
                final regionIndex = _regionItems!
                    .indexWhere((element) => element!.id.toString() == Utils().nullSafeString(strNTWRKSelectedRegion));
                if (regionIndex >= 0) {
                  _selectedRegion = _regionItems![regionIndex]!;
                }
              }
            }

            _centerItems = reportModel.filter_data!.centers;
            if (_selectedRegion != null) {
              //FOR FILL REGION WISE CENTERS
              _regionWiseCenters = [];
              _selectedCenter = null;

              if (_centerItems != null) {
                for (int v = 0; v < _centerItems!.length; v++) {
                  if (_selectedRegion!.id == int.parse(Utils().nullSafeString(_centerItems![v]!.RegionId))) {
                    _regionWiseCenters!.add(_centerItems![v]!);
                  }
                }

                if ((_regionWiseCenters != null && _regionWiseCenters!.length > 0) &&
                    Utils().nullSafeString(reportModel.roleType) != Constant.rtSiteAdmin) {
                  final centerIndex = _regionWiseCenters!.indexWhere((element) =>
                      element!.id.toString() == Utils().nullSafeString(reportModel.filter_data!.user_center_id));
                  if (centerIndex >= 0) {
                    _selectedCenter = _regionWiseCenters![centerIndex]!;
                  }
                }

                if (Utils().nullSafeString(strNTWRKSelectedCenter).isNotEmpty) {
                  if ((_regionWiseCenters != null && _regionWiseCenters!.length > 0)) {
                    final centerIndex = _regionWiseCenters!.indexWhere(
                        (element) => element!.id.toString() == Utils().nullSafeString(strNTWRKSelectedCenter));
                    if (centerIndex >= 0) {
                      _selectedCenter = _regionWiseCenters![centerIndex]!;
                    }
                  }
                }
              }
            }

            _yearItems = reportModel.filter_data!.years;
            if (_yearItems != null && _yearItems!.length > 0) {
              final yearIndex = _yearItems!
                  .indexWhere((element) => Utils().nullSafeInt(element).toString() == Utils().getCurrentDate("yyyy"));
              if (yearIndex >= 0) {
                _selectedYear = _yearItems![yearIndex]!;
              }
            }
            if (Utils().nullSafeString(strSelectedReportingYear).isNotEmpty) {
              if (_yearItems != null && _yearItems!.length > 0) {
                final yearIndex = _yearItems!.indexWhere((element) =>
                    Utils().nullSafeInt(element).toString() == Utils().nullSafeString(strSelectedReportingYear));
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
                      setState(() {
                        if (widget.isFiltered) {
                          widget.onSelectFilter(
                            widget.isFiltered,
                          );
                        }
                      });
                      //FOR ADD SELECTED SABHA REPORTS FILTERS
                      if (widget.isFiltered) {
                        if (widget.searchText.isNotEmpty) {
                          _showLoadingIndicator();
                          BlocProvider.of<NetworkingReportBloc>(context)
                              .add(NetworkingReportEvent.loadNetworkingReports(
                            context,
                            pageKey,
                            _pageSize,
                            _selectedRegion != null ? Utils().nullSafeString(_selectedRegion!.id.toString()) : "",
                            _selectedCenter != null ? Utils().nullSafeString(_selectedCenter!.id.toString()) : "",
                            _selectedYear != null ? Utils().nullSafeString(_selectedYear!.toString()) : "",
                            widget.searchText,
                          ));
                        } else {
                          _showLoadingIndicator();
                          BlocProvider.of<NetworkingReportBloc>(context)
                              .add(NetworkingReportEvent.loadNetworkingReports(
                            context,
                            pageKey,
                            _pageSize,
                            _selectedRegion != null ? Utils().nullSafeString(_selectedRegion!.id.toString()) : "",
                            _selectedCenter != null ? Utils().nullSafeString(_selectedCenter!.id.toString()) : "",
                            _selectedYear != null ? Utils().nullSafeString(_selectedYear!.toString()) : "",
                            "",
                          ));
                        }
                      }
                      if (widget.isFiltered) {
                        BlocProvider.of<ParamsBloc>(context).add(NetworkingReportFiltersEvent(
                          _selectedRegion != null ? Utils().nullSafeString(_selectedRegion!.id.toString()) : "",
                          _selectedCenter != null ? Utils().nullSafeString(_selectedCenter!.id.toString()) : "",
                          _selectedYear != null ? Utils().nullSafeString(_selectedYear!.toString()) : "",
                        ));
                      }
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
                  "Networking Report Filter",
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
                              child: DropdownButton<NTWRKRegionsModel>(
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
                                        if (_selectedRegion!.id ==
                                            int.parse(Utils().nullSafeString(_centerItems![v]!.RegionId))) {
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
                              child: DropdownButton<NTWRKCentersModel>(
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
                                    _selectedYear = value!;
                                    widget.isFiltered = true;
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
