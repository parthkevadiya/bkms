import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_app/Bloc/bst_report_bloc.dart';
import 'package:flutter_app/media_query/responsive.dart';
import 'package:flutter_app/models/manage_bst_report_model.dart';
import 'package:flutter_app/presentation/bloc/params_bloc.dart';
import 'package:flutter_app/presentation/bloc/params_event.dart';
import 'package:flutter_app/presentation/bloc/params_state.dart';
import 'package:flutter_app/presentation/reports_page/bst_report_model.dart';
import 'package:flutter_app/utils/constant.dart';
import 'package:flutter_app/utils/login_status.dart';
import 'package:flutter_app/utils/util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:vrouter/vrouter.dart';
import '../../../../Bloc/manage_niyam_report_bloc.dart';
import '../../../../loader.dart';
import '../bst_report.dart';
import 'manage_bst_attendance.dart';
import 'manage_bst_quiz_scores.dart';

class ManageReport extends StatefulWidget {
  static String id = "manageReport";
  static String path = "${BSTReport.path}/$id";
  final bool route;
  ManageReport({Key? key, required this.route}) : super(key: key);

  @override
  _ManageReportState createState() => _ManageReportState();
}

class _ManageReportState extends State<ManageReport> {
  //FOR PAGINATION
  int _totalBSTReports = 0;
  int _currentPage = 1;
  static const _pageSize = 50;

  bool _isLoading = false;
  bool _needToUpdateDashboardReports = false;

  BSTReportListDataModel? _bstReportItem;

  ManageBSTReportModel? _manageBSTReportModel;
  List<ManageBSTReportListDataModel?>? _bstReportItems = [];
  List<ManageBSTReportListDataModel?>? _allRecords = [];
  List<ManageBSTReportListDataModel?>? _searchItems = [];

  TextEditingController _search = TextEditingController();
  bool _isSearching = false;
  String _searchText = "";

  //region PERFORM SEARCH OPERATIONS ON REPORTS LIST
  void searchOperation() {
    _searchItems!.clear();
    if (_isSearching) {
      for (int i = 0; i < _bstReportItems!.length; i++) {
        ManageBSTReportListDataModel manageBSTReportListDataModel = _bstReportItems![i]!;
        if (Utils()
            .nullSafeString(manageBSTReportListDataModel.name)
            .toLowerCase()
            .contains(_searchText.toLowerCase())) {
          _searchItems!.add(manageBSTReportListDataModel);
        }
      }
    }
  }

  //endregion

  _ManageReportState() {
    _search.addListener(() {
      if (_search.text.isEmpty) {
        setState(() {
          _isSearching = false;
          _searchText = "";
        });
      } else {
        setState(() {
          _isSearching = true;
          _searchText = _search.text;
        });
      }
    });
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
    //FOR ADD SELECTED REPORT-ID
    BlocProvider.of<ParamsBloc>(context).add(BSTReportDetailsEvent(_bstReportItem, null));

    final paramsBloc = BlocProvider.of<ParamsBloc>(context).state;
    if (paramsBloc is BSTReportDetailsState) {
      _bstReportItem = paramsBloc.bstReportItem;
    }

    _showLoadingIndicator();
    //FOR GET REPORTS
    BlocProvider.of<ManageNiyamReportBloc>(context).add(ManageNiyamReportEvent.manageBSTReports(
      context,
      Utils().nullSafeString(_bstReportItem!.id),
      _currentPage,
      _pageSize,
      "",
    ));

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _isLoading = false;
    _isLoading = false;
    _search.text;
  }

