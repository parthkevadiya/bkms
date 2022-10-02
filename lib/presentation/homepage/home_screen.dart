import 'dart:ui';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/media_query/responsive.dart';
import 'package:flutter_app/preferences.dart';
import 'package:flutter_app/presentation/bloc/params_bloc.dart';
import 'package:flutter_app/presentation/bloc/params_event.dart';
import 'package:flutter_app/presentation/homepage/home.dart';
import 'package:flutter_app/presentation/notification/notification.dart';
import 'package:flutter_app/presentation/profile/profile_page_scaffold.dart';
import 'package:flutter_app/presentation/records_page/records.dart';
import 'package:flutter_app/presentation/reports_page/reports.dart';
import 'package:flutter_app/utils/constant.dart';
import 'package:flutter_app/utils/util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:vrouter/vrouter.dart';

import '../../main.dart';
import '../../models/login_model.dart';
import '../bloc/params_state.dart';

class HomeScreen extends StatefulWidget {
  final Widget child;
  static const String id = "homeScreen";
  static const String path = "/$id";
  const HomeScreen(this.child);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<BottomNavigationBarItem> filteredNavigationItems = [];
  LoginModel? loginModel;
  int _selectedItemPosition = 0;
  bool _isDoneByUser = false;
  SnakeShape snakeShape = SnakeShape.circle;
  Gradient selectedGradient = const LinearGradient(colors: [Colors.red, Colors.amber]);

