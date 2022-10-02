import 'dart:convert';
import 'dart:io';
import 'dart:isolate';
import 'dart:ui';
import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/presentation/bloc/bloc.dart';
import 'package:flutter_app/presentation/lifecycle/lifecycle_manager.dart';
import 'package:flutter_app/presentation/profile/add_new_record.dart';
import 'package:flutter_app/presentation/profile/profile_page_scaffold.dart';
import 'package:flutter_app/presentation/records_page/inner_page/fillter.dart';
import 'package:flutter_app/presentation/records_page/record_model.dart';
import 'package:flutter_app/utils/constant.dart';
import 'package:flutter_app/utils/login_status.dart';
import 'package:flutter_app/utils/util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import '../../loader.dart';
import '../homepage/home_screen.dart';
import 'bloc/record_bloc.dart';

typedef void RecordLengthSelectionCallBack(int value);

class Records extends StatefulWidget {
  static const String id = "record";
  static const String path = "${HomeScreen.path}/$id";
  const Records({Key? key}) : super(key: key);

  @override
  _RecordsState createState() => _RecordsState();
}

class _RecordsState extends State<Records> {
  //FOR PAGINATION
  static int _currentPage = 1;
  final int _pageSize = 50;
  int pageKey = 1;
  final RefreshController _scrollController = RefreshController();

  bool _isLoading = false;
  bool isMenuOpen = false;
  var excel = Excel.createExcel();

  List<RecordsItem?> _recordItems = [];
  List<RecordsItem?> _allRecords = [];
  RecordModel? _recordModel;

  final ReceivePort _port = ReceivePort();
  ScrollController _scrollControllerList = ScrollController();

  //FOR SEARCH
  final TextEditingController _search = TextEditingController();

  void onRefresh(context, strCName, strCGender, strCWing, strCSchoolYear, strCCenter, strCRegion, strCuserGroup,
      strfname, strmname, strlname, struser_id, stremail, pageKey, _pageSize, bool val) {
    _currentPage = pageKey;
    if (pageKey == 1) {
      _recordItems = [];
    }
    //FOR GET RECORDS
    BlocProvider.of<RecordBloc>(context).add(
      RecordEvent.load(context, strCName, strCGender, strCWing, strCSchoolYear, strCCenter, strCRegion, strCuserGroup,
          strfname, strmname, strlname, struser_id, stremail, pageKey, _pageSize, val),
    );
  }

  Future getExcel(List<RecordsItem?> records) async {
    Sheet sheetObject = excel['Sheet1'];
    var srNo = sheetObject.cell(CellIndex.indexByString("A1"));
    var name = sheetObject.cell(CellIndex.indexByString("B1"));
    var email = sheetObject.cell(CellIndex.indexByString("C1"));
    var phNo = sheetObject.cell(CellIndex.indexByString("D1"));
    var gender = sheetObject.cell(CellIndex.indexByString("E1"));
    var schoolYear = sheetObject.cell(CellIndex.indexByString("F1"));
    var wing = sheetObject.cell(CellIndex.indexByString("G1"));
    var region = sheetObject.cell(CellIndex.indexByString("H1"));
    var center = sheetObject.cell(CellIndex.indexByString("I1"));
    srNo.value = "Sr. No.";
    name.value = "Name";
    email.value = "Email";
    phNo.value = "Phone Number";
    gender.value = "Gender";
    schoolYear.value = "School Year";
    wing.value = "Wing";
    region.value = "Region";
    center.value = "Center";

    // for (int i = 0; i < 9; i++) {
    //   var x = records.map((e) => e?.copy()).toList();
    //   records.addAll(x);
    // }

    records.asMap().forEach((i, e) {
      if (e != null) {
        var srNo = sheetObject.cell(CellIndex.indexByString("A${i + 2}"));
        var name = sheetObject.cell(CellIndex.indexByString("B${i + 2}"));
        var email = sheetObject.cell(CellIndex.indexByString("C${i + 2}"));
        var phNo = sheetObject.cell(CellIndex.indexByString("D${i + 2}"));
        var gender = sheetObject.cell(CellIndex.indexByString("E${i + 2}"));
        var schoolYear = sheetObject.cell(CellIndex.indexByString("F${i + 2}"));
        var wing = sheetObject.cell(CellIndex.indexByString("G${i + 2}"));
        var region = sheetObject.cell(CellIndex.indexByString("H${i + 2}"));
        var center = sheetObject.cell(CellIndex.indexByString("I${i + 2}"));
        srNo.value = i + 1;
        name.value = e.name;
        email.value = e.email;
        phNo.value = e.phone_cell;
        gender.value = e.gender;
        schoolYear.value = e.school_year;
        wing.value = e.current_wing_name;
        region.value = e.region;
        center.value = e.center;
      }
    });

    await writeCounter(excel);
  }

