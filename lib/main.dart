import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/Bloc/manage_bst_attendance_report_bloc.dart';
import 'package:flutter_app/Bloc/networking_data_update_bloc.dart';
import 'package:flutter_app/Bloc/sabha_report_bloc.dart';
import 'package:flutter_app/presentation/auth/auth_bloc.dart';
import 'package:flutter_app/presentation/bloc/params_bloc.dart';
import 'package:flutter_app/presentation/bloc/setting_bloc.dart';
import 'package:flutter_app/presentation/bloc/user_profile_bloc.dart';
import 'package:flutter_app/presentation/homepage/home.dart';
import 'package:flutter_app/presentation/homepage/innerpage/agile_form.dart';
import 'package:flutter_app/presentation/homepage/innerpage/basic_registration_form.dart';
import 'package:flutter_app/presentation/homepage/innerpage/check_in_qr_scan.dart';
import 'package:flutter_app/presentation/homepage/innerpage/transportation_details_form.dart';
import 'package:flutter_app/presentation/notification/bloc/notification_bloc.dart';
import 'package:flutter_app/presentation/notification/notification.dart';
import 'package:flutter_app/presentation/profile/profile_page_scaffold.dart';
import 'package:flutter_app/presentation/records_page/records.dart';
import 'package:flutter_app/presentation/reports_page/inner_page/bst_report.dart';
import 'package:flutter_app/presentation/reports_page/inner_page/bst_report_pages/create_center_bst_report.dart';
import 'package:flutter_app/presentation/reports_page/inner_page/bst_report_pages/manage_bst_attendance.dart';
import 'package:flutter_app/presentation/reports_page/inner_page/bst_report_pages/manage_bst_niyam_assesment.dart';
import 'package:flutter_app/presentation/reports_page/inner_page/bst_report_pages/manage_bst_quiz_scores.dart';
import 'package:flutter_app/presentation/reports_page/inner_page/bst_report_pages/manage_report.dart';
import 'package:flutter_app/presentation/reports_page/inner_page/campus_hangout.dart';
import 'package:flutter_app/presentation/reports_page/inner_page/campus_hangout_pages/create_campus_hangout_report.dart';
import 'package:flutter_app/presentation/reports_page/inner_page/campus_hangout_pages/submit_campus_hangout_report.dart';
import 'package:flutter_app/presentation/reports_page/inner_page/campus_hangout_pages/view_campus_hangout_report.dart';
import 'package:flutter_app/presentation/reports_page/inner_page/campus_hangout_pages/view_hangout.dart';
import 'package:flutter_app/presentation/reports_page/inner_page/goshthi_report_pages/goshthi_report_all.dart';
import 'package:flutter_app/presentation/reports_page/inner_page/kst_pages/add_1on1_mentoring_interaction.dart';
import 'package:flutter_app/presentation/reports_page/inner_page/kst_pages/add_education_mentoring_interaction.dart';
import 'package:flutter_app/presentation/reports_page/inner_page/kst_pages/create_center_kst_report.dart';
import 'package:flutter_app/presentation/reports_page/inner_page/kst_pages/education_mentoring_interaction_details.dart';
import 'package:flutter_app/presentation/reports_page/inner_page/kst_pages/kst_1on1_mentoring_interaction_details.dart';
import 'package:flutter_app/presentation/reports_page/inner_page/kst_pages/manage_1on1_mentoring.dart';
import 'package:flutter_app/presentation/reports_page/inner_page/kst_pages/manage_education_mentoring.dart';
import 'package:flutter_app/presentation/reports_page/inner_page/kst_pages/manage_kst_attendance.dart';
import 'package:flutter_app/presentation/reports_page/inner_page/kst_pages/manage_kst_quiz_scores.dart';
import 'package:flutter_app/presentation/reports_page/inner_page/kst_pages/manage_kst_report.dart';
import 'package:flutter_app/presentation/reports_page/inner_page/kst_report.dart';
import 'package:flutter_app/presentation/reports_page/inner_page/networking_report_pages/create_networking_interactions.dart';
import 'package:flutter_app/presentation/reports_page/inner_page/networking_report_pages/networking_report_details.dart';
import 'package:flutter_app/presentation/reports_page/inner_page/networking_report_pages/networking_report_interaction_details.dart';
import 'package:flutter_app/presentation/reports_page/inner_page/networking_report_pages/networking_report_interaction_log.dart';
import 'package:flutter_app/presentation/reports_page/reports.dart';
import 'package:flutter_app/utils/constant.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_app/presentation/homepage/bloc/homepage_bloc.dart';
import 'package:flutter_app/presentation/homepage/home_screen.dart';
import 'package:flutter_app/presentation/homepage/innerpage/eventpage.dart';
import 'package:flutter_app/presentation/homepage/innerpage/liability_form.dart';
import 'package:flutter_app/presentation/homepage/innerpage/registrationFee.dart';
import 'package:flutter_app/presentation/login/login.dart';
import 'package:flutter_app/presentation/login/widgets/forgot_password.dart';
import 'package:flutter_app/presentation/login/widgets/reset_password.dart';
import 'package:flutter_app/presentation/records_page/bloc/record_bloc.dart';
import 'package:flutter_app/presentation/reports_page/bloc/report_bloc.dart';
import 'package:flutter_app/presentation/reports_page/inner_page/karyakar_goshti_report.dart';
import 'package:flutter_app/presentation/reports_page/inner_page/networking_report.dart';
import 'package:flutter_app/presentation/reports_page/inner_page/sabha_report.dart';
import 'package:flutter_app/presentation/reports_page/inner_page/sabha_report_pages/sabha_report_all.dart';
import 'package:flutter_app/presentation/splash/splash_screen.dart';
import 'package:flutter_app/presentation/survey/voter_registration_survey.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:vrouter/vrouter.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'Bloc/bst_data_update_bloc.dart';
import 'Bloc/bst_report_bloc.dart';
import 'Bloc/campus_hangout_bloc.dart';
import 'Bloc/campus_hangout_data_update_bloc.dart';
import 'Bloc/goshthi_data_update_bloc.dart';
import 'Bloc/goshthi_report_attendance_bloc.dart';
import 'Bloc/karyakar_goshthi_report_bloc.dart';
import 'Bloc/kst_data_update_bloc.dart';
import 'Bloc/kst_report_bloc.dart';
import 'Bloc/manage_kst_reports_bloc.dart';
import 'Bloc/manage_niyam_report_bloc.dart';
import 'Bloc/networking_report_bloc.dart';
import 'Bloc/sabha_report_question_bloc.dart';
import 'Bloc/view_hangout_report_bloc.dart';
import 'Bloc/view_networking_report_list_bloc.dart';
import 'configure.dart';
import 'firebase_options.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
    // options: const FirebaseOptions(
    //   apiKey: Constant.fcmApidKey,
    //   appId: Constant.fcmAppId,
    //   messagingSenderId: Constant.fcmSenderId,
    //   projectId: Constant.fcmProjectId,
    // ),
  );
  print('Handling a background message ${message.messageId}');
}

