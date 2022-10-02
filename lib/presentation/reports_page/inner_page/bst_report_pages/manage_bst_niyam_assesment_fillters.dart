import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/media_query/responsive.dart';
import 'package:flutter_app/models/manage_bst_niyam_assesment_model.dart';
import 'package:flutter_app/presentation/bloc/params_bloc.dart';
import 'package:flutter_app/presentation/bloc/params_event.dart';
import 'package:flutter_app/presentation/bloc/params_state.dart';
import 'package:flutter_app/presentation/reports_page/bloc/report_bloc.dart';
import 'package:flutter_app/utils/login_status.dart';
import 'package:flutter_app/utils/util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Bloc/manage_niyam_report_bloc.dart';
import '../../bst_report_model.dart';

class ManageBSTNiyamAssesmentFilter extends StatefulWidget {
  bool isFiltered;
  String searchText;
  final Function(
    bool isFiltered,
  ) onSelectFilter;
  final String? manageBSTNiyamId;
  ManageBSTNiyamAssesmentFilter(this.searchText,
      {Key? key, this.isFiltered = false, required this.onSelectFilter, this.manageBSTNiyamId})
      : super(key: key);

  @override
  _ManageBSTNiyamAssesmentFilterState createState() => _ManageBSTNiyamAssesmentFilterState();
}

class _ManageBSTNiyamAssesmentFilterState extends State<ManageBSTNiyamAssesmentFilter> {
  int _currentPage = 1;
  static const _pageSize = 50;

  String _strFallYear = "";
  String _strSpringYear = "";
  String _strgUserId = "";
  String _strFirstName = "";
  String _strMiddleName = "";
  String _strLastName = "";
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

  List<MNAWingsModel?>? _wingItems = [];
  MNAWingsModel? _selectedWing;

  List<MNARegionsModel?>? _regionItems = [];
  MNARegionsModel? _selectedRegion;

  List<MNACentersModel?>? _centerItems = [];
  List<MNACentersModel?>? _regionWiseCenters = [];
  MNACentersModel? _selectedCenter;

  List<MNAGroupListModel?>? _userGroupItems = [];
  MNAGroupListModel? _selectedUserGroup;

  List<String?>? _subGroupItems = [];
  String? _selectedSubGroup;

  List<MNASchoolListModel?>? _schoolYearItems = [];
  MNASchoolListModel? _selectedSchoolYear;

  String _strSelectedWing = "";
  String _strSelectedRegion = "";
  String _strSelectedSearchUserId = "";
  String _strSelectedGroup = "";
  String _strSelectedSubGroup = "";
  String _strSelectedSchoolYear = "";
  String _strSelectedFirstName = "";
  String _strSelectedMiddleName = "";
  String _strSelectedLastName = "";

  TextEditingController _fallYear = TextEditingController();
  late FocusNode _focusNodeFallYear;
  bool? reportFallYear;

  TextEditingController _springYear = TextEditingController();
  late FocusNode _focusNodeSpringYear;
  bool? springYearError;

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
  BSTReportListDataModel? _bstReportItem;
  bool textSearch = false;
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ParamsBloc>(context).add(BSTReportDetailsEvent(_bstReportItem, null));
    final paramsBloc1 = BlocProvider.of<ParamsBloc>(context).state;
    if (paramsBloc1 is BSTReportDetailsState) {
      _bstReportItem = paramsBloc1.bstReportItem;
    }
    _focusNodeFallYear = FocusNode();
    _focusNodeSpringYear = FocusNode();
    _focusNodeUserId = FocusNode();
    _focusNodeFirstName = FocusNode();
    _focusNodeMiddleName = FocusNode();
    _focusNodeLastName = FocusNode();

