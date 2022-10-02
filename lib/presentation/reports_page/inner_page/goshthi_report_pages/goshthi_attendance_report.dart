import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/goshthi_report_attendance_model.dart';
import 'package:flutter_app/presentation/bloc/params_bloc.dart';
import 'package:flutter_app/presentation/bloc/params_event.dart';
import 'package:flutter_app/utils/login_status.dart';
import 'package:flutter_app/utils/util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../Bloc/goshthi_data_update_bloc.dart';
import '../../../../Bloc/goshthi_report_attendance_bloc.dart';
import '../../../../loader.dart';

class GoshthiAttendanceReport extends StatefulWidget {
  const GoshthiAttendanceReport(this.karyakar_goshti_sabha_id, this.strSabhaDate, this.strWing, this.strCenter,
      this.strRegion, this.strSabhaLabel, this.strGender,
      {Key? key})
      : super(key: key);

  final String karyakar_goshti_sabha_id;
  final String strSabhaDate;
  final String strWing;
  final String strCenter;
  final String strRegion;
  final String strSabhaLabel;
  final String strGender;

  @override
  _GoshthiAttendanceReportState createState() => _GoshthiAttendanceReportState();
}

class _GoshthiAttendanceReportState extends State<GoshthiAttendanceReport> {
  List<GoshthiAttendanceDataModel?>? _goshthiAttendanceItems = [];
  List<GoshthiAttendanceDataModel?>? _allReports = [];

  int _currentIndex = 0;
  GoshthiReportAttendanceModel? _goshthiReportAttendanceModel;
  final RefreshController _scrollController = RefreshController();
  ScrollController _scrollControllerList = ScrollController();

  //FOR PAGINATION
  int _currentPage = 1;
  static const _pageSize = 50;
  int _totalRecords = 0;
  bool loading = true;
  //FOR SEARCH
  TextEditingController _search = TextEditingController();
  String _searchText = "";

  String _checkFilter = /*"1"*/ "2";

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

  void onRefresh(
    context,
    id,
    page,
    pageSize,
    _searchText,
    strWing,
    strCenter,
    strRegion,
    _checkFilter,
    strGender,
    String text,
  ) {
    if (_currentPage == 1) {
      _goshthiAttendanceItems = [];
    }

    //FOR GET RECORDS
    BlocProvider.of<GoshthiReportAttendanceBloc>(context).add(GoshthiReportAttendanceEvent.goshthiReportAttendance(
      context,
      id,
      page,
      pageSize,
      _searchText,
      strWing,
      strCenter,
      strRegion,
      _checkFilter,
      strGender,
    ));
  }

