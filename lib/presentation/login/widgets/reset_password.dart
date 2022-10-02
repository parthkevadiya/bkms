import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/reset_password_request_model.dart';
import 'package:flutter_app/presentation/auth/auth_bloc.dart';
import 'package:flutter_app/presentation/bloc/bloc.dart';
import 'package:flutter_app/presentation/login/login.dart';
import 'package:flutter_app/utils/login_status.dart';
import 'package:flutter_app/utils/util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vrouter/vrouter.dart';

import '../../../loader.dart';
import '../../../media_query/responsive.dart';
import 'forgot_password.dart';

class ResetPassword extends StatefulWidget {
  static const String id = "resetPassword";
  static String path = "${ForgotPassword.path}/$id";

  const ResetPassword({Key? key}) : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  String? resetPasswordDeepLink;

  late FocusNode _focusNodePassword;
  late FocusNode _focusNodeConfirmPassword;

  bool? passwordError;
  bool? confirmPasswordError;

  TextEditingController _password = TextEditingController();
  TextEditingController _confirmPassword = TextEditingController();

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
    _focusNodePassword = FocusNode();
    _focusNodeConfirmPassword = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize.setSize(context);
    if (resetPasswordDeepLink == null || resetPasswordDeepLink == '') {
      final paramsBloc = BlocProvider.of<ParamsBloc>(context).state;
      if (paramsBloc is DeepLinkState) {
        resetPasswordDeepLink = paramsBloc.strDeepLink;
      }
    }

    String strToken = '';
    String strBKMSID = '-1';
    String strIsChild = '';
    bool boolStrIsChild = true;
    if (resetPasswordDeepLink != null) {
      strToken = Uri.parse(resetPasswordDeepLink!).queryParameters['token'] ?? "";
      strIsChild = Uri.parse(resetPasswordDeepLink!).queryParameters['is_child'] ?? "";
      strBKMSID = Uri.parse(resetPasswordDeepLink!).queryParameters['bkms_id'] ?? "";
      boolStrIsChild = strIsChild.toLowerCase() == 'true';
    }