/// Create a [AndroidNotificationChannel] for heads up notifications
late AndroidNotificationChannel channel;

/// Initialize the [FlutterLocalNotificationsPlugin] package.
late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize(debug: true);
  await Hive.initFlutter();
  var initializationSettingsAndroid = AndroidInitializationSettings('ic_launcher');
  var initializationSettingsIOS = IOSInitializationSettings(
    requestAlertPermission: true,
    requestBadgePermission: true,
    requestSoundPermission: true,
  );
  var initializationSettings =
      InitializationSettings(android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
  // await flutterLocalNotificationsPlugin.initialize(initializationSettings, onSelectNotification: (payload) async {});

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // await Firebase.initializeApp(
  //     options: const FirebaseOptions(
  //   apiKey: Constant.fcmApidKey,
  //   appId: Constant.fcmAppId,
  //   messagingSenderId: Constant.fcmSenderId,
  //   projectId: Constant.fcmProjectId,
  // ));

  // Set the background messaging handler early on, as a named top-level function
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  if (!kIsWeb) {
    channel = const AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      description: 'This channel is used for important notifications.', // description
      importance: Importance.high,
    );

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    /// Create an Android Notification Channel.
    ///
    /// We use this channel in the `AndroidManifest.xml` file to override the
    /// default FCM channel to enable heads up notifications.
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    /// Update the iOS foreground notification presentation options to allow
    /// heads up notifications.
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  await configureDependencies();
  // moveTask;
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: Colors.transparent, statusBarIconBrightness: Brightness.dark),
  );

  runApp(MyApp());
}

