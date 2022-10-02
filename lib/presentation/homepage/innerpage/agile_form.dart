import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/media_query/responsive.dart';
import 'package:flutter_app/models/home_model.dart';
import 'package:flutter_app/models/user_profile_model.dart';
import 'package:flutter_app/presentation/bloc/params_bloc.dart';
import 'package:flutter_app/presentation/bloc/params_state.dart';
import 'package:flutter_app/presentation/bloc/user_profile_bloc.dart';
import 'package:flutter_app/utils/util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../loader.dart';
import 'eventpage.dart';

class AgileForm extends StatefulWidget {
  static String id = "agileForm";
  static String path = "${EventPage.path}/$id";

  @override
  _AgileFormState createState() => _AgileFormState();
}

class _AgileFormState extends State<AgileForm> with TickerProviderStateMixin {
  UserProfileModel? userProfileModel;
  late MyEvent _myEventItem;

  bool registrationInformation = true;

  List<Region?>? _agileDropDownItems;
  Region? _selectedAgileDropDown;

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
    if (paramsBloc is EventState) {
      _myEventItem = paramsBloc.myEvent;
    }

    _showLoadingIndicator();
    try {
      BlocProvider.of<UserProfileBloc>(context).add(UserProfileEvent.load(context, ""));
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MultiBlocListener(
        listeners: [
          BlocListener<UserProfileBloc, UserProfileState>(
            listener: (context, state) {
              state.maybeWhen(
                  empty: () {
                    _hideLoadingIndicator();
                  },
                  load: (userProfileModel) {
                    if (userProfileModel != null) {
                      _hideLoadingIndicator();
                      setState(
                        () {
                          // this.userProfileModel = userProfileModel;
                          _agileDropDownItems = userProfileModel.region;
                        },
                      );
                    }
                  },
                  orElse: () {});
            },
          ),
        ],
        child: Stack(children: <Widget>[
          Container(
              child: Column(
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
                                      "Agile Form",
                                      style: TextStyle(fontSize: 30.6, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Stack(children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: ListView(
                          padding: EdgeInsets.zero,
                          children: [
                            ExpansionTile(
                              trailing: (registrationInformation)
                                  ? Icon(Icons.keyboard_arrow_down)
                                  : Icon(Icons.keyboard_arrow_up),
                              collapsedIconColor: Colors.black,
                              iconColor: Colors.black,
                              initiallyExpanded: true,
                              onExpansionChanged: (val) {
                                setState(
                                  () {
                                    registrationInformation = val;
                                  },
                                );
                              },
                              title: Text(
                                "Registration Information",
                                style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              children: [
                                Divider(
                                  color: Colors.black38,
                                ),
                                Container(
                                  padding: EdgeInsets.all(14.4),
                                  margin: EdgeInsets.all(14.4),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(7.2),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
                                      Text(
                                        "Agile Dropdown",
                                        style: TextStyle(fontSize: 10.8, color: Color(0xFF4F4F4F)),
                                      ),
                                      SizedBox(
                                        height: 0.732,
                                      ),
                                      _agileDropDownItems != null
                                          ? DropdownButton(
                                              itemHeight: 60,
                                              hint: Text('Choose from Agile Dropdown'),
                                              value: _selectedAgileDropDown == null ? null : _selectedAgileDropDown,
                                              onChanged: (newValue) {
                                                setState(() {
                                                  _selectedAgileDropDown = newValue as Region;
                                                });
                                              },
                                              items: _agileDropDownItems!.map((item) {
                                                return DropdownMenuItem(
                                                  child: new Text(item!.RegionName.trim(),
                                                      overflow: TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                        fontSize: 14.4,
                                                      )),
                                                  value: item,
                                                );
                                              }).toList(),
                                            )
                                          : Container(height: 60),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 65.88,
                            )
                          ],
                        ),
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
                          padding: EdgeInsets.only(top: 18, left: 21.6, right: 21.6, bottom: 18),
                          // width: double.infinity,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateColor.resolveWith((states) => Color(0xff2F80ED)),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(9),
                                    ),
                                  ),
                                ),
                                onPressed: () async {
                                  setState(() {
                                    if (validateRegistrationInformation()) {
                                      /*_showLoadingIndicator();
                                            BlocProvider.of<HomeBloc>(context).add(HomeEvent.submitLiabilityForm(context, Utils().nullSafeString(_myEventItem.id.toString()), multiPartSignature));*/
                                    }
                                  });
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
          )),
          Container(child: _isLoading ? Loader(loadingTxt: 'Please wait...') : Container())
        ]),
      ),
    );
  }

  //region FOR VALIDATE REGISTRATION INFORMATION
  bool validateRegistrationInformation() {
    if (_selectedAgileDropDown != null) {
      return true;
    } else {
      Utils().showToast('Please choose from Agile Dropdown!');
    }

    return false;
  }
//endregion
}