  final RefreshController _scrollController = RefreshController();
  bool loading = true;
  void onRefresh(context, bstReportItemId, pageKey, pageSize, bool val) {
    _currentPage = pageKey;
    if (pageKey == 1) {
      _bstReportItems = [];
    }

    //FOR GET RECORDS
    BlocProvider.of<ManageNiyamReportBloc>(context).add(ManageNiyamReportEvent.manageBSTReports(
      context,
      // Utils().nullSafeString(_bstReportItem!.id),
      bstReportItemId,
      pageKey,
      pageSize,
      "",
    ));
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<ManageNiyamReportBloc, ManageNiyamReportState>(
          listener: (context, state) {
            state.maybeWhen(
                // empty: (l) {
                //   if (l == LoadingStatus.InProgress) {
                //     _showLoadingIndicator();
                //   }
                // },
                manageBSTReports: (manageBSTReportsModel, l) async {
                  if (l == LoadingStatus.Done) {
                    _bstReportItems!.clear();
                    _hideLoadingIndicator();
                    _totalBSTReports = 0;
                    _manageBSTReportModel = manageBSTReportsModel;
                    _totalBSTReports = Utils().nullSafeInt(_manageBSTReportModel!.manage_bst_report_list!.total);

                    if (_manageBSTReportModel!.manage_bst_report_list!.data!.length == _allRecords!.length) {
                      setState(() {
                        loading = false;
                      });
                    } else {
                      _scrollController.loadComplete();
                    }
                    final allRecords = _manageBSTReportModel!.manage_bst_report_list!.data;
                    _allRecords = allRecords!
                        .map(
                          (e) => ManageBSTReportListDataModel.fromJson(
                            jsonDecode(
                              jsonEncode(e),
                            ),
                          ),
                        )
                        .toList();
                    _bstReportItems!.clear();
                    _bstReportItems!.addAll(
                      List.from(
                        allRecords
                            .map(
                              (e) => ManageBSTReportListDataModel.fromJson(
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
                    } else {
                      loading = false;
                    }
                  } else {
                    if (l == LoadingStatus.Error) {
                      setState(() {
                        _hideLoadingIndicator();
                        _bstReportItems!.clear();
                        _totalBSTReports = 0;
                      });
                    }
                  }
                },
                orElse: () {});
          },
        ),
      ],
      child: Stack(children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  end: Alignment.topCenter,
                  begin: Alignment.bottomCenter,
                  colors: <Color>[
                    Color(0xffFFFAEA),
                    Color(0xffE6F5FE),
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
                          //FOR ADD STATUS FOR UPDATE GOSHTHI REPORTS
                          if (widget.route) {
                            BlocProvider.of<ParamsBloc>(context)
                                .add(UpdateDashBoardEvent(true /*_needToUpdateDashboardReports*/));
                          } else {
                            BlocProvider.of<BSTReportBloc>(context).add(
                              BSTReportEvent.loadBSTReports(context, "", "", "", "", 1, _pageSize, ""),
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: Text(
                                    "Manage Reports",
                                    style: TextStyle(
                                        decoration: TextDecoration.none,
                                        color: Colors.black,
                                        fontSize: 28.8,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(
                                  width: 7.2,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 9, vertical: 5.124),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  child: Text(
                                    "$_totalBSTReports",
                                    style: TextStyle(fontSize: 10.8, color: Colors.grey[600]),
                                  ),
                                ),
                                SizedBox(
                                  width: 3.6,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.98,
                      ),
                      Row(
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
                                onChanged: (val) {
                                  setState(() {});
                                },
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
                                  suffixIcon: _search.text == ""
                                      ? SizedBox()
                                      : InkWell(
                                          onTap: () {
                                            setState(() {
                                              loading = true;
                                              _search.text = "";
                                            });
                                            _showLoadingIndicator();
                                            BlocProvider.of<ManageNiyamReportBloc>(context)
                                                .add(ManageNiyamReportEvent.manageBSTReports(
                                              context,
                                              Utils().nullSafeString(_bstReportItem!.id),
                                              _currentPage,
                                              _pageSize,
                                              "",
                                            ));
                                          },
                                          child: Icon(
                                            Icons.cancel_outlined,
                                            color: Colors.black45,
                                          ),
                                        ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Expanded(
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
                                          _showLoadingIndicator();
                                          BlocProvider.of<ManageNiyamReportBloc>(context)
                                              .add(ManageNiyamReportEvent.manageBSTReports(
                                            context,
                                            Utils().nullSafeString(_bstReportItem!.id),
                                            _currentPage,
                                            _pageSize,
                                            _search.text,
                                          ));
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
                    ],
                  ),
                ),
              ),
            ),
            Flexible(
              child: Stack(
                children: [
                  if (_bstReportItems!.isEmpty)
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
                      _currentPage++;
                      onRefresh(context, Utils().nullSafeString(_bstReportItem!.id), _currentPage, _pageSize, false);
                    },
                    header: const WaterDropMaterialHeader(),
                    controller: _scrollController,
                    child: ListView.builder(
                      itemCount: (_bstReportItems?.length ?? 0) + ((loading) ? 0 : 1),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return (_bstReportItems?.length == index && loading == false)
                            ? SizedBox(
                                height: 40,
                              )
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  ListTile(
                                    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                                    title: Text(
                                      Utils().nullSafeString(
                                        _bstReportItems![index]!.name,
                                      ),
                                      style: TextStyle(
                                          fontSize: 16.2, color: Color(0xFF4F4F4F), fontWeight: FontWeight.bold),
                                    ),
                                    subtitle: Row(
                                      children: [
                                        ((Utils().nullSafeString(_bstReportItems![index]!.bst_report_status)) !=
                                                Constant.mbstrsComplete)
                                            ? Text(Utils().nullSafeString(_bstReportItems![index]!.RegionName) +
                                                " | " +
                                                Utils().nullSafeString(_bstReportItems![index]!.CenterName) +
                                                " | " +
                                                Utils().nullSafeString(_bstReportItems![index]!.wingName))
                                            : Container(
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(7.2),
                                                  color: Colors.green.shade50,
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(3.6),
                                                  child: Text(
                                                    Utils().nullSafeString(Utils()
                                                            .nullSafeString(_bstReportItems![index]!.RegionName) +
                                                        " | " +
                                                        Utils().nullSafeString(_bstReportItems![index]!.CenterName) +
                                                        " | " +
                                                        Utils().nullSafeString(_bstReportItems![index]!.wingName)),
                                                    style: TextStyle(color: Colors.green, fontSize: 13.68),
                                                  ),
                                                ),
                                              ),
                                      ],
                                    ),
                                  ),
                                  (_bstReportItems!.length == index)
                                      ? SizedBox(
                                          height: 40,
                                        )
                                      : Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          //change here don't //worked
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Flexible(
                                              child: ClipRect(
                                                child: BackdropFilter(
                                                  filter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      gradient: LinearGradient(
                                                        end: Alignment.topCenter,
                                                        begin: Alignment.bottomCenter,
                                                        colors: <Color>[
                                                          Color(0x11FFFAEA),
                                                          Color(0x11E6F5FE),
                                                        ],
                                                      ),
                                                    ),
                                                    padding: EdgeInsets.only(top: 0, left: 14.4, right: 0, bottom: 0),
                                                    child: Column(
                                                      mainAxisSize: MainAxisSize.max,
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      children: [
                                                        ElevatedButton(
                                                          onPressed: () async {
                                                            _isLoading = false;
                                                            _needToUpdateDashboardReports = true;
                                                            //FOR ADD SELECTED REPORT-ID
                                                            BlocProvider.of<ParamsBloc>(context)
                                                                .add(BSTReportDetailsEvent(
                                                              _bstReportItem,
                                                              _bstReportItems![index]!,
                                                            ));
                                                            VRouter.of(context).to(ManageBSTAttendance.id);
                                                          },
                                                          style: ButtonStyle(
                                                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                              RoundedRectangleBorder(
                                                                borderRadius: BorderRadius.circular(3.6),
                                                              ),
                                                            ),
                                                          ),
                                                          child: Text(
                                                            "Manage Attendance",
                                                            style: TextStyle(color: Colors.white, fontSize: 10.8),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Flexible(
                                              child: ClipRect(
                                                child: BackdropFilter(
                                                  filter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      gradient: LinearGradient(
                                                        end: Alignment.topCenter,
                                                        begin: Alignment.bottomCenter,
                                                        colors: <Color>[
                                                          Color(0x11FFFAEA),
                                                          Color(0x11E6F5FE),
                                                        ],
                                                      ),
                                                    ),
                                                    padding: EdgeInsets.only(top: 0, left: 0, right: 14.4, bottom: 0),
                                                    child: Column(
                                                      mainAxisSize: MainAxisSize.max,
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      children: [
                                                        ElevatedButton(
                                                          onPressed: () async {
                                                            _needToUpdateDashboardReports = true;
                                                            //FOR ADD SELECTED REPORT-ID
                                                            _needToUpdateDashboardReports = true;
                                                            //FOR ADD SELECTED REPORT-ID
                                                            BlocProvider.of<ParamsBloc>(context)
                                                                .add(BSTReportDetailsEvent(
                                                              _bstReportItem,
                                                              _bstReportItems![index]!,
                                                            ));
                                                            VRouter.of(context).to(ManageBSTQuizScores.id);
                                                          },
                                                          style: ButtonStyle(
                                                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                              RoundedRectangleBorder(
                                                                borderRadius: BorderRadius.circular(3.6),
                                                              ),
                                                            ),
                                                          ),
                                                          child: Text(
                                                            "Manage Quiz Scores",
                                                            style: TextStyle(color: Colors.white, fontSize: 10.8),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                  Divider(
                                    height: 7.32,
                                  ),
                                ],
                              );
                      },
                      // ),
                    ),
                  ),
                  // (isForSearch()
                  //         ? _searchItems!.length == 0
                  //         : _bstReportItems!.length == 0)
                  //     ? Stack(
                  //         children: [
                  //           Container(),
                  //           Padding(
                  //             padding: EdgeInsets.only(
                  //                 left: 18,
                  //                 right: 18,
                  //                 top: 18),
                  //             child: Container(
                  //               padding: EdgeInsets.all(
                  //                   9),
                  //               decoration: BoxDecoration(
                  //                 color: Color(0xFFF3F3F3),
                  //                 borderRadius: BorderRadius.circular(
                  //                     5.4),
                  //               ),
                  //               child: Row(
                  //                 mainAxisAlignment:
                  //                     MainAxisAlignment.center,
                  //                 children: [
                  //                   Icon(
                  //                     Icons.cancel_outlined,
                  //                     size: 14.4,
                  //                   ),
                  //                   SizedBox(
                  //                     width: 7.2,
                  //                   ),
                  //                   Text(
                  //                     "No Manage Reports data found.",
                  //                     style: TextStyle(
                  //                         color: Color(0xFF828282),
                  //                         fontSize:
                  //                             12.6),
                  //                   )
                  //                 ],
                  //               ),
                  //             ),
                  //           ),
                  //         ],
                  //       )
                  //     : Container(),
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
