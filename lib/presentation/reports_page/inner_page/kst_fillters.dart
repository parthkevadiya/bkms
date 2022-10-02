import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/presentation/bloc/params_bloc.dart';
import 'package:flutter_app/presentation/bloc/params_event.dart';
import 'package:flutter_app/presentation/bloc/params_state.dart';
import 'package:flutter_app/utils/constant.dart';
import 'package:flutter_app/utils/util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Bloc/kst_report_bloc.dart';
import '../kst_report_model.dart';

class KSTFilter extends StatefulWidget {
  bool isFiltered;
  String searchText;
  final Function(
    bool isFiltered,
  ) onSelectFilter;
  KSTFilter(this.searchText, {Key? key, required this.onSelectFilter, this.isFiltered = false}) : super(key: key);

  @override
  _KSTFilterState createState() => _KSTFilterState();
}

class _KSTFilterState extends State<KSTFilter> {
  static const _pageSize = 50;
  int pageKey = 1;

  List<KSTWingsItems?>? _wingItems = [];
  KSTWingsItems? _selectedWing;

  List<KSTRegionItems?>? _regionItems = [];
  KSTRegionItems? _selectedRegion;

  List<KSTCentersItems?>? _centerItems = [];
  List<KSTCentersItems?>? _regionWiseCenters = [];
  KSTCentersItems? _selectedCenter;

  List<int?>? _yearItems = [];
  int? _selectedYear;

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

  String _strSelectedWing = "";
  String _strSelectedCenter = "";
  String _strSelectedRegion = "";
  String _strSelectedYear = Utils().getCurrentDate("yyyy");
  @override
  void initState() {
    super.initState();

    final paramsBloc = BlocProvider.of<ParamsBloc>(context).state;
    if (paramsBloc is KSTReportFiltersState) {
      _strSelectedWing = paramsBloc.strKSTSelectedWing;
      _strSelectedCenter = paramsBloc.strKSTSelectedCenter;
      _strSelectedRegion = paramsBloc.strKSTSelectedRegion;
      _strSelectedYear =
          Utils().nullSafeWithDefaultString(paramsBloc.strKSTSelectedYear, Utils().getCurrentDate("yyyy"));
    }
  }

