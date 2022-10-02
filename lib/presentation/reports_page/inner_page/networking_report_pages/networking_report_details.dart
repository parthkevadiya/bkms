import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
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
import '../../../../Bloc/view_networking_report_list_bloc.dart';
import '../../../../loader.dart';
import '../../networking_report_model.dart';
import '../networking_report.dart';
import 'networking_report_interaction_log.dart';

class NetworkingReportDetails extends StatefulWidget {
  static String id = "networkingReportDetails";
  static String path = "${NetworkReport.path}/$id";

  @override
  _NetworkingReportDetailsState createState() => _NetworkingReportDetailsState();
}

class _NetworkingReportDetailsState extends State<NetworkingReportDetails> with TickerProviderStateMixin {
  List<NetworkingListDataModel?> _networkingListDataItems = [];
  List<NetworkingListDataModel?> _allRecords = [];
  ViewNetworkingReportListModel? _viewNetworkingReportListModel;
  NetworkReportListDataModel? _networkReportListDataModel;

  //FOR PAGINATION
  int _currentPage = 1;
  static const _pageSize = 50;
  int pageKey = 1;
  bool loading = true;

  final RefreshController _scrollController = RefreshController();

  void onRefresh(id, currentPage, pageSize) {
    _currentPage = pageKey;
    if (pageKey == 1) {
      _networkingListDataItems = [];
    }
    BlocProvider.of<ViewNetworkingReportBloc>(context).add(ViewNetworkingReportEvent.viewNetworkingReportList(
      context,
      id,
      currentPage,
      pageSize,
    ));
  }

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

  @override
  void initState() {
    final paramsBloc = BlocProvider.of<ParamsBloc>(context).state;
    if (paramsBloc is NetworkingReportDetailsState) {
      _networkReportListDataModel = paramsBloc.networkReportListDataModel;
    }
    _showLoadingIndicator();
    _networkingListDataItems.clear();
    //FOR ADD SELECTED REPORT-ID
    BlocProvider.of<ParamsBloc>(context).add(NetworkingReportDetailsEvent(_networkReportListDataModel!, null, null));

    //FOR GET NETWORKING LIST
    BlocProvider.of<ViewNetworkingReportBloc>(context).add(ViewNetworkingReportEvent.viewNetworkingReportList(
      context,
      Utils().nullSafeString(_networkReportListDataModel!.id),
      "$_currentPage",
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
                viewNetworkingReportList: (viewNetworkingReportListModel, l) {
                  if (l == LoadingStatus.Done) {
                    _networkingListDataItems.clear();
                    _hideLoadingIndicator();
                    if (viewNetworkingReportListModel != null &&
                        viewNetworkingReportListModel.networking_list != null) {
                      _viewNetworkingReportListModel = viewNetworkingReportListModel;

                      if (_viewNetworkingReportListModel!.networking_list!.data!.length == _allRecords.length) {
                        setState(() {
                          loading = false;
                        });
                      } else {
                        _scrollController.loadComplete();
                      }
                      final allRecords = _viewNetworkingReportListModel!.networking_list!.data;
                      _allRecords = allRecords!
                          .map(
                            (e) => NetworkingListDataModel.fromJson(
                              jsonDecode(
                                jsonEncode(e),
                              ),
                            ),
                          )
                          .toList();
                      _networkingListDataItems.clear();
                      _networkingListDataItems.addAll(
                        List.from(
                          allRecords
                              .map(
                                (e) => NetworkingListDataModel.fromJson(
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
                      _networkingListDataItems.clear();
                    });
                  }
                },
                orElse: () {});
          },
        ),
      ],
      child: Stack(children: [
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
                          //FOR ADD STATUS FOR UPDATE REPORTS
                          BlocProvider.of<ParamsBloc>(context).add(
                            UpdateDashBoardEvent(_needToUpdateDashboardReports),
                          );
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
                                    Utils().nullSafeString(_networkReportListDataModel!.CenterName) +
                                        "'s Networking List",
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
                              Utils().nullSafeString(_networkReportListDataModel!.reportdate),
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
                  if (_networkingListDataItems.isEmpty)
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
                        _networkReportListDataModel!.id,
                        pageKey.toString(),
                        _pageSize.toString(),
                      );
                    },
                    header: const WaterDropMaterialHeader(),
                    controller: _scrollController,
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: (_networkingListDataItems.length) + ((loading) ? 0 : 1),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(left: 18, right: 18),
                          child: Row(
                            children: [
                              Flexible(
                                child: GestureDetector(
                                  onTap: () {
                                    //FOR ADD SELECTED REPORT-ID
                                    BlocProvider.of<ParamsBloc>(context).add(NetworkingReportDetailsEvent(
                                        _networkReportListDataModel!, _networkingListDataItems[index], null));

                                    VRouter.of(context).to(NetworkingReportInteractionLog.id);
                                  },
                                  child: (_networkingListDataItems.length == index && loading == false)
                                      ? SizedBox(
                                          height: 60,
                                        )
                                      : Column(
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
                                                            .nullSafeString(_networkingListDataItems[index]!.user_name),
                                                        style: TextStyle(
                                                            fontSize: 16.2,
                                                            color: Color(0xFF4F4F4F),
                                                            fontWeight: FontWeight.bold),
                                                      ),
                                                      Text(
                                                        "Individual Interactions: " +
                                                            Utils().nullSafeString(_networkingListDataItems[index]!
                                                                .total_user_interaction),
                                                        style: TextStyle(color: Color(0xFF828282), fontSize: 13.68),
                                                      ),
                                                      Text(
                                                        "Parent Interactions: " +
                                                            Utils().nullSafeString(_networkingListDataItems[index]!
                                                                .total_parent_interaction),
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