  @override
  void initState() {
    _checkFilter = /*"1"*/ "2";

    //FOR GET GOSHTHI REPORTS QUESTIONS
    BlocProvider.of<GoshthiReportAttendanceBloc>(context).add(GoshthiReportAttendanceEvent.goshthiReportAttendance(
      context,
      widget.karyakar_goshti_sabha_id,
      "$_currentPage",
      "$_pageSize",
      _searchText,
      widget.strWing,
      widget.strCenter,
      widget.strRegion,
      _checkFilter,
      widget.strGender,
    ));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<GoshthiDataUpdateBloc, GoshthiDataUpdateState>(
          listener: (context, state) {
            _hideLoadingIndicator();

            state.maybeWhen(
                submitGoshthiReportAttendance: (submitGoshthiReportAttendanceModel, l) {
                  if (l == LoadingStatus.Done) {
                    if (submitGoshthiReportAttendanceModel != null) {
                      if (submitGoshthiReportAttendanceModel.has_error!) {
                        _goshthiAttendanceItems![_currentIndex]!.status =
                            Utils().nullSafeString(_goshthiAttendanceItems![_currentIndex]!.status) == "present"
                                ? "absent"
                                : "present";
                      }
                    } else {
                      _goshthiAttendanceItems![_currentIndex]!.status =
                          Utils().nullSafeString(_goshthiAttendanceItems![_currentIndex]!.status) == "present"
                              ? "absent"
                              : "present";
                    }

                    //UPDATE ATTENDANCE LIST BIN PARAMS BLOC FOR USE IN UPDATE GOSHTHI HELD STATUS
                    BlocProvider.of<ParamsBloc>(context)
                        .add(UpdateGoshthiAttendanceEvent(_goshthiAttendanceItems!, _totalRecords));
                  } else {
                    if (l == LoadingStatus.Error) {
                      setState(() {
                        _hideLoadingIndicator();
                        _goshthiAttendanceItems!.clear();
                        _totalRecords = 0;
                      });
                    }
                  }
                },
                orElse: () {});
          },
        ),
        BlocListener<GoshthiReportAttendanceBloc, GoshthiReportAttendanceState>(
          listener: (context, state) {
            _hideLoadingIndicator();

            state.maybeWhen(
                goshthiReportAttendance: (goshthiReportAttendanceModel, l) {
                  if (l == LoadingStatus.Done) {
                    _goshthiAttendanceItems!.clear();
                    _hideLoadingIndicator();
                    _totalRecords = 0;
                    if (goshthiReportAttendanceModel != null &&
                        goshthiReportAttendanceModel.attendance_result!.data != null) {
                      _goshthiReportAttendanceModel = goshthiReportAttendanceModel;
                      _totalRecords = Utils().nullSafeInt(_goshthiReportAttendanceModel!.attendance_result!.total);
                      if (_currentPage == 1) {
                        _allReports!.clear();
                      }
                      if (_goshthiReportAttendanceModel!.attendance_result!.data!.length == _allReports!.length) {
                        setState(() {
                          loading = false;
                        });
                      } else {
                        _scrollController.loadComplete();
                      }

                      final allReports = _goshthiReportAttendanceModel!.attendance_result!.data;
                      _allReports = allReports!
                          .map(
                            (e) => GoshthiAttendanceDataModel.fromJson(
                              jsonDecode(
                                jsonEncode(e),
                              ),
                            ),
                          )
                          .toList();
                      _goshthiAttendanceItems!.clear();
                      _goshthiAttendanceItems!.addAll(
                        List.from(
                          allReports
                              .map(
                                (e) => GoshthiAttendanceDataModel.fromJson(
                                  jsonDecode(
                                    jsonEncode(e),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      );
                    } else {
                      if (l == LoadingStatus.Error) {
                        setState(() {
                          _hideLoadingIndicator();
                        });
                      }
                    }
                  } else if (l == LoadingStatus.Error) {
                    setState(() {
                      _hideLoadingIndicator();
                      _goshthiAttendanceItems!.clear();
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
            Container(
              padding: EdgeInsets.only(
                left: 14.4,
                right: 14.4,
                top: 10.8,
                bottom: 10.8,
              ),
              child: TextField(
                controller: _search,
                onChanged: (val) {},
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 1.08),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 10.8),
                  fillColor: Color(0xFFF3F3F3),
                  filled: true,
                  hintText: "Search for someone",
                  hintStyle: TextStyle(fontSize: 14.4),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(7.2),
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                  ),
                ),
              ),
            ),
            Divider(
              height: 0.0,
            ),
            // SabhaAttendanceReportNode(),
            Flexible(
              child:
                  /*(*/ /*isForSearch()? _searchItems!.length == 0:*/ /* _sabhaAttendanceItems!.length == 0)
                      ? Padding(
                          padding: EdgeInsets.only(
                              left: 25.2,
                              right: 25.2,
                              top: 10.8),
                          child: Container(
                            padding: EdgeInsets.all(7.2),
                            decoration: BoxDecoration(color: Color(0xFFF3F3F3), borderRadius: BorderRadius.circular(5.4),),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.not_interested, size: 14.4,),
                                SizedBox(width: 7.2,),
                                Text("No Records found.", style: TextStyle(fontSize: 12.6),)
                              ],
                            ),
                          ),
                        )
                      :*/

                  SmartRefresher(
                header: const WaterDropMaterialHeader(),
                controller: _scrollController,
                enablePullDown: false,
                enablePullUp: loading,
                onLoading: () {
                  _currentPage++;
                  if (_search.text.isEmpty) {
                    BlocProvider.of<GoshthiReportAttendanceBloc>(context)
                        .add(GoshthiReportAttendanceEvent.goshthiReportAttendance(
                      context,
                      widget.karyakar_goshti_sabha_id,
                      "$_currentPage",
                      "$_pageSize",
                      _searchText,
                      widget.strWing,
                      widget.strCenter,
                      widget.strRegion,
                      _checkFilter,
                      widget.strGender,
                    ));
                    onRefresh(context, widget.karyakar_goshti_sabha_id, _currentPage, _pageSize, _searchText,
                        widget.strWing, widget.strCenter, widget.strRegion, _checkFilter, widget.strGender, "");
                  } else {
                    onRefresh(
                        context,
                        widget.karyakar_goshti_sabha_id,
                        _currentPage,
                        _pageSize,
                        _searchText,
                        widget.strWing,
                        widget.strCenter,
                        widget.strRegion,
                        _checkFilter,
                        widget.strGender,
                        _search.text);
                  }
                },
                child: ListView.builder(
                  controller: _scrollControllerList,
                  itemCount: (_goshthiAttendanceItems?.length ?? 0) + ((loading) ? 0 : 1),
                  itemBuilder: (context, index) {
                    return ((_goshthiAttendanceItems!.length == index && loading == false)
                        ? SizedBox(
                            height: 14.64,
                          )
                        : Padding(
                            padding: EdgeInsets.only(left: 18, right: 18),
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    if (Utils().nullSafeString(_goshthiAttendanceItems![index]!.status).isNotEmpty) {
                                      setState(() {
                                        _currentIndex = index;
                                        _goshthiAttendanceItems![index]!.status =
                                            Utils().nullSafeString(_goshthiAttendanceItems![index]!.status) == "present"
                                                ? "absent"
                                                : "present";

                                        //FOR SUBMIT GOSHTHI ATTENDANCE
                                        _showLoadingIndicator();
                                        BlocProvider.of<GoshthiDataUpdateBloc>(context)
                                            .add(GoshthiDataUpdateEvent.submitGoshthiReportAttendance(
                                          context,
                                          widget.karyakar_goshti_sabha_id,
                                          Utils().nullSafeString(_goshthiAttendanceItems![index]!.id),
                                          Utils().nullSafeString(_goshthiAttendanceItems![index]!.status) == "present"
                                              ? "present"
                                              : "absent",
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
                                          color: (Utils().nullSafeString(_goshthiAttendanceItems![index]!.status) ==
                                                  "present")
                                              ? Colors.green
                                              : (Utils()
                                                      .nullSafeString(_goshthiAttendanceItems![index]!.status)
                                                      .isNotEmpty
                                                  ? Colors.grey
                                                  : Colors.white),
                                          width: 1.44),
                                    ),
                                    child: Icon(
                                      Icons.done,
                                      color:
                                          (Utils().nullSafeString(_goshthiAttendanceItems![index]!.status) == "present")
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
                                            SizedBox(
                                              width: 12.6,
                                            ),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  Utils().nullSafeString(
                                                          /*isForSearch()? _searchItems![index]!.name:*/ _goshthiAttendanceItems![
                                                                  index]!
                                                              .FirstName) +
                                                      " " +
                                                      Utils().nullSafeString(
                                                          /*isForSearch()? _searchItems![index]!.name:*/ _goshthiAttendanceItems![
                                                                  index]!
                                                              .LastName),
                                                  style: TextStyle(
                                                      fontSize: 16.2,
                                                      color: Color(0xFF4F4F4F),
                                                      fontWeight: FontWeight.bold),
                                                ),
                                                Text(
                                                  Utils().nullSafeWithDefaultString(
                                                      /*isForSearch()? _searchItems![index]!.email:*/ _goshthiAttendanceItems![
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
                          ));
                  },
                ),
              ),
            ),
          ],
        ),
        Container(child: _isLoading ? Loader(loadingTxt: 'Please wait...') : Container())
      ]),
    );
  }
}
