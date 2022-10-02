import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/presentation/bloc/params_bloc.dart';
import 'package:flutter_app/presentation/bloc/params_event.dart';
import 'package:flutter_app/presentation/bloc/params_state.dart';
import 'package:flutter_app/presentation/records_page/bloc/record_bloc.dart';
import 'package:flutter_app/presentation/records_page/record_model.dart';
import 'package:flutter_app/utils/util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Filter extends StatefulWidget {
  bool isCallBackFilter;
  final Function(
    bool callBackFilter,
    String strName,
    String gender,
    String selectedWing,
    String selectedSchoolYear,
    String selectedCenter,
    String selectedRegion,
    String selectedUserGroup,
  ) onSelectFilter;
  Filter({
    Key? key,
    required this.onSelectFilter,
    required this.isCallBackFilter,
  }) : super(key: key);

  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  bool callBackFilter = false;
  bool callBack = false;

  String strName = "";
  String strGender = "";
  String strWing = "";
  String strSchoolYear = "";
  String strCenter = "";
  String strRegion = "";
  String gender = "gender";
  String male = "1";
  String female = "0";
  List<WingF?>? wing = [];
  List<WingF?>? wingItems = [];
  WingF? selectedWing;
  List<SchoolYear?>? schoolYear = [];
  SchoolYear? selectedSchoolYear;
  List<CenterF?>? center = [];
  List<CenterF?>? _centersItems = [];
  List<UserGroup?> _userGroup = [];
  CenterF? selectedCenter;
  UserGroup? selectedUserGroup;
  List<Region?>? region = [];
  Region? selectedRegion;
  TextEditingController _userId = TextEditingController();

  TextEditingController _firstName = TextEditingController();

  TextEditingController _middleName = TextEditingController();

  TextEditingController _lastName = TextEditingController();
  TextEditingController _emailAddress = TextEditingController();
  bool textSearch = false;

  findCenter() {
    if (selectedRegion != null) {
      _centersItems?.clear();
      for (int v = 0; v < center!.length; v++) {
        if (selectedRegion!.id == int.parse(center![v]!.RegionId)) {
          _centersItems?.add(center![v]!);
        }
      }
    }
  }

  findWing() {
    wingItems?.clear();
    if (gender == "1") {
      for (int v = 0; v < wing!.length; v++) {
        // TODO:male value change like  1 or 0
        if ("male" == wing![v]!.gender) {
          wingItems?.add(wing![v]!);
        }
      }
    } else if (gender == "0") {
      for (int v = 0; v < wing!.length; v++) {
        if ("female" == wing![v]!.gender) {
          wingItems?.add(wing![v]!);
        }
      }
    }
  }

  @override
  void initState() {
    super.initState();
    // callBackFilter = widget.isCallBackFilter;
    /*_showLoadingIndicator();*/
    //DUE TO RESPONSE COMING FROM RECORD SCREEN
    /*BlocProvider.of<CollectFiltersBloc>(context).add(CollectFiltersEvent.collectFilters());*/
    final paramsBloc = BlocProvider.of<ParamsBloc>(context).state;
    if (paramsBloc is SelectedFiltersState) {
      strRegion = paramsBloc.strRegion;
      strCenter = paramsBloc.strCenter;
      strWing = paramsBloc.strWing;
      strSchoolYear = paramsBloc.strSchoolYear;
    }
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<RecordBloc>(context).state.maybeWhen(
        loadRecord: (recordModel, l) {
          if (recordModel != null) {
            gender = recordModel.filter!.selected_filter.gender.toString();

            wing = recordModel.filter!.wing;
            final wingIndex =
                wing!.indexWhere((element) => element!.id.toString() == recordModel.filter!.selected_filter.wing);
            if (wingIndex >= 0) {
              selectedWing = wing![wingIndex]!;
            }

            schoolYear = recordModel.filter!.school_year;
            final schoolYearIndex = schoolYear!
                .indexWhere((element) => element!.id.toString() == recordModel.filter!.selected_filter.school_year);
            if (schoolYearIndex >= 0) {
              selectedSchoolYear = schoolYear![schoolYearIndex]!;
            }

            center = recordModel.filter!.center;
            final centerIndex =
                center!.indexWhere((element) => element!.id.toString() == recordModel.filter!.selected_filter.center);
            if (centerIndex >= 0) {
              selectedCenter = center![centerIndex]!;
            }

            _userGroup = recordModel.filter!.user_group;
            final userGroupIndex = _userGroup.indexWhere(
                (element) => element!.group_name.toString() == recordModel.filter!.selected_filter.user_group);
            if (userGroupIndex >= 0) {
              selectedUserGroup = _userGroup[userGroupIndex]!;
            }

            region = recordModel.filter!.region;
            final regionIndex =
                region!.indexWhere((element) => element!.id.toString() == recordModel.filter!.selected_filter.region);
            if (regionIndex >= 0) {
              selectedRegion = region![regionIndex]!;
            }
          }
        },
        orElse: () {});

    findCenter();
    findWing();

    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return SizedBox(
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
                          style: TextStyle(
                            fontSize: 16.2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  CupertinoButton(
                    onPressed: () {
                      BlocProvider.of<ParamsBloc>(context).add(
                        SelectedFiltersValue(
                            Utils().nullSafeString(gender),
                            selectedWing != null
                                ? Utils().nullSafeString(
                                    selectedWing!.id.toString(),
                                  )
                                : "",
                            selectedSchoolYear != null
                                ? Utils().nullSafeString(
                                    selectedSchoolYear!.id.toString(),
                                  )
                                : "",
                            selectedCenter != null
                                ? Utils().nullSafeString(
                                    selectedCenter!.id.toString(),
                                  )
                                : "",
                            selectedRegion != null
                                ? Utils().nullSafeString(
                                    selectedRegion!.id.toString(),
                                  )
                                : ""),
                      );

                      if (callBackFilter) {
                        widget.onSelectFilter(
                          callBackFilter,
                          strName,
                          gender,
                          selectedWing?.id.toString() ?? "",
                          selectedSchoolYear?.id.toString() ?? "",
                          selectedCenter?.id.toString() ?? "",
                          selectedRegion?.id.toString() ?? "",
                          selectedUserGroup?.group_name ?? "",
                        );
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
                padding: EdgeInsets.only(left: 14.4),
                child: Text(
                  "Filters",
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
                            "Gender",
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Divider(
                          thickness: 1,
                        ),
                        SizedBox(
                          height: 10.8,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              callBackFilter = true;
                              gender = male;
                              findWing();
                            });
                          },
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 14.4, right: 7.2),
                                padding: EdgeInsets.all(1.44),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                  border: Border.all(color: (gender == male) ? Colors.blue : Colors.grey, width: 1.44),
                                ),
                                child: Icon(
                                  Icons.done,
                                  color: (gender == male) ? Colors.blue : Colors.grey,
                                  size: 10.8,
                                ),
                              ),
                              Text(
                                "Male",
                                style: TextStyle(fontSize: 14.4, color: (gender == male) ? Colors.blue : Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 7.32,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              callBackFilter = true;
                              gender = female;
                              selectedWing = null;
                              findWing();
                            });
                          },
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 14.4, right: 7.2),
                                padding: EdgeInsets.all(1.44),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                  border:
                                      Border.all(color: (gender == female) ? Colors.blue : Colors.grey, width: 1.44),
                                ),
                                child: Icon(
                                  Icons.done,
                                  color: (gender == female) ? Colors.blue : Colors.grey,
                                  size: 10.8,
                                ),
                              ),
                              Text(
                                "Female",
                                style: TextStyle(fontSize: 14.4, color: (gender == female) ? Colors.blue : Colors.grey),
                              ),
                            ],
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
                            width: 100,
                            decoration:
                                BoxDecoration(color: Color(0xffF2F2F2), borderRadius: BorderRadius.circular(3.6)),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<WingF>(
                                hint: const Text('  Choose Wing'),
                                isExpanded: true,
                                value: selectedWing,
                                style: TextStyle(fontSize: 14.4, color: Colors.black),
                                icon: Icon(
                                  Icons.keyboard_arrow_down,
                                  size: 21.6,
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    callBackFilter = true;
                                    selectedWing = value!;
                                  });
                                },
                                items: wingItems!.map(
                                  (wingItem) {
                                    return DropdownMenuItem(
                                      child: Padding(
                                        padding: EdgeInsets.all(
                                          7.2,
                                        ),
                                        child: Text(wingItem!.wingName),
                                      ),
                                      value: wingItem,
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
                            decoration: BoxDecoration(
                              color: Color(0xffF2F2F2),
                              borderRadius: BorderRadius.circular(3.6),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<SchoolYear>(
                                hint: const Text('  Choose School Year'),
                                isExpanded: true,
                                style: TextStyle(fontSize: 14.4, color: Colors.black),
                                icon: Icon(
                                  Icons.keyboard_arrow_down,
                                  size: 21.6,
                                ),
                                value: selectedSchoolYear,
                                onChanged: (value) {
                                  setState(() {
                                    callBackFilter = true;

                                    selectedSchoolYear = value!;
                                  });
                                },
                                items: schoolYear!.map(
                                  (schoolYear) {
                                    return DropdownMenuItem(
                                      child: Padding(
                                        padding: EdgeInsets.all(
                                          7.2,
                                        ),
                                        child: Text(schoolYear!.school_display_name),
                                      ),
                                      value: schoolYear,
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
                          padding: EdgeInsets.only(left: 10.8, right: 14.4),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xffF2F2F2),
                              borderRadius: BorderRadius.circular(
                                3.6,
                              ),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<Region>(
                                hint: const Text('  Choose Region'),
                                isExpanded: true,
                                value: selectedRegion,
                                style: TextStyle(fontSize: 14.4, color: Colors.black),
                                icon: Icon(
                                  Icons.keyboard_arrow_down,
                                  size: 21.6,
                                ),
                                onChanged: (value) {
                                  setState(
                                    () {
                                      callBackFilter = true;
                                      selectedRegion = value!;
                                      selectedCenter = null;
                                      findCenter();
                                    },
                                  );
                                  //   _centersItems = [];
                                },
                                items: region!.map((regionItem) {
                                  return DropdownMenuItem(
                                    child: Padding(
                                      padding: EdgeInsets.all(
                                        7.2,
                                      ),
                                      child: Text(regionItem!.RegionName),
                                    ),
                                    value: regionItem,
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
                              child: DropdownButton<CenterF>(
                                hint: Text(
                                  '  Choose Center',
                                ),
                                isExpanded: true,
                                style: TextStyle(fontSize: 14.4, color: Colors.black),
                                icon: Icon(
                                  Icons.keyboard_arrow_down,
                                  size: 21.6,
                                ),
                                value: selectedCenter,
                                onChanged: (value) {
                                  setState(
                                    () {
                                      callBackFilter = true;
                                      selectedCenter = value!;
                                    },
                                  );
                                },
                                items: _centersItems!.map(
                                  (centerItem) {
                                    return DropdownMenuItem(
                                      child: Padding(
                                        padding: EdgeInsets.all(
                                          7.2,
                                        ),
                                        child: Text(centerItem!.CenterName),
                                      ),
                                      value: centerItem,
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
                            width: 100,
                            decoration:
                                BoxDecoration(color: Color(0xffF2F2F2), borderRadius: BorderRadius.circular(3.6)),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<UserGroup>(
                                hint: const Text('  Choose Wing'),
                                isExpanded: true,
                                value: selectedUserGroup,
                                style: TextStyle(fontSize: 14.4, color: Colors.black),
                                icon: Icon(
                                  Icons.keyboard_arrow_down,
                                  size: 21.6,
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    callBackFilter = true;
                                    selectedUserGroup = value!;
                                  });
                                },
                                items: _userGroup.map(
                                  (userItem) {
                                    return DropdownMenuItem(
                                      child: Padding(
                                        padding: EdgeInsets.all(
                                          7.2,
                                        ),
                                        child: Text(
                                          userItem?.group_name ?? "",
                                        ),
                                      ),
                                      value: userItem,
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
                                controller: _userId,
                              ),
                            ],
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
                                controller: _firstName,
                              ),
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
                                controller: _middleName,
                              ),
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
                                controller: _lastName,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 18.3,
                        ),
                        SizedBox(
                          height: 18.3,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 14.4, right: 14.4),
                          child: Text(
                            "Email Address",
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
                                controller: _emailAddress,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 18.3,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom,
                          ),
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
