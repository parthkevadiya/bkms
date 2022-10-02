import 'dart:io';
import 'package:app_settings/app_settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/loader.dart';
import 'package:flutter_app/media_query/responsive.dart';
import 'package:flutter_app/models/home_model.dart';
import 'package:flutter_app/models/login_model.dart';
import 'package:flutter_app/presentation/bloc/bloc.dart';
import 'package:flutter_app/presentation/bloc/setting_bloc.dart';
import 'package:flutter_app/presentation/homepage/bloc/homepage_bloc.dart';
import 'package:flutter_app/presentation/homepage/home_screen.dart';
import 'package:flutter_app/presentation/homepage/innerpage/check_in_qr_scan.dart';
import 'package:flutter_app/presentation/homepage/innerpage/eventpage.dart';
import 'package:flutter_app/presentation/lifecycle/lifecycle_manager.dart';
import 'package:flutter_app/presentation/lifecycle/local_auth_api.dart';
import 'package:flutter_app/utils/constant.dart';
import 'package:flutter_app/utils/login_status.dart';
import 'package:flutter_app/utils/util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vrouter/vrouter.dart';

import '../../preferences.dart';

class Home extends StatefulWidget {
  static const String id = "homePage";
  static const String path = "${HomeScreen.path}/$id";
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int? index1;
  bool isExpandEvent = false;
  bool isExpandSurvey = false;
  bool isExpandBirthday = false;
  bool authenticated = false;

  List<MyEvent?>? _myEventsItems = [];
  List<MySurveys?>? _mySurveysItems = [];
  List<UpcomingBirthdays?>? _upcomingBirthdaysItems = [];

  bool _isMyEventsPermission = true;
  bool _isMySurveyPermission = true;
  bool _isUpcomingBirthdaysPermission = true;

  int _totalMyEvents = 0;
  int _totalMySurveys = 0;
  int _totalUpcomingBirthdays = 0;

  LoginModel? loginModel;

  bool _isLoading = false;

  void _showLoadingIndicator() {
    setState(() {
      _isLoading = true;
    });
  }

