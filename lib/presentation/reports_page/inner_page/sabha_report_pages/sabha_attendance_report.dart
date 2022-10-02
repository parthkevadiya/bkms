import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/sabha_report_attendance_model.dart';
import 'package:flutter_app/utils/constant.dart';
import 'package:flutter_app/utils/login_status.dart';
import 'package:flutter_app/utils/util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../Bloc/sabha_report_question_bloc.dart';
import '../../../../loader.dart';

class SabhaAttendanceReport extends StatefulWidget {
  const SabhaAttendanceReport(
      this.strSabhaReportId, this.strSabhaDate, this.strWingId, this.strCenterId, this.strRegionId, this.strSabhaLabel,
      {Key? key})
      : super(key: key);

  final String strSabhaReportId;
  final String strSabhaDate;
  final String strWingId;
  final String strCenterId;
  final String strRegionId;
  final String strSabhaLabel;

  @override
  _SabhaAttendanceReportState createState() => _SabhaAttendanceReportState();
}

class _SabhaAttendanceReportState extends State<SabhaAttendanceReport> {
  List<DataModel?>? _sabhaAttendanceItems = [];
  List<DataModel?>? _allRecords = [];

  int _currentIndex = 0;

  //FOR PAGINATION
  bool loading = true;

  final int _pageSize = 50;
  int pageKey = 1;
  int _totalRecords = 0;
  final RefreshController _scrollController = RefreshController();

  SabhaReportAttendanceModel? _sabhaReportAttendanceModel;

  //FOR SEARCH
  TextEditingController _search = TextEditingController();
  bool _isSearching = false;
  String _searchText = "";
  bool searchByName = false;

  String _editMode = /*"1"*/ "2";

