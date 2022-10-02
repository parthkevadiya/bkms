import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/kst_1on1_mentoring_list_model.dart';
import 'package:flutter_app/models/manage_kst_report_model.dart';
import 'package:flutter_app/presentation/bloc/params_bloc.dart';
import 'package:flutter_app/presentation/bloc/params_event.dart';
import 'package:flutter_app/presentation/bloc/params_state.dart';
import 'package:flutter_app/utils/constant.dart';
import 'package:flutter_app/utils/login_status.dart';
import 'package:flutter_app/utils/util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:vrouter/vrouter.dart';
import '../../../../Bloc/manage_kst_reports_bloc.dart';
import '../../../../loader.dart';
import '../../kst_report_model.dart';
import 'add_1on1_mentoring_interaction.dart';
import 'kst_1on1_mentoring_interaction_details.dart';
import 'manage_kst_report.dart';

class Manage1On1Mentoring extends StatefulWidget {
  static String id = "manage1On1Mentoring";
  static String path = "${ManageKSTReport.path}/$id";

  const Manage1On1Mentoring({Key? key}) : super(key: key);

  @override
  _Manage1On1MentoringState createState() => _Manage1On1MentoringState();
}

class _Manage1On1MentoringState extends State<Manage1On1Mentoring> {
  //FOR PAGINATION
  int _totalKSTReports = 0;
  int _currentPage = 1;
  int pageKey = 1;
  static const _pageSize = 50;
  final RefreshController _scrollController = RefreshController();

  bool _isLoading = false;
  bool _needToUpdateDashboardReports = false;

  KSTReportListDataModel? _kstReportItem;
  ManageKSTReportListDataModel? _manageKSTReportListDataModel;

  KST1On1MentoringListModel? _kst1On1MentoringListModel;
  List<K1On1MDataModel?>? _1On1MentoringItems = [];
  List<K1On1MDataModel?> _allRecords = [];
  bool loading = true;
  ScrollController _scrollControllerList = ScrollController();

  //FOR SEARCH
  TextEditingController _search = TextEditingController();
  bool _isSearching = false;
  String _searchText = "";

  void onRefresh(context, id, _searchText, _currentPage, _pageSize) {
    _currentPage = pageKey;
    if (pageKey == 1) {
      _1On1MentoringItems = [];
    }

    //FOR GET RECORDS
    BlocProvider.of<ManageKSTReportBloc>(context)
        .add(ManageKSTReportEvent.kstEducationMentoringList(context, id, _searchText, _currentPage, _pageSize));
  }

  //endregion

