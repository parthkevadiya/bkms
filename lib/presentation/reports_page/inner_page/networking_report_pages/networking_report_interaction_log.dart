import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_app/Bloc/view_networking_report_list_bloc.dart';
import 'package:flutter_app/models/networking_interaction_log_model.dart';
import 'package:flutter_app/models/view_network_report_list_model.dart';
import 'package:flutter_app/presentation/bloc/bloc.dart';
import 'package:flutter_app/presentation/bloc/params_bloc.dart';
import 'package:flutter_app/presentation/bloc/params_state.dart';
import 'package:flutter_app/utils/constant.dart';
import 'package:flutter_app/utils/login_status.dart';
import 'package:flutter_app/utils/util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:vrouter/vrouter.dart';
import '../../../../loader.dart';
import '../../networking_report_model.dart';
import 'networking_report_details.dart';
import 'networking_report_interaction_details.dart';

class NetworkingReportInteractionLog extends StatefulWidget {
  static String id = "networkingReportInteractionLog";
  static String path = "${NetworkingReportDetails.path}/$id";

  @override
  _NetworkingReportInteractionLogState createState() => _NetworkingReportInteractionLogState();
}

class _NetworkingReportInteractionLogState extends State<NetworkingReportInteractionLog> with TickerProviderStateMixin {
  List<InteractionLogDataModel?>? _interactionLogDataItems = [];
  List<InteractionLogDataModel?>? _allReports = [];

  NetworkReportListDataModel? _networkReportListDataModel;
  NetworkingListDataModel? _networkingListDataModel;
  NetworkingInteractionLogModel? _networkingInteractionLogModel;
  //FOR PAGINATION
  int pageKey = 1;
  bool loading = true;

  static const _pageSize = 50;
  final RefreshController _scrollController = RefreshController();