    return WillPopScope(
      onWillPop: () async {
        resetPasswordDeepLink = '';
        return true;
      },
      child: Builder(
        builder: (context) {
          return BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              state.maybeWhen(
                  loading: (l) {
                    if (l == LoadingStatus.InProgress) {
                      _showLoadingIndicator();
                    }
                  },
                  resetPasswordSuccess: (loadingStatus, isLoggedIn) {
                    if (loadingStatus == LoadingStatus.Done) {
                      _hideLoadingIndicator();
                      VRouter.of(context).to(Login.path, isReplacement: true);
                    }
                  },
                  error: (loadingStatus, message) {
                    if (loadingStatus == LoadingStatus.Error) {
                      _hideLoadingIndicator();
                    }
                  },
                  orElse: () {});
            },
            child: Scaffold(
              body: Stack(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ListView(
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        children: [
                          Column(children: [
                            GestureDetector(
                              onTap: () {
                                VRouter.of(context).to(Login.path);
                              },
                              child: Padding(
                                padding: EdgeInsets.only(left: 10.0),
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
                                    "img/reset.png",
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
                          ]),
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
                                      "Reset Password",
                                      style: TextStyle(
                                          color: Color(0xff4F4F4F), fontSize: 36, fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 3.66,
                                    ),
                                    Text(
                                      "Create a new password for your BKMS account here and then use it to log in.",
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
                                padding: EdgeInsets.only(top: 3.6, left: 19.8, bottom: 3.6),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        "Password",
                                        style: TextStyle(color: Colors.black, fontSize: 12.6),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 4,
                                      child: Container(
                                        padding: EdgeInsets.only(left: 19.8, right: 19.8),
                                        width: 360,
                                        height: 28.8,
                                        //color: Colors.red,
                                        child: TextField(
                                          onChanged: (value) {
                                            setState(() {
                                              (value.isEmpty) ? passwordError = true : passwordError = false;
                                            });
                                          },
                                          focusNode: _focusNodePassword,
                                          controller: _password,
                                          textInputAction: TextInputAction.next,
                                          keyboardType: TextInputType.text,
                                          obscureText: true,
                                          decoration: InputDecoration(
                                            suffixIcon: (passwordError == true)
                                                ? Padding(
                                                    padding: EdgeInsets.only(left: 28.8),
                                                    child: Image.asset(
                                                      "img/question.png",
                                                      color: Colors.red,
                                                    ),
                                                  )
                                                : SizedBox(),
                                            contentPadding: EdgeInsets.only(),
                                            hintText: "*******",
                                            border: OutlineInputBorder(borderSide: BorderSide.none),
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
                                      padding: EdgeInsets.only(bottom: 7.2, left: 14.4),
                                      child: Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(7.2),
                                              color: Color(0x1FEB5757),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(3.6),
                                              child: Text(
                                                "Please enter password. ",
                                                style: TextStyle(color: Color(0xffEB5757), fontSize: 13.68),
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
                                padding: EdgeInsets.only(top: 3.6, left: 19.8, bottom: 10.8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        "Confirm Password",
                                        style: TextStyle(color: Colors.black, fontSize: 12.6),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 4,
                                      child: Container(
                                        padding: EdgeInsets.only(
                                          left: 19.8,
                                          right: 19.8,
                                        ),
                                        width: 360,
                                        height: 36,
                                        child: TextField(
                                          onChanged: (value) {
                                            setState(() {
                                              (value.isEmpty)
                                                  ? confirmPasswordError = true
                                                  : confirmPasswordError = false;
                                            });
                                          },
                                          focusNode: _focusNodeConfirmPassword,
                                          controller: _confirmPassword,
                                          textInputAction: TextInputAction.done,
                                          keyboardType: TextInputType.text,
                                          obscureText: true,
                                          decoration: InputDecoration(
                                            suffixIcon: (confirmPasswordError == true)
                                                ? Padding(
                                                    padding: EdgeInsets.only(left: 28.8),
                                                    child: Padding(
                                                      padding: EdgeInsets.only(left: 28.8),
                                                      child: Image.asset(
                                                        "img/question.png",
                                                        color: Colors.red,
                                                      ),
                                                    ))
                                                : SizedBox(),
                                            contentPadding: EdgeInsets.only(),
                                            hintText: "*******",
                                            border: OutlineInputBorder(borderSide: BorderSide.none),
                                            hintStyle: TextStyle(fontSize: 12.6),
                                            focusColor: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              (confirmPasswordError == true)
                                  ? Padding(
                                      padding: EdgeInsets.only(bottom: 7.2, left: 14.4),
                                      child: Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(7.2),
                                              color: Color(0x1FEB5757),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(3.6),
                                              child: Text(
                                                "Please enter Confirm password. ",
                                                style: TextStyle(color: Color(0xffEB5757), fontSize: 13.68),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : SizedBox(),
                              Divider(
                                thickness: 1,
                                height: 0,
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
                              colors: <Color>[
                                Color(0x11FFFAEA),
                                Color(0x11E6F5FE),
                              ],
                            ),
                          ),
                          padding: EdgeInsets.only(top: 18, left: 21.6, right: 21.6, bottom: 18),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateColor.resolveWith((states) =>
                                      (passwordError == false && confirmPasswordError == false)
                                          ? Color(0xff2F80ED)
                                          : Color(0xffBDBDBD)),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(9),
                                    ),
                                  ),
                                ),
                                onPressed: (_password.text.isEmpty || _confirmPassword.text.isEmpty)
                                    ? null
                                    : () {
                                        setState(() {
                                          if (_password.text.isNotEmpty) {
                                            if (_confirmPassword.text.isNotEmpty) {
                                              if (_password.text == _confirmPassword.text) {
                                                _focusNodePassword.unfocus();
                                                _focusNodeConfirmPassword.unfocus();
                                                var formData = ResetPasswordRequestModel(
                                                    _password.text,
                                                    _confirmPassword.text,
                                                    Utils().nullSafeString(strToken),
                                                    int.parse(Utils().nullSafeString(strBKMSID)),
                                                    boolStrIsChild);
                                                BlocProvider.of<AuthBloc>(context).add(
                                                  AuthEvent.resetPassword(formData),
                                                );
                                                resetPasswordDeepLink = '';
                                              } else {
                                                Utils().showToast('Password and Confirm password must be same!');
                                              }
                                            } else {
                                              confirmPasswordError = true;
                                              _focusNodeConfirmPassword.requestFocus();
                                            }
                                          } else {
                                            passwordError = true;
                                            _focusNodePassword.requestFocus();
                                          }
                                        });
                                      },
                                child: Padding(
                                  padding: EdgeInsets.all(10.8),
                                  child: Text(
                                    "Reset Password",
                                    style: TextStyle(color: Colors.white, fontSize: 14.4),
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
                Container(child: _isLoading ? Loader(loadingTxt: 'Please wait...') : Container())
              ]),
            ),
          );
        },
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
      ..color = Color(0xffF2994A);

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
