import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_app/media_query/responsive.dart';
import 'package:flutter_app/models/get_bst_wing_name_model.dart';
import 'package:flutter_app/presentation/bloc/params_bloc.dart';
import 'package:flutter_app/presentation/bloc/params_event.dart';
import 'package:flutter_app/presentation/bloc/params_state.dart';
import 'package:flutter_app/presentation/reports_page/bloc/report_bloc.dart';
import 'package:flutter_app/utils/login_status.dart';
import 'package:flutter_app/utils/util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Bloc/bst_data_update_bloc.dart';
import '../../../../Bloc/manage_kst_reports_bloc.dart';
import '../../../../loader.dart';
import '../../kst_report_model.dart';
import '../kst_report.dart';

class CreateCenterKSTReport extends StatefulWidget {
  static String id = "createCenterKSTReport";
  static String path = "${KSTReport.path}/$id";

  @override
  _CreateCenterKSTReportState createState() => _CreateCenterKSTReportState();
}

class _CreateCenterKSTReportState extends State<CreateCenterKSTReport> with TickerProviderStateMixin {
  List<KSTCentersItems?>? _kstCenterItems;
  KSTCentersItems? _selectedCenter;

  List<BSTWingModel?>? _wingItems = [];
  BSTWingModel? _selectedWing;

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
    super.initState();

    final paramsBloc = BlocProvider.of<ParamsBloc>(context).state;
    if (paramsBloc is CreateCenterKSTReportState) {
      _kstCenterItems = paramsBloc.kstCenters;
    }

