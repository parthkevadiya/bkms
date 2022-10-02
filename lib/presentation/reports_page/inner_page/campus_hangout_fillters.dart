import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/region_wise_campus_model.dart';
import 'package:flutter_app/presentation/bloc/params_bloc.dart';
import 'package:flutter_app/presentation/bloc/params_event.dart';
import 'package:flutter_app/utils/util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Bloc/campus_hangout_bloc.dart';
import '../../../Bloc/campus_hangout_data_update_bloc.dart';
import '../../../utils/constant.dart';
import '../../bloc/params_state.dart';
import '../campus_hangout_model.dart';

class CampusHangoutFilter extends StatefulWidget {
  bool isCallBackFilter;
  final Function(
    bool callBackFilter,
    String selectedWing,
    String selectedSchoolYear,
    String selectedCenter,
    String selectedRegion,
  ) onSelectFilter;

  CampusHangoutFilter({
    Key? key,
    required this.onSelectFilter,
    required this.isCallBackFilter,
  }) : super(key: key);

  @override
  _CampusHangoutFilterState createState() => _CampusHangoutFilterState();
}

class _CampusHangoutFilterState extends State<CampusHangoutFilter> {
  List<CHWingsItems?>? _wingItems = [];
  CHWingsItems? _selectedWing;

  int _pageKey = 1;
  static const _pageSize = 50;
  List<CHRegionItems?>? _regionItems = [];
  CHRegionItems? _selectedRegion;

  List<RWCCampusModel?>? _campusItems = [];
  RWCCampusModel? _selectedCampus;

  List<int?>? _yearItems = [];
  int? _selectedYear;

  String _strCHSelectedWing = "";
  String _strCHSelectedCampus = "";
  String _strCHSelectedRegion = "";
  //String _strCHSelectedYear = Utils().getCurrentDate("yyyy");
  bool _isLoading = false;
  bool callBackFilter = false;