  Future<File> get _localFile async {
    Directory tempDir = await getApplicationDocumentsDirectory();

    getLibraryDirectory();
    getApplicationDocumentsDirectory();
    String fileName = "record" +
        DateTime.now().toLocal().toString().replaceAll(" ", "_").replaceAll(":", "_").replaceAll(".", "_") +
        ".xlsx";

    if (Platform.isIOS) {
      return File('${tempDir.path}/$fileName');
    } else {
      return File('/storage/emulated/0/Download/$fileName');
    }
  }

  Future writeCounter(Excel excel) async {
    final file = await _localFile;

    File(file.path)
      ..createSync(recursive: true)
      ..writeAsBytesSync(excel.encode() ?? []);
    // return file.writeAsBytes(excel.encode());
  }
  //VAAPGLKNS RECORDS NOTE
  //region PERFORM SEARCH OPERATIONS ON RECORD LIST
  /*void searchOperation(String strSearch) {
    //FOR ADD SELECTED FILTERS
    BlocProvider.of<ParamsBloc>(context)
        .add(SetRecordSearchValue(strSearch, _isSearching));
  }*/

  //endregion

  //FOR FILTERS

  String strCName = "";
  String strCGender = "";
  String strCWing = "";
  String strCSchoolYear = "";
  String strCCenter = "";
  String strCRegion = "";
  String strCuserGroup = "";
  String strFilePath = "";
  String taskId = "";
  String strfname = "";
  String strmname = "";
  String strlname = "";
  String struser_id = "";
  String stremail = "";

  var strFileULR;
  bool? isCallBackFilter;

  int _totalRecords = 0;

  void _showLoadingIndicator() {
    setState(() {
      _isLoading = true;
    });
  }

  callAddRecord(bool addOrNot) {
    if (addOrNot) {
      _showLoadingIndicator();
      BlocProvider.of<RecordBloc>(context).add(
        RecordEvent.load(context, "", "", "", "", "", "", "", "", "", "", "", "", 1, _pageSize, false),
      );
    }
  }

  void _hideLoadingIndicator() {
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    //FOR GET RECORDS
    _showLoadingIndicator();
    _recordItems.clear();
    BlocProvider.of<RecordBloc>(context).add(
      RecordEvent.load(context, strCName, strCGender, strCWing, strCSchoolYear, strCCenter, strCRegion, strCuserGroup,
          strfname, strmname, strlname, struser_id, stremail, _currentPage, _pageSize, false),
    );
    _port.listen((dynamic data) {
      String id = data[0];
      DownloadTaskStatus status = data[1];
      int progress = data[2];
      setState(() {
        if (status == DownloadTaskStatus.complete) {
          Utils().showSnackBarWithCallback(
              context, 'Records is exported successfully and saved at $strFilePath', 'Open', (isClicked) {
            FlutterDownloader.open(taskId: taskId);
          });
        } else if (status == DownloadTaskStatus.failed) {
          Utils().showToast('Export failed!');
        } else if (status == DownloadTaskStatus.canceled) {
          Utils().showToast('Export cancelled!');
        } else if (status == DownloadTaskStatus.paused) {
          Utils().showToast('Export paused!');
        }
      });
    });
  }

  bool checkClearFilter = false;
  bool loading = true;
  bool refresh = true;

