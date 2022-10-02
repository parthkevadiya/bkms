import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/presentation/bloc/params_bloc.dart';
import 'package:flutter_app/presentation/bloc/params_event.dart';
import 'package:flutter_app/presentation/bloc/params_state.dart';
import 'package:flutter_app/utils/util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Bloc/bst_report_bloc.dart';
import '../bst_report_model.dart';

class BSTFilter extends StatefulWidget {
  bool isFiltered;
  String searchText;
  final Function(
    bool isFiltered,
  ) onSelectFilter;
  BSTFilter(this.searchText, {Key? key, this.isFiltered = false, required this.onSelectFilter}) : super(key: key);

  @override
  _BSTFilterState createState() => _BSTFilterState();
}

class _BSTFilterState extends State<BSTFilter> {
  List<BSTWingsItems?>? _wingItems = [];
  BSTWingsItems? _selectedWing;
  int _pageSize = 50;
  int pageKey = 1;
  List<BSTRegionItems?>? _regionItems = [];
  BSTRegionItems? _selectedRegion;

  List<BSTCentersItems?>? _centerItems = [];
  List<BSTCentersItems?>? _regionWiseCenters = [];
  BSTCentersItems? _selectedCenter;

  List<int?>? _yearItems = [];
  int? _selectedYear;

