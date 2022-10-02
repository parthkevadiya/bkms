import 'dart:convert';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/kst_education_mentoring_list_model.dart';
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
import 'add_education_mentoring_interaction.dart';
import 'education_mentoring_interaction_details.dart';
import 'manage_kst_report.dart';

class ManageEducationMentoring extends StatefulWidget {
  static String id = "manageEducationMentoring";
  static String path = "${ManageKSTReport.path}/$id";

  const ManageEducationMentoring({Key? key}) : super(key: key);

  @override
  _ManageEducationMentoringState createState() => _ManageEducationMentoringState();
}

class _ManageEducationMentoringState extends State<ManageEducationMentoring> {
  //FOR PAGINATION
  int _totalKSTReports = 0;
  int _currentPage = 1;
  int pageKey = 1;
  static const _pageSize = 50;
  final RefreshController _scrollController = RefreshController();
  ScrollController _scrollControllerList = ScrollController();

  bool _isLoading = false;
  bool _needToUpdateDashboardReports = false;

  KSTReportListDataModel? _kstReportItem;
  ManageKSTReportListDataModel? _manageKSTReportListDataModel;

  KSTEducationMentoringListModel? _kstEducationMentoringListModel;
  List<KEMDataModel?>? _educationMentoringItems = [];
  List<KEMDataModel?>? _searchItems = [];
  List<KEMDataModel?> _allRecords = [];
  bool loading = true;

  //FOR SEARCH
  TextEditingController _search = TextEditingController();
  bool _isSearching = false;

  //region CHECK FOR WHETHER IS FOR SEARCH

  void onRefresh(context, id, _searchText, _currentPage, _pageSize) {
    _currentPage = pageKey;
    if (pageKey == 1) {
      _educationMentoringItems = [];
    }

    //FOR GET RECORDS
    BlocProvider.of<ManageKSTReportBloc>(context).add(ManageKSTReportEvent.kstEducationMentoringList(
      context,
      id,
      _searchText,
      _currentPage,
      _pageSize,
    ));
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
    _showLoadingIndicator();
    //FOR ADD SELECTED REPORT-ID
    BlocProvider.of<ParamsBloc>(context)
        .add(KSTReportDetailsEvent(_kstReportItem, _manageKSTReportListDataModel, null, null));

    //FOR GET REPORTS
    BlocProvider.of<ManageKSTReportBloc>(context).add(ManageKSTReportEvent.kstEducationMentoringList(
      context,
      Utils().nullSafeString(_manageKSTReportListDataModel!.id.toString()),
      _search.text,
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
                kstEducationMentoringList: (kstEducationMentoringListModel, l) async {
                  if (l == LoadingStatus.Done) {
                    _educationMentoringItems!.clear();
                    _hideLoadingIndicator();
                    _totalKSTReports = 0;

                    if (kstEducationMentoringListModel != null && kstEducationMentoringListModel.result != null) {
                      _kstEducationMentoringListModel = kstEducationMentoringListModel;
                      _totalKSTReports = Utils().nullSafeInt(_kstEducationMentoringListModel!.result!.total);

                      if (_kstEducationMentoringListModel!.result!.data!.length == _allRecords.length) {
                        setState(() {
                          loading = false;
                        });
                      } else {
                        _scrollController.loadComplete();
                      }
                      final allRecords = _kstEducationMentoringListModel!.result!.data!;
                      _allRecords = allRecords
                          .map(
                            (e) => KEMDataModel.fromJson(
                              jsonDecode(
                                jsonEncode(e),
                              ),
                            ),
                          )
                          .toList();
                      _educationMentoringItems!.clear();
                      _educationMentoringItems!.addAll(
                        List.from(
                          allRecords
                              .map(
                                (e) => KEMDataModel.fromJson(
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
                      _educationMentoringItems!.clear();
                      _totalKSTReports = 0;
                    });
                  }
                },
                orElse: () {});
          },
        ),
        BlocListener<ParamsBloc, ParamsState>(
          listener: (context, state) {
            if (state is KSTEducationMentoringListRefreshState) {
              if (state.isForRefresh) {
                _scrollController.requestRefresh();
                // _pagingController.refresh();
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
                    bottom: 18,
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
                                    "Education Mentoring",
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
                              VRouter.of(context).to(AddEducationMentoringInteraction.id);
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
                        "${Utils().nullSafeString(_manageKSTReportListDataModel!.CenterName)} - ${Utils().nullSafeString(_manageKSTReportListDataModel!.wingName)} Education Mentoring Interaction Log",
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
                                                _search.text = "";
                                                _currentPage = 1;
                                                _showLoadingIndicator();
                                                BlocProvider.of<ManageKSTReportBloc>(context)
                                                    .add(ManageKSTReportEvent.kstEducationMentoringList(
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
                                          loading = true;
                                          _currentPage = 1;
                                          _showLoadingIndicator();
                                          BlocProvider.of<ManageKSTReportBloc>(context)
                                              .add(ManageKSTReportEvent.kstEducationMentoringList(
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
                  if (_educationMentoringItems!.isEmpty)
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
                      onRefresh(context, Utils().nullSafeString(_manageKSTReportListDataModel!.id.toString()),
                          _search.text, pageKey, _pageSize);
                    },
                    header: const WaterDropMaterialHeader(),
                    controller: _scrollController,
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      controller: _scrollControllerList,
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: (_educationMentoringItems?.length ?? 0) + 1,
                      itemBuilder: (context, index) => (_educationMentoringItems!.length == index)
                          ? SizedBox(
                              height: 60,
                            )
                          : GestureDetector(
                              onTap: () {
                                //FOR ADD SELECTED ITEM
                                BlocProvider.of<ParamsBloc>(context).add(KSTReportDetailsEvent(
                                  _kstReportItem,
                                  _manageKSTReportListDataModel,
                                  /*isForSearch() ? _searchItems![index]! : */ _educationMentoringItems![index]!,
                                  null,
                                ));
                                VRouter.of(context).to(EducationMentoringInteractionDetails.id);
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  ListTile(
                                    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                                    title: Text(
                                      Utils().nullSafeString(
                                          (/*isForSearch() ? _searchItems![index]!.kst_report_type :*/ _educationMentoringItems![
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
                                                          (/*isForSearch() ? _searchItems![index]:*/ _educationMentoringItems![
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
                                                      (/*isForSearch() ? _searchItems![index]:*/ _educationMentoringItems![
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
                                                      (/*isForSearch() ? _searchItems![index]:*/ _educationMentoringItems![
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
                            ),
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
