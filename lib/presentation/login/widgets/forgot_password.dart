import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/forgot_password_request_model.dart';
import 'package:flutter_app/presentation/auth/auth_bloc.dart';
import 'package:flutter_app/utils/login_status.dart';
import 'package:flutter_app/utils/util.dart';
import 'package:vrouter/vrouter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../loader.dart';
import '../../../media_query/responsive.dart';
import '../login.dart';

class ForgotPassword extends StatefulWidget {
  static const String id = "forgotPassword";
  static String path = "${Login.path}/$id";
  final String bkmsid;
  final String email;

  ForgotPassword({
    Key? key,
    required this.bkmsid,
    required this.email,
  }) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  late FocusNode _focusNodeBKMSId;
  late FocusNode _focusNodeEmail;

  bool bkmsIdError = false;
  bool emailError = false;

  TextEditingController _email = TextEditingController();
  TextEditingController _bkmsId = TextEditingController();

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
    _focusNodeBKMSId = FocusNode();
    _focusNodeEmail = FocusNode();

    _bkmsId.text = widget.bkmsid.replaceAll(" ", "");
    _email.text = widget.email.replaceAll(" ", "");
    bkmsIdError = widget.bkmsid.isEmpty;
    emailError = widget.email.isEmpty;
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize.setSize(context);
    return Builder(
      builder: (context) {
        return BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            state.maybeWhen(
                loading: (l) {
                  if (l == LoadingStatus.InProgress) {
                    _showLoadingIndicator();
                  }
                },
                forgetPasswordSuccess: (loadingStatus, isLoggedIn) {
                  if (loadingStatus == LoadingStatus.Done) {
                    _hideLoadingIndicator();
                    VRouter.of(context).to(Login.path, isReplacement: true);
                  }
                },
                error: (loadingStatus, message) {
                  if (loadingStatus == LoadingStatus.Error) {
                    setState(() {
                      _hideLoadingIndicator();
                    });
                  }
                },
                orElse: () {});
          },
          child: Scaffold(
            body: Stack(children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ListView(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
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
                          ],
                        ),
                        Stack(
                          children: [
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

                            // CustomPaint(
                            //   size: Size(0, 292.8),
                            //   painter: LinePainter(),
                            // ),
                            // Center(
                            //   child: Padding(
                            //     padding: EdgeInsets.only(top: 51.24),
                            //     child: Container(
                            //       width: 72,
                            //       child: Image.asset("img/god.png"),
                            //       decoration: BoxDecoration(
                            //         borderRadius: BorderRadius.circular(18),
                            //       ),
                            //     ),
                            //   ),
                            // ),
                            // Positioned(
                            //   top: 165,
                            //   left: 25.2,
                            //   child: Container(
                            //     padding: EdgeInsets.all(9),
                            //     height: 84.18,
                            //     width: 84.18,
                            //     child: Image.asset("img/logo.png"),
                            //     decoration: BoxDecoration(
                            //       boxShadow: [
                            //         BoxShadow(
                            //           color: Colors.black12,
                            //           blurRadius: 18,
                            //         ),
                            //       ],
                            //       color: Colors.white,
                            //       borderRadius: BorderRadius.circular(18),
                            //     ),
                            //   ),
                            // ),
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
                                    "Forgot Password",
                                    style:
                                        TextStyle(color: Color(0xff4F4F4F), fontSize: 36, fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 3.66,
                                  ),
                                  Text(
                                    "Please provide your BKMS ID and email and we’ll send a link to reset your password.",
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
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      "BKMS ID",
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
                                            (value.isEmpty) ? bkmsIdError = true : bkmsIdError = false;
                                          });
                                        },
                                        focusNode: _focusNodeBKMSId,
                                        controller: _bkmsId,
                                        textInputAction: TextInputAction.next,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          suffixIcon: (bkmsIdError == true)
                                              ? Padding(
                                                  padding: EdgeInsets.only(left: 28.8),
                                                  child: Padding(
                                                    padding: EdgeInsets.only(left: 28.8),
                                                    child: Image.asset(
                                                      "img/error_outline.png",
                                                      color: Colors.red,
                                                    ),
                                                  ))
                                              : SizedBox(),
                                          contentPadding: EdgeInsets.only(),
                                          hintText: "12345",
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
                            (bkmsIdError == true)
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
                                              "Please Enter a BKMS ID",
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
                              padding: EdgeInsets.only(top: 3.6, left: 19.8, bottom: 3.6),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      "Email",
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
                                            (value.isEmpty) ? emailError = true : emailError = false;
                                          });
                                        },
                                        focusNode: _focusNodeEmail,
                                        controller: _email,
                                        textInputAction: TextInputAction.done,
                                        keyboardType: TextInputType.emailAddress,
                                        decoration: InputDecoration(
                                          suffixIcon: (emailError == true)
                                              ? Padding(
                                                  padding: EdgeInsets.only(left: 28.8),
                                                  child: Padding(
                                                    padding: EdgeInsets.only(left: 28.8),
                                                    child: Image.asset(
                                                      "img/error_outline.png",
                                                      color: Colors.red,
                                                    ),
                                                  ),
                                                )
                                              : SizedBox(),
                                          contentPadding: EdgeInsets.only(),
                                          hintText: "test@email.com",
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
                            (emailError == true)
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
                                              (_email.text != "" && !Utils().validateEmail(_email.text))
                                                  ? "Please Enter Valid Email Address"
                                                  : "Please Enter an Email Address",
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
                        decoration: const BoxDecoration(
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
                                backgroundColor: MaterialStateColor.resolveWith(
                                    (states) => (!bkmsIdError && !emailError) ? Color(0xff2F80ED) : Color(0xffBDBDBD)),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(9),
                                  ),
                                ),
                              ),
                              onPressed: (_bkmsId.text.isEmpty || _email.text.isEmpty)
                                  ? null
                                  : () {
                                      setState(() {
                                        if (_bkmsId.text.isEmpty) {
                                          bkmsIdError = true;

                                          _focusNodeBKMSId.requestFocus();
                                        }

                                        if (_email.text.isEmpty || !Utils().validateEmail(_email.text)) {
                                          emailError = true;

                                          _focusNodeEmail.requestFocus();
                                        }

                                        if (Utils().validateEmail(_email.text) && _bkmsId.text.isNotEmpty) {
                                          setState(
                                            () {
                                              _focusNodeEmail.unfocus();
                                              _focusNodeBKMSId.unfocus();

                                              var formData = ForgotPasswordRequestModel(
                                                  int.parse(_bkmsId.text, onError: (_) => 0), _email.text);
                                              BlocProvider.of<AuthBloc>(context).add(
                                                AuthEvent.forgotPassword(formData),
                                              );
                                            },
                                          );
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
                            TextButton(
                              onPressed: () {
                                VRouter.of(context).to(Login.path, isReplacement: false);
                              },
                              child: Text(
                                "Back to login",
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
              Container(child: _isLoading ? Loader(loadingTxt: 'Please wait...') : Container())
            ]),
          ),
        );
      },
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
