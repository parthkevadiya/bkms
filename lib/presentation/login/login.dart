import 'dart:ui';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/login_request_model.dart';
import 'package:flutter_app/preferences.dart';
import 'package:flutter_app/presentation/auth/auth_bloc.dart';
import 'package:flutter_app/presentation/bloc/setting_bloc.dart';
import 'package:flutter_app/presentation/homepage/home.dart';
import 'package:flutter_app/presentation/lifecycle/lifecycle_manager.dart';
import 'package:flutter_app/presentation/login/widgets/forgot_password.dart';
import 'package:flutter_app/utils/constant.dart';
import 'package:flutter_app/utils/util.dart';
import 'package:vrouter/vrouter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../loader.dart';
import '../../media_query/responsive.dart';

class Login extends StatefulWidget {
  static String id = "login";
  static String path = "/$id";

  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String? _token;
  late Stream<String> _tokenStream;

  bool faceAuth = false;

  late FocusNode _focusNodeBKMSId;
  late FocusNode _focusNodeEmail;
  late FocusNode _focusNodePassword;

  bool? bkmsIdError;
  bool? emailError;
  bool? passwordError;

  TextEditingController _bkmsId = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  bool _isLoading = false;

  void _showLoadingIndicator() {
    setState(() {
      _isLoading = true;
    });
  }

  Future<void> setAlertPreferance() async {
    final _pref = await Preferences.getInstance();
    await _pref.setAleartDialog(true);
    await _pref.setAuthDialog(true);
  }

  void _hideLoadingIndicator() {
    setState(() {
      _isLoading = false;
    });
  }

  void setToken(String? token) {
    print('FCM Token: $token');
    setState(() {
      _token = token;
    });
  }

  @override
  void initState() {
    super.initState();
    FirebaseMessaging.instance
        .getToken(vapidKey: Constant.fcmVApidKey)
        .then(setToken);
    _tokenStream = FirebaseMessaging.instance.onTokenRefresh;
    _tokenStream.listen(setToken);

    _focusNodeBKMSId = FocusNode();
    _focusNodeEmail = FocusNode();
    _focusNodePassword = FocusNode();

    //TODO Just for Testing purpose
    bkmsIdError = false;
    emailError = false;
    passwordError = false;
    _bkmsId.text = '15';
    _email.text = '15@bkms.baps.dev';
    _password.text = '123456';
  }