  @override
  Widget build(BuildContext context) {
    return LifecycleManager(
      child: MultiBlocListener(
          listeners: [
            BlocListener<RecordBloc, RecordState>(listener: (context, state) {
              state.maybeWhen(
                  loadRecord: (recordModel, l) {
                    if (l == LoadingStatus.Done) {
                      _recordItems.clear();
                      _hideLoadingIndicator();
                      _totalRecords = 0;

                      if (recordModel != null && recordModel.records != null) {
                        _recordModel = recordModel;
                        _totalRecords = Utils().nullSafeInt(_recordModel!.total_reocrds);

                        if (_recordModel!.records!.length == _allRecords.length) {
                          setState(() {
                            loading = false;
                          });
                        } else {
                          _scrollController.loadComplete();
                        }
                        final allRecords = _recordModel!.records!;
                        _allRecords = allRecords
                            .map(
                              (e) => RecordsItem.fromJson(
                                jsonDecode(
                                  jsonEncode(e),
                                ),
                              ),
                            )
                            .toList();
                        _recordItems.clear();
                        _recordItems.addAll(
                          List.from(
                            allRecords
                                .map(
                                  (e) => RecordsItem.fromJson(
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
                      }
                    } else if (l == LoadingStatus.Error) {
                      setState(() {
                        _hideLoadingIndicator();
                        _recordItems.clear();
                        _totalRecords = 0;
                      });
                    }
                  },
                  orElse: () {});
            }),
            BlocListener<ExportBloc, ExportState>(
              listener: (context, state) {
                state.maybeWhen(
                    complete: (exportModel, l) {
                      if (l == LoadingStatus.Done) {
                        setState(() {
                          _hideLoadingIndicator();
                          final allRecords = exportModel!.records!;
                          _allRecords = allRecords
                              .map(
                                (e) => RecordsItem.fromJson(
                                  jsonDecode(
                                    jsonEncode(e),
                                  ),
                                ),
                              )
                              .toList();
                          _recordItems.clear();
                          _recordItems.addAll(
                            List.from(
                              allRecords
                                  .map(
                                    (e) => RecordsItem.fromJson(
                                      jsonDecode(
                                        jsonEncode(e),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          );
                          getExcel(_recordItems).then((value) => ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text("Exported Successfully"))));
                        });
                      }
                    },
                    orElse: () {});
              },
            ),
            BlocListener<ParamsBloc, ParamsState>(
              listener: (context, state) {
                // if (state is SelectedFiltersState) {
                //   strCGender = state.strCGender;
                //   strCWing = state.strCWing;
                //   strCSchoolYear = state.strCSchoolYear;
                //   strCCenter = state.strCCenter;
                //   strCRegion = state.strCRegion;
                //
                //   _scrollController.refreshCompleted();
                //   //           _pagingController.refresh();
                //
                //   /*_currentPage = 0;
                //   _recordItems = [];
                //   _searchItems = [];
                //
                //   //CALL API FOR COLLECT UPDATE FILTERS DATA
                //   BlocProvider.of<RecordBloc>(context).add(RecordEvent.load(
                //       context,
                //       strCName,
                //       strCGender,`
                //       strCWing,
                //       strCSchoolYear,
                //       strCCenter,
                //       strCRegion,
                //       _currentPage,
                //       _pageSize,
                //       false));*/
                // }

                if (state is DeActivateUserStatusState) {
                  //FOR UPDATE LIST AFTER USER DEACTIVATED
                  if (state.isUserDeActivated) {
                    //      _pagingController.refresh();
                    /* _currentPage = 0;
                    _recordItems = [];
                    _searchItems = [];
                    BlocProvider.of<RecordBloc>(context).add(RecordEvent.load(
                        context,
                        strCName,
                        strCGender,
                        strCWing,
                        strCSchoolYear,
                        strCCenter,
                        strCRegion,
                        _currentPage,
                        _pageSize,
                        false));*/
                  }
                }
              },
            ),
          ],
          child: GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(
              FocusNode(),
            ),
            child: Stack(children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    decoration: const BoxDecoration(
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
                        padding: EdgeInsets.only(left: 14.4, right: 14.4, bottom: 18),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      Flexible(
                                        child: Text(
                                          "Records ",
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
                                          (_search.text.isEmpty)
                                              ? _totalRecords.toString()
                                              : _recordItems.length.toString(),
                                          style: TextStyle(
                                            fontSize: 10.8,
                                            color: Colors.grey[600],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                PortalEntry(
                                  visible: isMenuOpen,
                                  portal: GestureDetector(
                                    child: Container(
                                      color: const Color(0xCC262623),
                                    ),
                                    // behavior: HitTestBehavior.opaque,
                                    onTap: () {
                                      setState(() {
                                        isMenuOpen = false;
                                      });
                                    },
                                  ),
                                  child: PortalEntry(
                                    portalAnchor: Alignment.topRight,
                                    childAnchor: Alignment.bottomCenter,
                                    visible: isMenuOpen,
                                    portal: IntrinsicWidth(
                                      child: Container(
                                        width: 216,
                                        // height: ScreenSize.height * 0.135,
                                        decoration: BoxDecoration(
                                          color: const Color(0xCCffffff),
                                          borderRadius: BorderRadius.circular(7.2),
                                        ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  isMenuOpen = false;
                                                  openFilter();
                                                });
                                              },
                                              child: Padding(
                                                padding: EdgeInsets.all(10.8),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      'Filter ',
                                                      style: TextStyle(fontSize: 14.4),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            const Divider(
                                              height: 0,
                                              color: Colors.black,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  // getExcel();
                                                  isMenuOpen = false;
                                                  _showExportLengthSelectionDialog(context, _totalRecords, _pageSize,
                                                      (value) {
                                                    //FOR EXPORT RECORDS
                                                    _showLoadingIndicator();
                                                    BlocProvider.of<ExportBloc>(context).add(
                                                      ExportEvent.export(
                                                          context,
                                                          strCName,
                                                          strCGender,
                                                          strCWing,
                                                          strCSchoolYear,
                                                          strCCenter,
                                                          strCRegion,
                                                          strCuserGroup,
                                                          strfname,
                                                          strmname,
                                                          strlname,
                                                          struser_id,
                                                          stremail,
                                                          0,
                                                          value,
                                                          true),
                                                    );
                                                  });
                                                });
                                              },
                                              child: Padding(
                                                padding: EdgeInsets.all(10.8),
                                                child: Text(
                                                  'Export List',
                                                  style: TextStyle(fontSize: 14.4),
                                                ),
                                              ),
                                            ),
                                            const Divider(
                                              height: 0,
                                              color: Colors.black,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  isMenuOpen = false;
                                                });
                                                showMaterialModalBottomSheet(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.only(
                                                      topRight: Radius.circular(14.4),
                                                      topLeft: Radius.circular(14.4),
                                                    ),
                                                  ),
                                                  expand: false,
                                                  context: context,
                                                  builder: (context) => AddNewRecord(
                                                    addRecordData: (addOrNot) {
                                                      callAddRecord(addOrNot);
                                                    },
                                                  ),
                                                );
                                              },
                                              child: Padding(
                                                padding: EdgeInsets.all(10.8),
                                                child: Text(
                                                  'Add Record',
                                                  style: TextStyle(fontSize: 14.4),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          isMenuOpen = true;
                                        });
                                      },
                                      child: Icon(
                                        Icons.more_vert,
                                        color: Colors.blue,
                                        size: 23.4,
                                      ),
                                    ),
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
                                        suffixIcon: _search.text == ""
                                            ? SizedBox()
                                            : InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    isCallBackFilter = false;
                                                    checkClearFilter = true;
                                                    _search.text = "";
                                                    loading = true;
                                                    pageKey = 1;
                                                  });
                                                  // FocusScope.of(context)
                                                  //     .requestFocus(
                                                  //         new FocusNode());
                                                  strCGender = "";
                                                  strCWing = "";
                                                  strCSchoolYear = "";
                                                  strCCenter = "";
                                                  strCRegion = "";
                                                  //    _pagingController.refresh();

                                                  BlocProvider.of<RecordBloc>(context).add(
                                                    RecordEvent.load(
                                                        context,
                                                        strCName,
                                                        strCGender,
                                                        strCWing,
                                                        strCSchoolYear,
                                                        strCCenter,
                                                        strCRegion,
                                                        strCuserGroup,
                                                        strfname,
                                                        strmname,
                                                        strlname,
                                                        struser_id,
                                                        stremail,
                                                        1,
                                                        _pageSize,
                                                        false),
                                                  );
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
                                                _showLoadingIndicator();
                                                BlocProvider.of<RecordBloc>(context).add(
                                                  RecordEvent.load(
                                                      context,
                                                      _search.text,
                                                      strCGender,
                                                      strCWing,
                                                      strCSchoolYear,
                                                      strCCenter,
                                                      strCRegion,
                                                      strCuserGroup,
                                                      strfname,
                                                      strmname,
                                                      strlname,
                                                      struser_id,
                                                      stremail,
                                                      1,
                                                      _pageSize,
                                                      false),
                                                );
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
                    //VAAPGLKNS RECORDS NOTE
                    // child: RecordsNode(),
                    child: WillPopScope(
                      onWillPop: () async {
                        if (isMenuOpen) {
                          setState(() {
                            isMenuOpen = false;
                          });
                          return false;
                        } else {
                          return true;
                        }
                      },
                      child: Stack(
                        children: [
                          if (_recordItems.isEmpty)
                            Center(
                              child: Container(
                                margin: EdgeInsets.all(
                                  9,
                                ),
                                padding: EdgeInsets.all(9),
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
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
                                      CommonMessage.record,
                                      style: TextStyle(color: const Color(0xFF828282), fontSize: 12.6),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 55),
                            child: SmartRefresher(
                              enablePullDown: false,
                              enablePullUp: loading,
                              onLoading: () {
                                pageKey++;
                                if (_search.text.isEmpty) {
                                  onRefresh(
                                      context,
                                      strCName,
                                      strCGender,
                                      strCWing,
                                      strCSchoolYear,
                                      strCCenter,
                                      strCRegion,
                                      strCuserGroup,
                                      strfname,
                                      strmname,
                                      strlname,
                                      struser_id,
                                      stremail,
                                      pageKey,
                                      _pageSize,
                                      false);
                                } else {
                                  onRefresh(
                                      context,
                                      _search.text,
                                      strCGender,
                                      strCWing,
                                      strCSchoolYear,
                                      strCCenter,
                                      strCRegion,
                                      strCuserGroup,
                                      strfname,
                                      strmname,
                                      strlname,
                                      struser_id,
                                      stremail,
                                      pageKey,
                                      _pageSize,
                                      false);
                                }
                              },
                              header: const WaterDropMaterialHeader(),
                              controller: _scrollController,
                              child: ListView.builder(
                                controller: _scrollControllerList,
                                padding: EdgeInsets.zero,
                                physics: const BouncingScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: _recordItems.length + 1,
                                itemBuilder: (context, index) => (_recordItems.length == index)
                                    ? SizedBox(
                                        height: 40,
                                      )
                                    : GestureDetector(
                                        child: Column(
                                          children: [
                                            ListTile(
                                              leading: _recordItems[index]!.image != null
                                                  ? CircleAvatar(
                                                      radius: 21.6,
                                                      backgroundImage: NetworkImage(_recordItems[index]!.image ?? ""),
                                                    )
                                                  : CircleAvatar(
                                                      backgroundColor: Colors.blueGrey[50],
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(5.0),
                                                        child: FittedBox(
                                                          child: Text(
                                                            _recordItems[index]!.name!.characters.first.toUpperCase(),
                                                            style:
                                                                const TextStyle(fontSize: 500, color: Colors.blueGrey),
                                                          ),
                                                        ),
                                                      ),
                                                      radius: 21.6,
                                                    ),
                                              title: Text(
                                                _recordItems[index]!.name ?? "",
                                                style: TextStyle(
                                                    fontSize: 16.2,
                                                    color: const Color(0xFF4F4F4F),
                                                    fontWeight: FontWeight.bold),
                                              ),
                                              subtitle: Text(
                                                "${_recordItems[index]!.region} • ${_recordItems[index]!.current_wing_name}",
                                                style: TextStyle(color: const Color(0xFF828282), fontSize: 13.68),
                                              ),
                                            ),
                                            Divider(
                                              height: 7.32,
                                            ),
                                          ],
                                        ),
                                        onTap: () {
                                          setState(() {
                                            //FOR ADD SELECTED RECORD-ID
                                            BlocProvider.of<ParamsBloc>(context)
                                                .add(SetRecordIdValue(_recordItems[index]!.id.toString()));

                                            showMaterialModalBottomSheet(
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(14.4),
                                                  topLeft: Radius.circular(14.4),
                                                ),
                                              ),
                                              expand: false,
                                              context: context,
                                              builder: (context) => ProfilePageScaffold(true),
                                            );
                                          });
                                        },
                                      ),
                              ),
                            ),
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
                                      _recordItems.isEmpty
                                          ? "Showing no results based on filters. "
                                          : ((_search.text.isEmpty)
                                              ? "Showing all ${_totalRecords.toString()} result. "
                                              : "Showing all ${_recordItems.length} result. "),
                                      style: TextStyle(
                                        fontSize: 12.6,
                                        color: const Color(0xFF4F4F4F),
                                      ),
                                    ),
                                    (isCallBackFilter ?? false)
                                        ? GestureDetector(
                                            behavior: HitTestBehavior.opaque,
                                            onTap: () {
                                              setState(() {
                                                isCallBackFilter = false;
                                              });
                                              strCGender = "";
                                              strCWing = "";
                                              strCSchoolYear = "";
                                              strCCenter = "";
                                              strCRegion = "";
                                              //           _pagingController.refresh();

                                              (_search.text.isEmpty)
                                                  ? BlocProvider.of<RecordBloc>(context).add(
                                                      RecordEvent.load(
                                                          context,
                                                          strCName,
                                                          strCGender,
                                                          strCWing,
                                                          strCSchoolYear,
                                                          strCCenter,
                                                          strCRegion,
                                                          strCuserGroup,
                                                          strfname,
                                                          strmname,
                                                          strlname,
                                                          struser_id,
                                                          stremail,
                                                          1,
                                                          _pageSize,
                                                          false),
                                                    )
                                                  : BlocProvider.of<RecordBloc>(context).add(
                                                      RecordEvent.load(
                                                          context,
                                                          _search.text,
                                                          strCGender,
                                                          strCWing,
                                                          strCSchoolYear,
                                                          strCCenter,
                                                          strCRegion,
                                                          strCuserGroup,
                                                          strfname,
                                                          strmname,
                                                          strlname,
                                                          struser_id,
                                                          stremail,
                                                          1,
                                                          _pageSize,
                                                          false),
                                                    );
                                              if (_scrollControllerList.positions.isNotEmpty) {
                                                _scrollControllerList
                                                    .jumpTo(_scrollControllerList.position.minScrollExtent);
                                              }
                                              setState(() {
                                                loading = true;
                                              });
                                              _showLoadingIndicator();
                                            },
                                            child: Text(
                                              "Clear Filters",
                                              style: TextStyle(fontSize: 12.6, color: Colors.blue),
                                            ),
                                          )
                                        : GestureDetector(
                                            behavior: HitTestBehavior.opaque,
                                            onTap: () {
                                              openFilter();
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
                  ),
                ],
              ),
              Container(
                  child: _isLoading
                      ? Center(
                          child: Loader(loadingTxt: 'Please wait...'),
                        )
                      : Container())
            ]),
          )),
    );
  }

