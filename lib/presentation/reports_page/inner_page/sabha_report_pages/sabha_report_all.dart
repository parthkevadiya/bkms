import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_app/Bloc/sabha_report_bloc.dart';
import 'package:flutter_app/presentation/bloc/bloc.dart';
import 'package:flutter_app/presentation/bloc/params_bloc.dart';
import 'package:flutter_app/presentation/bloc/params_state.dart';
import 'package:flutter_app/presentation/reports_page/inner_page/sabha_report.dart';
import 'package:flutter_app/presentation/reports_page/inner_page/sabha_report_pages/sabha_attendance_report.dart';
import 'package:flutter_app/presentation/reports_page/inner_page/sabha_report_pages/sabha_questions_report.dart';
import 'package:flutter_app/utils/constant.dart';
import 'package:flutter_app/utils/util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../../loader.dart';

class SabhaReportAll extends StatefulWidget {
  static String id = "sabhaReportAll";
  static String path = "${SabhaReport.path}/$id";
  final bool route;
  SabhaReportAll({required this.route});

  @override
  _SabhaReportAllState createState() => _SabhaReportAllState();
}

class _SabhaReportAllState extends State<SabhaReportAll> with TickerProviderStateMixin {
  TabController? tabController;
  double _questionsCurrentProgress = 0;
  double _totalProgress = 1.0;

  String _strSabhaReportId = "";
  String _strSabhaDate = "";
  String _strWingId = "";
  String _strCenterId = "";
  String _strRegionId = "";
  String _strSabhaLabel = "";

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
    tabController = TabController(length: 2, vsync: this);
    super.initState();

    final paramsBloc = BlocProvider.of<ParamsBloc>(context).state;
    if (paramsBloc is SabhaReportDetailsState) {
      _strSabhaReportId = paramsBloc.strSabhaReportId;
      _strSabhaDate = paramsBloc.strSabhaDate;
      _strWingId = paramsBloc.strWing;
      _strCenterId = paramsBloc.strCenter;
      _strRegionId = paramsBloc.strRegion;
      _strSabhaLabel = paramsBloc.strSabhaLabel;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<ParamsBloc, ParamsState>(
          listener: (context, state) {
            if (state is SabhaQuestionsProgressState) {
              setState(() {
                _hideLoadingIndicator();
                _questionsCurrentProgress = state.progress;
              });
            }
          },
        ),
      ],
      child: Stack(children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  end: Alignment.topCenter,
                  begin: Alignment.bottomCenter,
                  colors: <Color>[
                    Color(0xffFFFBEF),
                    Color(0xffFFF5F5),
                    Color(0xffEFF9FF),
                  ],
                ),
              ),
              child: SafeArea(
                left: false,
                bottom: false,
                right: false,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 14.4,
                    right: 14.4,
                    bottom: 18,
                  ),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (widget.route) {
                            BlocProvider.of<ParamsBloc>(context).add(
                              UpdateDashBoardEvent(true),
                            );
                          } else {
                            BlocProvider.of<SabhaReportBloc>(context).add(
                              SabhaReportEvent.loadSabhaReports(context, 1, 50, 0, "", "", "", "", "", "", ""),
                            );
                          }
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                            bottom: 10.8,
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.arrow_back_ios,
                                size: 21.6,
                                color: Colors.lightBlue,
                              ),
                              Text(
                                "Back",
                                style: TextStyle(fontSize: 14.4, color: Colors.lightBlue),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Flexible(
                                  child: Text(
                                    Utils().changeDateFormatString(
                                        _strSabhaDate, Constant.defaultDateFormat, "MMMM dd, yyyy"),
                                    style: TextStyle(fontSize: 28.08, fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              _strSabhaLabel,
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 16.2,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.98,
            ),
            LinearPercentIndicator(
              linearGradient: (_questionsCurrentProgress == _totalProgress)
                  ? LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xff6FCF97), Color(0xff6FCF97)])
                  : LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [
                      Color(0xffFFDADA),
                      Color(0xffFFC592),
                    ]),
              padding: EdgeInsets.only(left: 18, right: 18),
              width: 360,
              lineHeight: 10.98,
              percent: _questionsCurrentProgress,
              backgroundColor: Colors.grey[200],
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 3.6,
                left: 14.4,
                right: 14.4,
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.menu,
                    color: Colors.grey[400],
                    size: 25.2,
                  ),
                  Expanded(
                    child: Text(
                      "  " + (_questionsCurrentProgress * 100).toInt().toString() + "%" + " Complete",
                      style: TextStyle(
                          color: (_questionsCurrentProgress == _totalProgress) ? Colors.green : Colors.orange,
                          fontSize: 14.4),
                    ),
                  ),
                  SizedBox(
                    width: 72,
                  ),
                  Expanded(
                      child: Text(
                    SabhaQuectionReport.updateTime,
                    style: TextStyle(fontSize: 10.8),
                  )),
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  width: 194.4,
                  child: TabBar(
                    physics: NeverScrollableScrollPhysics(),
                    onTap: (index) {},
                    indicatorSize: TabBarIndicatorSize.label,
                    unselectedLabelColor: Color(0xFF4F4F4F),
                    controller: tabController,
                    labelColor: Colors.lightBlue,
                    tabs: [
                      Tab(
                        child: Container(
                          child: Text(
                            "Questions",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 10.8,
                            ),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          child: Text(
                            "Attendance",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 10.8,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Divider(
              height: 0,
            ),
            Expanded(
              child: Stack(
                children: [
                  TabBarView(
                    controller: tabController,
                    children: [
                      SabhaQuectionReport(
                        _strSabhaReportId,
                        _strSabhaDate,
                        _strWingId,
                        _strCenterId,
                        _strRegionId,
                        _strSabhaLabel,
                      ),
                      SabhaAttendanceReport(
                        _strSabhaReportId,
                        _strSabhaDate,
                        _strWingId,
                        _strCenterId,
                        _strRegionId,
                        _strSabhaLabel,
                      ),
                    ],
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
