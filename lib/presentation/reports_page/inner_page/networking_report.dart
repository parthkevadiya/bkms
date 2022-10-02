import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/media_query/responsive.dart';
import 'package:flutter_app/models/login_model.dart';
import 'package:flutter_app/presentation/bloc/params_bloc.dart';
import 'package:flutter_app/presentation/bloc/params_event.dart';
import 'package:flutter_app/presentation/bloc/params_state.dart';
import 'package:flutter_app/presentation/reports_page/reports.dart';
import 'package:flutter_app/utils/constant.dart';
import 'package:flutter_app/utils/login_status.dart';
import 'package:flutter_app/utils/util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:vrouter/vrouter.dart';

import '../../../Bloc/networking_report_bloc.dart';
import '../../../loader.dart';
import '../../../preferences.dart';
import '../networking_report_model.dart';
import 'networking_fillters.dart';
import 'networking_report_pages/create_networking_interactions.dart';
import 'networking_report_pages/networking_report_details.dart';

class NetworkReport extends StatefulWidget {
  static String id = "networkReport";
  static String path = "${Reports.path}/$id";

  const NetworkReport({Key? key}) : super(key: key);

  @override
  _NetworkReportState createState() => _NetworkReportState();
}

class _NetworkReportState extends State<NetworkReport> {
  //FOR PAGINATION
  int _totalNetworkingReports = 0;
  static const _pageSize = 50;
  int pageKey = 1;

  bool _needToUpdateDashboardReports = false;
  final RefreshController _scrollController = RefreshController();
  ScrollController _scrollControllerList = ScrollController();

  NetworkingReportModel? _networkingReportModel;
  List<NetworkReportListDataModel?>? _networkingReportItems = [];
  List<NetworkReportListDataModel?>? _searchItems = [];
  List<NetworkReportListDataModel?>? _allReports = [];
  bool isFilter = false;

  //FOR SEARCH
  TextEditingController _search = TextEditingController();
  bool _isSearching = false;
  String _searchText = "";
  String strRegion = "";
  String strCenter = "";
  String strYear = "";

  //region CHECK FOR WHETHER IS FOR SEARCH
  // bool isForSearch() {
  //   return _searchItems!.length != 0 || _searchText.isNotEmpty;
  // }
  //endregion

  //region PERFORM SEARCH OPERATIONS ON REPORTS LIST
  void searchOperation() {
    _searchItems!.clear();
    if (_isSearching) {
      for (int i = 0; i < _networkingReportItems!.length; i++) {
        NetworkReportListDataModel networkReportListDataModel = _networkingReportItems![i]!;
        if (Utils()
            .nullSafeString(networkReportListDataModel.reportdate)
            .toLowerCase()
            .contains(_searchText.toLowerCase())) {
          _searchItems!.add(networkReportListDataModel);
        }
      }
    }
  }
  //endregion

  void onRefresh(
    context,
    page,
    _pageSize,
    strNTWRKSelectedRegion,
    strNTWRKSelectedCenter,
    strSelectedReportingYear,
  ) {
    if (pageKey == 1) {
      _networkingReportItems = [];
    }

    //FOR GET REPORTS
    BlocProvider.of<NetworkingReportBloc>(context).add(NetworkingReportEvent.loadNetworkingReports(
        context, page, _pageSize, strNTWRKSelectedRegion, strNTWRKSelectedCenter, strSelectedReportingYear, ""));
  }

  //FOR NETWORKING REPORT FILTERS
  String strNTWRKSelectedRegion = "";
  String strNTWRKSelectedCenter = "";
  String strSelectedReportingYear = Utils().getCurrentDate("yyyy");

  bool _isLoading = false;
  bool loading = true;

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
    _networkingReportItems!.clear();