  bool _isLoading = false;
  void onRefresh(
    context,
    strSabhaReportId,
    page,
    pageSize,
    _searchText,
    strWingId,
    strCenterId,
    strRegionId,
    editMode,
  ) {
    if (pageKey == 1) {
      _sabhaAttendanceItems = [];
    }

    //FOR GET RECORDS
    BlocProvider.of<SabhaReportQuestionAttendanceBloc>(context).add(
      SabhaReportQuestionAttendanceEvent.sabhaReportAttendance(
        context,
        strSabhaReportId,
        page,
        pageSize,
        _searchText,
        strWingId,
        strCenterId,
        strRegionId,
        editMode,
      ),
    );
  }

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
    _showLoadingIndicator();
    //FOR GET SABHA REPORTS QUESTIONS
    BlocProvider.of<SabhaReportQuestionAttendanceBloc>(context)
        .add(SabhaReportQuestionAttendanceEvent.sabhaReportAttendance(
      context,
      widget.strSabhaReportId,
      pageKey,
      _pageSize,
      _searchText,
      widget.strWingId,
      widget.strCenterId,
      widget.strRegionId,
      _editMode,
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<SabhaReportQuestionAttendanceBloc, SabhaReportQuestionAttendanceState>(
          listener: (context, state) {
            state.maybeWhen(
                submitSabhaReportAttendance: (submitSabhaReportAttendanceModel, l) {
                  if (l == LoadingStatus.Done) {
                    if (submitSabhaReportAttendanceModel != null) {
                      _hideLoadingIndicator();
                      if (submitSabhaReportAttendanceModel.has_error!) {
                        _sabhaAttendanceItems![_currentIndex]!.is_present =
                            Utils().nullSafeString(_sabhaAttendanceItems![_currentIndex]!.is_present) == "1"
                                ? "0"
                                : "1";
                      }
                    } else {
                      _sabhaAttendanceItems![_currentIndex]!.is_present =
                          Utils().nullSafeString(_sabhaAttendanceItems![_currentIndex]!.is_present) == "1" ? "0" : "1";
                    }
                  } else {
                    if (l == LoadingStatus.Error) {
                      setState(() {
                        _hideLoadingIndicator();
                      });
                    }
                  }
                },
                orElse: () {});
          },
        ),
        BlocListener<SabhaReportQuestionAttendanceBloc, SabhaReportQuestionAttendanceState>(
          listener: (context, state) {
            state.maybeWhen(
                sabhaReportAttendance: (sabhaReportAttendanceModel, l) {
                  if (l == LoadingStatus.Done) {
                    _sabhaAttendanceItems!.clear();
                    _hideLoadingIndicator();
                    _totalRecords = 0;
                    if (sabhaReportAttendanceModel != null && sabhaReportAttendanceModel.attendance_result != null) {
                      _sabhaReportAttendanceModel = sabhaReportAttendanceModel;

                      _totalRecords = Utils().nullSafeInt(sabhaReportAttendanceModel.attendance_result!.total);

                      if (_sabhaReportAttendanceModel!.attendance_result!.data!.length == _allRecords!.length) {
                        setState(() {
                          loading = false;
                        });
                      } else {
                        _scrollController.loadComplete();
                      }

                      final allRecords = _sabhaReportAttendanceModel!.attendance_result!.data;
                      _allRecords = allRecords!
                          .map(
                            (e) => DataModel.fromJson(
                              jsonDecode(
                                jsonEncode(e),
                              ),
                            ),
                          )
                          .toList();

                      _sabhaAttendanceItems!.clear();
                      _sabhaAttendanceItems!.addAll(
                        List.from(
                          allRecords
                              .map(
                                (e) => DataModel.fromJson(
                                  jsonDecode(
                                    jsonEncode(e),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      );
                      if (_search.text.isEmpty) {
                        _scrollController.loadComplete();
                        //loading = false;
                      }
                    } else {
                      _hideLoadingIndicator();
                    }
                  } else if (l == LoadingStatus.Error) {
                    setState(() {
                      _hideLoadingIndicator();
                      _sabhaAttendanceItems!.clear();
                      _totalRecords = 0;
                    });
                  }
                },
                orElse: () {});
          },
        ),
      ],
      child: Stack(children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 10,
                    child: Container(
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(blurRadius: 20, color: Colors.black12),
                        ],
                      ),
                      child: TextField(
                        controller: _search,
                        onChanged: (val) {},
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue, width: 1.44),
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 10.8),
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "Search for someone",
                          hintStyle: TextStyle(fontSize: 14.4),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(5.4),
                          ),
                          prefixIcon: const Icon(
                            Icons.search,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  (searchByName == true)
                      ? Expanded(
                          flex: 2,
                          child: Container(
                            height: 45,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                    Colors.white,
                                  ),
                                ),
                                onPressed: () {
                                  _showLoadingIndicator();
                                  setState(() {
                                    searchByName = false;
                                    _search.text = "";
                                    FocusScope.of(context).requestFocus(new FocusNode());
                                  });

                                  BlocProvider.of<SabhaReportQuestionAttendanceBloc>(context).add(
                                    SabhaReportQuestionAttendanceEvent.sabhaReportAttendance(
                                      context,
                                      widget.strSabhaReportId,
                                      pageKey,
                                      _pageSize,
                                      _searchText,
                                      widget.strWingId,
                                      widget.strCenterId,
                                      widget.strRegionId,
                                      _editMode,
                                    ),
                                  );
                                },
                                child: Icon(
                                  Icons.cancel_outlined,
                                  color: Colors.black,
                                )),
                          ),
                        )
                      : Expanded(
                          flex: 2,
                          child: Container(
                            height: 45,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                    Colors.white,
                                  ),
                                ),
                                onPressed: () {
                                  setState(
                                    () {
                                      if (_search.text.isNotEmpty) {
                                        searchByName = true;
                                        _showLoadingIndicator();
                                        BlocProvider.of<SabhaReportQuestionAttendanceBloc>(context).add(
                                          SabhaReportQuestionAttendanceEvent.sabhaReportAttendance(
                                            context,
                                            widget.strSabhaReportId,
                                            pageKey,
                                            _pageSize,
                                            _search.text,
                                            widget.strWingId,
                                            widget.strCenterId,
                                            widget.strRegionId,
                                            _editMode,
                                          ),
                                        );
                                      }
                                    },
                                  );
                                },
                                child: Icon(
                                  Icons.search,
                                  color: Colors.black,
                                )),
                          ),
                        ),
                ],
              ),
            ),
            Divider(
              height: 0.0,
            ),
            // SabhaAttendanceReportNode(),
            Flexible(
              child: Stack(
                children: [
                  if (_sabhaAttendanceItems!.isEmpty)
                    Center(
                      child: Container(
                        margin: EdgeInsets.all(
                          9,
                        ),
                        padding: EdgeInsets.all(9),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF3F3F3),
                          borderRadius: BorderRadius.circular(5.4),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.cancel_outlined,
                              size: 14.4,
                            ),
                            SizedBox(
                              width: 7.2,
                            ),
                            Text(
                              CommonMessage.sabhaReportAttendance,
                              style: TextStyle(color: const Color(0xFF828282), fontSize: 12.6),
                            )
                          ],
                        ),
                      ),
                    ),
                  SmartRefresher(
                    onLoading: () {
                      pageKey++;
                      onRefresh(
                        context,
                        widget.strSabhaReportId,
                        pageKey,
                        _pageSize,
                        _searchText,
                        widget.strWingId,
                        widget.strCenterId,
                        widget.strRegionId,
                        _editMode,
                      );
                    },
                    enablePullDown: false,
                    enablePullUp: loading,
                    header: const WaterDropMaterialHeader(),
                    controller: _scrollController,
                    child: ListView.builder(
                      itemCount:
                          (_sabhaAttendanceItems?.length ?? 0) + ((loading) ? 0 : 1) /*_sabhaAttendanceItems?.length*/,
                      itemBuilder: (context, index) {
                        return (_sabhaAttendanceItems!.length == index && loading == false)
                            ? SizedBox(
                                height: 50,
                              )
                            : Padding(
                                padding: EdgeInsets.only(left: 18, right: 18),
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        if (Utils()
                                            .nullSafeString(_sabhaAttendanceItems![index]!.is_present)
                                            .isNotEmpty) {
                                          setState(() {
                                            _currentIndex = index;
                                            _sabhaAttendanceItems![index]!.is_present =
                                                Utils().nullSafeString(_sabhaAttendanceItems![index]!.is_present) == "1"
                                                    ? "0"
                                                    : "1";

                                            //FOR SUBMIT SABHA ATTENDANCE
                                            _showLoadingIndicator();
                                            BlocProvider.of<SabhaReportQuestionAttendanceBloc>(context)
                                                .add(SabhaReportQuestionAttendanceEvent.submitSabhaReportAttendance(
                                              context,
                                              widget.strSabhaReportId,
                                              Utils().nullSafeString(_sabhaAttendanceItems![index]!.user_id),
                                              Utils().nullSafeString(_sabhaAttendanceItems![index]!.is_present) == "1"
                                                  ? "present"
                                                  : "absent",
                                              Utils().nullSafeString(_sabhaAttendanceItems![index]!.user_group_name),
                                              Utils().nullSafeString(_sabhaAttendanceItems![index]!.wing_name),
                                              Utils()
                                                  .nullSafeString(_sabhaAttendanceItems![index]!.user_school_year_name),
                                            ));
                                          });
                                        }
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(
                                          right: 10.8,
                                        ),
                                        padding: EdgeInsets.all(
                                          1.62,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(3.6),
                                          border: Border.all(
                                              color:
                                                  (Utils().nullSafeString(_sabhaAttendanceItems![index]!.is_present) ==
                                                          "1")
                                                      ? Colors.green
                                                      : (Utils()
                                                              .nullSafeString(_sabhaAttendanceItems![index]!.is_present)
                                                              .isNotEmpty
                                                          ? Colors.grey
                                                          : Colors.white),
                                              width: 1.44),
                                        ),
                                        child: Icon(
                                          Icons.done,
                                          color:
                                              (Utils().nullSafeString(_sabhaAttendanceItems![index]!.is_present) == "1")
                                                  ? Colors.green
                                                  : Colors.white,
                                          size: 10.8,
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(top: 10.8, bottom: 7.2, right: 7.2),
                                            child: Row(
                                              children: [
                                                // CircleAvatar(
                                                //   backgroundImage:
                                                //       NetworkImage(Constant
                                                //           .defaultPlaceholderImage),
                                                //   radius: ScreenSize.width *
                                                //       0.075,
                                                // ),
                                                SizedBox(
                                                  width: 12.6,
                                                ),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      Utils().nullSafeString(
                                                          /*isForSearch()? _searchItems![index]!.name:*/ _sabhaAttendanceItems![
                                                                  index]!
                                                              .name),
                                                      style: TextStyle(
                                                          fontSize: 16.2,
                                                          color: Color(0xFF4F4F4F),
                                                          fontWeight: FontWeight.bold),
                                                    ),
                                                    Text(
                                                      Utils().nullSafeWithDefaultString(
                                                          /*isForSearch()? _searchItems![index]!.email:*/ _sabhaAttendanceItems![
                                                                  index]!
                                                              .email,
                                                          "Email Id"),
                                                      style: TextStyle(color: Color(0xFF828282), fontSize: 13.68),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Divider(
                                            height: 7.32,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Container(child: _isLoading ? Loader(loadingTxt: 'Please wait...') : Container())
      ]),
    );
  }
}