    final paramsBloc = BlocProvider.of<ParamsBloc>(context).state;
    if (paramsBloc is ManageBSTNiyamAssesmentFiltersState) {
      _strSelectedWing = paramsBloc.strSelectedWing;
      _strSelectedRegion = paramsBloc.strSelectedRegion;
      _strSelectedSearchUserId = paramsBloc.strSearchUserId;
      _strSelectedGroup = paramsBloc.strGroup;
      _strSelectedSubGroup = paramsBloc.strSubGroup;
      _strSelectedSchoolYear = Utils().nullSafeString(paramsBloc.strSchoolYear);
      _strSelectedFirstName = paramsBloc.strFirstName;
      _strSelectedMiddleName = paramsBloc.strMiddleName;
      _strSelectedLastName = paramsBloc.strLastName;
    }
  }

  @override
  Widget build(BuildContext context) {
    //FOR FILL DATA IN DROPDOWN AND DISPLAY SELECTED VALUES
    BlocProvider.of<ManageNiyamReportBloc>(context).state.maybeWhen(
        manageBSTNiyamAssesment: (manageBSTNiyamAssesmentModel, l) {
          if (manageBSTNiyamAssesmentModel != null) {
            _wingItems = manageBSTNiyamAssesmentModel.search_filter!.wings;
            if ((_wingItems != null && _wingItems!.length > 0)) {
              final regionIndex = _wingItems!.indexWhere((element) =>
                  element!.id.toString() ==
                  Utils().nullSafeString(manageBSTNiyamAssesmentModel.search_filter!.bst_report_data!.wing_id));
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

            _regionItems = manageBSTNiyamAssesmentModel.search_filter!.regions;
            if ((_regionItems != null && _regionItems!.length > 0)) {
              final regionIndex = _regionItems!.indexWhere((element) =>
                  element!.id.toString() ==
                  Utils().nullSafeString(manageBSTNiyamAssesmentModel.search_filter!.bst_report_data!.region_id));
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

            _centerItems = manageBSTNiyamAssesmentModel.search_filter!.centers;
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
                      Utils()
                          .nullSafeString(manageBSTNiyamAssesmentModel.search_filter!.bst_report_data!.host_center_id));
                  if (centerIndex >= 0) {
                    _selectedCenter = _regionWiseCenters![centerIndex]!;
                  }
                }
              }
            }

            _userGroupItems = manageBSTNiyamAssesmentModel.search_filter!.grouplist;
            if (Utils().nullSafeString(_strSelectedGroup).isNotEmpty) {
              if (_userGroupItems != null && _userGroupItems!.length > 0) {
                final userGroupIndex = _userGroupItems!.indexWhere(
                    (element) => element!.group_name.toString() == Utils().nullSafeString(_strSelectedGroup));
                if (userGroupIndex >= 0) {
                  _selectedUserGroup = _userGroupItems![userGroupIndex]!;
                }
              }
            }

            _schoolYearItems = manageBSTNiyamAssesmentModel.search_filter!.school_list;
            if (Utils().nullSafeString(_strSelectedSchoolYear).isNotEmpty) {
              if (_schoolYearItems != null && _schoolYearItems!.length > 0) {
                final yearIndex = _schoolYearItems!
                    .indexWhere((element) => element!.id.toString() == Utils().nullSafeString(_strSelectedSchoolYear));
                if (yearIndex >= 0) {
                  _selectedSchoolYear = _schoolYearItems![yearIndex]!;
                }
              }
            }

            _strFallYear =
                Utils().nullSafeString(manageBSTNiyamAssesmentModel.search_filter!.bst_report_data!.fall_year);
            _fallYear.text = _strFallYear;

            _strSpringYear =
                Utils().nullSafeString(manageBSTNiyamAssesmentModel.search_filter!.bst_report_data!.spring_year);
            _springYear.text = _strSpringYear;

            if (Utils().nullSafeString(_strSelectedSearchUserId).isNotEmpty) {
              if (_userId.text.toString().isEmpty) {
                _strgUserId = _strSelectedSearchUserId;
                _userId.text = _strgUserId;
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
    // BlocProvider.of<ManageNiyamReportBloc>(context).state.maybeWhen(
    //
    //     orElse: () {});

    return MultiBlocListener(
      listeners: [
        BlocListener<ManageNiyamReportBloc, ManageNiyamReportState>(
          listener: (context, state) {
            state.maybeWhen(
                userGroupWiseSubGroup: (userGroupWiseSubGroupModel, l) {
                  if (l == LoadingStatus.Done) {
                    setState(() {
                      if (userGroupWiseSubGroupModel != null) {
                        if (userGroupWiseSubGroupModel.subgroups != null) {
                          setState(() {
                            _subGroupItems = userGroupWiseSubGroupModel.subgroups;
                          });
                        }
                      }
                    });
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
                        String isForEditMode() {
                          if (_selectedWing == null) {
                            return "2";
                          }

                          if (_selectedRegion == null) {
                            return "2";
                          }

                          if (_userId.text.isEmpty) {
                            return "2";
                          }

                          if (_selectedUserGroup == null) {
                            return "2";
                          }

                          if (_selectedSubGroup == null) {
                            return "2";
                          }

                          if (_selectedSchoolYear == null) {
                            return "2";
                          }

                          if (_firstName.text.isEmpty) {
                            return "2";
                          }

                          if (_middleName.text.isEmpty) {
                            return "2";
                          }

                          if (_lastName.text.isEmpty) {
                            return "2";
                          }

                          return "1";
                        }

                        if (widget.isFiltered || textSearch) {
                          widget.onSelectFilter(
                            widget.isFiltered = true,
                          );
                        }
                        if (widget.isFiltered || textSearch) {
                          if (widget.searchText.isNotEmpty) {
                            _showLoadingIndicator();
                            BlocProvider.of<ManageNiyamReportBloc>(context)
                                .add(ManageNiyamReportEvent.manageBSTNiyamAssesment(
                              context,
                              widget.manageBSTNiyamId!,
                              // Utils().nullSafeString(_bstReportItem!.id),
                              isForEditMode(),
                              _selectedWing != null ? Utils().nullSafeString(_selectedWing!.id.toString()) : "",
                              _selectedRegion != null ? Utils().nullSafeString(_selectedRegion!.id.toString()) : "",
                              _selectedCenter != null ? Utils().nullSafeString(_selectedCenter!.id.toString()) : "",
                              _userId.text.toString(),
                              _selectedUserGroup != null
                                  ? Utils().nullSafeString(_selectedUserGroup!.group_name.toString())
                                  : "",
                              _selectedSubGroup != null ? Utils().nullSafeString(_selectedSubGroup!.toString()) : "",
                              _selectedSchoolYear != null
                                  ? Utils().nullSafeString(_selectedSchoolYear!.id.toString())
                                  : "",
                              _firstName.text,
                              _middleName.text,
                              _lastName.text,
                              _currentPage,
                              _pageSize,
                              widget.searchText,
                            ));
                            BlocProvider.of<ParamsBloc>(context).add(ManageBSTNiyamAssesmentFiltersEvent(
                              _selectedWing != null ? Utils().nullSafeString(_selectedWing!.id.toString()) : "",
                              _selectedRegion != null ? Utils().nullSafeString(_selectedRegion!.id.toString()) : "",
                              _selectedCenter != null ? Utils().nullSafeString(_selectedCenter!.id.toString()) : "",
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
                            Navigator.pop(context);
                          } else {
                            _showLoadingIndicator();

                            BlocProvider.of<ManageNiyamReportBloc>(context)
                                .add(ManageNiyamReportEvent.manageBSTNiyamAssesment(
                              context,
                              widget.manageBSTNiyamId!,
                              // Utils().nullSafeString(_bstReportItem!.id),
                              isForEditMode(),
                              _selectedWing != null ? Utils().nullSafeString(_selectedWing!.id.toString()) : "",
                              _selectedRegion != null ? Utils().nullSafeString(_selectedRegion!.id.toString()) : "",
                              /*_selectedCenter != null ? Utils().nullSafeString(_selectedCenter!.id.toString()) :*/ "",
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
                              _currentPage,
                              _pageSize,
                              "",
                            ));
                            BlocProvider.of<ParamsBloc>(context).add(ManageBSTNiyamAssesmentFiltersEvent(
                              _selectedWing != null ? Utils().nullSafeString(_selectedWing!.id.toString()) : "",
                              _selectedRegion != null ? Utils().nullSafeString(_selectedRegion!.id.toString()) : "",
                              _selectedCenter != null ? Utils().nullSafeString(_selectedCenter!.id.toString()) : "",
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
                    "Manage Niyam Assesment Filters",
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
                            "Fall Year",
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
                                onChanged:
                                    null /*(value) {
                                  setState(() {
                                    reportFallYear = false;
                                    widget.isFiltered = true;

                                    */ /*(value.isEmpty)
                                      ? ReportTypeError = true
                                      : ReportTypeError = false;*/ /*
                                  });
                                }*/
                                ,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.text,
                                focusNode: _focusNodeFallYear,
                                controller: _fallYear,
                                decoration: InputDecoration(
                                  hintText: "Fall Year",
                                  suffixIcon: (reportFallYear == true)
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
                              (reportFallYear == true)
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
                                                "Please enter Fall Year!",
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
                            "Spring Year",
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
                                onChanged:
                                    null /*(value) {
                                  setState(() {
                                    widget.isFiltered = true;

                                    */ /*(value.isEmpty)
                                      ? ReportTypeError = true
                                      : ReportTypeError = false;*/ /*
                                  });
                                }*/
                                ,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.text,
                                focusNode: _focusNodeSpringYear,
                                controller: _springYear,
                                decoration: InputDecoration(
                                  hintText: "Spring Year",
                                  suffixIcon: (springYearError == true)
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
                              (springYearError == true)
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
                                                "Please enter Spring Year!",
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
                              child: DropdownButton<MNAWingsModel>(
                                hint: Text('  Choose Wing'),
                                isExpanded: true,
                                itemHeight: null,
                                value: _selectedWing == null ? null : _selectedWing,
                                icon: Icon(
                                  Icons.keyboard_arrow_down,
                                  size: 21.6,
                                ),
                                style: TextStyle(fontSize: 14.4, color: Colors.black),
                                onChanged: null
                                /* (value) {
                                  setState(() {
                                    _selectedWing = value!;
                                    widget.isFiltered = true;
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
                              child: DropdownButton<MNARegionsModel>(
                                hint: Text('  Choose Region'),
                                isExpanded: true,
                                itemHeight: null,
                                value: _selectedRegion == null ? null : _selectedRegion,
                                icon: Icon(
                                  Icons.keyboard_arrow_down,
                                  size: 21.6,
                                ),
                                style: TextStyle(fontSize: 14.4, color: Colors.black),
                                onChanged: null
                                /*   (value) {
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
                              child: DropdownButton<MNACentersModel>(
                                hint: Text('  Choose Host Center'),
                                isExpanded: true,
                                itemHeight: null,
                                value: _selectedCenter == null ? null : _selectedCenter,
                                icon: Icon(
                                  Icons.keyboard_arrow_down,
                                  size: 21.6,
                                ),
                                style: TextStyle(fontSize: 14.4, color: Colors.black),
                                onChanged: null
                                /*  (value) {
                                  setState(() {
                                    _selectedCenter = value!;
                                    widget.isFiltered = true;
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
                                    textSearch = true;

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
                              child: DropdownButton<MNAGroupListModel>(
                                hint: Text('  Choose User Group'),
                                itemHeight: null,
                                isExpanded: true,
                                style: TextStyle(fontSize: 14.4, color: Colors.black),
                                value: _selectedUserGroup == null ? null : _selectedUserGroup,
                                icon: Icon(
                                  Icons.keyboard_arrow_down,
                                  size: 21.6,
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    _selectedUserGroup = value!;
                                    widget.isFiltered = true;

                                    _subGroupItems = [];
                                    _selectedSubGroup = null;

                                    //FOR GET USER GROUP WISE SUB-GROUPS
                                    BlocProvider.of<ManageNiyamReportBloc>(context).add(
                                        ManageNiyamReportEvent.userGroupWiseSubGroup(
                                            context,
                                            Utils().nullSafeString(_selectedCenter!.id.toString()),
                                            Utils().nullSafeString(_selectedUserGroup!.wingName),
                                            Utils().nullSafeString(_selectedUserGroup!.group_name)));
                                    _showLoadingIndicator();
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
                                    widget.isFiltered = true;

                                    _selectedSubGroup = value!;
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
                              child: DropdownButton<MNASchoolListModel>(
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
                                    widget.isFiltered = true;

                                    _selectedSchoolYear = value!;
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
                                    textSearch = true;
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
                                    textSearch = true;

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
                                    textSearch = true;

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
                        Padding(padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom)),
                      ]),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