    //FOR GET REPORTS
    BlocProvider.of<NetworkingReportBloc>(context).add(NetworkingReportEvent.loadNetworkingReports(
        context, pageKey, _pageSize, strNTWRKSelectedRegion, strNTWRKSelectedCenter, strSelectedReportingYear, ""));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
        listeners: [
          BlocListener<NetworkingReportBloc, NetworkingReportState>(
            listener: (context, state) {
              state.maybeWhen(
                  loadNetworkingReports: (networkingReportModel, l) async {
                    if (l == LoadingStatus.Done) {
                      _networkingReportItems!.clear();
                      _hideLoadingIndicator();
                      _totalNetworkingReports = 0;

                      if (networkingReportModel != null && networkingReportModel.network_list!.data != null) {
                        _networkingReportModel = networkingReportModel;
                        _totalNetworkingReports = Utils().nullSafeInt(_networkingReportModel!.network_list!.total);
                        if (_networkingReportModel!.network_list!.data!.length == _allReports!.length) {
                          setState(() {
                            loading = false;
                          });
                        } else {
                          _scrollController.loadComplete();
                        }
                        final allReports = _networkingReportModel!.network_list!.data;
                        _allReports = allReports!
                            .map(
                              (e) => NetworkReportListDataModel.fromJson(
                                jsonDecode(
                                  jsonEncode(e),
                                ),
                              ),
                            )
                            .toList();
                        _networkingReportItems!.clear();
                        _networkingReportItems!.addAll(
                          List.from(
                            allReports
                                .map(
                                  (e) => NetworkReportListDataModel.fromJson(
                                    jsonDecode(
                                      jsonEncode(e),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        );
                        final _pref = await Preferences.getInstance();
                        LoginModel? loginModel = await _pref.getToken();
                        networkingReportModel.roleType = Utils().nullSafeString(loginModel!.role);
                        if (_search.text.isEmpty) {
                          _scrollController.loadComplete();
                        } else {
                          loading = false;
                        }
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
                        _networkingReportItems!.clear();
                        _totalNetworkingReports = 0;
                      });
                    }
                  },
                  orElse: () {});
            },
          ),
          BlocListener<ParamsBloc, ParamsState>(
            listener: (context, state) {
              if (state is NetworkingReportFiltersState) {
                strNTWRKSelectedRegion = state.strNTWRKSelectedRegion;
                strNTWRKSelectedCenter = state.strNTWRKSelectedCenter;
                strSelectedReportingYear =
                    Utils().nullSafeWithDefaultString(state.strSelectedReportingYear, Utils().getCurrentDate("yyyy"));

                //FOR ADD SELECTED FILTERS
                BlocProvider.of<ParamsBloc>(context).add(NetworkingReportFiltersEvent(
                  strNTWRKSelectedRegion,
                  strNTWRKSelectedCenter,
                  strSelectedReportingYear,
                ));

                //_pagingController.refresh();
              }
            },
          ),
          BlocListener<ParamsBloc, ParamsState>(
            listener: (context, state) {
              if (state is UpdateDashBoardState) {
                if (state.needToUpdateList) {
                  //API CALLING FOR UPDATE REPORTS
                  _networkingReportItems = [];
                  _searchItems = [];
                  //  _pagingController.refresh();
                }
              }
            },
          ),
        ],
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(
            FocusNode(),
          ),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        end: Alignment.topCenter,
                        begin: Alignment.bottomCenter,
                        colors: <Color>[
                          Color(0xfffffaea),
                          Color(0xffeefaff),
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
                          bottom: 14.4,
                        ),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                //FOR ADD STATUS FOR UPDATE REPORTS
                                BlocProvider.of<ParamsBloc>(context)
                                    .add(UpdateDashBoardEvent(true /*_needToUpdateDashboardReports*/));
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          "Networking Reports ",
                                          style: TextStyle(fontSize: 28.8, fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(horizontal: 9, vertical: 5.124),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(18),
                                        ),
                                        child: Text(
                                          "$_totalNetworkingReports",
                                          style: TextStyle(fontSize: 10.8, color: Colors.grey[600]),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    showMaterialModalBottomSheet(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(14.4),
                                          topLeft: Radius.circular(14.4),
                                        ),
                                      ),
                                      expand: false,
                                      context: context,
                                      builder: (context) => NetworkingFilter(
                                        _search.text,
                                        onSelectFilter: (
                                          bool isFiltered,
                                        ) {
                                          setState(() {
                                            _showLoadingIndicator();
                                            isFilter = isFiltered;
                                            if (isFilter) {
                                              pageKey = 1;
                                              if (_scrollControllerList.positions.isNotEmpty) {
                                                _scrollControllerList
                                                    .jumpTo(_scrollControllerList.position.minScrollExtent);
                                              }
                                            }
                                          });
                                        },
                                      ),
                                    );
                                  },
                                  child: Image.asset("img/filter.png"),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    VRouter.of(context).to(CreateNetworkingInteractions.id);
                                  },
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.blue,
                                    size: 21.6,
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
                                        setState(() {
                                          // if (_search.text.isNotEmpty) {
                                          //   _recordItems = _allRecords
                                          //       .where(
                                          //         (record) => record!.name
                                          //         .toLowerCase()
                                          //         .contains(
                                          //       _search.text.toLowerCase(),
                                          //     ),
                                          //   )
                                          //       .toList();
                                          //   // loading = false;
                                          // } else {
                                          //   // loading = true;
                                          //   _recordItems.clear();
                                          //   _recordItems = List<RecordsItem?>.of(
                                          //     _allRecords.map(
                                          //           (e) => e != null
                                          //           ? RecordsItem.fromJson(
                                          //         jsonDecode(
                                          //           jsonEncode(e),
                                          //         ),
                                          //       )
                                          //           : e,
                                          //     ),
                                          //   );
                                          //   loading = true;
                                          // }
                                        });
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
                                                    isFilter = false;
                                                    loading = true;
                                                    _search.text = "";
                                                    pageKey = 1;
                                                  });
                                                  strNTWRKSelectedRegion = "";
                                                  strNTWRKSelectedCenter = "";
                                                  strSelectedReportingYear = "";
                                                  strSelectedReportingYear = Utils().getCurrentDate("yyyy");

                                                  BlocProvider.of<NetworkingReportBloc>(context).add(
                                                      NetworkingReportEvent.loadNetworkingReports(
                                                          context,
                                                          pageKey,
                                                          _pageSize,
                                                          strNTWRKSelectedRegion,
                                                          strNTWRKSelectedCenter,
                                                          strSelectedReportingYear,
                                                          ""));
                                                  if (_scrollControllerList.positions.isNotEmpty) {
                                                    _scrollControllerList
                                                        .jumpTo(_scrollControllerList.position.minScrollExtent);
                                                  }
                                                  _showLoadingIndicator();
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
                                                pageKey = 1;
                                                _showLoadingIndicator();
                                                BlocProvider.of<NetworkingReportBloc>(context).add(
                                                  NetworkingReportEvent.loadNetworkingReports(
                                                      context,
                                                      pageKey,
                                                      _pageSize,
                                                      strNTWRKSelectedRegion,
                                                      strNTWRKSelectedCenter,
                                                      strSelectedReportingYear,
                                                      _search.text),
                                                );
                                                if (_scrollControllerList.positions.isNotEmpty) {
                                                  _scrollControllerList
                                                      .jumpTo(_scrollControllerList.position.minScrollExtent);
                                                }
                                                _allReports!.clear();
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
                            // Material(
                            //   elevation: 10.8,
                            //   child: TextField(
                            //     controller: _search,
                            //     onChanged: (val) {
                            //       //VAAPGLKNS RECORDS NOTE
                            //       // searchOperation(val);
                            //
                            //       _searchText = val;
                            //       searchOperation();
                            //     },
                            //     decoration: InputDecoration(
                            //       focusedBorder: OutlineInputBorder(
                            //         borderSide: BorderSide(
                            //             color: Colors.blue,
                            //             width: 1.44),
                            //       ),
                            //       contentPadding: EdgeInsets.symmetric(
                            //           vertical: 10.8),
                            //       fillColor: Colors.white,
                            //       filled: true,
                            //       hintText: "Search for a Report",
                            //       hintStyle: TextStyle(
                            //           fontSize: 14.4),
                            //       border: OutlineInputBorder(
                            //         borderSide: BorderSide.none,
                            //         borderRadius: BorderRadius.circular(
                            //             3.6),
                            //       ),
                            //       prefixIcon: Icon(
                            //         Icons.search,
                            //       ),
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Stack(
                      children: [
                        if (_networkingReportItems!.isEmpty)
                          Center(
                            child: Padding(
                              padding: EdgeInsets.only(left: 18, right: 18, top: 18),
                              child: Container(
                                padding: EdgeInsets.all(9),
                                decoration: BoxDecoration(
                                  color: Color(0xFFF3F3F3),
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
                                      style: TextStyle(color: Color(0xFF828282), fontSize: 12.6),
                                    )
                                  ],
                                ),
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
                              pageKey,
                              _pageSize,
                              strNTWRKSelectedRegion,
                              strNTWRKSelectedCenter,
                              strSelectedReportingYear,
                            );
                          },
                          header: const WaterDropMaterialHeader(),
                          controller: _scrollController,
                          child: ListView.builder(
                              controller: _scrollControllerList,
                              itemCount: (_networkingReportItems?.length ?? 0) + ((loading) ? 0 : 1),
                              shrinkWrap: true,
                              itemBuilder: (context, index) => (_networkingReportItems!.length == index &&
                                      loading == false)
                                  ? SizedBox(
                                      height: 40,
                                    )
                                  : Column(
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            _needToUpdateDashboardReports = true;
                                            //FOR ADD SELECTED REPORT-ID
                                            BlocProvider.of<ParamsBloc>(context).add(NetworkingReportDetailsEvent(
                                                _networkingReportItems![index]!, null, null));
                                            VRouter.of(context).to(NetworkingReportDetails.id);
                                          },
                                          child: ListTile(
                                            leading: CircularPercentIndicator(
                                              animation: true,
                                              animationDuration: 1800,
                                              circularStrokeCap: CircularStrokeCap.round,
                                              startAngle: 0,
                                              percent: (int.parse(Utils().nullSafeWithDefaultString(
                                                      _networkingReportItems![index]!.total_ratio, "0")) /
                                                  100),
                                              center: (double.parse(
                                                        Utils().nullSafeWithDefaultString(
                                                            _networkingReportItems![index]!.total_ratio, "0"),
                                                      ) ==
                                                      100)
                                                  ? Icon(
                                                      Icons.done_all,
                                                      color: Color(0xff45e588),
                                                      size: 21.6,
                                                    )
                                                  : Text(
                                                      "${Utils().nullSafeWithDefaultString(_networkingReportItems![index]!.total_ratio, "0")}%",
                                                      style: TextStyle(color: Colors.orange, fontSize: 8.1),
                                                    ),
                                              backgroundColor: Colors.grey.shade300,
                                              radius: 21.24,
                                              lineWidth: 5.4,
                                              linearGradient: LinearGradient(
                                                end: Alignment.topCenter,
                                                begin: Alignment.bottomCenter,
                                                colors: <Color>[
                                                  (int.parse(Utils().nullSafeWithDefaultString(
                                                              _networkingReportItems![index]!.total_ratio, "0")) ==
                                                          100)
                                                      ? Color(0xff3AE280)
                                                      : Color(0xffFFE69B),
                                                  (int.parse(Utils().nullSafeWithDefaultString(
                                                              _networkingReportItems![index]!.total_ratio, "0")) ==
                                                          100)
                                                      ? Color(0xffB0FFD2)
                                                      : Color(0xffFFD1D1),
                                                ],
                                              ),
                                            ),
                                            title: Text(
                                              Utils().nullSafeString(_networkingReportItems![index]!.reportdate),
                                              style: TextStyle(
                                                  fontSize: 16.2,
                                                  color: Color(0xFF4F4F4F),
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            subtitle: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    ((int.parse(Utils().nullSafeWithDefaultString(
                                                                    _networkingReportItems![index]!.total_ratio, "0")) /
                                                                100) <
                                                            1.0)
                                                        ? Text(Utils().nullSafeString("Individuals: " +
                                                            Utils().nullSafeString(_networkingReportItems![index]!
                                                                .current_networking_targetuser)))
                                                        : Container(
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(7.2),
                                                              color: Colors.green.shade50,
                                                            ),
                                                            child: Padding(
                                                              padding: EdgeInsets.all(3.6),
                                                              child: Text(Utils().nullSafeString("Individuals: " +
                                                                  Utils().nullSafeString(_networkingReportItems![index]!
                                                                      .current_networking_targetuser))),
                                                            ),
                                                          ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    ((int.parse(Utils().nullSafeWithDefaultString(
                                                                    _networkingReportItems![index]!.total_ratio, "0")) /
                                                                100) <
                                                            1.0)
                                                        ? Text(Utils().nullSafeString(Utils().nullSafeString(
                                                                _networkingReportItems![index]!.RegionName) +
                                                            " | " +
                                                            Utils().nullSafeString(
                                                                _networkingReportItems![index]!.CenterName) +
                                                            " | " +
                                                            Utils().nullSafeString(
                                                                _networkingReportItems![index]!.wingname)))
                                                        : Container(
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(7.2),
                                                              color: Colors.green.shade50,
                                                            ),
                                                            child: Padding(
                                                              padding: EdgeInsets.all(3.6),
                                                              child: Text(
                                                                Utils().nullSafeString(Utils().nullSafeString(
                                                                        _networkingReportItems![index]!.RegionName) +
                                                                    " | " +
                                                                    Utils().nullSafeString(
                                                                        _networkingReportItems![index]!.CenterName) +
                                                                    " | " +
                                                                    Utils().nullSafeString(
                                                                        _networkingReportItems![index]!.wingname)),
                                                                style: TextStyle(color: Colors.green, fontSize: 13.68),
                                                              ),
                                                            ),
                                                          ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    )),
                        ),
                        Positioned(
                          bottom: (Platform.isIOS) ? 100.8 : 72,
                          left: 18,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(7.2),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(
                                7.2,
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    _networkingReportItems!.isEmpty
                                        ? "Showing no results based on filters. "
                                        : ((_search.text.isEmpty)
                                            ? "Showing all ${_totalNetworkingReports.toString()}  result. "
                                            : "Showing all ${_networkingReportItems!.length}  result. "),
                                    style: TextStyle(
                                      fontSize: 12.6,
                                      color: Color(0xFF4F4F4F),
                                    ),
                                  ),
                                  isFilter
                                      ? GestureDetector(
                                          behavior: HitTestBehavior.opaque,
                                          onTap: () {
                                            setState(() {
                                              isFilter = false;
                                              loading = true;
                                            });
                                            strNTWRKSelectedRegion = "";
                                            strNTWRKSelectedCenter = "";
                                            strSelectedReportingYear = Utils().getCurrentDate("yyyy");
                                            _showLoadingIndicator();
                                            //FOR ADD SELECTED FILTERS
                                            pageKey = 1;
                                            if (_search.text.isNotEmpty) {
                                              BlocProvider.of<NetworkingReportBloc>(context).add(
                                                  NetworkingReportEvent.loadNetworkingReports(
                                                      context,
                                                      pageKey,
                                                      _pageSize,
                                                      strNTWRKSelectedRegion,
                                                      strNTWRKSelectedCenter,
                                                      strSelectedReportingYear,
                                                      _search.text));
                                              BlocProvider.of<ParamsBloc>(context).add(
                                                NetworkingReportFiltersEvent(
                                                  "",
                                                  "",
                                                  "",
                                                ),
                                              );
                                              if (_scrollControllerList.positions.isNotEmpty) {
                                                _scrollControllerList
                                                    .jumpTo(_scrollControllerList.position.minScrollExtent);
                                              }
                                            } else {
                                              BlocProvider.of<NetworkingReportBloc>(context).add(
                                                NetworkingReportEvent.loadNetworkingReports(
                                                    context,
                                                    pageKey,
                                                    _pageSize,
                                                    strNTWRKSelectedRegion,
                                                    strNTWRKSelectedCenter,
                                                    strSelectedReportingYear,
                                                    ""),
                                              );
                                              BlocProvider.of<ParamsBloc>(context).add(
                                                NetworkingReportFiltersEvent(
                                                  "",
                                                  "",
                                                  "",
                                                ),
                                              );
                                              if (_scrollControllerList.positions.isNotEmpty) {
                                                _scrollControllerList
                                                    .jumpTo(_scrollControllerList.position.minScrollExtent);
                                              }
                                            }
                                          },
                                          child: Text(
                                            "Clear Filters",
                                            style: TextStyle(fontSize: 12.6, color: Colors.blue),
                                          ),
                                        )
                                      : GestureDetector(
                                          behavior: HitTestBehavior.opaque,
                                          onTap: () {
                                            showMaterialModalBottomSheet(
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(14.4),
                                                  topLeft: Radius.circular(14.4),
                                                ),
                                              ),
                                              expand: false,
                                              context: context,
                                              builder: (context) => NetworkingFilter(
                                                _search.text,
                                                onSelectFilter: (
                                                  bool isFiltered,
                                                ) {
                                                  setState(() {
                                                    _showLoadingIndicator();
                                                    isFilter = isFiltered;
                                                    if (isFilter) {
                                                      pageKey = 1;
                                                      if (_scrollControllerList.positions.isNotEmpty) {
                                                        _scrollControllerList
                                                            .jumpTo(_scrollControllerList.position.minScrollExtent);
                                                      }
                                                    }
                                                  });
                                                },
                                              ),
                                            );
                                          },
                                          child: Text(
                                            "Add Filters",
                                            style: TextStyle(fontSize: 12.6, color: Colors.blue),
                                          ),
                                        ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(child: _isLoading ? Loader(loadingTxt: 'Please wait...') : Container())
            ],
          ),
        ));
  }
}