  //region FOR EXPORT RECORD
  Future<void> exportRecord(String strFileULR) async {
    if (await Permission.storage.request().isGranted) {
      var dir = await Utils().getPathToDownload();
      File file = File(dir);
      String filePath = dir + "/";

      var fullDir = Directory(filePath);
      bool hasExisted = await fullDir.exists();
      if (!hasExisted) {
        fullDir.create();
      }

      String fileExtension = strFileULR.split(".").last;
      String data = strFileULR.split("/").last;
      List<String> newData = data.split(".");
      newData.removeAt(newData.length - 1);
      newData.add("_" + DateTime.now().toLocal().toString() + "." + fileExtension);
      String fileName = newData.join("").replaceAll(" ", "_");
      print(fileName);
      FlutterDownloader.registerCallback(downloadCallback);
      final tid = await FlutterDownloader.enqueue(
        fileName: fileName,
        url: strFileULR,
        savedDir: filePath,
        showNotification: true,
        // show download progress in status bar (for Android)
        openFileFromNotification: true, // click on notification to open downloaded file (for Android)
      );
      setState(() {
        taskId = tid ?? "";
        strFilePath = filePath;
      });
      Utils().showSnackBar(context, 'Records is exporting!');

      IsolateNameServer.registerPortWithName(_port.sendPort, 'downloader_send_port');
    }
  }

//   //region FOR DOWNLOAD CALLBACK
  static void downloadCallback(String id, DownloadTaskStatus status, int progress) {
    final SendPort? send = IsolateNameServer.lookupPortByName('downloader_send_port');
    send!.send([id, status, progress]);
  }

//   //endregion
//
  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
    _recordItems.clear();
    pageKey = 1;
    _currentPage = 1;
    _search.clear();
    IsolateNameServer.removePortNameMapping('downloader_send_port');
  }

