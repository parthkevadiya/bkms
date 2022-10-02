import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/view_hangout_report_model.dart';
import 'package:flutter_app/presentation/bloc/params_bloc.dart';
import 'package:flutter_app/presentation/bloc/params_event.dart';
import 'package:flutter_app/presentation/bloc/params_state.dart';
import 'package:flutter_app/presentation/reports_page/inner_page/campus_hangout_pages/view_campus_hangout_report.dart';
import 'package:flutter_app/utils/constant.dart';
import 'package:flutter_app/utils/login_status.dart';
import 'package:flutter_app/utils/util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:vrouter/vrouter.dart';
import '../../../../Bloc/view_hangout_report_bloc.dart';
import '../../../../loader.dart';
import '../../campus_hangout_model.dart';
import '../campus_hangout.dart';

class ViewHangout extends StatefulWidget {
  static String id = "viewHangout";
  static String path = "${CampusHangout.path}/$id";

  const ViewHangout({Key? key}) : super(key: key);

  @override
  _ViewHangoutState createState() => _ViewHangoutState();
}

class _ViewHangoutState extends State<ViewHangout> {
  //FOR PAGINATION
  int _totalViewHangoutReports = 0;
  int _currentPage = 1;
  static const _pageSize = 50;
  int pageKey = 1;
  final RefreshController _scrollController = RefreshController();
  ScrollController _scrollControllerList = ScrollController();

  bool _isLoading = false;
  bool _needToUpdateDashboardReports = false;

  CampusHangoutDataModel? _campusHangoutDataModel;

  ViewHangoutReportModel? _viewHangoutReportModel;
  List<ViewHangoutDataModel?>? _viewHangoutDataItems = [];
  List<ViewHangoutDataModel?>? _searchItems = [];
  List<ViewHangoutDataModel?>? _allReports = [];

  //FOR SEARCH
  TextEditingController _search = TextEditingController();
  bool _isSearching = false;
  String _searchText = "";

  //region CHECK FOR WHETHER IS FOR SEARCH

  //region PERFORM SEARCH OPERATIONS ON REPORTS LIST

  //endregion

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

  bool loading = true;

  void onRefresh(
    context,
    id,
    _currentPage,
    _pageSize,
  ) {
    _currentPage = pageKey;
    if (pageKey == 1) {
      _viewHangoutDataItems = [];
    }

    //FOR GET RECORDS
    BlocProvider.of<CampusHangoutBloc>(context).add(CampusHangoutEvent.viewHangoutReport(
      context,
      id,
      _currentPage,
      _pageSize,
      "",
    ));
  }

