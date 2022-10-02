import 'package:flutter/material.dart';
import 'package:flutter_app/models/login_model.dart';
import 'package:flutter_app/models/notification_model.dart';
import 'package:flutter_app/models/read_notification_request_model.dart';
import 'package:flutter_app/presentation/homepage/home.dart';
import 'package:flutter_app/presentation/homepage/home_screen.dart';
import 'package:flutter_app/utils/login_status.dart';
import 'package:flutter_app/utils/util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vrouter/vrouter.dart';
import '../../loader.dart';
import '../../preferences.dart';
import '../../utils/constant.dart';
import 'bloc/notification_bloc.dart';

class NotificationPage extends StatefulWidget {
  static const String id = "notification";
  static const String path = "${HomeScreen.path}/$id";
  const NotificationPage({Key? key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  bool _isLoading = false;
  int _selectedIndex = 0;

  List<NotificationListModel?> _notificationsItems = [];

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
    //FOR GET NOTIFICATIONS LIST
    _showLoadingIndicator();
    BlocProvider.of<NotificationBloc>(context).add(NotificationEvent.loadNotifications(context));
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<NotificationBloc, NotificationState>(
          listener: (context, state) {
            state.maybeWhen(
                loadNotifications: (notificationsModel, l) {
                  final isForeground = TickerMode.of(context);
                  if (isForeground) {
                    if (l == LoadingStatus.Done) {
                      _hideLoadingIndicator();

                      if (notificationsModel != null) {
                        if (notificationsModel.notification_list.isNotEmpty) {
                          _notificationsItems = notificationsModel.notification_list;
                        }
                      }
                    } else {
                      if (l == LoadingStatus.Error) {
                        _hideLoadingIndicator();
                      }
                    }
                  }
                },
                readNotification: (l, readNotificationModel) {
                  final isForeground = TickerMode.of(context);
                  if (isForeground) {
                    if (l == LoadingStatus.Done) {
                      _hideLoadingIndicator();
                      if (readNotificationModel != null) {
                        if (!readNotificationModel.has_error) {
                          _notificationsItems[_selectedIndex]!.is_read = "1";
                          VRouter.of(context).to(Home.path);
                          //FOR REDIRECT ON RESPECTIVE SCREEN
                          // switch (_notificationsItems![_selectedIndex]!.redirection_type) {
                          //   case Constant.nrtEventInvite:
                          //     BlocProvider.of<ParamsBloc>(context)
                          //         .add(NotificationRedirectionEvent(Constant.nrtEventInvite));
                          //     break;
                          //
                          //   case Constant.nrtSurveyInvite:
                          //     BlocProvider.of<ParamsBloc>(context)
                          //         .add(NotificationRedirectionEvent(Constant.nrtSurveyInvite));
                          //     break;
                          // }
                        }
                      }
                    }
                  }
                },
                error: (l) {
                  if (l == LoadingStatus.Error) {
                    _hideLoadingIndicator();
                  }
                },
                orElse: () {});
          },
        ),
      ],
      child: Stack(children: [
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          "Notifications",
                          style: TextStyle(fontSize: 28.08, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: (_notificationsItems.isEmpty)
                  ? Center(
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
                              CommonMessage.notification,
                              style: TextStyle(color: const Color(0xFF828282), fontSize: 12.6),
                            )
                          ],
                        ),
                      ),
                    )
                  : ListView.builder(
                      padding: EdgeInsets.zero,
                      physics: BouncingScrollPhysics(),
                      itemCount: (_notificationsItems.isEmpty) ? 1 : _notificationsItems.length,
                      itemBuilder: (context, index) => Column(
                        children: [
                          GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () async {
                              _selectedIndex = index;

                              if (Utils().nullSafeString(_notificationsItems[index]!.is_read) == "1") {
                                final _pref = await Preferences.getInstance();
                                LoginModel? loginModel = await _pref.getToken();

                                var readNotificationRequestModel = ReadNotificationRequestModel(
                                  Utils().nullSafeString(loginModel!.login_user_type.toString()),
                                  Utils().nullSafeString(loginModel.login_parent_type),
                                  Utils().nullSafeString(loginModel.role),
                                  Utils().nullSafeInt(loginModel.bkms_id).toString(),
                                  Utils().nullSafeString(_notificationsItems[index]!.id),
                                );
                                _showLoadingIndicator();
                                BlocProvider.of<NotificationBloc>(context)
                                    .add(NotificationEvent.readNotification(context, readNotificationRequestModel));
                              } else {
                                VRouter.of(context).to(Home.path);

                                //FOR REDIRECT ON RESPECTIVE SCREEN
                                // switch (_notificationsItems![index]!.redirection_type) {
                                //   case Constant.nrtEventInvite:
                                //     BlocProvider.of<ParamsBloc>(context)
                                //         .add(NotificationRedirectionEvent(Constant.nrtEventInvite));
                                //     break;
                                //
                                //   case Constant.nrtSurveyInvite:
                                //     BlocProvider.of<ParamsBloc>(context)
                                //         .add(NotificationRedirectionEvent(Constant.nrtSurveyInvite));
                                //     break;
                                // }
                              }
                            },
                            child: ListTile(
                              // leading: CircleAvatar(
                              //   radius: 27,
                              //   child\: Image(
                              //     image: NetworkImage(Utils()
                              //         .nullSafeWithDefaultString(
                              //             _notificationsItems![index]!.image,
                              //             Constant.defaultPlaceholderImage)),
                              //   ),
                              // ),
                              title: Text(
                                Utils()
                                    .nullSafeWithDefaultString(_notificationsItems[index]!.name, "Notification Title"),
                                style: TextStyle(
                                    fontSize: 14.4,
                                    color: Utils().nullSafeString(_notificationsItems[index]!.is_read) == "1"
                                        ? Color(0xFF4F4F4F)
                                        : Color(0xFF9A9A9A),
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                Utils().nullSafeWithDefaultString(
                                    _notificationsItems[index]!.details, "Notification Description"),
                                style: TextStyle(
                                  fontSize: 10.8,
                                  color: Utils().nullSafeString(_notificationsItems[index]!.is_read) == "1"
                                      ? Color(0xFF828282)
                                      : Color(0xFFA8A8A8),
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            height: 0,
                          ),
                        ],
                      ),
                    ),
            )
          ],
        ),
        Container(child: _isLoading ? Loader(loadingTxt: 'Please wait...') : Container())
      ]),
    );
  }
}