//void moveTask() => LockScreen.moveTaskToBack;
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => GetIt.I<AuthBloc>(),
        ),
        BlocProvider<ParamsBloc>(
          create: (context) => GetIt.I<ParamsBloc>(),
        ),
        BlocProvider<UserProfileBloc>(
          create: (context) => GetIt.I<UserProfileBloc>(),
        ),
        BlocProvider<UpdateProfileBloc>(
          create: (context) => GetIt.I<UpdateProfileBloc>(),
        ),
        BlocProvider<DeactivateUserBloc>(
          create: (context) => GetIt.I<DeactivateUserBloc>(),
        ),
        BlocProvider<ReportBloc>(
          create: (context) => GetIt.I<ReportBloc>(),
        ),
        BlocProvider<HomeBloc>(
          create: (context) => GetIt.I<HomeBloc>(),
        ),
        BlocProvider<RecordBloc>(
          create: (context) => GetIt.I<RecordBloc>(),
        ),
        BlocProvider<NotificationBloc>(
          create: (context) => GetIt.I<NotificationBloc>(),
        ),
        BlocProvider<ExportBloc>(
          create: (context) => GetIt.I<ExportBloc>(),
        ),
        BlocProvider<ParamsBloc>(
          create: (context) => GetIt.I<ParamsBloc>(),
        ),
        BlocProvider<SettingBloc>(
          create: (context) => GetIt.I<SettingBloc>(),
        ),
        BlocProvider<AddNewRecordBloc>(
          create: (context) => GetIt.I<AddNewRecordBloc>(),
        ),
        BlocProvider<EventDetailBloc>(
          create: (context) => GetIt.I<EventDetailBloc>(),
        ),
        BlocProvider<SabhaReportQuestionAttendanceBloc>(
          create: (context) => GetIt.I<SabhaReportQuestionAttendanceBloc>(),
        ),
        // BlocProvider<SabhaReportQuestionAttendanceBloc>(
        //   create: (context) => GetIt.I<SabhaReportQuestionAttendanceBloc>(),
        // ),
        BlocProvider<ViewNetworkingReportBloc>(
          create: (context) => GetIt.I<ViewNetworkingReportBloc>(),
        ),
        BlocProvider<GoshthiReportAttendanceBloc>(
          create: (context) => GetIt.I<GoshthiReportAttendanceBloc>(),
        ),
        BlocProvider<ManageNiyamReportBloc>(
          create: (context) => GetIt.I<ManageNiyamReportBloc>(),
        ),
        BlocProvider<ManageKSTReportBloc>(
          create: (context) => GetIt.I<ManageKSTReportBloc>(),
        ),
        BlocProvider<CampusHangoutBloc>(
          create: (context) => GetIt.I<CampusHangoutBloc>(),
        ),
        BlocProvider<KstReportBloc>(
          create: (context) => GetIt.I<KstReportBloc>(),
        ),
        BlocProvider<SabhaReportBloc>(
          create: (context) => GetIt.I<SabhaReportBloc>(),
        ),
        BlocProvider<NetworkingReportBloc>(
          create: (context) => GetIt.I<NetworkingReportBloc>(),
        ),
        BlocProvider<KaryakarGoshthiReportBloc>(
          create: (context) => GetIt.I<KaryakarGoshthiReportBloc>(),
        ),
        BlocProvider<BSTReportBloc>(
          create: (context) => GetIt.I<BSTReportBloc>(),
        ),
        BlocProvider<CampusHangoutReportBloc>(
          create: (context) => GetIt.I<CampusHangoutReportBloc>(),
        ),
        BlocProvider<NetWorkingDataUpdateBloc>(
          create: (context) => GetIt.I<NetWorkingDataUpdateBloc>(),
        ),
        BlocProvider<GoshthiDataUpdateBloc>(
          create: (context) => GetIt.I<GoshthiDataUpdateBloc>(),
        ),
        BlocProvider<BSTDataUpdateBloc>(
          create: (context) => GetIt.I<BSTDataUpdateBloc>(),
        ),
        BlocProvider<KSTDataUpdateBloc>(
          create: (context) => GetIt.I<KSTDataUpdateBloc>(),
        ),
        BlocProvider<CampusHangOutDataUpdateBloc>(
          create: (context) => GetIt.I<CampusHangOutDataUpdateBloc>(),
        ),
        BlocProvider<ManageBstAttendanceReportBloc>(
          create: (context) => GetIt.I<ManageBstAttendanceReportBloc>(),
        ),
      ],
      child: Portal(
        child: MaterialApp(
          theme: ThemeData(
            bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.red),
          ),
          home: VRouter(
            routes: [
              VRouter(
                debugShowCheckedModeBanner: false,
                routes: [
                  VNester(
                    path: HomeScreen.id,
                    widgetBuilder: (child) => HomeScreen(child), // Child is the widget from nestedRoutes
                    nestedRoutes: [
                      VWidget(
                          path: ProfilePageScaffold.path,
                          widget: ProfilePageScaffold(false)), // null path matches parent
                      VWidget(path: Reports.path, widget: Reports(), stackedRoutes: [
                        VWidget(path: SabhaReport.id, widget: SabhaReport(), stackedRoutes: [
                          VWidget(
                            path: SabhaReportAll.id,
                            widget: SabhaReportAll(
                              route: false,
                            ),
                          ),
                        ]),
                        VWidget(
                          path: SabhaReportAll.id,
                          widget: SabhaReportAll(
                            route: true,
                          ),
                        ),
                        VWidget(
                          path: NetworkReport.id,
                          widget: NetworkReport(),
                          stackedRoutes: [
                            VWidget(
                              path: CreateNetworkingInteractions.id,
                              widget: CreateNetworkingInteractions(),
                            ),
                            VWidget(
                              path: NetworkingReportDetails.id,
                              widget: NetworkingReportDetails(),
                              stackedRoutes: [
                                VWidget(
                                  path: NetworkingReportInteractionLog.id,
                                  widget: NetworkingReportInteractionLog(),
                                  stackedRoutes: [
                                    VWidget(
                                      path: NetworkingReportInteractionDetails.id,
                                      widget: NetworkingReportInteractionDetails(),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        VWidget(path: NetworkingReportDetails.id, widget: NetworkingReportDetails(), stackedRoutes: [
                          VWidget(
                              path: NetworkingReportInteractionLog.id,
                              widget: NetworkingReportInteractionLog(),
                              stackedRoutes: [
                                VWidget(
                                  path: NetworkingReportInteractionDetails.id,
                                  widget: NetworkingReportInteractionDetails(),
                                ),
                              ]),
                        ]),
                        VWidget(path: KaryakarGoshtiReport.id, widget: KaryakarGoshtiReport(), stackedRoutes: [
                          VWidget.builder(
                            path: GoshthiReportAll.id + "/:questons",
                            builder: (context, state) => GoshthiReportAll(
                              questionsCurrentProgress: double.tryParse(state.pathParameters["questons"] ?? ""),
                              route: false,
                            ),
                          ),
                        ]),
                        VWidget.builder(
                          path: GoshthiReportAll.id + "/:questons",
                          builder: (context, state) => GoshthiReportAll(
                            questionsCurrentProgress: double.tryParse(state.pathParameters["questons"] ?? ""),
                            route: true,
                          ),
                        ),
                        VWidget(path: BSTReport.id, widget: BSTReport(), stackedRoutes: [
                          VWidget(
                              path: ManageReport.id,
                              widget: ManageReport(
                                route: false,
                              ),
                              stackedRoutes: [
                                VWidget(
                                  path: ManageBSTAttendance.id,
                                  widget: ManageBSTAttendance(),
                                ),
                                VWidget(
                                  path: ManageBSTQuizScores.id,
                                  widget: ManageBSTQuizScores(),
                                ),
                              ]),
                          VWidget(
                            path: ManageBSTNiyamAssesment.id,
                            widget: ManageBSTNiyamAssesment(
                              route: false,
                            ),
                          ),
                          VWidget(
                            path: CreateCenterBSTReport.id,
                            widget: CreateCenterBSTReport(),
                          ),
                        ]),
                        VWidget(
                            path: ManageReport.id,
                            widget: ManageReport(
                              route: true,
                            ),
                            stackedRoutes: [
                              VWidget(
                                path: ManageBSTAttendance.id,
                                widget: ManageBSTAttendance(),
                              ),
                              VWidget(
                                path: ManageBSTQuizScores.id,
                                widget: ManageBSTQuizScores(),
                              ),
                            ]),
                        VWidget(
                          path: ManageBSTNiyamAssesment.id,
                          widget: ManageBSTNiyamAssesment(
                            route: true,
                          ),
                        ),
                        VWidget(path: KSTReport.id, widget: KSTReport(), stackedRoutes: [
                          VWidget(path: ManageKSTReport.id, widget: ManageKSTReport(), stackedRoutes: [
                            VWidget(
                              path: ManageKSTAttendance.id,
                              widget: ManageKSTAttendance(),
                            ),
                            VWidget(
                              path: ManageKSTQuizScores.id,
                              widget: ManageKSTQuizScores(),
                            ),
                            VWidget(
                                path: ManageEducationMentoring.id,
                                widget: ManageEducationMentoring(),
                                stackedRoutes: [
                                  VWidget(
                                    path: EducationMentoringInteractionDetails.id,
                                    widget: EducationMentoringInteractionDetails(),
                                  ),
                                  VWidget(
                                    path: AddEducationMentoringInteraction.id,
                                    widget: AddEducationMentoringInteraction(),
                                  ),
                                ]),
                            VWidget(path: Manage1On1Mentoring.id, widget: Manage1On1Mentoring(), stackedRoutes: [
                              VWidget(
                                path: KST1On1MentoringInteractionDetails.id,
                                widget: KST1On1MentoringInteractionDetails(),
                              ),
                              VWidget(
                                path: Add1On1MentoringInteraction.id,
                                widget: Add1On1MentoringInteraction(),
                              ),
                            ]),
                          ]),
                          VWidget(
                            path: CreateCenterKSTReport.id,
                            widget: CreateCenterKSTReport(),
                          ),
                        ]),
                        VWidget(path: ManageKSTReport.id, widget: ManageKSTReport(), stackedRoutes: [
                          VWidget(
                            path: ManageKSTAttendance.id,
                            widget: ManageKSTAttendance(),
                          ),
                          VWidget(
                            path: ManageKSTQuizScores.id,
                            widget: ManageKSTQuizScores(),
                          ),
                          VWidget(
                              path: ManageEducationMentoring.id,
                              widget: ManageEducationMentoring(),
                              stackedRoutes: [
                                VWidget(
                                  path: EducationMentoringInteractionDetails.id,
                                  widget: EducationMentoringInteractionDetails(),
                                ),
                                VWidget(
                                  path: AddEducationMentoringInteraction.id,
                                  widget: AddEducationMentoringInteraction(),
                                ),
                              ]),
                          VWidget(path: Manage1On1Mentoring.id, widget: Manage1On1Mentoring(), stackedRoutes: [
                            VWidget(
                              path: KST1On1MentoringInteractionDetails.id,
                              widget: KST1On1MentoringInteractionDetails(),
                            ),
                            VWidget(
                              path: Add1On1MentoringInteraction.id,
                              widget: Add1On1MentoringInteraction(),
                            ),
                          ]),
                        ]),
                        VWidget(path: CampusHangout.id, widget: CampusHangout(), stackedRoutes: [
                          VWidget(path: ViewHangout.id, widget: ViewHangout(), stackedRoutes: [
                            VWidget(
                              path: ViewCampusHangoutReport.id,
                              widget: ViewCampusHangoutReport(),
                            ),
                          ]),
                          VWidget(
                            path: SubmitCampusHangoutReport.id,
                            widget: SubmitCampusHangoutReport(),
                          ),
                          VWidget(
                            path: CreateCampusHangoutReport.id,
                            widget: CreateCampusHangoutReport(),
                          ),
                        ]),
                        VWidget(path: ViewHangout.id, widget: ViewHangout(), stackedRoutes: [
                          VWidget(
                            path: ViewCampusHangoutReport.id,
                            widget: ViewCampusHangoutReport(),
                          ),
                        ]),
                      ]),

                      VWidget(path: Home.path, widget: Home(), stackedRoutes: [
                        VWidget.builder(
                          path: EventPage.id + "/:eventId",
                          builder: (context, state) => EventPage(
                            eventId: int.tryParse(state.pathParameters["eventId"]!),
                          ),
                          stackedRoutes: [
                            VWidget(
                              path: AgileForm.id,
                              widget: AgileForm(),
                            ),
                            VWidget(
                              path: BasicRegistrationForm.id,
                              widget: BasicRegistrationForm(),
                            ),
                            VWidget(
                              path: RegistrationFee.id,
                              widget: RegistrationFee(),
                              stackedRoutes: [
                                VWidget(
                                  path: VoterRegistrationSurvey.id,
                                  widget: VoterRegistrationSurvey(),
                                ),
                              ],
                            ),
                            VWidget(
                              path: LiabilityForm.id,
                              widget: LiabilityForm(),
                            ),
                            VWidget(
                              path: TransportationsDetailsForm.id,
                              widget: TransportationsDetailsForm(),
                            ),
                            VWidget.builder(
                              path: CheckInQRScan.id + "/:eventName",
                              builder: (context, state) => CheckInQRScan(
                                eventName: state.pathParameters["eventName"]!,
                              ),
                            ),
                          ],
                        ),
                      ]),
                      VWidget(
                        path: Records.path,
                        widget: Records(),
                      ),
                      VWidget(
                        path: NotificationPage.path,
                        widget: NotificationPage(),
                      ),
                    ],
                  ),
                ],
              ),
              VWidget(
                path: SplashPage.path,
                widget: SplashPage(),
                stackedRoutes: [
                  VWidget(
                    path: Login.path,
                    widget: Login(),
                    stackedRoutes: [
                      VWidget.builder(
                        path: ForgotPassword.path + "/:bkmsid" + "/:email",
                        builder: (context, state) => ForgotPassword(
                          bkmsid: state.pathParameters["bkmsid"] ?? "",
                          email: state.pathParameters["email"] ?? "",
                        ),
                      ),
                      VWidget(
                        path: ResetPassword.path,
                        widget: ResetPassword(),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