  bool _isLoading = false;
  bool _needToUpdateDashboardReports = false;

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
    uId,
    pageKey,
    page,
  ) {
    if (pageKey == 1) {
      _interactionLogDataItems = [];
    }

    BlocProvider.of<ViewNetworkingReportBloc>(context).add(ViewNetworkingReportEvent.networkingInteractionLog(
      context,
      id,
      uId,
      pageKey,
      page,
    ));
  }

  @override
  void initState() {
    final paramsBloc = BlocProvider.of<ParamsBloc>(context).state;
    if (paramsBloc is NetworkingReportDetailsState) {
      _networkReportListDataModel = paramsBloc.networkReportListDataModel;
      _networkingListDataModel = paramsBloc.networkingListDataModel;
    }
    //FOR ADD SELECTED REPORT-ID
    BlocProvider.of<ParamsBloc>(context)
        .add(NetworkingReportDetailsEvent(_networkReportListDataModel!, _networkingListDataModel, null));
    //FOR GET NETWORKING LIST
    BlocProvider.of<ViewNetworkingReportBloc>(context).add(ViewNetworkingReportEvent.networkingInteractionLog(
      context,
      Utils().nullSafeString(_networkReportListDataModel!.id),
      Utils().nullSafeString(_networkingListDataModel!.user_id),
      "$pageKey",
      "$_pageSize",
    ));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<ViewNetworkingReportBloc, ViewNetworkingReportState>(
          listener: (context, state) {
            state.maybeWhen(
                networkingInteractionLog: (networkingInteractionLogModel, l) {
                  if (l == LoadingStatus.Done) {
                    _interactionLogDataItems!.clear();
                    _hideLoadingIndicator();
                    if (networkingInteractionLogModel != null &&
                        networkingInteractionLogModel.interaction_log_list != null) {
                      _networkingInteractionLogModel = networkingInteractionLogModel;
                      if (_networkingInteractionLogModel!.interaction_log_list!.data!.length == _allReports!.length) {
                        setState(() {
                          loading = false;
                        });
                      } else {
                        _scrollController.loadComplete();
                      }
                      final allRecords = _networkingInteractionLogModel!.interaction_log_list!.data;
                      _allReports = allRecords!
                          .map(
                            (e) => InteractionLogDataModel.fromJson(
                              jsonDecode(
                                jsonEncode(e),
                              ),
                            ),
                          )
                          .toList();
                      _interactionLogDataItems!.clear();
                      _interactionLogDataItems!.addAll(
                        List.from(
                          allRecords
                              .map(
                                (e) => InteractionLogDataModel.fromJson(
                                  jsonDecode(
                                    jsonEncode(e),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      );
                    } else {
                      _hideLoadingIndicator();
                    }
                  } else if (l == LoadingStatus.Error) {
                    setState(() {
                      _hideLoadingIndicator();
                      _interactionLogDataItems!.clear();
                    });
                  }
                },
                orElse: () {});
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
                    bottom: 21.6,
                  ),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          //FOR ADD STATUS FOR UPDATE REPORTS
                          BlocProvider.of<ParamsBloc>(context).add(UpdateDashBoardEvent(_needToUpdateDashboardReports));
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
                                    "Networking Report",
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
                              Utils().nullSafeString(_networkingListDataModel!.user_name) + "'s Interaction Log",
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
            Flexible(
              child: Stack(
                children: [
                  if (_interactionLogDataItems!.isEmpty)
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
                              CommonMessage.report,
                              style: TextStyle(color: const Color(0xFF828282), fontSize: 12.6),
                            )
                          ],
                        ),
                      ),
                    ),
                  SmartRefresher(
                    enablePullDown: false,
                    enablePullUp: loading,
                    onLoading: () {
                      pageKey++;
                      onRefresh(
                        context,
                        Utils().nullSafeString(_networkReportListDataModel!.id),
                        Utils().nullSafeString(_networkingListDataModel!.user_id),
                        "$pageKey",
                        "$_pageSize",
                      );
                    },
                    header: const WaterDropMaterialHeader(),
                    controller: _scrollController,
                    child: ListView.builder(
                        padding: EdgeInsets.zero,
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: _interactionLogDataItems?.length,
                        itemBuilder: (context, index) => Padding(
                              padding: EdgeInsets.only(left: 18, right: 18),
                              child: Row(
                                children: [
                                  Flexible(
                                    child: GestureDetector(
                                      onTap: () {
                                        //FOR ADD SELECTED REPORT-ID
                                        BlocProvider.of<ParamsBloc>(context).add(NetworkingReportDetailsEvent(
                                            _networkReportListDataModel!,
                                            _networkingListDataModel,
                                            _interactionLogDataItems![index]));
                                        VRouter.of(context).to(NetworkingReportInteractionDetails.id);
                                      },
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(top: 7.2, bottom: 7.2, right: 7.2),
                                            child: Row(
                                              children: [
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      Utils()
                                                          .nullSafeString(_interactionLogDataItems![index]!.event_name),
                                                      style: TextStyle(
                                                          fontSize: 16.2,
                                                          color: Color(0xFF4F4F4F),
                                                          fontWeight: FontWeight.bold),
                                                    ),
                                                    Text(
                                                      "Interactions Type: " +
                                                          Utils().nullSafeString(
                                                              _interactionLogDataItems![index]!.interaction_type),
                                                      style: TextStyle(color: Color(0xFF828282), fontSize: 13.68),
                                                    ),
                                                    Text(
                                                      "Interactions Date: " +
                                                          Utils().changeDateFormatString(
                                                              Utils().nullSafeString(
                                                                  _interactionLogDataItems![index]!.interaction_date),
                                                              Constant.defaultDateFormatWeb,
                                                              "dd MMMM yyyy"),
                                                      style: TextStyle(color: Color(0xFF828282), fontSize: 13.68),
                                                    ),
                                                    Text(
                                                      "Reported By: " +
                                                          Utils()
                                                              .nullSafeString(_interactionLogDataItems![index]!.name) +
                                                          " (" +
                                                          Utils().nullSafeString(
                                                              _interactionLogDataItems![index]!.reportdate) +
                                                          ")",
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
                                  ),
                                ],
                              ),
                            )),
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

  //region FOR GET FIRST STAGE MARGIN
  double getFirstStageMargin(String value) {
    double margin = 0.0;
    if (value.isNotEmpty) {
      margin = 7.32;
    }
    return margin;
  }
  //endregion

  //region FOR GET SECOND STAGE MARGIN
  double getSecondStageMargin(String value) {
    double margin = 7.32;
    if (value.isNotEmpty) {
      margin = 21.96;
    }
    return margin;
  }
//endregion

  //region FOR GET THIRD STAGE MARGIN
  double getThirdStageMargin(String value) {
    double margin = 21.96;
    if (value.isNotEmpty) {
      margin = 36.6;
    }
    return margin;
  }
  //endregion
}
