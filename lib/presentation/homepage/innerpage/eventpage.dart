import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/event_detail.dart';
import 'package:flutter_app/models/home_model.dart';
import 'package:flutter_app/presentation/bloc/bloc.dart';
import 'package:flutter_app/presentation/bloc/params_bloc.dart';
import 'package:flutter_app/presentation/bloc/user_profile_bloc.dart';
import 'package:flutter_app/presentation/homepage/bloc/homepage_bloc.dart';
import 'package:flutter_app/presentation/homepage/home_screen.dart';
import 'package:flutter_app/presentation/homepage/innerpage/overview_page.dart';
import 'package:flutter_app/presentation/homepage/innerpage/registration_page.dart';
import 'package:flutter_app/utils/constant.dart';
import 'package:flutter_app/utils/login_status.dart';
import 'package:flutter_app/utils/util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import '../../../loader.dart';

class EventPage extends StatefulWidget {
  static String id = "eventpage";
  static String path = "${HomeScreen.path}/$id";
  final int? eventId;
  const EventPage({
    Key? key,
    required this.eventId,
  }) : super(key: key);

  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> with TickerProviderStateMixin {
  TabController? tabController;
  bool register = false;
  late MyEvent _myEventItem;
  EventDetailModel? eventDetailModel;
  String _strEventRegistrationStatus = Constant.erPending;

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

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Are you sure?'),
            content: new Text('Do you want to exit an App'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('No'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: new Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);

    final paramsBloc = BlocProvider.of<ParamsBloc>(context).state;
    if (paramsBloc is EventState) {
      _myEventItem = paramsBloc.myEvent;
      setState(() {
        _strEventRegistrationStatus = Utils().nullSafeString(_myEventItem.registration_status.toString());
      });
    }
    if (widget.eventId != null) {
      _showLoadingIndicator();
      BlocProvider.of<EventDetailBloc>(context).add(EventDetailEvent.eventDetail(widget.eventId, context));
    }

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    register = false;
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<ParamsBloc, ParamsState>(
          listener: (context, state) {
            if (state is EventRegistrationStatusState) {
              setState(() {
                _strEventRegistrationStatus = state.strEventStatus;
              });
            }
          },
        ),
        BlocListener<EventDetailBloc, EventDetailState>(
          listener: (context, state) {
            state.maybeWhen(
                load: (eventDetailModel, l) {
                  if (l == LoadingStatus.Done) {
                    _hideLoadingIndicator();
                    this.eventDetailModel = eventDetailModel;
                  }
                },
                empty: (l) {
                  if (l == LoadingStatus.Error) {
                    Utils().showToast("Something is wrong");
                  } else {
                    Container();
                  }
                },
                orElse: () {});
          },
        ),
        BlocListener<HomeBloc, HomeState>(
          listener: (context, state) {
            state.maybeWhen(
                eventWontBeAttend: (eventWontBeAttendModel, l) {
                  //FOR UPDATE EVENT UPDATE STATUS
                  if (l == LoadingStatus.Done) {
                    if (eventDetailModel != null) {
                      _hideLoadingIndicator();
                      BlocProvider.of<ParamsBloc>(context).add(SetEventUpdateStatusValue(true));
                      Navigator.pop(context);
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
      child: KeyboardVisibilityBuilder(
        builder: (p0, isKeyboardVisible) {
          return Stack(children: [
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
                              Navigator.of(context).pop();
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
                                      child: (eventDetailModel == null)
                                          ? Text("")
                                          : Text(
                                              eventDetailModel!.name,
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
                                child: eventDetailModel == null
                                    ? Text("")
                                    : Text(
                                        eventDetailModel!.country + " • " + eventDetailModel!.date_time,
                                        style: TextStyle(
                                          color: Colors.grey[600],
                                          fontSize: 13.68,
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
                (register)
                    ? Row(
                        children: [
                          Container(
                            /*width: 0.535,*/
                            child: TabBar(
                              isScrollable: true,
                              indicatorSize: TabBarIndicatorSize.label,
                              unselectedLabelColor: Color(0xFF4F4F4F),
                              controller: tabController,
                              labelColor: Colors.lightBlue,
                              tabs: [
                                Tab(
                                  child: Container(
                                    child: Text(
                                      "Overview",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10.8,
                                      ),
                                    ),
                                  ),
                                ),
                                Tab(
                                  child: Container(
                                    child: Text(
                                      "Registration",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10.8,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 9, vertical: 5.124),
                            decoration: BoxDecoration(
                              color: _strEventRegistrationStatus == Constant.erPending
                                  ? Colors.grey[200]
                                  : Colors.green[200],
                              borderRadius: BorderRadius.circular(7.2),
                            ),
                            child: Text(
                              _getEventRegistrationStatus(_strEventRegistrationStatus),
                              style: TextStyle(
                                  fontSize: 9,
                                  color: _strEventRegistrationStatus == Constant.erPending
                                      ? Colors.grey[700]
                                      : Colors.green[700]),
                            ),
                          ),
                        ],
                      )
                    : Expanded(
                        child: Stack(
                          children: [
                            ListView(
                              physics: BouncingScrollPhysics(),
                              clipBehavior: Clip.hardEdge,
                              shrinkWrap: true,
                              children: [
                                Container(
                                  height: 219.6,
                                  child: eventDetailModel == null
                                      ? Center(child: CircularProgressIndicator())
                                      : eventDetailModel!.image != null
                                          ? Image.network(eventDetailModel!.image!)
                                          : null,
                                ),
                                Container(
                                  margin: EdgeInsets.all(10.8),
                                  child: (eventDetailModel == null)
                                      ? Text("Unknown")
                                      : (eventDetailModel!.description == null)
                                          ? Text("Unknown")
                                          : Text(
                                              eventDetailModel!.description ?? "",
                                              style: TextStyle(
                                                fontSize: 16.2,
                                                color: Colors.grey[600],
                                              ),
                                            ),
                                ),
                                SizedBox(
                                  height: 109.8,
                                ),
                              ],
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
                                    padding: EdgeInsets.only(
                                      top: 18,
                                      left: 21.6,
                                      right: 21.6,
                                      bottom: isKeyboardVisible ? 18 : 72,
                                    ),
                                    // width: double.infinity,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: [
                                        ElevatedButton(
                                          style: ButtonStyle(
                                            backgroundColor: MaterialStateColor.resolveWith((states) =>
                                                (Utils().nullSafeString(_myEventItem.is_open) == Constant.psSIT_FOUND)
                                                    ? Color(0xff2F80ED)
                                                    : Color(0xffBDBDBD)),
                                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(9),
                                              ),
                                            ),
                                          ),
                                          onPressed: () {
                                            if ((Utils().nullSafeString(_myEventItem.is_open) ==
                                                Constant.psSIT_FOUND)) {
                                              setState(() {
                                                register = true;
                                              });
                                            } else {
                                              Utils().showToast("Sit is not available!");
                                            }
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.all(10.8),
                                            child: Text(
                                              "Register",
                                              style: TextStyle(color: Colors.white, fontSize: 14.4),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 7.32,
                                        ),
                                        (Utils().nullSafeString(_myEventItem.is_open) == Constant.psSIT_FOUND)
                                            ? GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    _showWontBeAttendingEventDialog();
                                                  });
                                                },
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "I won't be attending",
                                                      style: TextStyle(
                                                          fontSize: 12.6, decoration: TextDecoration.underline),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            : Container()
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                (register)
                    ? Divider(
                        height: 0,
                      )
                    : SizedBox(),
                (register)
                    ? Expanded(
                        child: TabBarView(
                          controller: tabController,
                          children: [
                            OverView(_myEventItem, eventDetailModel),
                            Registration(_myEventItem, eventDetailModel),
                          ],
                        ),
                      )
                    : SizedBox(),
              ],
            ),
            Container(child: _isLoading ? Loader(loadingTxt: 'Please wait...') : Container())
          ]);
        },
      ),
    );
  }

  //region FOR GET EVENT REGISTRATION STATUS
  String _getEventRegistrationStatus(String strEventRegistrationStatus) {
    String strResult = 'Pending';
    switch (strEventRegistrationStatus) {
      case Constant.erPending:
        strResult = 'Pending';
        break;

      case Constant.erCompleted:
        strResult = 'Completed';
        break;
    }

    return strResult;
  }
  //endregion

  //region SHOW CONFIRMATION DIALOG FOR WON'T BE ATTENDING EVENT
  Future<void> _showWontBeAttendingEventDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('Confirmation'),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Text("Are you sure, You won't attending this Event?"),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Yes'),
              onPressed: () {
                Navigator.of(context).pop();

                _showLoadingIndicator();
                BlocProvider.of<HomeBloc>(context)
                    .add(HomeEvent.eventWontBeAttend(context, Utils().nullSafeString(_myEventItem.id.toString())));
              },
            ),
            TextButton(
              child: Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
//endregion
}
