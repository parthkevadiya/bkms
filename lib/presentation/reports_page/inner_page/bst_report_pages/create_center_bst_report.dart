import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/get_bst_wing_name_model.dart';
import 'package:flutter_app/presentation/bloc/params_bloc.dart';
import 'package:flutter_app/presentation/bloc/params_event.dart';
import 'package:flutter_app/presentation/bloc/params_state.dart';
import 'package:flutter_app/utils/util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../Bloc/bst_data_update_bloc.dart';
import '../../../../Bloc/manage_niyam_report_bloc.dart';
import '../../../../loader.dart';
import '../../bst_report_model.dart';
import '../bst_report.dart';

class CreateCenterBSTReport extends StatefulWidget {
  static String id = "createCenterBSTReport";
  static String path = "$BSTReport.path/$id";

  @override
  _CreateCenterBSTReportState createState() => _CreateCenterBSTReportState();
}

class _CreateCenterBSTReportState extends State<CreateCenterBSTReport> with TickerProviderStateMixin {
  List<BSTCentersItems?>? _bstCenterItems;
  BSTCentersItems? _selectedCenter;

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
    if (paramsBloc is CreateCenterBSTReportState) {
      _bstCenterItems = paramsBloc.bstCenters;
    }

    //FOR ADD DATA
    BlocProvider.of<ParamsBloc>(context).add(CreateCenterBSTReportEvent(_bstCenterItems));
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
        BlocListener<ManageNiyamReportBloc, ManageNiyamReportState>(
          listener: (context, state) {
            _hideLoadingIndicator();

            state.maybeWhen(
                createCenterBSTReport: (createCenterBSTReportModel) {
                  if (!createCenterBSTReportModel!.has_error!) {
                    //FOR UPDATE BST REPORT LIST
                    BlocProvider.of<ParamsBloc>(context).add(BSTReportRefreshEvent(true));
                    Navigator.of(context).pop();
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
                                    "Create Center BST Report",
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
                              "BST Report",
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
                                      child: DropdownButton<BSTCentersItems>(
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
                                                    Utils().nullSafeString(_selectedCenter!.id.toString()), "BST"));
                                          });
                                        },
                                        items: _bstCenterItems!.map(
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
                                              //FOR CREATE CENTER BST REPORT
                                              _showLoadingIndicator();
                                              BlocProvider.of<ManageNiyamReportBloc>(context).add(
                                                  ManageNiyamReportEvent.createCenterBSTReport(
                                                      context,
                                                      Utils().nullSafeString(_selectedCenter!.id.toString()),
                                                      Utils().nullSafeString(_selectedWing!.wing_id.toString())));
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