  Future<void> onFCMActionSelected(String value) async {
    switch (value) {
      case Constant.fcmSubscribe:
        {
          print(
              'FlutterFire Messaging Example: Subscribing to topic "fcm_test".');
          await FirebaseMessaging.instance.subscribeToTopic('fcm_test');
          print(
              'FlutterFire Messaging Example: Subscribing to topic "fcm_test" successful.');
        }
        break;
      case Constant.fcmUnsubscribe:
        {
          print(
              'FlutterFire Messaging Example: Unsubscribing from topic "fcm_test".');
          await FirebaseMessaging.instance.unsubscribeFromTopic('fcm_test');
          print(
              'FlutterFire Messaging Example: Unsubscribing from topic "fcm_test" successful.');
        }
        break;
      case Constant.fcmGetApnsToken:
        {
          if (defaultTargetPlatform == TargetPlatform.iOS ||
              defaultTargetPlatform == TargetPlatform.macOS) {
            print('FlutterFire Messaging Example: Getting APNs token...');
            String? token = await FirebaseMessaging.instance.getAPNSToken();
            print('FlutterFire Messaging Example: Got APNs token: $token');
          } else {
            print(
                'FlutterFire Messaging Example: Getting an APNs token is only supported on iOS and macOS platforms.');
          }
        }
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize.setSize(context);
    bool biometrics = BlocProvider.of<SettingBloc>(context).state.bio;
    WidgetsBinding.instance!.addPostFrameCallback((_) => setAlertPreferance());

    return LifecycleManager(
      child: MultiBlocListener(
        listeners: [
          BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              state.maybeWhen(
                  loginSuccess: (loadingStatus, isLoggedIn) {
                    _hideLoadingIndicator();
                    VRouter.of(context).to(Home.path, isReplacement: true);
                  },
                  error: (loadingStatus, message) {
                    _hideLoadingIndicator();
                    if (message != '') {
                      Utils().showToast(message);
                    }
                  },
                  orElse: () {});
            },
          ),
        ],
        child: Scaffold(
          body: Stack(children: [
            Column(
              children: [
                Expanded(
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      Column(
                        children: [
                          Center(
                            child: Container(
                              width: 72,
                              child: Image.asset("img/god.png"),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                              ),
                            ),
                          ),
                          Stack(
                            children: [
                              // CustomPaint(
                              //   size: Size(0, 292.8),
                              //   painter: LinePainter(),
                              // ),
                              Container(
                                //height: 84.18,
                                width: double.infinity,
                                child: Image.asset(
                                  "img/patto.png",
                                  height: 250,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 25,
                                  top: 100,
                                ),
                                child: Container(
                                  padding: EdgeInsets.only(
                                    left: 9,
                                    right: 9,
                                    top: 10.98,
                                    bottom: 10.98,
                                  ),
                                  height: 84.18,
                                  width: 84.18,
                                  child: Image.asset("img/logo.png"),
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 18,
                                      ),
                                    ],
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: 10.8,
                              left: 18,
                              right: 18,
                              bottom: 10.8,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Jay Swaminarayan",
                                  style: TextStyle(
                                      color: Color(0xff4F4F4F),
                                      fontSize: 36,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 3.66,
                                ),
                                Text(
                                  "Welcome to the BKMS app. To get started, log in with your BKMS credentials.",
                                  style: TextStyle(
                                    color: Colors.grey[700],
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 14.64,
                          ),
                          Divider(
                            thickness: 1,
                            height: 0,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 3.6, left: 19.8, bottom: 3.6),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    "BKMS ID",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 12.6),
                                  ),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        left: 19.8, right: 19.8),
                                    width: 360,
                                    height: 28.8,
                                    //color: Colors.red,
                                    child: TextField(
                                      onChanged: (value) {
                                        setState(() {
                                          (value.isEmpty)
                                              ? bkmsIdError = true
                                              : bkmsIdError = false;
                                        });
                                      },
                                      focusNode: _focusNodeBKMSId,
                                      controller: _bkmsId,
                                      textInputAction: TextInputAction.next,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        suffixIcon: (bkmsIdError == true)
                                            ? Padding(
                                                padding:
                                                    EdgeInsets.only(left: 28.8),
                                                child: Image.asset(
                                                  "img/error_outline.png",
                                                  color: Colors.red,
                                                ),
                                              )
                                            : SizedBox(),
                                        contentPadding: EdgeInsets.only(),
                                        hintText: "12345",
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide.none),
                                        hintStyle: TextStyle(fontSize: 12.6),
                                        focusColor: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          (bkmsIdError == true)
                              ? Padding(
                                  padding:
                                      EdgeInsets.only(bottom: 7.2, left: 14.4),
                                  child: Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(7.2),
                                          color: Color(0x1FEB5757),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(3.6),
                                          child: Text(
                                            "Please Enter a BKMS ID",
                                            style: TextStyle(
                                                color: Color(0xffEB5757),
                                                fontSize: 13.68),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : SizedBox(),
                          Divider(
                            thickness: 1,
                            indent: 18,
                            endIndent: 18,
                            height: 0,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 3.6, left: 19.8, bottom: 3.6),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    "Email",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 12.6),
                                  ),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        left: 19.8, right: 19.8),
                                    width: 360,
                                    height: 28.8,
                                    //color: Colors.red,
                                    child: TextField(
                                      onChanged: (value) {
                                        setState(() {
                                          (value.isEmpty)
                                              ? emailError = true
                                              : emailError = false;
                                        });
                                      },
                                      focusNode: _focusNodeEmail,
                                      controller: _email,
                                      textInputAction: TextInputAction.next,
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: InputDecoration(
                                        suffixIcon: (emailError == true)
                                            ? Padding(
                                                padding:
                                                    EdgeInsets.only(left: 28.8),
                                                child: Image.asset(
                                                  "img/error_outline.png",
                                                  color: Colors.red,
                                                ))
                                            : SizedBox(),
                                        contentPadding: EdgeInsets.only(),
                                        hintText: "test@email.com",
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide.none),
                                        hintStyle: TextStyle(fontSize: 12.6),
                                        focusColor: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          (emailError == true)
                              ? Padding(
                                  padding:
                                      EdgeInsets.only(bottom: 7.2, left: 14.4),
                                  child: Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(7.2),
                                          color: Color(0x1FEB5757),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(3.6),
                                          child: Text(
                                            (_email.text != "" &&
                                                    !Utils().validateEmail(
                                                        _email.text))
                                                ? "Please Enter Valid Email Address. "
                                                : "Please Enter an Email Address",
                                            style: TextStyle(
                                                color: Color(0xffEB5757),
                                                fontSize: 13.68),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : SizedBox(),
                          Divider(
                            thickness: 1,
                            indent: 18,
                            endIndent: 18,
                            height: 0,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 3.6, left: 19.8, bottom: 3.6),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    "Password",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 12.6),
                                  ),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        left: 19.8, right: 19.8),
                                    width: 360,
                                    height: 28.8,
                                    //color: Colors.red,
                                    child: TextField(
                                      onChanged: (value) {
                                        setState(() {
                                          (value.isEmpty)
                                              ? passwordError = true
                                              : passwordError = false;
                                        });
                                      },
                                      focusNode: _focusNodePassword,
                                      controller: _password,
                                      textInputAction: TextInputAction.done,
                                      obscureText: true,
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                        suffixIcon: (passwordError == true)
                                            ? Padding(
                                                padding:
                                                    EdgeInsets.only(left: 28.8),
                                                child: Image.asset(
                                                  "img/question.png",
                                                  color: Colors.red,
                                                ))
                                            : SizedBox(),
                                        contentPadding: EdgeInsets.only(),
                                        hintText: "************",
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide.none),
                                        hintStyle: TextStyle(fontSize: 12.6),
                                        focusColor: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          (passwordError == true)
                              ? Padding(
                                  padding:
                                      EdgeInsets.only(bottom: 7.2, left: 14.4),
                                  child: Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(7.2),
                                          color: Color(0x1FEB5757),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(3.6),
                                          child: Text(
                                            "Please Enter a Password",
                                            style: TextStyle(
                                                color: Color(0xffEB5757),
                                                fontSize: 13.68),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : SizedBox(),
                          // Divider(
                          //   thickness: 1,
                          //   indent: 18,
                          //   endIndent: 18,
                          //   height: 0,
                          // ),
                          // Padding(
                          //   padding: EdgeInsets.only(top: 7.2, bottom: 3.6),
                          //   child: Row(
                          //     children: [
                          //       GestureDetector(
                          //         onTap: () {
                          //           setState(
                          //             () {
                          //               BlocProvider.of<SettingBloc>(context).add(
                          //                 SettingEvent.setbiomatric(
                          //                   (!biometrics),
                          //                 ),
                          //               );
                          //             },
                          //           );
                          //         },
                          //         child: Container(
                          //           margin: EdgeInsets.only(left: 18, right: 7.2),
                          //           padding: EdgeInsets.all(2.16),
                          //           decoration: BoxDecoration(
                          //             color: biometrics ? Color(0xff27AE60) : Colors.white,
                          //             borderRadius: BorderRadius.circular(18),
                          //             border:
                          //                 Border.all(color: biometrics ? Color(0xff27AE60) : Colors.grey, width: 1.44),
                          //           ),
                          //           child: Icon(
                          //             Icons.done,
                          //             color: Colors.white,
                          //             size: 10.8,
                          //           ),
                          //         ),
                          //       ),
                          //       Expanded(
                          //         child: Text(
                          //           "Enable Face ID for authentication",
                          //           style: TextStyle(fontSize: 14.4, color: Colors.black),
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          Divider(
                            thickness: 1,
                            // /height: 0,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          end: Alignment.topCenter,
                          begin: Alignment.bottomCenter,
                          colors: [
                            Color(0x1fedb672),
                            Color(0x1f22b8bd),
                          ],
                        ),
                      ),
                      padding: EdgeInsets.only(
                          top: 18, left: 21.6, right: 21.6, bottom: 10.8),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateColor.resolveWith(
                                  (states) => (bkmsIdError == false &&
                                          emailError == false &&
                                          passwordError == false)
                                      ? Color(0xff2F80ED)
                                      : Color(0xffBDBDBD)),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(9),
                                ),
                              ),
                            ),
                            onPressed: (_bkmsId.text.isEmpty ||
                                    _email.text.isEmpty ||
                                    _password.text.isEmpty)
                                ? null
                                : () {
                                    setState(() {
                                      if (_bkmsId.text.isEmpty) {
                                        bkmsIdError = true;

                                        _focusNodeBKMSId.requestFocus();
                                      }

                                      if (_email.text.isEmpty ||
                                          !Utils().validateEmail(_email.text)) {
                                        emailError = true;

                                        _focusNodeEmail.requestFocus();
                                      }

                                      if (_password.text.isEmpty) {
                                        passwordError = true;

                                        _focusNodePassword.requestFocus();
                                      }

                                      if (_bkmsId.text.isNotEmpty &&
                                          Utils().validateEmail(_email.text) &&
                                          _password.text.isNotEmpty) {
                                        _focusNodeBKMSId.unfocus();
                                        _focusNodeEmail.unfocus();
                                        _focusNodePassword.unfocus();

                                        _showLoadingIndicator();

                                        var formData = LoginRequestModel(
                                          int.parse(_bkmsId.text,
                                              onError: (_) => 0),
                                          _email.text,
                                          _password.text,
                                          Utils().nullSafeString(_token),
                                        );
                                        BlocProvider.of<AuthBloc>(context).add(
                                          AuthEvent.logIn(formData),
                                        );
                                      }
                                    });
                                  },
                            child: Padding(
                              padding: EdgeInsets.all(10.8),
                              child: Text(
                                "Sign In",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14.4),
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              VRouter.of(context).to(ForgotPassword.id +
                                  "/${_bkmsId.text.isEmpty ? " " : _bkmsId.text}" +
                                  "/${_email.text.isEmpty ? " " : _email.text}");
                            },
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(
                                color: Colors.grey[700],
                                decoration: TextDecoration.underline,
                                fontSize: 12.6,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
                child: _isLoading
                    ? Loader(loadingTxt: 'Please wait...')
                    : Container())
          ]),
        ),
      ),
    );
  }
}

class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var rect = Offset.zero & size;
    var paint = Paint()..strokeWidth = 36;
    paint.shader = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xffFFDADA),
        Color(0xffFFFAEA),
      ],
    ).createShader(rect);

    Offset start = Offset(ScreenSize.width * -0.1, ScreenSize.height * 0.335);
    Offset end = Offset(ScreenSize.width * 1.1, ScreenSize.height * 0.11);

    var paint2 = Paint()
      ..strokeWidth = 36
      ..color = Color(0xff56CCF2);

    Offset start2 = Offset(ScreenSize.width * -0.1, ScreenSize.height * 0.385);
    Offset end2 = Offset(ScreenSize.width * 1.2, ScreenSize.height * 0.14);

    canvas.drawLine(start, end, paint);
    canvas.drawLine(start2, end2, paint2);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