//
//   //region SHOW DIALOG FOR EXPORT RECORDS LENGTH SELECTION
  Future<void> _showExportLengthSelectionDialog(BuildContext context, int _totalRecords, int _pageSize,
      RecordLengthSelectionCallBack recordLengthSelectionCallBack) async {
    List<String> values = ['50', '100', 'All'];
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text("How many Records you want to Export?"),
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (ctx, index) {
                  return SimpleDialogOption(
                    onPressed: () async {
                      Navigator.pop(context);

                      int value = _pageSize;
                      switch (index) {
                        case 0:
                          value = 50;
                          break;
                        case 1:
                          value = 100;
                          break;
                        case 2:
                          value = _totalRecords;
                          break;
                      }
                      recordLengthSelectionCallBack.call(value);
                    },
                    child: Text(values[index]),
                  );
                },
                itemCount: values.length,
              ),
            )
          ],
        );
      },
    );
  }

//endregion
  openFilter() {
    showMaterialModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(14.4),
          topLeft: Radius.circular(14.4),
        ),
      ),
      expand: false,
      context: context,
      builder: (context) => Filter(
        onSelectFilter: (
          bool callBackFilter,
          String strName,
          String gender,
          String selectedWing,
          String selectedSchoolYear,
          String selectedCenter,
          String selectedRegion,
          String selectedUserGroup,
        ) {
          setState(() {
            if (callBackFilter) {
              _allRecords.clear();
              if (_scrollControllerList.positions.isNotEmpty) {
                loading = true;

                _scrollControllerList.jumpTo(_scrollControllerList.position.minScrollExtent);
              }
            }
            isCallBackFilter = callBackFilter;
            strCName = strName;
            strCGender = gender;
            strCWing = selectedWing.toString();
            strCSchoolYear = selectedSchoolYear.toString();
            strCCenter = selectedCenter.toString();
            strCRegion = selectedRegion.toString();
            strCuserGroup = selectedUserGroup.toString();
            BlocProvider.of<RecordBloc>(context).add(
              RecordEvent.load(
                context,
                _search.text,
                strCGender,
                strCWing,
                strCSchoolYear,
                strCCenter,
                strCRegion,
                strCuserGroup,
                strfname,
                strmname,
                strlname,
                struser_id,
                stremail,
                1,
                50,
                false,
              ),
            );
            _showLoadingIndicator();
          });
        },
        isCallBackFilter: !checkClearFilter,
      ),
    );
  }
}