  String _strBSTSelectedWing = "";
  String _strBSTSelectedCenter = "";
  String _strBSTSelectedRegion = "";
  String _strBSTSabhaYear = Utils().getCurrentDate("yyyy");
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
    if (paramsBloc is BSTReportFiltersState) {
      _strBSTSelectedWing = paramsBloc.strBSTSelectedWing;
      _strBSTSelectedCenter = paramsBloc.strBSTSelectedCenter;
      _strBSTSelectedRegion = paramsBloc.strBSTSelectedRegion;
      _strBSTSabhaYear = Utils().nullSafeWithDefaultString(paramsBloc.strBSTSabhaYear, Utils().getCurrentDate("yyyy"));
    }
  }

  @override
  Widget build(BuildContext context) {
    //FOR FILL DATA IN DROPDOWN AND DISPLAY SELECTED VALUES
    BlocProvider.of<BSTReportBloc>(context).state.maybeWhen(
        loadBSTReports: (bstReportModel, l) {
          if (bstReportModel != null) {
            _wingItems = bstReportModel.search_filter!.wings;
            if ((_wingItems != null && _wingItems!.length > 0)) {
              final regionIndex = _wingItems!.indexWhere((element) =>
                  element!.id.toString() ==
                  Utils().nullSafeInt(bstReportModel.search_filter!.user_wing_set).toString());
              if (regionIndex >= 0) {
                _selectedWing = _wingItems![regionIndex]!;
              }
            }

            if (Utils().nullSafeString(_strBSTSelectedWing).isNotEmpty) {
              if ((_wingItems != null && _wingItems!.length > 0)) {
                final regionIndex = _wingItems!
                    .indexWhere((element) => element!.id.toString() == Utils().nullSafeString(_strBSTSelectedWing));
                if (regionIndex >= 0) {
                  _selectedWing = _wingItems![regionIndex]!;
                }
              }
            }

            _regionItems = bstReportModel.search_filter!.regions;
            if ((_regionItems != null && _regionItems!.length > 0)) {
              final regionIndex = _regionItems!.indexWhere((element) =>
                  element!.id.toString() == Utils().nullSafeString(bstReportModel.search_filter!.user_region_id));
              if (regionIndex >= 0) {
                _selectedRegion = _regionItems![regionIndex]!;
              }
            }

            if (Utils().nullSafeString(_strBSTSelectedRegion).isNotEmpty) {
              if ((_regionItems != null && _regionItems!.length > 0)) {
                final regionIndex = _regionItems!
                    .indexWhere((element) => element!.id.toString() == Utils().nullSafeString(_strBSTSelectedRegion));
                if (regionIndex >= 0) {
                  _selectedRegion = _regionItems![regionIndex]!;
                }
              }
            }

            _centerItems = bstReportModel.search_filter!.centers;
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
                      element!.id.toString() == Utils().nullSafeString(bstReportModel.search_filter!.user_center_id));
                  if (centerIndex >= 0) {
                    _selectedCenter = _regionWiseCenters![centerIndex]!;
                  }
                }

                if (Utils().nullSafeString(_strBSTSelectedCenter).isNotEmpty) {
                  if ((_regionWiseCenters != null && _regionWiseCenters!.length > 0)) {
                    final centerIndex = _regionWiseCenters!.indexWhere(
                        (element) => element!.id.toString() == Utils().nullSafeString(_strBSTSelectedCenter));
                    if (centerIndex >= 0) {
                      _selectedCenter = _regionWiseCenters![centerIndex]!;
                    }
                  }
                }
              }
            }

            _yearItems = bstReportModel.search_filter!.years;
            if (_yearItems != null && _yearItems!.length > 0) {
              final yearIndex = _yearItems!
                  .indexWhere((element) => Utils().nullSafeInt(element).toString() == Utils().getCurrentDate("yyyy"));
              if (yearIndex >= 0) {
                _selectedYear = _yearItems![yearIndex]!;
              }
            }
            if (Utils().nullSafeString(_strBSTSabhaYear).isNotEmpty) {
              if (_yearItems != null && _yearItems!.length > 0) {
                final yearIndex = _yearItems!.indexWhere(
                    (element) => Utils().nullSafeInt(element).toString() == Utils().nullSafeString(_strBSTSabhaYear));
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
                      pageKey = 1;
                      if (widget.isFiltered) {
                        if (widget.searchText.isNotEmpty) {
                          BlocProvider.of<ParamsBloc>(context).add(BSTReportFiltersEvent(
                            _selectedWing != null ? Utils().nullSafeString(_selectedWing!.id.toString()) : "",
                            _selectedRegion != null ? Utils().nullSafeString(_selectedRegion!.id.toString()) : "",
                            _selectedCenter != null ? Utils().nullSafeString(_selectedCenter!.id.toString()) : "",
                            _selectedYear != null ? Utils().nullSafeString(_selectedYear!.toString()) : "",
                          ));

                          BlocProvider.of<BSTReportBloc>(context).add(
                            BSTReportEvent.loadBSTReports(
                              context,
                              _selectedWing != null ? Utils().nullSafeString(_selectedWing!.id.toString()) : "",
                              _selectedCenter != null ? Utils().nullSafeString(_selectedCenter!.id.toString()) : "",
                              _selectedRegion != null ? Utils().nullSafeString(_selectedRegion!.id.toString()) : "",
                              _selectedYear != null ? Utils().nullSafeString(_selectedYear!.toString()) : "",
                              pageKey,
                              _pageSize,
                              widget.searchText,
                            ),
                          );
                        } else {
                          BlocProvider.of<ParamsBloc>(context).add(BSTReportFiltersEvent(
                            _selectedWing != null ? Utils().nullSafeString(_selectedWing!.id.toString()) : "",
                            _selectedRegion != null ? Utils().nullSafeString(_selectedRegion!.id.toString()) : "",
                            _selectedCenter != null ? Utils().nullSafeString(_selectedCenter!.id.toString()) : "",
                            _selectedYear != null ? Utils().nullSafeString(_selectedYear!.toString()) : "",
                          ));

                          BlocProvider.of<BSTReportBloc>(context).add(
                            BSTReportEvent.loadBSTReports(
                              context,
                              _selectedWing != null ? Utils().nullSafeString(_selectedWing!.id.toString()) : "",
                              _selectedCenter != null ? Utils().nullSafeString(_selectedCenter!.id.toString()) : "",
                              _selectedRegion != null ? Utils().nullSafeString(_selectedRegion!.id.toString()) : "",
                              _selectedYear != null ? Utils().nullSafeString(_selectedYear!.toString()) : "",
                              pageKey,
                              _pageSize,
                              "",
                            ),
                          );
                        }
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
                  "BST Report Filter",
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
                          decoration: BoxDecoration(color: Color(0xffF2F2F2), borderRadius: BorderRadius.circular(3.6)),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<BSTWingsItems>(
                              hint: Text('  Choose Wing'),
                              isExpanded: true,
                              itemHeight: null,
                              value: _selectedWing,
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
                            child: DropdownButton<BSTRegionItems>(
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
                          decoration: BoxDecoration(color: Color(0xffF2F2F2), borderRadius: BorderRadius.circular(3.6)),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<BSTCentersItems>(
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