    //FOR ADD DATA
    BlocProvider.of<ParamsBloc>(context).add(CreateCenterKSTReportEvent(_kstCenterItems));
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<BSTDataUpdateBloc, BSTDataUpdateState>(
          listener: (context, state) {
            _hideLoadingIndicator();

            state.maybeWhen(
                getBSTWingName: (getBSTWingNameModel) {
                  if (getBSTWingNameModel != null) {
                    _wingItems = getBSTWingNameModel.wing!;
                  }
                },
                orElse: () {});
          },
        ),
        BlocListener<ManageKSTReportBloc, ManageKSTReportState>(
          listener: (context, state) {
            _hideLoadingIndicator();

            state.maybeWhen(
                createAllKSTReport: (createAllKSTReportModel, l) {
                  if (l == LoadingStatus.Done) {
                    _hideLoadingIndicator();
                    if (!createAllKSTReportModel!.has_error!) {
                      //FOR UPDATE KST REPORT LIST
                      BlocProvider.of<ParamsBloc>(context).add(KSTReportRefreshEvent(true));
                      Navigator.of(context).pop();
                    }
                  } else {
                    if (l == LoadingStatus.Error) {
                      _hideLoadingIndicator();
                    }
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
                                    "Create Center KST Report",
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
                              "KST Report",
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
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Stack(children: [
                            Padding(
                              padding: EdgeInsets.only(
                                left: 14.4,
                                right: 14.4,
                              ),
                              child: Container(
                                height: 695.4,
                                child: ListView(
                                  padding: EdgeInsets.zero,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 14.4),
                                      child: RichText(
                                        text: new TextSpan(
                                          // Note: Styles for TextSpans must be explicitly defined.
                                          // Child text spans will inherit styles from parent
                                          style: new TextStyle(
                                            fontSize: 14.4,
                                            color: Colors.black,
                                          ),
                                          children: <TextSpan>[
                                            new TextSpan(
                                                text: "Center",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold, fontSize: 14.4, color: Colors.black)),
                                            new TextSpan(
                                                text: "*",
                                                style: new TextStyle(
                                                    fontWeight: FontWeight.bold, fontSize: 14.4, color: Colors.red)),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          top: 7.32, left: getSecondStageMargin(Utils().nullSafeString(""))),
                                      child: DropdownButton<KSTCentersItems>(
                                        hint: Text('  Choose Center'),
                                        isExpanded: true,
                                        itemHeight: null,
                                        value: _selectedCenter == null ? null : _selectedCenter,
                                        icon: Icon(
                                          Icons.keyboard_arrow_down,
                                          size: 21.6,
                                        ),
                                        style: TextStyle(fontSize: 12.6, color: Colors.black),
                                        onChanged: (value) {
                                          setState(() {
                                            _selectedCenter = value!;

                                            _wingItems = [];
                                            _selectedWing = null;

                                            //FOR GET CENTER WISE WINGS
                                            _showLoadingIndicator();
                                            BlocProvider.of<BSTDataUpdateBloc>(context).add(
                                                BSTDataUpdateEvent.getBSTWingName(context,
                                                    Utils().nullSafeString(_selectedCenter!.id.toString()), "KST"));
                                          });
                                        },
                                        items: _kstCenterItems!.map(
                                          (value) {
                                            return DropdownMenuItem(
                                              child: Padding(
                                                padding: EdgeInsets.all(
                                                  7.2,
                                                ),
                                                child: Text(Utils().nullSafeString(value!.CenterName)),
                                              ),
                                              value: value,
                                            );
                                          },
                                        ).toList(),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 18.3,
                                    ),
                                    RichText(
                                      text: new TextSpan(
                                        // Note: Styles for TextSpans must be explicitly defined.
                                        // Child text spans will inherit styles from parent
                                        style: new TextStyle(
                                          fontSize: 14.4,
                                          color: Colors.black,
                                        ),
                                        children: <TextSpan>[
                                          new TextSpan(
                                              text: "Wing",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold, fontSize: 14.4, color: Colors.black)),
                                          new TextSpan(
                                              text: "*",
                                              style: new TextStyle(
                                                  fontWeight: FontWeight.bold, fontSize: 14.4, color: Colors.red)),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          top: 7.32, left: getSecondStageMargin(Utils().nullSafeString(""))),
                                      child: DropdownButton<BSTWingModel>(
                                        hint: Text('  Choose Wing'),
                                        isExpanded: true,
                                        itemHeight: null,
                                        value: _selectedWing == null ? null : _selectedWing,
                                        icon: Icon(
                                          Icons.keyboard_arrow_down,
                                          size: 21.6,
                                        ),
                                        style: TextStyle(fontSize: 12.6, color: Colors.black),
                                        onChanged: (value) {
                                          setState(() {
                                            _selectedWing = value!;
                                          });
                                        },
                                        items: _wingItems!.map(
                                          (value) {
                                            return DropdownMenuItem(
                                              child: Padding(
                                                padding: EdgeInsets.all(
                                                  7.2,
                                                ),
                                                child: Text(Utils().nullSafeString(value!.wingName)),
                                              ),
                                              value: value,
                                            );
                                          },
                                        ).toList(),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 87.84,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: ClipRect(
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
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
                                    padding: EdgeInsets.only(top: 18, left: 21.6, right: 21.6, bottom: 18),
                                    // width: double.infinity,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: [
                                        ElevatedButton(
                                          style: ButtonStyle(
                                            backgroundColor: MaterialStateColor.resolveWith((states) =>
                                                (_selectedWing != null) ? Color(0xff2F80ED) : Color(0xffBDBDBD)),
                                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(9),
                                              ),
                                            ),
                                          ),
                                          onPressed: () async {
                                            if (_selectedWing != null) {
                                              //FOR CREATE CENTER KST REPORT
                                              _showLoadingIndicator();
                                              BlocProvider.of<ManageKSTReportBloc>(context).add(
                                                  ManageKSTReportEvent.createAllKSTReport(
                                                      context,
                                                      Utils().nullSafeString(_selectedCenter!.id.toString()),
                                                      Utils().nullSafeString(_selectedWing!.wing_id.toString()),
                                                      false));
                                            }
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.all(10.8),
                                            child: Text(
                                              "Submit",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(color: Colors.white, fontSize: 14.4),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ]),
                        ),
                      ],
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