  @override
  Widget build(BuildContext context) {
    //FOR FILL DATA IN DROPDOWN AND DISPLAY SELECTED VALUES
    BlocProvider.of<KstReportBloc>(context).state.maybeWhen(
        loadKSTReports: (kstReportModel, l) {
          if (kstReportModel != null) {
            _wingItems = [];
            _wingItems!.add(KSTWingsItems(Constant.fDEFAULT_FILTER_ID, "Choose Wing"));
            _wingItems!.addAll(kstReportModel.kst_filter!.wings!);
            if ((_wingItems != null && _wingItems!.length > 0)) {
              final regionIndex = _wingItems!.indexWhere((element) =>
                  element!.id.toString() == Utils().nullSafeInt(kstReportModel.kst_filter!.user_wings).toString());
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

            _regionItems = [];
            _regionItems!.add(KSTRegionItems(Constant.fDEFAULT_FILTER_ID, "Choose region"));
            _regionItems!.addAll(kstReportModel.kst_filter!.regions!);
            if ((_regionItems != null && _regionItems!.length > 0)) {
              final regionIndex = _regionItems!.indexWhere((element) =>
                  element!.id.toString() == Utils().nullSafeString(kstReportModel.kst_filter!.user_region_id));
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

            _centerItems = [];
            //_centerItems!.add(KSTCentersItems(Constant.fDEFAULT_FILTER_ID, "Choose Center", ""));
            _centerItems!.addAll(kstReportModel.kst_filter!.centers!);
            if (_selectedRegion != null) {
              //FOR FILL REGION WISE CENTERS
              _regionWiseCenters = [];
              _regionWiseCenters!.add(KSTCentersItems(Constant.fDEFAULT_FILTER_ID, "Choose Center", ""));
              _selectedCenter = null;

              if (_centerItems != null) {
                for (int v = 0; v < _centerItems!.length; v++) {
                  if (_selectedRegion!.id.toString() == _centerItems![v]!.RegionId) {
                    _regionWiseCenters!.add(_centerItems![v]!);
                  }
                }

                if ((_regionWiseCenters != null && _regionWiseCenters!.length > 0)) {
                  final centerIndex = _regionWiseCenters!.indexWhere((element) =>
                      element!.id.toString() == Utils().nullSafeString(kstReportModel.kst_filter!.user_center_id));
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

            _yearItems = [];
            _yearItems!.add(Constant.fDEFAULT_FILTER_ID_INT);
            _yearItems!.addAll(kstReportModel.kst_filter!.years!);
            /*    if (_yearItems != null && _yearItems!.length > 0) {
              final yearIndex = _yearItems!
                  .indexWhere((element) => Utils().nullSafeInt(element).toString() == Utils().getCurrentDate("yyyy"));
              if (yearIndex >= 0) {
                _selectedYear = _yearItems![yearIndex]!;
              }
            }*/
            if (Utils().nullSafeString(_strSelectedYear).isNotEmpty) {
              if (_yearItems != null && _yearItems!.length > 0) {
                final yearIndex = _yearItems!.indexWhere(
                    (element) => Utils().nullSafeInt(element).toString() == Utils().nullSafeString(_strSelectedYear));
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
                      }
                      _showLoadingIndicator();
                      int isForFilter() {
                        if (_strSelectedWing.isNotEmpty && (_strSelectedWing != Constant.fDEFAULT_FILTER_ID)) {
                          return 1;
                        }

                        if (_strSelectedCenter.isNotEmpty && (_strSelectedCenter != Constant.fDEFAULT_FILTER_ID)) {
                          return 1;
                        }

                        if (_strSelectedRegion.isNotEmpty && (_strSelectedRegion != Constant.fDEFAULT_FILTER_ID)) {
                          return 1;
                        }

                        if (_strSelectedYear.isNotEmpty && (_strSelectedYear != Constant.fDEFAULT_FILTER_ID)) {
                          return 1;
                        }

                        return 0;
                      }

                      pageKey = 1;
                      if (widget.isFiltered) {
                        if (widget.searchText.isNotEmpty) {
                          BlocProvider.of<KstReportBloc>(context).add(
                            KstReportEvent.loadKSTReports(
                              context,
                              pageKey,
                              _pageSize,
                              isForFilter(),
                              _selectedWing != null ? Utils().nullSafeString(_selectedWing!.id.toString()) : "",
                              _selectedCenter != null ? Utils().nullSafeString(_selectedCenter!.id.toString()) : "",
                              _selectedRegion != null ? Utils().nullSafeString(_selectedRegion!.id.toString()) : "",
                              _selectedYear != null ? Utils().nullSafeString(_selectedYear!.toString()) : "",
                              widget.searchText,
                            ),
                          );

                          BlocProvider.of<ParamsBloc>(context).add(KSTReportFiltersEvent(
                            _selectedWing != null ? Utils().nullSafeString(_selectedWing!.id.toString()) : "",
                            _selectedRegion != null ? Utils().nullSafeString(_selectedRegion!.id.toString()) : "",
                            _selectedCenter != null ? Utils().nullSafeString(_selectedCenter!.id.toString()) : "",
                            _selectedYear != null ? Utils().nullSafeString(_selectedYear!.toString()) : "",
                          ));
                          Navigator.pop(context);
                        } else {
                          BlocProvider.of<KstReportBloc>(context).add(
                            KstReportEvent.loadKSTReports(
                              context,
                              pageKey,
                              _pageSize,
                              isForFilter(),
                              _selectedWing != null ? Utils().nullSafeString(_selectedWing!.id.toString()) : "",
                              _selectedCenter != null ? Utils().nullSafeString(_selectedCenter!.id.toString()) : "",
                              _selectedRegion != null ? Utils().nullSafeString(_selectedRegion!.id.toString()) : "",
                              _selectedYear != null ? Utils().nullSafeString(_selectedYear!.toString()) : "",
                              "",
                            ),
                          );

                          BlocProvider.of<ParamsBloc>(context).add(KSTReportFiltersEvent(
                            _selectedWing != null ? Utils().nullSafeString(_selectedWing!.id.toString()) : "",
                            _selectedRegion != null ? Utils().nullSafeString(_selectedRegion!.id.toString()) : "",
                            _selectedCenter != null ? Utils().nullSafeString(_selectedCenter!.id.toString()) : "",
                            _selectedYear != null ? Utils().nullSafeString(_selectedYear!.toString()) : "",
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
                  "KST Report Filter",
                  style: TextStyle(fontSize: 25.2, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: SafeArea(
                  left: false,
                  right: false,
                  top: false,
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
                              child: DropdownButton<KSTWingsItems>(
                                hint: Text('  Choose Wing'),
                                isExpanded: true,
                                itemHeight: null,
                                value: _selectedWing == null ? null : _selectedWing,
                                icon: Icon(
                                  Icons.keyboard_arrow_down,
                                  size: 21.6,
                                ),
                                style: TextStyle(fontSize: 14.4, color: Colors.black),
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
                              "Region",
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            )),
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
                              child: DropdownButton<KSTRegionItems>(
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
                                    _regionWiseCenters!
                                        .add(KSTCentersItems(Constant.fDEFAULT_FILTER_ID, "Choose Center", ""));
                                    _selectedCenter = null;
                                    if (_centerItems != null) {
                                      for (int v = 0; v < _centerItems!.length; v++) {
                                        if (_selectedRegion!.id.toString() == _centerItems![v]!.RegionId) {
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
                              child: DropdownButton<KSTCentersItems>(
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
                                      child: Text(value == Constant.fDEFAULT_FILTER_ID_INT
                                          ? "Choose Year"
                                          : Utils().nullSafeInt(value).toString()),
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