  @override
  void initState() {
    final paramsBloc = BlocProvider.of<ParamsBloc>(context).state;
    if (paramsBloc is CampusHangoutDetailsState) {
      _campusHangoutDataModel = paramsBloc.campusHangoutDataModel;
    }
    _showLoadingIndicator();
    //FOR ADD SELECTED ITEM
    BlocProvider.of<ParamsBloc>(context).add(CampusHangoutDetailsEvent(_campusHangoutDataModel, null));
    //FOR GET VIEW HANGOUTS
    BlocProvider.of<CampusHangoutBloc>(context).add(CampusHangoutEvent.viewHangoutReport(
      context,
      Utils().nullSafeString(_campusHangoutDataModel!.id),
      _currentPage,
      _pageSize,
      "",
    ));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<CampusHangoutBloc, CampusHangoutState>(
          listener: (context, state) {
            state.maybeWhen(
                viewHangoutReport: (viewHangoutReportModel, l) async {
                  if (l == LoadingStatus.Done) {
                    _viewHangoutDataItems!.clear();
                    _hideLoadingIndicator();
                    _totalViewHangoutReports = 0;
                    if (viewHangoutReportModel != null && viewHangoutReportModel.hangout_result!.data != null) {
                      _viewHangoutReportModel = viewHangoutReportModel;
                      _totalViewHangoutReports = Utils().nullSafeInt(_viewHangoutReportModel!.hangout_result!.total);

                      if (_viewHangoutReportModel!.hangout_result!.data!.length == _allReports!.length) {
                        setState(() {
                          loading = false;
                        });
                      }
                      final allReports = _viewHangoutReportModel!.hangout_result!.data;
                      _allReports = allReports!
                          .map(
                            (e) => ViewHangoutDataModel.fromJson(
                              jsonDecode(
                                jsonEncode(e),
                              ),
                            ),
                          )
                          .toList();

                      _viewHangoutDataItems!.clear();
                      _viewHangoutDataItems!.addAll(
                        List.from(
                          allReports
                              .map(
                                (e) => ViewHangoutDataModel.fromJson(
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
                      _viewHangoutDataItems!.clear();
                      _totalViewHangoutReports = 0;
                    });
                  }
                },
                orElse: () {});
          },
        ),
      ],
      child: Stack(
        children: <Widget>[
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
                            BlocProvider.of<ParamsBloc>(context)
                                .add(UpdateDashBoardEvent(_needToUpdateDashboardReports));
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
                                      "View Hangout",
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
                                      "$_totalViewHangoutReports",
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
                                              loading = true;
                                              _currentPage = 1;
                                              _showLoadingIndicator();
                                              BlocProvider.of<CampusHangoutBloc>(context)
                                                  .add(CampusHangoutEvent.viewHangoutReport(
                                                context,
                                                Utils().nullSafeString(_campusHangoutDataModel!.id),
                                                _currentPage,
                                                _pageSize,
                                                "",
                                              ));
                                              if (_scrollControllerList.positions.isNotEmpty) {
                                                _scrollControllerList
                                                    .jumpTo(_scrollControllerList.position.minScrollExtent);
                                              }
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
                                            loading = true;
                                            _currentPage = 1;
                                            _showLoadingIndicator();
                                            BlocProvider.of<CampusHangoutBloc>(context)
                                                .add(CampusHangoutEvent.viewHangoutReport(
                                              context,
                                              Utils().nullSafeString(_campusHangoutDataModel!.id),
                                              _currentPage,
                                              _pageSize,
                                              _search.text,
                                            ));
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
                      ],
                    ),
                  ),
                ),
              ),
              Flexible(
                child: (_viewHangoutDataItems!.length == 0)
                    ? Stack(
                        children: [
                          Center(
                            child: Padding(
                              padding: EdgeInsets.only(left: 18, right: 18, top: 0),
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
                        ],
                      )
                    : Stack(
                        children: [
                          SmartRefresher(
                            enablePullDown: false,
                            enablePullUp: loading,
                            onLoading: () {
                              pageKey++;
                              onRefresh() {
                                context;
                                _campusHangoutDataModel!.id;
                                pageKey;
                                _pageSize;
                              }

                              ;
                            },
                            header: const WaterDropMaterialHeader(),
                            controller: _scrollController,
                            child: ListView.builder(
                              itemCount: _viewHangoutDataItems?.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    _needToUpdateDashboardReports = true;
                                    //FOR ADD SELECTED REPORT-ID
                                    BlocProvider.of<ParamsBloc>(context).add(CampusHangoutDetailsEvent(
                                      _campusHangoutDataModel,
                                      _viewHangoutDataItems![index]!,
                                    ));
                                    VRouter.of(context).to(ViewCampusHangoutReport.id);
                                  },
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
                                      ListTile(
                                        visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                                        title: Text(
                                          Utils().nullSafeString((_viewHangoutDataItems![index]!.name)),
                                          style: TextStyle(
                                              fontSize: 16.2, color: Color(0xFF4F4F4F), fontWeight: FontWeight.bold),
                                        ),
                                        subtitle: Column(
                                          crossAxisAlignment: CrossAxisAlignment.stretch,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(top: 3.6),
                                              child: RichText(
                                                text: new TextSpan(
                                                  // Note: Styles for TextSpans must be explicitly defined.
                                                  // Child text spans will inherit styles from parent
                                                  style: new TextStyle(
                                                    fontSize: 12.6,
                                                    color: Colors.black,
                                                  ),
                                                  children: <TextSpan>[
                                                    new TextSpan(
                                                        text: Utils().nullSafeString("Report Type: "),
                                                        style: TextStyle(fontSize: 12.6, color: Colors.grey[700])),
                                                    new TextSpan(
                                                        text: Utils().nullSafeString(Utils().nullSafeString(
                                                            _viewHangoutDataItems![index]!.report_type)),
                                                        style: new TextStyle(
                                                            fontWeight: FontWeight.bold,
                                                            fontSize: 12.6,
                                                            color: Color(0xFF4F4F4F))),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(top: 3.6),
                                              child: RichText(
                                                text: new TextSpan(
                                                  // Note: Styles for TextSpans must be explicitly defined.
                                                  // Child text spans will inherit styles from parent
                                                  style: new TextStyle(
                                                    fontSize: 12.6,
                                                    color: Colors.black,
                                                  ),
                                                  children: <TextSpan>[
                                                    new TextSpan(
                                                        text: Utils().nullSafeString("Hangout Date: "),
                                                        style: TextStyle(fontSize: 12.6, color: Colors.grey[700])),
                                                    new TextSpan(
                                                        text: Utils().changeDateFormatString(
                                                            Utils().nullSafeString(Utils().nullSafeString(
                                                                _viewHangoutDataItems![index]!
                                                                    .campus_hangout_date_updated)),
                                                            Constant.defaultDateFormatWeb,
                                                            "dd, MMMM yyyy"),
                                                        style: new TextStyle(
                                                            fontWeight: FontWeight.bold,
                                                            fontSize: 12.6,
                                                            color: Color(0xFF4F4F4F))),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(top: 3.6),
                                              child: RichText(
                                                text: new TextSpan(
                                                  // Note: Styles for TextSpans must be explicitly defined.
                                                  // Child text spans will inherit styles from parent
                                                  style: new TextStyle(
                                                    fontSize: 12.6,
                                                    color: Colors.black,
                                                  ),
                                                  children: <TextSpan>[
                                                    new TextSpan(
                                                        text: Utils().nullSafeString("Total Students: "),
                                                        style: TextStyle(fontSize: 12.6, color: Colors.grey[700])),
                                                    new TextSpan(
                                                        text: Utils().nullSafeString(Utils().nullSafeString(
                                                            _viewHangoutDataItems![index]!.total_students)),
                                                        style: new TextStyle(
                                                            fontWeight: FontWeight.bold,
                                                            fontSize: 12.6,
                                                            color: Color(0xFF4F4F4F))),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(top: 3.6),
                                              child: RichText(
                                                text: new TextSpan(
                                                  // Note: Styles for TextSpans must be explicitly defined.
                                                  // Child text spans will inherit styles from parent
                                                  style: new TextStyle(
                                                    fontSize: 12.6,
                                                    color: Colors.black,
                                                  ),
                                                  children: <TextSpan>[
                                                    new TextSpan(
                                                        text: Utils().nullSafeString("Total Attendees: "),
                                                        style: TextStyle(fontSize: 12.6, color: Colors.grey[700])),
                                                    new TextSpan(
                                                        text: Utils().nullSafeString(Utils().nullSafeString(
                                                            _viewHangoutDataItems![index]!.total_attendees)),
                                                        style: new TextStyle(
                                                            fontWeight: FontWeight.bold,
                                                            fontSize: 12.6,
                                                            color: Color(0xFF4F4F4F))),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Divider(
                                        height: 7.32,
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
        ],
      ),
    );
  }
}