  Future<void> openDialog() async {
    final _pref = await Preferences.getInstance();
    bool _alert = await _pref.getAleartDialog();
    if (LocalAuthApi.errorBio == true) {
      if (_alert == true) {
        if (Platform.isAndroid) {
          if (BlocProvider.of<SettingBloc>(context).state.bio) {
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (BuildContext ctx) {
                return CupertinoAlertDialog(
                  title: const Text('Biometrics Information'),
                  content: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        " If you can set biometrics then press goto Setting button and set the biometrics .",
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        " If you press Cancel button then it is not set .",
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () async {
                        BlocProvider.of<SettingBloc>(context).add(
                          const SettingEvent.setbiomatric(
                            (false),
                          ),
                        );
                        await _pref.setAleartDialog(false);
                        Navigator.pop(ctx);
                      }, // passing false
                      child: const Text(
                        'OK',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                    TextButton(
                      onPressed: () async {
                        AppSettings.openSecuritySettings();
                        await _pref.setAleartDialog(false);
                        Navigator.pop(ctx);
                      }, // passing false
                      child: const Text(
                        'Go to Setting',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          }
        }
      }
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
    _showLoadingIndicator();
    BlocProvider.of<HomeBloc>(context).add(HomeEvent.load(context));
  }

  @override
  Widget build(BuildContext context) {
    //  bool biometrics = BlocProvider.of<SettingBloc>(context).state.bio;
    return LifecycleManager(
      child: MultiBlocListener(
          listeners: [
            BlocListener<HomeBloc, HomeState>(
              listener: (context, state) {
                state.maybeWhen(
                    empty: () {
                      _hideLoadingIndicator();
                    },
                    load: (homeModel, l) {
                      if (l == LoadingStatus.Done) {
                        _hideLoadingIndicator();
                        for (var e in homeModel.my_event!) {
                          if (e!.is_expired == "0") {
                            _myEventsItems = homeModel.my_event;
                          }
                        }
                        //_myEventsItems = homeModel.my_event;
                        _upcomingBirthdaysItems = homeModel.upcoming_birthdays;
                        _mySurveysItems = homeModel.my_survey;

                        _isMyEventsPermission = homeModel.is_event_permission;
                        _isMySurveyPermission = homeModel.is_survey_permission;
                        _isUpcomingBirthdaysPermission = homeModel.upcoming_birthdays_permission;

                        _totalMyEvents = homeModel.total_event_count;
                        _totalUpcomingBirthdays = homeModel.total_my_upcoming_birthdays;
                        _totalMySurveys = homeModel.total_my_surveys;

                        //FOR UPDATE EVENT UPDATE STATUS
                        BlocProvider.of<ParamsBloc>(context).add(SetEventUpdateStatusValue(false));
                        openDialog();
                      } else {
                        if (l == LoadingStatus.Error) {
                          _hideLoadingIndicator();
                        }
                      }
                    },
                    error: (failure) {
                      _hideLoadingIndicator();
                      Utils().showToast(failure.msg);
                    },
                    orElse: () {});
              },
            ),
            BlocListener<ParamsBloc, ParamsState>(
              listener: (context, state) {
                if (state is SetEventUpdateStatusState) {
                  //FOR UPDATE LIST AFTER USER DEACTIVATED
                  if (state.isEventUpdated) {
                    _showLoadingIndicator();
                    BlocProvider.of<HomeBloc>(context).add(HomeEvent.load(context));
                  }
                }
              },
            ),
          ],
          child: FutureBuilder<Preferences>(
              future: Preferences.getInstance(),
              builder: (BuildContext context, AsyncSnapshot<Preferences> snapshot) {
                if (snapshot.hasData) {
                  loginModel = snapshot.data!.getToken();
                  return Stack(
                    children: [
                      SafeArea(
                        bottom: false,
                        left: false,
                        right: false,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 14.4,
                            right: 14.4,
                            bottom: 14.4,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 21.96,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                //change here don't //worked
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    Utils().nullSafeString(loginModel!.greeting_title) + ",",
                                    style: TextStyle(fontSize: 18, color: Colors.grey),
                                  ),
                                ],
                              ),
                              Text(
                                Utils().nullSafeString(loginModel!.f_name),
                                style: TextStyle(fontSize: 28.8, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 21.96,
                              ),
                              Expanded(
                                child: SingleChildScrollView(
                                  physics: BouncingScrollPhysics(),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      //    <===Events===>
                                      (_isMyEventsPermission == true)
                                          ? ExpansionTile(
                                              onExpansionChanged: (val) {
                                                setState(
                                                  () {
                                                    isExpandEvent = val;
                                                  },
                                                );
                                              },
                                              collapsedIconColor: Colors.black,
                                              iconColor: Colors.black,
                                              title: Row(
                                                children: [
                                                  Expanded(
                                                    child: Row(
                                                      children: [
                                                        Flexible(
                                                          child: Text(
                                                            "My Events",
                                                            style: TextStyle(
                                                                color: Colors.black,
                                                                fontSize: 18,
                                                                fontWeight: FontWeight.bold),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 3.6,
                                                        ),
                                                        Container(
                                                          padding:
                                                              EdgeInsets.symmetric(horizontal: 6.12, vertical: 2.196),
                                                          decoration: BoxDecoration(
                                                            color: Colors.grey[300],
                                                            borderRadius: BorderRadius.circular(18),
                                                          ),
                                                          child: Text(
                                                            _myEventsItems!.length.toString(),
                                                            style: TextStyle(
                                                              fontSize: 10.8,
                                                              color: Color(0xFF828282),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              children: [
                                                (_myEventsItems!.isEmpty)
                                                    ? Padding(
                                                        padding: EdgeInsets.only(
                                                            top: 10.8, left: 10.8, right: 10.8, bottom: 10.8),
                                                        child: Container(
                                                          padding: EdgeInsets.all(7.2),
                                                          decoration: BoxDecoration(
                                                            color: Colors.grey[200],
                                                            borderRadius: BorderRadius.circular(
                                                              5.4,
                                                            ),
                                                          ),
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            children: [
                                                              Icon(
                                                                Icons.not_interested,
                                                                size: 14.4,
                                                              ),
                                                              SizedBox(
                                                                width: 7.2,
                                                              ),
                                                              Text(
                                                                CommonMessage.event,
                                                                style: TextStyle(fontSize: 12.6),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      )
                                                    : ListView.builder(
                                                        padding: EdgeInsets.zero,
                                                        itemCount: _myEventsItems!.length,
                                                        physics: BouncingScrollPhysics(),
                                                        shrinkWrap: true,
                                                        itemBuilder: (context, index) {
                                                          return Column(
                                                            children: [
                                                              GestureDetector(
                                                                onTap: () {
                                                                  if (Utils().nullSafeString(
                                                                          _myEventsItems![index]!.is_expired) ==
                                                                      "0") {
                                                                    BlocProvider.of<ParamsBloc>(context)
                                                                        .add(SetEventValue(_myEventsItems![index]!));
                                                                    // VRouter.of(
                                                                    //         context)
                                                                    //     .to(EventPage
                                                                    //         .id);
                                                                    VRouter.of(context).to(EventPage.id +
                                                                        "/${_myEventsItems![index]!.id}");
                                                                  } else {
                                                                    Utils().showToast("Event is expired!");
                                                                  }
                                                                },
                                                                child: Container(
                                                                  decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(7.2),
                                                                    gradient: LinearGradient(
                                                                      end: Alignment.topCenter,
                                                                      begin: Alignment.bottomCenter,
                                                                      colors: <Color>[
                                                                        Color(0xffFFFAEA),
                                                                        Color(0xffE6F5FE),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  child: Padding(
                                                                    padding: EdgeInsets.only(top: 5.4, bottom: 5.4),
                                                                    child: ListTile(
                                                                      leading: _myEventsItems![index]!.image == ""
                                                                          ? CircleAvatar(
                                                                              backgroundColor: Colors.blueGrey[50],
                                                                              child: Padding(
                                                                                padding: const EdgeInsets.all(5.0),
                                                                                child: FittedBox(
                                                                                  child: Text(
                                                                                    _myEventsItems![index]!
                                                                                        .name
                                                                                        .characters
                                                                                        .first
                                                                                        .toUpperCase(),
                                                                                    style: const TextStyle(
                                                                                        fontSize: 500,
                                                                                        color: Colors.blueGrey),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              radius: 21.6,
                                                                            )
                                                                          : CircleAvatar(
                                                                              backgroundImage: NetworkImage(
                                                                                  _myEventsItems![index]!.image!),
                                                                            ),
                                                                      title: Text(
                                                                        _myEventsItems![index]!.name,
                                                                        style: TextStyle(
                                                                            fontSize: 16.2,
                                                                            color: Color(0xFF4F4F4F),
                                                                            fontWeight: FontWeight.bold),
                                                                      ),
                                                                      subtitle: Text(
                                                                        _myEventsItems![index]!.country +
                                                                            " • " +
                                                                            Utils().nullSafeString(
                                                                                _myEventsItems![index]!.date_time),
                                                                        style: TextStyle(
                                                                            color: Color(0xFF828282), fontSize: 13.68),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: 14.64,
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      ),
                                              ],
                                            )
                                          : SizedBox(),
                                      (_isMyEventsPermission == true && isExpandEvent == false)
                                          ? ListView.builder(
                                              padding: EdgeInsets.zero,
                                              itemCount: _myEventsItems!.length >= 2 ? 2 : _myEventsItems!.length,
                                              physics: BouncingScrollPhysics(),
                                              shrinkWrap: true,
                                              itemBuilder: (context, index) {
                                                return Column(
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        if (Utils()
                                                                .nullSafeString(_myEventsItems![index]!.is_expired) ==
                                                            "0") {
                                                          BlocProvider.of<ParamsBloc>(context)
                                                              .add(SetEventValue(_myEventsItems![index]!));

                                                          VRouter.of(context)
                                                              .to(EventPage.id + "/${_myEventsItems![index]!.id}");
                                                          // VRouter.of(context)
                                                          //     .to(EventPage.id);
                                                        } else {
                                                          Utils().showToast("Event is expired!");
                                                        }
                                                      },
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(7.2),
                                                          gradient: LinearGradient(
                                                            end: Alignment.topCenter,
                                                            begin: Alignment.bottomCenter,
                                                            colors: <Color>[
                                                              Color(0xffFFFAEA),
                                                              Color(0xffE6F5FE),
                                                            ],
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding: EdgeInsets.only(top: 5.4, bottom: 5.4),
                                                          child: ListTile(
                                                            leading: _myEventsItems![index]!.image == ""
                                                                ? CircleAvatar(
                                                                    backgroundColor: Colors.blueGrey[50],
                                                                    child: Padding(
                                                                      padding: const EdgeInsets.all(5.0),
                                                                      child: FittedBox(
                                                                        child: Text(
                                                                          _myEventsItems![index]!
                                                                              .name
                                                                              .characters
                                                                              .first
                                                                              .toUpperCase(),
                                                                          style: const TextStyle(
                                                                              fontSize: 500, color: Colors.blueGrey),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    radius: 21.6,
                                                                  )
                                                                : CircleAvatar(
                                                                    backgroundImage:
                                                                        NetworkImage(_myEventsItems![index]!.image!),
                                                                  ),
                                                            title: Text(
                                                              _myEventsItems![index]!.name,
                                                              style: TextStyle(
                                                                  fontSize: 16.2,
                                                                  color: Color(0xFF4F4F4F),
                                                                  fontWeight: FontWeight.bold),
                                                            ),
                                                            subtitle: Text(
                                                              _myEventsItems![index]!.country +
                                                                  " • " +
                                                                  Utils().nullSafeString(
                                                                      _myEventsItems![index]!.date_time),
                                                              style:
                                                                  TextStyle(color: Color(0xFF828282), fontSize: 13.68),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 14.64,
                                                    ),
                                                  ],
                                                );
                                              },
                                            )
                                          : SizedBox(),
                                      //    <===Surveys===>
                                      (_isMySurveyPermission == true)
                                          ? ExpansionTile(
                                              collapsedIconColor: Colors.black,
                                              iconColor: Colors.black,
                                              onExpansionChanged: (val) {
                                                setState(() {
                                                  isExpandSurvey = val;
                                                });
                                              },
                                              title: Row(
                                                children: [
                                                  Expanded(
                                                    child: Row(
                                                      children: [
                                                        Flexible(
                                                          child: Text(
                                                            "My Surveys",
                                                            style: TextStyle(
                                                                color: Colors.black,
                                                                fontSize: 18,
                                                                fontWeight: FontWeight.bold),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 3.6,
                                                        ),
                                                        Container(
                                                          padding:
                                                              EdgeInsets.symmetric(horizontal: 6.12, vertical: 2.196),
                                                          decoration: BoxDecoration(
                                                            color: Colors.grey[300],
                                                            borderRadius: BorderRadius.circular(18),
                                                          ),
                                                          child: Text(
                                                            "$_totalMySurveys",
                                                            style: TextStyle(
                                                              fontSize: 10.8,
                                                              color: Color(0xFF828282),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              children: [
                                                (_mySurveysItems!.isEmpty)
                                                    ? Padding(
                                                        padding: EdgeInsets.only(
                                                            top: 10.8, left: 10.8, right: 10.8, bottom: 10.8),
                                                        child: Container(
                                                          padding: EdgeInsets.all(7.2),
                                                          decoration: BoxDecoration(
                                                              color: Colors.grey[200],
                                                              borderRadius: BorderRadius.circular(5.4)),
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            children: [
                                                              Icon(
                                                                Icons.not_interested,
                                                                size: 14.4,
                                                              ),
                                                              SizedBox(
                                                                width: 7.2,
                                                              ),
                                                              Text(
                                                                CommonMessage.survey,
                                                                style: TextStyle(fontSize: 12.6),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      )
                                                    : ListView.builder(
                                                        padding: EdgeInsets.zero,
                                                        itemCount: _mySurveysItems!.length,
                                                        physics: BouncingScrollPhysics(),
                                                        shrinkWrap: true,
                                                        itemBuilder: (context, index) {
                                                          return Column(
                                                            children: [
                                                              ListTile(
                                                                title: Text(
                                                                  _mySurveysItems![index]!.name,
                                                                  style: TextStyle(
                                                                      fontSize: 16.2,
                                                                      color: Color(0xFF4F4F4F),
                                                                      fontWeight: FontWeight.bold),
                                                                ),
                                                                subtitle: Row(
                                                                  children: [
                                                                    Container(
                                                                      decoration: BoxDecoration(
                                                                        borderRadius: BorderRadius.circular(7.2),
                                                                        color: Colors.orange[50],
                                                                      ),
                                                                      child: Padding(
                                                                        padding: EdgeInsets.all(3.6),
                                                                        child: Text(
                                                                          "Due",
                                                                          style: TextStyle(
                                                                              color: Colors.orange, fontSize: 13.68),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child: Text(
                                                                        _mySurveysItems![index]!.due_date,
                                                                        style: TextStyle(fontSize: 13.68),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: 14.64,
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      ),
                                              ],
                                            )
                                          : SizedBox(),
                                      (_isMySurveyPermission == true && isExpandSurvey == false)
                                          ? ListView.builder(
                                              padding: EdgeInsets.zero,
                                              itemCount: _mySurveysItems!.length >= 2 ? 2 : _mySurveysItems!.length,
                                              physics: BouncingScrollPhysics(),
                                              shrinkWrap: true,
                                              itemBuilder: (context, index) {
                                                return Column(
                                                  children: [
                                                    ListTile(
                                                      title: Text(
                                                        _mySurveysItems![index]!.name,
                                                        style: TextStyle(
                                                            fontSize: 16.2,
                                                            color: Color(0xFF4F4F4F),
                                                            fontWeight: FontWeight.bold),
                                                      ),
                                                      subtitle: Row(
                                                        children: [
                                                          Container(
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(7.2),
                                                              color: Colors.orange[50],
                                                            ),
                                                            child: Padding(
                                                              padding: EdgeInsets.all(3.6),
                                                              child: Text(
                                                                "Due",
                                                                style: TextStyle(color: Colors.orange, fontSize: 13.68),
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Text(
                                                              _mySurveysItems![index]!.due_date,
                                                              style: TextStyle(fontSize: 13.68),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 14.64,
                                                    ),
                                                  ],
                                                );
                                              },
                                            )
                                          : SizedBox(),
                                      //    <===Upcoming Birthdays===>
                                      (_isUpcomingBirthdaysPermission == true)
                                          ? ExpansionTile(
                                              collapsedIconColor: Colors.black,
                                              iconColor: Colors.black,
                                              onExpansionChanged: (val) {
                                                setState(() {
                                                  isExpandBirthday = val;
                                                });
                                              },
                                              title: Row(
                                                children: [
                                                  Expanded(
                                                    child: Row(
                                                      children: [
                                                        Flexible(
                                                          child: Text(
                                                            "Upcoming Birthdays",
                                                            style: TextStyle(
                                                                color: Colors.black,
                                                                fontSize: 18,
                                                                fontWeight: FontWeight.bold),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 3.6,
                                                        ),
                                                        Container(
                                                          padding:
                                                              EdgeInsets.symmetric(horizontal: 6.12, vertical: 2.196),
                                                          decoration: BoxDecoration(
                                                            color: Colors.grey[300],
                                                            borderRadius: BorderRadius.circular(18),
                                                          ),
                                                          child: Text(
                                                            "$_totalUpcomingBirthdays",
                                                            style: TextStyle(
                                                              fontSize: 10.8,
                                                              color: Color(0xFF828282),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              children: [
                                                (_upcomingBirthdaysItems!.length == 0)
                                                    ? Padding(
                                                        padding: EdgeInsets.only(
                                                            top: 10.8, left: 10.8, right: 10.8, bottom: 10.8),
                                                        child: Container(
                                                          padding: EdgeInsets.all(7.2),
                                                          decoration: BoxDecoration(
                                                              color: Colors.grey[200],
                                                              borderRadius: BorderRadius.circular(5.4)),
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            children: [
                                                              Icon(
                                                                Icons.not_interested,
                                                                size: 14.4,
                                                              ),
                                                              SizedBox(
                                                                width: 7.2,
                                                              ),
                                                              Text(
                                                                CommonMessage.birthDate,
                                                                style: TextStyle(
                                                                  fontSize: 12.6,
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      )
                                                    : ListView.builder(
                                                        padding: EdgeInsets.zero,
                                                        itemCount: _upcomingBirthdaysItems!.length,
                                                        physics: BouncingScrollPhysics(),
                                                        shrinkWrap: true,
                                                        itemBuilder: (context, index) {
                                                          return Column(
                                                            children: [
                                                              ListTile(
                                                                leading: _upcomingBirthdaysItems![index]!.image == null
                                                                    ? CircleAvatar(
                                                                        backgroundColor: Colors.blueGrey[50],
                                                                        child: Padding(
                                                                          padding: const EdgeInsets.all(5.0),
                                                                          child: FittedBox(
                                                                            child: Text(
                                                                              _upcomingBirthdaysItems![index]!
                                                                                  .name
                                                                                  .characters
                                                                                  .first
                                                                                  .toUpperCase(),
                                                                              style: const TextStyle(
                                                                                  fontSize: 500,
                                                                                  color: Colors.blueGrey),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        radius: 21.6,
                                                                      )
                                                                    : CircleAvatar(
                                                                        backgroundImage: NetworkImage(
                                                                            _upcomingBirthdaysItems![index]!.image!),
                                                                      ),
                                                                title: Text(
                                                                  _upcomingBirthdaysItems![index]!.name,
                                                                  style: TextStyle(
                                                                      fontSize: 16.2,
                                                                      color: Color(0xFF4F4F4F),
                                                                      fontWeight: FontWeight.bold),
                                                                ),
                                                                subtitle: Text(
                                                                  _upcomingBirthdaysItems![index]!.birth_date +
                                                                      " • " +
                                                                      _upcomingBirthdaysItems![index]!.regional +
                                                                      " • " +
                                                                      _upcomingBirthdaysItems![index]!.role,
                                                                  style: TextStyle(
                                                                      color: Color(0xFF828282), fontSize: 13.68),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: 14.64,
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      ),
                                              ],
                                            )
                                          : SizedBox(),
                                      (_isUpcomingBirthdaysPermission == true && isExpandBirthday == false)
                                          ? ListView.builder(
                                              padding: EdgeInsets.zero,
                                              itemCount: _upcomingBirthdaysItems!.length >= 2
                                                  ? 2
                                                  : _upcomingBirthdaysItems!.length,
                                              physics: BouncingScrollPhysics(),
                                              shrinkWrap: true,
                                              itemBuilder: (context, index) {
                                                return Column(
                                                  children: [
                                                    ListTile(
                                                      leading: _upcomingBirthdaysItems![index]!.image == null
                                                          ? CircleAvatar(
                                                              backgroundColor: Colors.blueGrey[50],
                                                              child: Padding(
                                                                padding: const EdgeInsets.all(5.0),
                                                                child: FittedBox(
                                                                  child: Text(
                                                                    _upcomingBirthdaysItems![index]!
                                                                        .name
                                                                        .characters
                                                                        .first
                                                                        .toUpperCase(),
                                                                    style: const TextStyle(
                                                                        fontSize: 500, color: Colors.blueGrey),
                                                                  ),
                                                                ),
                                                              ),
                                                              radius: 21.6,
                                                            )
                                                          : CircleAvatar(
                                                              backgroundImage:
                                                                  NetworkImage(_upcomingBirthdaysItems![index]!.image!),
                                                            ),
                                                      title: Text(
                                                        _upcomingBirthdaysItems![index]!.name,
                                                        style: TextStyle(
                                                            fontSize: 16.2,
                                                            color: Color(0xFF4F4F4F),
                                                            fontWeight: FontWeight.bold),
                                                      ),
                                                      subtitle: Text(
                                                        _upcomingBirthdaysItems![index]!.birth_date +
                                                            " • " +
                                                            _upcomingBirthdaysItems![index]!.regional +
                                                            " • " +
                                                            _upcomingBirthdaysItems![index]!.role,
                                                        style: TextStyle(color: Color(0xFF828282), fontSize: 13.68),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                  ],
                                                );
                                              },
                                            )
                                          : SizedBox(),

                                      SizedBox(
                                        height: 47.58,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(child: _isLoading ? Loader(loadingTxt: 'Please wait...') : Container())
                    ],
                  );
                  // ),

                } else {
                  return Center(
                    child: Text(''),
                  );
                }
              })),
    );
  }
}