  @override
  void initState() {
    super.initState();

    //FOR FILL DATA IN DROPDOWN AND DISPLAY SELECTED VALUES
    final paramsBloc = BlocProvider.of<ParamsBloc>(context).state;
    if (paramsBloc is CampusHangoutFiltersState) {
      _strCHSelectedWing = paramsBloc.strCHSelectedWing;
      _strCHSelectedCampus = paramsBloc.strCHSelectedCampus;
      _strCHSelectedRegion = paramsBloc.strCHSelectedRegion;
      _selectedYear =
          int.tryParse(Utils().nullSafeWithDefaultString(paramsBloc.strCHSelectedYear, Utils().getCurrentDate("yyyy")));
    }
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CampusHangoutReportBloc>(context).state.maybeWhen(
        campusHangout: (campusHangoutModel, l) {
          if (campusHangoutModel != null) {
            _wingItems = [];
            _wingItems = campusHangoutModel.search_filter!.wings;
            if ((_wingItems != null && _wingItems!.length > 0)) {
              final regionIndex = _wingItems!.indexWhere((element) =>
                  element!.id.toString() ==
                  Utils().nullSafeInt(campusHangoutModel.search_filter!.user_wings).toString());
              if (regionIndex >= 0) {
                _selectedWing = _wingItems![regionIndex]!;
              }
            }

            if (Utils().nullSafeString(_strCHSelectedWing).isNotEmpty) {
              if ((_wingItems != null && _wingItems!.length > 0)) {
                final regionIndex = _wingItems!
                    .indexWhere((element) => element!.id.toString() == Utils().nullSafeString(_strCHSelectedWing));
                if (regionIndex >= 0) {
                  _selectedWing = _wingItems![regionIndex]!;
                }
              }
            }
            _regionItems = campusHangoutModel.search_filter!.regions;
            if ((_regionItems != null && _regionItems!.length > 0) &&
                Utils().nullSafeString(campusHangoutModel.roleType) != Constant.rtSiteAdmin) {
              final regionIndex = _regionItems!.indexWhere(
                (element) =>
                    element!.id.toString() ==
                    Utils().nullSafeString(
                      campusHangoutModel.search_filter!.user_region_id,
                    ),
              );
              if (regionIndex >= 0) {
                _selectedRegion = _regionItems![regionIndex]!;
              }
            }

            if (Utils().nullSafeString(_strCHSelectedRegion).isNotEmpty) {
              if ((_regionItems != null && _regionItems!.length > 0)) {
                final regionIndex = _regionItems!
                    .indexWhere((element) => element!.id.toString() == Utils().nullSafeString(_strCHSelectedRegion));
                if (regionIndex >= 0) {
                  _selectedRegion = _regionItems![regionIndex]!;
                }
              }
            }

            _yearItems = [];
            _yearItems = campusHangoutModel.search_filter!.years;
            if (_yearItems != null && _yearItems!.length > 0) {
              final yearIndex = _yearItems!
                  .indexWhere((element) => Utils().nullSafeInt(element).toString() == Utils().getCurrentDate("yyyy"));
              if (yearIndex >= 0) {
                _selectedYear = _yearItems![yearIndex]!;
              }
            }
            if (_selectedYear != null) {
              if (_yearItems != null && _yearItems!.length > 0) {
                final yearIndex =
                    _yearItems!.indexWhere((element) => Utils().nullSafeInt(element).toString() == _selectedYear);
                if (yearIndex >= 0) {
                  _selectedYear = _yearItems![yearIndex]!;
                }
              }
            }
          }
        },
        orElse: () {});

    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) => MultiBlocListener(
        listeners: [
          BlocListener<CampusHangOutDataUpdateBloc, CampusHangOutDataUpdateState>(
            listener: (context, state) {
              state.maybeWhen(
                  regionWiseCampus: (regionWiseCampusModel) {
                    if (regionWiseCampusModel != null) {
                      if (regionWiseCampusModel.campus != null) {
                        setState(() {
                          _campusItems = regionWiseCampusModel.campus;
                        });
                      }
                    }
                  },
                  orElse: () {});
            },
          ),
        ],
        child: Container(
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
                      BlocProvider.of<ParamsBloc>(context).add(
                        CampusHangoutFiltersEvent(
                          _selectedWing != null
                              ? Utils().nullSafeString(
                                  _selectedWing!.id.toString(),
                                )
                              : "",
                          _selectedCampus != null
                              ? Utils().nullSafeString(
                                  _selectedCampus!.id.toString(),
                                )
                              : "",
                          _selectedRegion != null
                              ? Utils().nullSafeString(
                                  _selectedRegion!.id.toString(),
                                )
                              : "",
                          _selectedYear != null
                              ? Utils().nullSafeString(
                                  _selectedYear!.toString(),
                                )
                              : "",
                        ),
                      );

                      if (callBackFilter) {
                        widget.onSelectFilter(
                          callBackFilter,
                          _selectedWing?.id.toString() ?? "",
                          _selectedCampus?.id.toString() ?? "",
                          _selectedRegion?.id.toString() ?? "",
                          _selectedYear.toString(),
                        );
                        _selectedRegion = null;
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
                  "Campus Hangout Filter",
                  style: TextStyle(fontSize: 25.2, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: SafeArea(
                  left: false,
                  top: false,
                  right: false,
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
                            child: DropdownButton<CHWingsItems>(
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
                                  callBackFilter = true;
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
                            child: DropdownButton<CHRegionItems>(
                              hint: Text('  Choose Region'),
                              isExpanded: true,
                              itemHeight: null,
                              value: _selectedRegion,
                              icon: Icon(
                                Icons.keyboard_arrow_down,
                                size: 21.6,
                              ),
                              style: TextStyle(fontSize: 14.4, color: Colors.black),
                              onChanged: (value) {
                                setState(
                                  () {
                                    _selectedRegion = value!;
                                    callBackFilter = true;

                                    _campusItems = [];
                                    _selectedCampus = null;

                                    //FOR GET USER GROUP WISE SUB-GROUPS
                                    BlocProvider.of<CampusHangOutDataUpdateBloc>(context).add(
                                      CampusHangOutDataUpdateEvent.regionWiseCampus(
                                        context,
                                        Utils().nullSafeString(_selectedRegion!.id.toString()),
                                      ),
                                    );
                                  },
                                );
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
                          "Campus",
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
                            child: DropdownButton<RWCCampusModel>(
                              hint: Text('  Choose Campus'),
                              isExpanded: true,
                              itemHeight: null,
                              value: _selectedCampus,
                              icon: Icon(
                                Icons.keyboard_arrow_down,
                                size: 21.6,
                              ),
                              style: TextStyle(fontSize: 14.4, color: Colors.black),
                              onChanged: (value) {
                                setState(() {
                                  callBackFilter = true;
                                  _selectedCampus = value!;
                                });
                              },
                              items: _campusItems!.map(
                                (value) {
                                  return DropdownMenuItem(
                                    child: Padding(
                                      padding: EdgeInsets.all(
                                        7.2,
                                      ),
                                      child: Text(Utils().nullSafeString(value!.campus_name)),
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
                                  callBackFilter = true;
                                  _selectedYear = value;
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
        ),
      ),
    );
  }
}