  _Manage1On1MentoringState() {
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
    final paramsBloc = BlocProvider.of<ParamsBloc>(context).state;
    if (paramsBloc is KSTReportDetailsState) {
      _kstReportItem = paramsBloc.kstReportListDataModel;
      _manageKSTReportListDataModel = paramsBloc.manageKSTReportListDataModel;
    }

    //FOR ADD SELECTED REPORT-ID
    BlocProvider.of<ParamsBloc>(context)
        .add(KSTReportDetailsEvent(_kstReportItem, _manageKSTReportListDataModel, null, null));
    _showLoadingIndicator();
    //FOR GET REPORTS
    BlocProvider.of<ManageKSTReportBloc>(context).add(ManageKSTReportEvent.kst1On1MentoringList(
      context,
      Utils().nullSafeString(_manageKSTReportListDataModel!.id.toString()),
      _searchText,
      _currentPage,
      _pageSize,
    ));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<ManageKSTReportBloc, ManageKSTReportState>(
          listener: (context, state) {
            state.maybeWhen(
                kst1On1MentoringList: (kst1On1MentoringListModel, l) async {
                  if (l == LoadingStatus.Done) {
                    _1On1MentoringItems!.clear();
                    _hideLoadingIndicator();
                    _totalKSTReports = 0;

                    if (kst1On1MentoringListModel != null && kst1On1MentoringListModel.result != null) {
                      _kst1On1MentoringListModel = kst1On1MentoringListModel;
                      _totalKSTReports = Utils().nullSafeInt(_kst1On1MentoringListModel!.result!.total);

                      if (_kst1On1MentoringListModel!.result!.data!.length == _allRecords.length) {
                        setState(() {
                          loading = false;
                        });
                      } else {
                        _scrollController.loadComplete();
                      }
                      final allRecords = _kst1On1MentoringListModel!.result!.data!;
                      _allRecords = allRecords
                          .map(
                            (e) => K1On1MDataModel.fromJson(
                              jsonDecode(
                                jsonEncode(e),
                              ),
                            ),
                          )
                          .toList();
                      _1On1MentoringItems!.clear();
                      _1On1MentoringItems!.addAll(
                        List.from(
                          allRecords
                              .map(
                                (e) => K1On1MDataModel.fromJson(
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
                      _hideLoadingIndicator();
                    }
                  } else if (l == LoadingStatus.Error) {
                    setState(() {
                      _hideLoadingIndicator();
                      _1On1MentoringItems!.clear();
                      _totalKSTReports = 0;
                    });
                  }
                },
                orElse: () {});
          },
        ),
        BlocListener<ParamsBloc, ParamsState>(
          listener: (context, state) {
            if (state is KST1On1MentoringListRefreshState) {
              if (state.isForRefresh) {
                _scrollController.requestRefresh();
                //_pagingController.refresh();
              }
            }
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: Text(
                                    "1-on-1 Mentoring",
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
                                    "$_totalKSTReports",
                                    style: TextStyle(fontSize: 10.8, color: Colors.grey[600]),
                                  ),
                                ),
                                SizedBox(
                                  width: 3.6,
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              //FOR ADD SELECTED ITEM
                              BlocProvider.of<ParamsBloc>(context).add(KSTReportDetailsEvent(
                                _kstReportItem,
                                _manageKSTReportListDataModel,
                                null,
                                null,
                              ));
                              VRouter.of(context).to(Add1On1MentoringInteraction.id);
                            },
                            child: Icon(
                              Icons.add,
                              color: Colors.blue,
                              size: 21.6,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "${Utils().nullSafeString(_manageKSTReportListDataModel!.CenterName)} - ${Utils().nullSafeString(_manageKSTReportListDataModel!.wingName)} 1-On-1 Mentoring Interaction Log",
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            color: Colors.grey,
                            fontSize: 14.4,
                            fontWeight: FontWeight.normal),
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
                                              if (_search.text.isNotEmpty) {
                                                loading = true;
                                                _currentPage = 1;
                                                _search.text = "";
                                                _showLoadingIndicator();
                                                BlocProvider.of<ManageKSTReportBloc>(context)
                                                    .add(ManageKSTReportEvent.kst1On1MentoringList(
                                                  context,
                                                  Utils().nullSafeString(_manageKSTReportListDataModel!.id.toString()),
                                                  "",
                                                  _currentPage,
                                                  _pageSize,
                                                ));
                                                if (_scrollControllerList.positions.isNotEmpty) {
                                                  _scrollControllerList
                                                      .jumpTo(_scrollControllerList.position.minScrollExtent);
                                                }
                                              }
                                            });
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
                                          loading = true;

                                          BlocProvider.of<ManageKSTReportBloc>(context)
                                              .add(ManageKSTReportEvent.kst1On1MentoringList(
                                            context,
                                            Utils().nullSafeString(_manageKSTReportListDataModel!.id.toString()),
                                            _search.text,
                                            _currentPage,
                                            _pageSize,
                                          ));
                                          if (_scrollControllerList.positions.isNotEmpty) {
                                            _scrollControllerList
                                                .jumpTo(_scrollControllerList.position.minScrollExtent);
                                          }
                                          _allRecords.clear();
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
                  if (_1On1MentoringItems!.isEmpty)
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
                      pageKey = 0;
                      pageKey++;
                      onRefresh(
                        context,
                        Utils().nullSafeString(_manageKSTReportListDataModel!.id.toString()),
                        _searchText,
                        _currentPage,
                        _pageSize,
                      );
                    },
                    header: const WaterDropMaterialHeader(),
                    controller: _scrollController,
                    child: ListView.builder(
                        padding: EdgeInsets.zero,
                        controller: _scrollControllerList,
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: (_1On1MentoringItems?.length ?? 0) + 1,
                        itemBuilder: (context, index) => (_1On1MentoringItems!.length == index)
                            ? SizedBox(
                                height: 60,
                              )
                            : GestureDetector(
                                onTap: () {
                                  //FOR ADD SELECTED ITEM
                                  BlocProvider.of<ParamsBloc>(context).add(KSTReportDetailsEvent(
                                    _kstReportItem,
                                    _manageKSTReportListDataModel,
                                    null,
                                    /*isForSearch() ? _searchItems![index]! : */ _1On1MentoringItems![index]!,
                                  ));
                                  VRouter.of(context).to(KST1On1MentoringInteractionDetails.id);
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    ListTile(
                                      visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                                      title: Text(
                                        Utils().nullSafeString(
                                            (/*isForSearch() ? _searchItems![index]!.kst_report_type :*/ _1On1MentoringItems![
                                                    index]!
                                                .kst_report_type)),
                                        style: TextStyle(
                                            fontSize: 16.2, color: Color(0xFF4F4F4F), fontWeight: FontWeight.bold),
                                      ),
                                      subtitle: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment: CrossAxisAlignment.stretch,
                                        children: [
                                          RichText(
                                            text: new TextSpan(
                                              // Note: Styles for TextSpans must be explicitly defined.
                                              // Child text spans will inherit styles from parent
                                              style: new TextStyle(
                                                fontSize: 12.6,
                                                color: Colors.black,
                                              ),
                                              children: <TextSpan>[
                                                new TextSpan(
                                                    text: Utils().nullSafeString("Interaction Date: "),
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.normal,
                                                        fontSize: 0.032,
                                                        color: Colors.grey)),
                                                new TextSpan(
                                                    text: Utils().changeDateFormatString(
                                                        Utils().nullSafeString(
                                                            (/*isForSearch() ? _searchItems![index]:*/ _1On1MentoringItems![
                                                                    index])!
                                                                .interaction_date),
                                                        Constant.defaultDateFormatWeb,
                                                        "dd, MMMM yyyy"),
                                                    style: new TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 12.6,
                                                        color: Color(0xFF4F4F4F))),
                                              ],
                                            ),
                                          ),
                                          RichText(
                                            text: new TextSpan(
                                              // Note: Styles for TextSpans must be explicitly defined.
                                              // Child text spans will inherit styles from parent
                                              style: new TextStyle(
                                                fontSize: 12.6,
                                                color: Colors.black,
                                              ),
                                              children: <TextSpan>[
                                                new TextSpan(
                                                    text: Utils().nullSafeString("Submitted For: "),
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.normal,
                                                        fontSize: 0.032,
                                                        color: Colors.grey)),
                                                new TextSpan(
                                                    text: Utils().nullSafeString(
                                                        (/*isForSearch() ? _searchItems![index]:*/ _1On1MentoringItems![
                                                                index])!
                                                            .submitted_for_name),
                                                    style: new TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 12.6,
                                                        color: Color(0xFF4F4F4F))),
                                              ],
                                            ),
                                          ),
                                          RichText(
                                            text: new TextSpan(
                                              // Note: Styles for TextSpans must be explicitly defined.
                                              // Child text spans will inherit styles from parent
                                              style: new TextStyle(
                                                fontSize: 12.6,
                                                color: Colors.black,
                                              ),
                                              children: <TextSpan>[
                                                new TextSpan(
                                                    text: Utils().nullSafeString("Reported By: "),
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.normal,
                                                        fontSize: 0.032,
                                                        color: Colors.grey)),
                                                new TextSpan(
                                                    text: Utils().nullSafeString(
                                                        (/*isForSearch() ? _searchItems![index]:*/ _1On1MentoringItems![
                                                                index])!
                                                            .reported_by),
                                                    style: new TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 12.6,
                                                        color: Color(0xFF4F4F4F))),
                                              ],
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
}