  @override
  void initState() {
    super.initState();
    FirebaseMessaging.instance.getInitialMessage().then((RemoteMessage? message) {
      if (message != null) {
        // Navigator.pushNamed(context, '/message', arguments: MessageArguments(message, true));
        switch (Utils().nullSafeString(message.messageType)) {
          case Constant.nrtEventInvite:
            BlocProvider.of<ParamsBloc>(context).add(NotificationRedirectionEvent(Constant.nrtEventInvite));
            break;

          case Constant.nrtSurveyInvite:
            BlocProvider.of<ParamsBloc>(context).add(NotificationRedirectionEvent(Constant.nrtSurveyInvite));
            break;
        }
      }
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null && !kIsWeb) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channelDescription: channel.description,
                // TODO add a proper drawable resource to android, for now using
                //      one that already exists in example app.
                icon: 'launch_background',
              ),
            ));
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      // print('A new onMessageOpenedApp event was published!');
      // // Navigator.pushNamed(context, '/message', arguments: MessageArguments(message, true));
      // switch (Utils().nullSafeString(message.messageType)) {
      //   case Constant.nrtEventInvite:
      //     BlocProvider.of<ParamsBloc>(context).add(NotificationRedirectionEvent(Constant.nrtEventInvite));
      //     break;
      //
      //   case Constant.nrtSurveyInvite:
      //     BlocProvider.of<ParamsBloc>(context).add(NotificationRedirectionEvent(Constant.nrtSurveyInvite));
      //     break;
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    return
        //MultiBlocListener(
        // listeners: [
        //   BlocListener<ParamsBloc, ParamsState>(
        //     listener: (context, state) {
        //       if (state is NotificationRedirectionState) {
        //         switch (state.strRedirectionType) {
        //           case Constant.nrtEventInvite:
        //             setState(() {
        //               _isDoneByUser = true;
        //               _selectedItemPosition = 2;
        //             });
        //             break;
        //
        //           case Constant.nrtSurveyInvite:
        //             setState(() {
        //               _isDoneByUser = true;
        //               _selectedItemPosition = 2;
        //             });
        //             break;
        //         }
        //       }
        //     },
        //   ),
        // ],
        FutureBuilder<Preferences>(
      future: Preferences.getInstance(),
      builder: (BuildContext context, AsyncSnapshot<Preferences> snapshot) {
        bool view = VRouter.of(context).path.contains("checkInQRScan");
        if (snapshot.hasData) {
          loginModel = snapshot.data!.getToken();

          if (!_isDoneByUser) {
            _selectedItemPosition = 0;
          }
          if (VRouter.of(context).previousPath.toString() == "/homeScreen/notification" && _selectedItemPosition != 3) {
            _selectedItemPosition = 2;
          }

          //FOR SHOW PERMISSION WISE BOTTOM NAVIGATION
          filteredNavigationItems = [];
          if (loginModel != null) {
            if (loginModel!.is_profile) {
              filteredNavigationItems.add(bottomNavigationItems[0]);
              if (!_isDoneByUser) {
                _selectedItemPosition++;
              }
            }
            if (loginModel!.is_report) {
              filteredNavigationItems.add(bottomNavigationItems[1]);
              if (!_isDoneByUser) {
                _selectedItemPosition++;
              }
            }
            if (loginModel!.is_home) {
              filteredNavigationItems.add(bottomNavigationItems[2]);
            }
            if (loginModel!.is_record) {
              filteredNavigationItems.add(bottomNavigationItems[3]);
            }
            if (loginModel!.is_notification) {
              filteredNavigationItems.add(bottomNavigationItems[4]);
            }
          } else {
            return SizedBox();
          }

          return Scaffold(
            backgroundColor: Color(0xFFf5f5f5),
            extendBody: true,
            body: widget.child,
            bottomNavigationBar: (view)
                ? Container()
                : ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                      child: SnakeNavigationBar.gradient(
                        selectedItemGradient: LinearGradient(
                          colors: [
                            Color(0xff2F80ED),
                            Color(0xff2F80ED),
                          ],
                        ),
                        unselectedItemGradient: LinearGradient(
                          colors: [Colors.grey.shade700, Colors.grey.shade700],
                        ),
                        snakeViewGradient: LinearGradient(
                          end: Alignment.topLeft,
                          begin: Alignment.bottomRight,
                          colors: [Colors.white, Colors.white],
                        ),
                        snakeShape: SnakeShape.rectangle.copyWith(
                          padding: EdgeInsets.symmetric(
                            horizontal: 9,
                            vertical: 5.4,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(21.6),
                          ),
                        ),
                        backgroundGradient:
                            LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [
                          Color(0x55FF9FF),
                          Color(0x55FFF5F5),
                          Color(0x55FFFBEF),
                        ]),
                        currentIndex: _selectedItemPosition,
                        onTap: (index) => setState(
                          () {
                            //THIS IS FOR SPRINT 7 AND ABOVE
                            // if(index != 4) {
                            _isDoneByUser = true;
                            _selectedItemPosition = index;
                            // }

                            // if (_selectedItemPosition == 0) {
                            //   VRouter.of(context).to(ProfilePageScaffold.path);
                            // } else if (_selectedItemPosition == 1) {
                            //   VRouter.of(context).to(Reports.path);
                            // } else if (_selectedItemPosition == 2) {
                            //   VRouter.of(context).to(Home.path);
                            // } else if (_selectedItemPosition == 3) {
                            //   VRouter.of(context).to(Records.path);
                            // } else if (_selectedItemPosition == 4) {
                            //   VRouter.of(context).to(NotificationPage.path);
                            // }

                            switch (filteredNavigationItems[index].label) {
                              case Constant.nmProfile:
                                return VRouter.of(context).to(ProfilePageScaffold.path, isReplacement: false);

                              case Constant.nmReports:
                                return VRouter.of(context).to(Reports.path);

                              case Constant.nmHome:
                                return VRouter.of(context).to(Home.path);

                              case Constant.nmRecords:
                                return VRouter.of(context).to(Records.path);

                              case Constant.nmNotifications:
                                return VRouter.of(context).to(NotificationPage.path);

                              default:
                                return null;
                            }
                          },
                        ),
                        items: filteredNavigationItems,
                      ),
                    ),
                  ),
          );
        } else {
          return Container();
        }
      },
    );
    //);
  }

  List<BottomNavigationBarItem> bottomNavigationItems = [
    BottomNavigationBarItem(
      icon: Image.asset("img/user.png"),
      label: Constant.nmProfile,
    ),
    BottomNavigationBarItem(
      icon: Image.asset(
        "img/folder_open.png",
      ),
      label: Constant.nmReports,
    ),
    BottomNavigationBarItem(
      icon: Image.asset(
        "img/home_alt_outline.png",
      ),
      label: Constant.nmHome,
    ),
    BottomNavigationBarItem(
      icon: Image.asset("img/coolicon.png"),
      label: Constant.nmRecords,
    ),
    BottomNavigationBarItem(
      icon: Image.asset("img/notification_outline.png"),
      label: Constant.nmNotifications,
    ),
  ];
}
