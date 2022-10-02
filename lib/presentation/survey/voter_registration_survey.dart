import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_app/media_query/responsive.dart';
import 'package:flutter_app/presentation/homepage/innerpage/registrationFee.dart';
import 'package:flutter_app/presentation/homepage/innerpage/registration_page.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class VoterRegistrationSurvey extends StatefulWidget {
  static String id = "voterRegistrationSurvey";
  static String path = "${Registration.path}/$id";

  const VoterRegistrationSurvey({Key? key}) : super(key: key);

  @override
  _VoterRegistrationSurveyState createState() => _VoterRegistrationSurveyState();
}

class _VoterRegistrationSurveyState extends State<VoterRegistrationSurvey> {
  String both = "both";
  String yes = "yes";
  String no = "no";
  double voterTotal = 0.0;
  String firstBoth = "firstBoth";
  String firstYes = "yes";
  String firstNo = "no";

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              end: Alignment.topCenter,
              begin: Alignment.bottomCenter,
              colors: <Color>[
                Color(0xfffffaea),
                Color(0xaae7dadb),
                Color(0xffeefaff),
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
                                "Voter Registration Survey",
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
                          "Due February 9, 2021",
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
        SizedBox(
          height: 10.98,
        ),
        LinearPercentIndicator(
          linearGradient: (voterTotal == 1.0)
              ? LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xff6FCF97), Color(0xff6FCF97)])
              : LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [
                  Color(0xffFFDADA),
                  Color(0xffFFC592),
                ]),
          padding: EdgeInsets.only(left: 18, right: 18),
          width: 360,
          lineHeight: 10.98,
          percent: voterTotal,
          backgroundColor: Colors.grey[200],
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 3.6,
            left: 14.4,
            right: 14.4,
          ),
          child: Row(
            children: [
              Icon(
                Icons.menu,
                color: Colors.grey[400],
                size: 25.2,
              ),
              Expanded(
                child: Text(
                  "  " + (voterTotal * 100).toInt().toString() + "%" + " Complete",
                  style: TextStyle(color: (voterTotal == 1.0) ? Color(0xff27AE60) : Colors.orange, fontSize: 14.4),
                ),
              ),
              SizedBox(
                width: 36,
              ),
              Expanded(
                child: Text(
                  (voterTotal == 1.0) ? "Auto-saved just now." : "Auto-saved 2 minutes ago.",
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 10.8),
                ),
              ),
            ],
          ),
        ),
        Divider(
          thickness: 1,
        ),
        Expanded(
          child: Stack(
            children: [
              ListView(
                shrinkWrap: true,
                padding: EdgeInsets.only(
                  top: 7.2,
                ),
                children: [
                  Padding(
                    padding: EdgeInsets.all(18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Was at least one group sabha/hangout held?",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.2,
                            color: Colors.grey[700],
                          ),
                        ),
                        Divider(
                          thickness: 1,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.8),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    both = yes;
                                    voterTotal = 0.5;
                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.only(right: 7.2),
                                  padding: EdgeInsets.all(1.44),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18),
                                    border:
                                        Border.all(color: (both == yes) ? Color(0xFF2F80ED) : Colors.grey, width: 1.44),
                                  ),
                                  child: Icon(
                                    Icons.done,
                                    color: (both == yes) ? Color(0xFF2F80ED) : Colors.grey,
                                    size: 10.8,
                                  ),
                                ),
                              ),
                              Text(
                                "Yes",
                                style:
                                    TextStyle(fontSize: 14.4, color: (both == yes) ? Color(0xFF2F80ED) : Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.98,
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  both = no;
                                  voterTotal = 0.5 + voterTotal;
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 7.2),
                                padding: EdgeInsets.all(1.44),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                  border:
                                      Border.all(color: (both == no) ? Color(0xFF2F80ED) : Colors.grey, width: 1.44),
                                ),
                                child: Icon(
                                  Icons.done,
                                  color: (both == no) ? Color(0xFF2F80ED) : Colors.grey,
                                  size: 10.8,
                                ),
                              ),
                            ),
                            Text(
                              "No",
                              style: TextStyle(fontSize: 14.4, color: (both == no) ? Color(0xFF2F80ED) : Colors.grey),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 29.28,
                        ),
                        Text(
                          "Was at least one group sabha/hangout held?",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.2,
                            color: Colors.grey[700],
                          ),
                        ),
                        Divider(
                          thickness: 1,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.8),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    firstBoth = yes;
                                    voterTotal = 0.5;
                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.only(right: 7.2),
                                  padding: EdgeInsets.all(1.44),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18),
                                    border: Border.all(
                                        color: (firstBoth == yes) ? Color(0xFF2F80ED) : Colors.grey, width: 1.44),
                                  ),
                                  child: Icon(
                                    Icons.done,
                                    color: (firstBoth == yes) ? Color(0xFF2F80ED) : Colors.grey,
                                    size: 10.8,
                                  ),
                                ),
                              ),
                              Text(
                                "Yes",
                                style: TextStyle(
                                    fontSize: 14.4, color: (firstBoth == yes) ? Color(0xFF2F80ED) : Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.98,
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  firstBoth = no;
                                  voterTotal = 0.5 + voterTotal;
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 7.2),
                                padding: EdgeInsets.all(1.44),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                  border: Border.all(
                                      color: (firstBoth == no) ? Color(0xFF2F80ED) : Colors.grey, width: 1.44),
                                ),
                                child: Icon(
                                  Icons.done,
                                  color: (firstBoth == no) ? Color(0xFF2F80ED) : Colors.grey,
                                  size: 10.8,
                                ),
                              ),
                            ),
                            Text(
                              "No",
                              style:
                                  TextStyle(fontSize: 14.4, color: (firstBoth == no) ? Color(0xFF2F80ED) : Colors.grey),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 29.28,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              (voterTotal == 1.0)
                  ? Align(
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
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(9),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    setState(() {});
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.all(10.8),
                                    child: Text(
                                      "Register",
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
                  : SizedBox(),
            ],
          ),
        ),
      ],
    );
  }
}
