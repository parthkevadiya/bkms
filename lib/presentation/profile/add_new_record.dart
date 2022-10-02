import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/add_new_record_model.dart';
import 'package:flutter_app/models/add_new_record_request_model.dart';
import 'package:flutter_app/models/login_model.dart';
import 'package:flutter_app/models/user_profile_model.dart';
import 'package:flutter_app/preferences.dart';
import 'package:flutter_app/presentation/bloc/user_profile_bloc.dart';
import 'package:flutter_app/utils/gender_status.dart';
import 'package:flutter_app/utils/login_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:masked_text_field/masked_text_field.dart';

import '../../loader.dart';
import '../../utils/constant.dart';
import '../../utils/util.dart';

class AddNewRecord extends StatefulWidget {
  final Function(
    bool add,
  ) addRecordData;
  const AddNewRecord({
    Key? key,
    required this.addRecordData,
  }) : super(key: key);

  @override
  _AddNewRecordState createState() => _AddNewRecordState();
}

class _AddNewRecordState extends State<AddNewRecord> {
  UserProfileModel? userProfileModel;

  List<Country?> _countryItems = [];
  Country? _selectedCountry;

  List<StateUP?> _stateItems = [];
  List<StateUP?>? _countryWiseStateItems;
  StateUP? _selectedState;

  List<Seva?> _sevaItems = [];
  Seva? _selectedSevaItem;

  List<Wing?> _currentWingItems = [];
  Wing? _selectedCurrentWingItem;

  List<Wing?> _currentSecondaryWingItems = [];
  Wing? _selectedSecondaryCurrentWing;

  List<TShirtSize?> _tShortSizeItems = [];
  TShirtSize? _selectedTShirtSizeItem;

  List<Region?> _regionsItems = [];
  Region? _selectedRegion;

  List<CenterUP?> _regionWiseCentersItems = [];
  List<CenterUP?>? _centersItems;
  CenterUP? _selectedCenter;

  // List<Wing?> _currentUserWingItems = [];
  // Wing? _selectedCurrentUserWingItem;

  List<Seva?> _sevaSecondaryItems = [];
  Seva? _selectedSecondarySevaItem;

  List<SchoolYear?> _schoolYearsItems = [];
  SchoolYear? _selectedYear;

  List<GroupUP?> _groupItems = [];
  GroupUP? _selectedGroup;

  bool personal = true;
  bool contact = true;
  bool satsang = true;
  bool gender = false;
  String? userWing;
  String? userGroup;

  final _formKey = new GlobalKey<FormBuilderState>();

  TextEditingController _firstName = TextEditingController();
  late FocusNode _focusNodeFName;
  bool? fNameError;

  TextEditingController _lastName = TextEditingController();
  late FocusNode _focusNodeLName;
  bool? lNameError;

  TextEditingController _email = TextEditingController();
  late FocusNode _focusNodeEmail;
  bool? emailError;

  late FocusNode _focusNodeDate;
  bool? birthError;

  TextEditingController _password = TextEditingController();
  late FocusNode _focusNodePassword;
  bool? passwordError;

  TextEditingController _confirmPassword = TextEditingController();
  late FocusNode _focusNodeConfirmPassword;
  bool? confirmPasswordError;

  TextEditingController _apartment = TextEditingController();
  late FocusNode _focusNodeApartment;
  bool? apartmentError;

  TextEditingController _homeAddress = TextEditingController();
  late FocusNode _focusNodeHomeAddress;
  bool? homeAddressError;

  TextEditingController _city = TextEditingController();
  late FocusNode _focusNodeCity;
  bool? cityError;

  TextEditingController _zipCode = TextEditingController();
  late FocusNode _focusNodeZipCode;
  bool? zipCodeError;

  LoginModel? loginModel;
  LoadingStatus? loadingStatus;
  bool _isLoading = false;
  String _strRecordId = "";

  TextEditingController _homePhone = TextEditingController();
  TextEditingController _cellPhone = TextEditingController();

  final TextEditingController _middleName = TextEditingController();
  final TextEditingController _undergraduateSchool = TextEditingController();
  final TextEditingController _major = TextEditingController();
  final TextEditingController _careerInterest = TextEditingController();
  final TextEditingController _satsangYear = TextEditingController();

  final TextEditingController _allergies = TextEditingController();
  final TextEditingController _medicationsTaken = TextEditingController();
  final TextEditingController _medicalConditions = TextEditingController();
  final TextEditingController _specialMedicalInstructions = TextEditingController();
  final TextEditingController _notes = TextEditingController();

  final TextEditingController _facebook = TextEditingController();
  final TextEditingController _twitter = TextEditingController();
  final TextEditingController _snapchat = TextEditingController();
  final TextEditingController _instagram = TextEditingController();
  final TextEditingController _linkedin = TextEditingController();

  final TextEditingController _eC1Name = TextEditingController();
  final TextEditingController _eC1Email = TextEditingController();
  final TextEditingController _eC1PrimaryNumber = TextEditingController();
  final TextEditingController _eC1SecondaryNumber = TextEditingController();

  final TextEditingController _eC2Name = TextEditingController();
  final TextEditingController _eC2Email = TextEditingController();
  final TextEditingController _eC2PrimaryNumber = TextEditingController();
  final TextEditingController _eC2SecondaryNumber = TextEditingController();

  final TextEditingController _fatherName = TextEditingController();
  final TextEditingController _fatherEmail = TextEditingController();
  bool fatherEmailError = false;
  late FocusNode _focusNodeFatherEmail;
  final TextEditingController _fatherPhone = TextEditingController();

  final TextEditingController _motherName = TextEditingController();
  final TextEditingController _motherEmail = TextEditingController();
  bool motherEmailError = false;
  late FocusNode _focusNodeMotherEmail;
  final TextEditingController _motherPhone = TextEditingController();

  DateTime selectedDate = DateTime.now();
  DateTime? picked;
  Future<void> _selectDate(BuildContext context) async {
    picked = await showDatePicker(
        context: context, initialDate: selectedDate, firstDate: DateTime(1900, 1), lastDate: DateTime.now());
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked!;
        birthError = false;
      });

    if (picked != null && _genderStatus != null && _selectedYear != null) {
      var formData = UserWiseGroupRequest(
        Utils().nullSafeInt(loginModel!.bkms_id),
        Utils().nullSafeString(_selectedYear!.id.toString()),
        Utils().changeDateFormat(selectedDate, Constant.defaultDateFormatWeb),
        _genderStatus!,
      );
      BlocProvider.of<AddNewRecordBloc>(context).add(
        AddNewRecordEvent.userWiseGroup(
          formData,
          Utils().nullSafeString(loginModel!.access_token).toString(),
          context,
        ),
      );
    }
  }

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

  GenderStatus? _genderStatus;

  bool addOrNot = false;
  bool viewWingGroup = false;

  @override
  void initState() {
    super.initState();
    _focusNodeFName = FocusNode();
    _focusNodeLName = FocusNode();
    _focusNodeEmail = FocusNode();
    _focusNodePassword = FocusNode();
    _focusNodeConfirmPassword = FocusNode();
    _focusNodeApartment = FocusNode();
    _focusNodeHomeAddress = FocusNode();
    _focusNodeCity = FocusNode();
    _focusNodeZipCode = FocusNode();
    _focusNodeDate = FocusNode();
    _focusNodeFatherEmail = FocusNode();
    _focusNodeMotherEmail = FocusNode();

    _showLoadingIndicator();
    try {
      BlocProvider.of<UserProfileBloc>(context).add(UserProfileEvent.load(context, ""));
    } catch (e) {
      print(e);
    }
  }

  bool chooseRegion = false;
  bool callBackFilter = false;
  bool chooseCenter = false;
  bool chooseCountry = false;
  bool chooseState = false;
  bool chooseYear = false;
  bool chooseSeva = false;
  bool chooseGroup = false;
  bool chooseSize = false;
  bool chooseWing = false;
  UserWiseGroup? userWiseGroup;

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
        listeners: [
          BlocListener<UserProfileBloc, UserProfileState>(
            listener: (context, state) {
              state.maybeWhen(
                  load: (userProfileModel) {
                    if (userProfileModel != null) {
                      setState(
                        () {
                          _hideLoadingIndicator();
                          this.userProfileModel = userProfileModel;
                          _countryItems = userProfileModel.country;
                          //  _currentUserWingItems = userProfileModel.wing;
                          _countryWiseStateItems = userProfileModel.state;
                          _sevaItems = userProfileModel.seva;
                          _sevaSecondaryItems = userProfileModel.seva;
                          _currentWingItems = userProfileModel.wing;
                          _currentSecondaryWingItems = userProfileModel.wing;
                          _tShortSizeItems = userProfileModel.tishirtsize;
                          _regionsItems = userProfileModel.region;
                          _regionWiseCentersItems = userProfileModel.center;
                          _schoolYearsItems = userProfileModel.school_year;
                          _groupItems = userProfileModel.group;
                        },
                      );
                    }
                  },
                  orElse: () {});
            },
          ),
          BlocListener<AddNewRecordBloc, AddNewRecordState>(
            listener: (context, state) {
              state.maybeWhen(load: (addNewRecordModel, loadingStatus) {
                if (loadingStatus == LoadingStatus.Done) {
                  _hideLoadingIndicator();
                  widget.addRecordData(true);
                  Navigator.of(context).pop();
                }
              }, userWiseGroup: (userWiseGroupModel, loadingStatus) {
                if (loadingStatus == LoadingStatus.Done) {
                  _hideLoadingIndicator();
                  if (userWiseGroupModel != null) {
                    setState(() {
                      this.userWiseGroup = userWiseGroupModel;
                      userWing = userWiseGroupModel.wing_data.wing_name;
                      userGroup = userWiseGroupModel.group_data.group_name;
                      viewWingGroup = true;
                    });
                  }
                }
              }, orElse: () {
                _hideLoadingIndicator();
              });
              state.maybeWhen(
                  empty: (loadingStatus) {
                    _hideLoadingIndicator();
                    this.loadingStatus = loadingStatus;
                    setState(() {
                      viewWingGroup = false;
                    });
                  },
                  orElse: () {});
            },
          ),
        ],
        child: FutureBuilder<Preferences>(
            future: Preferences.getInstance(),
            builder: (BuildContext context, AsyncSnapshot<Preferences> snapshot) {
              if (snapshot.hasData) {
                loginModel = snapshot.data!.getToken();
                return Stack(children: <Widget>[
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
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
                              padding: EdgeInsets.only(left: 14.4, right: 14.4, bottom: 18),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      CupertinoButton(
                                        onPressed: () {
                                          setState(() {
                                            widget.addRecordData(false);
                                            Navigator.of(context).pop();
                                          });
                                        },
                                        child: Text(
                                          "Cancel",
                                          style: TextStyle(fontSize: 16.2),
                                        ),
                                      ),
                                      CupertinoButton(
                                        onPressed: () {
                                          if (_motherEmail.text.isEmpty) {
                                            setState(() {
                                              motherEmailError = true;
                                            });
                                          }
                                          if (_fatherEmail.text.isEmpty) {
                                            setState(() {
                                              fatherEmailError = true;
                                            });
                                          }
                                          if (_selectedYear == null) {
                                            setState(() {
                                              chooseYear = true;
                                            });
                                          }
                                          if (_genderStatus == null) {
                                            setState(() {
                                              gender = true;
                                            });
                                          }
                                          if (_selectedCenter == null) {
                                            setState(() {
                                              chooseCenter = true;
                                            });
                                          }
                                          if (_selectedRegion == null) {
                                            setState(() {
                                              chooseRegion = true;
                                            });
                                          }
                                          if (_confirmPassword.text.isEmpty) {
                                            setState(() {
                                              confirmPasswordError = true;
                                            });
                                          }
                                          if (_password.text.isEmpty) {
                                            setState(() {
                                              passwordError = true;
                                            });
                                          }

                                          if (picked == null) {
                                            setState(() {
                                              birthError = true;
                                            });
                                          }

                                          if (_email.text.isEmpty && !Utils().validateEmail(_email.text)) {
                                            setState(() {
                                              emailError = true;
                                            });
                                          }
                                          if (_lastName.text.isEmpty) {
                                            setState(() {
                                              lNameError = true;
                                            });
                                          }

                                          if (_firstName.text.isEmpty) {
                                            setState(() {
                                              fNameError = true;
                                            });
                                          }
                                          if (_firstName.text.isNotEmpty) {
                                            _focusNodeFName.unfocus();
                                            fNameError = false;
                                            if (_lastName.text.isNotEmpty) {
                                              _focusNodeLName.unfocus();
                                              lNameError = false;
                                              if (_email.text.isNotEmpty) {
                                                _focusNodeEmail.unfocus();
                                                emailError = false;
                                                if (picked != null) {
                                                  _focusNodeDate.unfocus();
                                                  birthError = false;
                                                  if (_password.text.isNotEmpty) {
                                                    if (_confirmPassword.text.isNotEmpty) {
                                                      if (_password.text == _confirmPassword.text) {
                                                        if (_selectedRegion != null) {
                                                          if (_selectedCenter != null) {
                                                            if (_genderStatus != null) {
                                                              if (_selectedYear != null) {
                                                                if (_fatherEmail.text.isNotEmpty) {
                                                                  if (_motherEmail.text.isNotEmpty) {
                                                                    var contactInformation = ContactInformationAU(
                                                                      _firstName.text.isEmpty ? null : _firstName.text,
                                                                      _middleName.text.isEmpty
                                                                          ? null
                                                                          : _middleName.text,
                                                                      _lastName.text.isEmpty ? null : _lastName.text,
                                                                      _email.text.isEmpty ? null : _email.text,
                                                                      Utils().changeDateFormat(
                                                                          selectedDate, Constant.defaultDateFormat),
                                                                      _password.text.isEmpty ? null : _password.text,
                                                                      _selectedRegion != null
                                                                          ? _selectedRegion!.id.toString()
                                                                          : null,
                                                                      _selectedCenter != null
                                                                          ? _selectedCenter!.id.toString()
                                                                          : null,
                                                                      _homeAddress.text.isEmpty
                                                                          ? null
                                                                          : _homeAddress.text,
                                                                      _apartment.text.isEmpty ? null : _apartment.text,
                                                                      _city.text.isEmpty ? null : _city.text,
                                                                      _selectedState != null
                                                                          ? _selectedState!.id.toString()
                                                                          : null,
                                                                      _selectedCountry != null
                                                                          ? _selectedCountry!.id.toString().toString()
                                                                          : null,
                                                                      _zipCode.text.toUpperCase().isEmpty
                                                                          ? null
                                                                          : _zipCode.text,
                                                                      _homePhone.text.isEmpty ? null : _homePhone.text,
                                                                      _cellPhone.text.isEmpty ? null : _homePhone.text,
                                                                      null,
                                                                      null,
                                                                    );

                                                                    var familyContactInformation =
                                                                        FamilyContactInformationAU(
                                                                      _fatherName.text.isEmpty
                                                                          ? null
                                                                          : _fatherName.text,
                                                                      _fatherPhone.text.isEmpty
                                                                          ? null
                                                                          : _fatherPhone.text,
                                                                      _fatherEmail.text.isEmpty
                                                                          ? null
                                                                          : _fatherEmail.text,
                                                                      _motherName.text.isEmpty
                                                                          ? null
                                                                          : _motherName.text,
                                                                      _motherPhone.text.isEmpty
                                                                          ? null
                                                                          : _motherPhone.text,
                                                                      _motherEmail.text.isEmpty
                                                                          ? null
                                                                          : _motherEmail.text,
                                                                    );
                                                                    var emergencyContactInformation =
                                                                        EmergencyContactInformationAU(
                                                                      _eC1Name.text.isEmpty ? null : _eC1Name.text,
                                                                      _eC1PrimaryNumber.text.isEmpty
                                                                          ? null
                                                                          : _eC1PrimaryNumber.text,
                                                                      _eC1SecondaryNumber.text.isEmpty
                                                                          ? null
                                                                          : _eC1SecondaryNumber.text,
                                                                      _eC1Email.text.isEmpty ? null : _eC1Email.text,
                                                                      _eC2Name.text.isEmpty ? null : _eC2Name.text,
                                                                      _eC2PrimaryNumber.text.isEmpty
                                                                          ? null
                                                                          : _eC2PrimaryNumber.text,
                                                                      _eC2SecondaryNumber.text.isEmpty
                                                                          ? null
                                                                          : _eC2SecondaryNumber.text,
                                                                      _eC2Email.text.isEmpty ? null : _eC2Email.text,
                                                                    );

                                                                    var medicalInformation = MedicalInformationAU(
                                                                      _allergies.text.isEmpty ? null : _allergies.text,
                                                                      _medicationsTaken.text.isEmpty
                                                                          ? null
                                                                          : _medicationsTaken.text,
                                                                      _medicalConditions.text.isEmpty
                                                                          ? null
                                                                          : _medicalConditions.text,
                                                                      _specialMedicalInstructions.text.isEmpty
                                                                          ? null
                                                                          : _specialMedicalInstructions.text,
                                                                      _notes.text.isEmpty ? null : _notes.text,
                                                                    );

                                                                    var satsangInformation = SatsangInformationAU(
                                                                      _selectedTShirtSizeItem != null
                                                                          ? Utils().nullSafeString(
                                                                              _selectedTShirtSizeItem!.id.toString())
                                                                          : null,
                                                                      userWiseGroup!.wing_data.wing_id.toString(),
                                                                      userWing,
                                                                      _satsangYear.text.isEmpty
                                                                          ? null
                                                                          : _satsangYear.text,
                                                                      _selectedYear != null
                                                                          ? Utils().nullSafeString(
                                                                              _selectedYear!.id.toString())
                                                                          : null,
                                                                      _genderStatus!,
                                                                      userWiseGroup!.group_data.group_id.toString(),
                                                                      _selectedCurrentWingItem != null
                                                                          ? Utils().nullSafeString(
                                                                              _selectedCurrentWingItem!.id.toString())
                                                                          : null,
                                                                      _selectedSecondaryCurrentWing != null
                                                                          ? Utils().nullSafeString(
                                                                              _selectedSecondaryCurrentWing!.id
                                                                                  .toString())
                                                                          : null,
                                                                      _selectedSevaItem != null
                                                                          ? Utils().nullSafeString(
                                                                              _selectedSevaItem!.id.toString())
                                                                          : null,
                                                                      _selectedSecondarySevaItem != null
                                                                          ? Utils().nullSafeString(
                                                                              _selectedSecondarySevaItem!.id.toString())
                                                                          : null,
                                                                      _undergraduateSchool.text.isEmpty
                                                                          ? null
                                                                          : _undergraduateSchool.text,
                                                                      null,
                                                                      null,
                                                                      null,
                                                                      null,
                                                                      null,
                                                                      null,
                                                                    );

                                                                    var socialMediaInformation =
                                                                        SocialMediaInformationAU(
                                                                      _facebook.text.isEmpty ? null : _facebook.text,
                                                                      _twitter.text.isEmpty ? null : _twitter.text,
                                                                      _instagram.text.isEmpty ? null : _instagram.text,
                                                                      _snapchat.text.isEmpty ? null : _snapchat.text,
                                                                      _linkedin.text.isEmpty ? null : _linkedin.text,
                                                                    );

                                                                    var formData = AddNewRecordRequestModel(
                                                                      Utils().nullSafeInt(loginModel!.bkms_id),
                                                                      Utils().nullSafeString(
                                                                          loginModel!.login_user_type.toString()),
                                                                      Utils().nullSafeString(
                                                                          loginModel!.login_parent_type),
                                                                      Utils().nullSafeString(loginModel!.role),
                                                                      contactInformation,
                                                                      familyContactInformation,
                                                                      emergencyContactInformation,
                                                                      medicalInformation,
                                                                      satsangInformation,
                                                                      socialMediaInformation,
                                                                    );
                                                                    _showLoadingIndicator();
                                                                    print(formData);
                                                                    BlocProvider.of<AddNewRecordBloc>(context).add(
                                                                      AddNewRecordEvent.addNewRecord(
                                                                          formData,
                                                                          Utils()
                                                                              .nullSafeString(loginModel!.access_token)
                                                                              .toString(),
                                                                          context),
                                                                    );
                                                                  } else {
                                                                    setState(() {
                                                                      motherEmailError = true;
                                                                      _focusNodeMotherEmail.requestFocus();
                                                                    });
                                                                  }
                                                                } else {
                                                                  setState(() {
                                                                    fatherEmailError = true;
                                                                    _focusNodeFatherEmail.requestFocus();
                                                                  });
                                                                }
                                                              } else {
                                                                setState(() {
                                                                  chooseYear = true;
                                                                });
                                                                Scrollable.ensureVisible(
                                                                    _formKey.currentState!.fields["schoolKey"]!.context,
                                                                    alignmentPolicy: ScrollPositionAlignmentPolicy
                                                                        .keepVisibleAtStart);
                                                                Utils().showToast('Please choose school year!');
                                                                // FocusScope.of(context).requestFocus(_focusNodeDate);
                                                              }
                                                            } else {
                                                              Utils().showToast('Please Select Gender!');
                                                              setState(() {
                                                                gender = true;
                                                              });
                                                            }
                                                          } else {
                                                            Utils().showToast('Please choose Center!');
                                                            setState(() {
                                                              chooseCenter = true;
                                                            });
                                                          }
                                                        } else {
                                                          Utils().showToast('Please choose Region!');
                                                          setState(() {
                                                            chooseRegion = true;
                                                          });
                                                        }
                                                      } else {
                                                        Utils()
                                                            .showToast('Password and Confirm Password are not same!');
                                                      }
                                                    } else {
                                                      setState(() {
                                                        confirmPasswordError = true;
                                                        _focusNodeConfirmPassword.requestFocus();
                                                      });
                                                    }
                                                  } else {
                                                    setState(() {
                                                      passwordError = true;
                                                      _focusNodePassword.requestFocus();
                                                    });
                                                  }
                                                } else {
                                                  birthError = true;
                                                  _focusNodeDate.requestFocus();
                                                }
                                              } else {
                                                emailError = true;
                                                _focusNodeEmail.requestFocus();
                                              }
                                            } else {
                                              lNameError = true;
                                              _focusNodeLName.requestFocus();
                                            }
                                          } else {
                                            fNameError = true;
                                            _focusNodeFName.requestFocus();
                                          }
                                        },
                                        child: Text(
                                          "Add Record",
                                          style: TextStyle(fontSize: 16.2, fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            padding: EdgeInsets.zero,
                            child: FormBuilder(
                              key: _formKey,
                              child: Column(
                                children: [
                                  ExpansionTile(
                                    collapsedIconColor: Colors.black,
                                    iconColor: Colors.black,
                                    initiallyExpanded: true,
                                    onExpansionChanged: (val) {
                                      setState(() {
                                        contact = val;
                                      });
                                    },
                                    title: Text(
                                      "Contact Information",
                                      style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                                    ),
                                    children: [
                                      const Divider(
                                        color: Colors.black38,
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(14.4),
                                        margin: EdgeInsets.all(14.4),
                                        decoration: BoxDecoration(
                                          color: Color(0xffF3F3F3),
                                          borderRadius: BorderRadius.circular(7.2),
                                        ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.stretch,
                                          children: [
                                            Text(
                                              "First Name",
                                              style: TextStyle(fontSize: 10.8, color: const Color(0xFF4F4F4F)),
                                            ),
                                            Column(
                                              children: [
                                                TextField(
                                                  onChanged: (value) {
                                                    setState(() {
                                                      (value.isEmpty) ? fNameError = true : fNameError = false;
                                                    });
                                                  },
                                                  textInputAction: TextInputAction.next,
                                                  keyboardType: TextInputType.name,
                                                  focusNode: _focusNodeFName,
                                                  controller: _firstName,
                                                  decoration: InputDecoration(
                                                    hintText: "Please Enter First Name",
                                                    suffixIcon: (fNameError == true)
                                                        ? Padding(
                                                            padding: EdgeInsets.only(left: 28.8),
                                                            child: Icon(
                                                              Icons.warning_amber_outlined,
                                                              color: Colors.red,
                                                              size: 18,
                                                            ),
                                                          )
                                                        : const SizedBox(),
                                                  ),
                                                ),
                                                (fNameError == true)
                                                    ? Padding(
                                                        padding: EdgeInsets.only(bottom: 7.2),
                                                        child: Row(
                                                          children: [
                                                            Container(
                                                              decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(7.2),
                                                                color: const Color(0x1FEB5757),
                                                              ),
                                                              child: Padding(
                                                                padding: EdgeInsets.all(3.6),
                                                                child: Text(
                                                                  "Please enter First Name!",
                                                                  style: TextStyle(
                                                                      color: const Color(0xffEB5757), fontSize: 13.68),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    : const SizedBox(),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 14.64,
                                            ),
                                            Text(
                                              "Middle Name",
                                              style: TextStyle(fontSize: 10.8, color: const Color(0xFF4F4F4F)),
                                            ),
                                            SizedBox(
                                              height: 0.732,
                                            ),
                                            TextField(
                                              textInputAction: TextInputAction.next,
                                              keyboardType: TextInputType.name,
                                              controller: _middleName,
                                              decoration: InputDecoration(
                                                hintText: "Please Enter Middle Name",
                                              ),
                                            ),
                                            SizedBox(
                                              height: 14.64,
                                            ),
                                            Text(
                                              "Last Name",
                                              style: TextStyle(fontSize: 10.8, color: const Color(0xFF4F4F4F)),
                                            ),
                                            SizedBox(
                                              height: 0.732,
                                            ),
                                            Column(
                                              children: [
                                                TextField(
                                                  onChanged: (value) {
                                                    setState(() {
                                                      (value.isEmpty) ? lNameError = true : lNameError = false;
                                                    });
                                                  },
                                                  textInputAction: TextInputAction.done,
                                                  keyboardType: TextInputType.name,
                                                  focusNode: _focusNodeLName,
                                                  controller: _lastName,
                                                  decoration: InputDecoration(
                                                    hintText: "Please Enter Last Name",
                                                    suffixIcon: (lNameError == true)
                                                        ? Padding(
                                                            padding: EdgeInsets.only(left: 28.8),
                                                            child: Icon(
                                                              Icons.warning_amber_outlined,
                                                              color: Colors.red,
                                                              size: 18,
                                                            ),
                                                          )
                                                        : const SizedBox(),
                                                  ),
                                                ),
                                                (lNameError == true)
                                                    ? Padding(
                                                        padding: EdgeInsets.only(bottom: 7.2),
                                                        child: Row(
                                                          children: [
                                                            Container(
                                                              decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(7.2),
                                                                color: const Color(0x1FEB5757),
                                                              ),
                                                              child: Padding(
                                                                padding: EdgeInsets.all(3.6),
                                                                child: Text(
                                                                  "Please enter Last Name!",
                                                                  style: TextStyle(
                                                                      color: const Color(0xffEB5757), fontSize: 13.68),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    : const SizedBox(),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 14.64,
                                            ),
                                            Text(
                                              "Email",
                                              style: TextStyle(fontSize: 10.8, color: const Color(0xFF4F4F4F)),
                                            ),
                                            Column(
                                              children: [
                                                TextField(
                                                  onChanged: (value) {
                                                    setState(() {
                                                      (value.isEmpty) ? emailError = true : emailError = false;
                                                    });
                                                  },
                                                  textInputAction: TextInputAction.next,
                                                  keyboardType: TextInputType.name,
                                                  focusNode: _focusNodeEmail,
                                                  controller: _email,
                                                  decoration: InputDecoration(
                                                    hintText: "Please Enter Email",
                                                    suffixIcon: (emailError == true)
                                                        ? Padding(
                                                            padding: EdgeInsets.only(left: 28.8),
                                                            child: Icon(
                                                              Icons.warning_amber_outlined,
                                                              color: Colors.red,
                                                              size: 18,
                                                            ),
                                                          )
                                                        : const SizedBox(),
                                                  ),
                                                ),
                                                (emailError == true)
                                                    ? Padding(
                                                        padding: EdgeInsets.only(bottom: 7.2),
                                                        child: Row(
                                                          children: [
                                                            Container(
                                                              decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(7.2),
                                                                color: const Color(0x1FEB5757),
                                                              ),
                                                              child: Padding(
                                                                padding: EdgeInsets.all(3.6),
                                                                child: Text(
                                                                  (_email.text != "" &&
                                                                          !Utils().validateEmail(_email.text))
                                                                      ? "Please Enter Valid Email Address. "
                                                                      : "Please Enter an Email Address",
                                                                  style: TextStyle(
                                                                      color: Color(0xffEB5757), fontSize: 13.68),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    : const SizedBox(),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 14.64,
                                            ),
                                            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                                              Expanded(
                                                flex: 2,
                                                child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        "Home Phone",
                                                        style:
                                                            TextStyle(fontSize: 10.8, color: const Color(0xFF4F4F4F)),
                                                      ),
                                                      SizedBox(
                                                        height: 0.732,
                                                      ),
                                                      Column(
                                                        children: [
                                                          MaskedTextField(
                                                            maxLength: 14,
                                                            keyboardType: TextInputType.number,
                                                            onChange: (val) {},
                                                            mask: '(xxx) xxx-xxxx',
                                                            textFieldController: _homePhone,
                                                            inputDecoration: InputDecoration(
                                                              hintText: "Please Enter Homne Phone",
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 14.64,
                                                      ),
                                                    ]),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Expanded(
                                                flex: 2,
                                                child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        "Cell Phone",
                                                        style: TextStyle(
                                                          fontSize: 10.8,
                                                          color: const Color(0xFF4F4F4F),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 0.732,
                                                      ),
                                                      Column(
                                                        children: [
                                                          MaskedTextField(
                                                            maxLength: 14,
                                                            keyboardType: TextInputType.number,
                                                            onChange: (val) {},
                                                            mask: '(xxx) xxx-xxxx',
                                                            textFieldController: _cellPhone,
                                                            inputDecoration: InputDecoration(
                                                              hintText: "Please Enter Cell Phone",
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 14.64,
                                                      ),
                                                    ]),
                                              ),
                                            ]),
                                            Text(
                                              "Password",
                                              style: TextStyle(fontSize: 10.8, color: const Color(0xFF4F4F4F)),
                                            ),
                                            Column(
                                              children: [
                                                TextField(
                                                  onChanged: (value) {
                                                    setState(() {
                                                      (value.isEmpty) ? passwordError = true : passwordError = false;
                                                    });
                                                  },
                                                  textInputAction: TextInputAction.next,
                                                  keyboardType: TextInputType.text,
                                                  obscureText: true,
                                                  focusNode: _focusNodePassword,
                                                  controller: _password,
                                                  decoration: InputDecoration(
                                                    hintText: "Please enter Password",
                                                    suffixIcon: (passwordError == true)
                                                        ? Padding(
                                                            padding: EdgeInsets.only(left: 28.8),
                                                            child: Icon(
                                                              Icons.warning_amber_outlined,
                                                              color: Colors.red,
                                                              size: 18,
                                                            ),
                                                          )
                                                        : const SizedBox(),
                                                  ),
                                                ),
                                                (passwordError == true)
                                                    ? Padding(
                                                        padding: EdgeInsets.only(bottom: 7.2),
                                                        child: Row(
                                                          children: [
                                                            Container(
                                                              decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(7.2),
                                                                color: const Color(0x1FEB5757),
                                                              ),
                                                              child: Padding(
                                                                padding: EdgeInsets.all(3.6),
                                                                child: Text(
                                                                  "Please enter Confirm Password!",
                                                                  style: TextStyle(
                                                                      color: const Color(0xffEB5757), fontSize: 13.68),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    : const SizedBox(),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 14.64,
                                            ),
                                            Text(
                                              "Confirm Password",
                                              style: TextStyle(fontSize: 10.8, color: const Color(0xFF4F4F4F)),
                                            ),
                                            Column(
                                              children: [
                                                TextField(
                                                  onChanged: (value) {
                                                    setState(() {
                                                      (value.isEmpty)
                                                          ? confirmPasswordError = true
                                                          : confirmPasswordError = false;
                                                      if (_password.text != _confirmPassword.text) {
                                                        confirmPasswordError = true;
                                                      } else {
                                                        confirmPasswordError = false;
                                                      }
                                                    });
                                                  },
                                                  textInputAction: TextInputAction.done,
                                                  keyboardType: TextInputType.text,
                                                  obscureText: true,
                                                  focusNode: _focusNodeConfirmPassword,
                                                  controller: _confirmPassword,
                                                  decoration: InputDecoration(
                                                    hintText: "Please enter Password",
                                                    suffixIcon: (confirmPasswordError == true)
                                                        ? Padding(
                                                            padding: EdgeInsets.only(left: 28.8),
                                                            child: Icon(
                                                              Icons.warning_amber_outlined,
                                                              color: Colors.red,
                                                              size: 18,
                                                            ),
                                                          )
                                                        : const SizedBox(),
                                                  ),
                                                ),
                                                (confirmPasswordError == true)
                                                    ? Padding(
                                                        padding: EdgeInsets.only(bottom: 7.2),
                                                        child: Row(
                                                          children: [
                                                            Container(
                                                              decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(7.2),
                                                                color: const Color(0x1FEB5757),
                                                              ),
                                                              child: Padding(
                                                                padding: EdgeInsets.all(3.6),
                                                                child: (_password.text != _confirmPassword.text)
                                                                    ? Text("Please enter Same Password!")
                                                                    : Text(
                                                                        "Please enter Confirm Password!",
                                                                        style: TextStyle(
                                                                            color: const Color(0xffEB5757),
                                                                            fontSize: 13.68),
                                                                      ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    : const SizedBox(),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 14.64,
                                            ),
                                            Text(
                                              "Date of Birth",
                                              style: TextStyle(fontSize: 10.8, color: const Color(0xFF4F4F4F)),
                                            ),
                                            ElevatedButton(
                                              style: ButtonStyle(
                                                  backgroundColor: MaterialStateProperty.all(Colors.grey[500]),
                                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(5.0),
                                                      side: BorderSide(
                                                        color: (birthError != null && birthError == true)
                                                            ? Colors.red
                                                            : Colors.grey,
                                                      ),
                                                    ),
                                                  )),
                                              onPressed: () => _selectDate(context),
                                              child: (picked != null)
                                                  ? Text(Utils().changeDateFormat(selectedDate, "dd MMMM yyyy"))
                                                  : Text("Select Birth Date"),
                                            ),
                                            (birthError == true)
                                                ? Padding(
                                                    padding: EdgeInsets.only(bottom: 7.2),
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(7.2),
                                                            color: const Color(0x1FEB5757),
                                                          ),
                                                          child: Padding(
                                                            padding: EdgeInsets.all(3.6),
                                                            child: Text(
                                                              "Please enter Birth Date!",
                                                              style: TextStyle(
                                                                  color: const Color(0xffEB5757), fontSize: 13.68),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                : const SizedBox(),
                                            SizedBox(
                                              height: 14.64,
                                            ),
                                            Text(
                                              "Gender",
                                              style: TextStyle(fontSize: 10.8, color: const Color(0xFF4F4F4F)),
                                            ),
                                            SizedBox(
                                              height: 7.32,
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                  border: (gender)
                                                      ? Border.all(color: Colors.red)
                                                      : Border.all(color: Colors.transparent),
                                                  borderRadius: BorderRadius.circular(3.6)),
                                              child: Row(
                                                children: <Widget>[
                                                  Expanded(
                                                    child: ListTile(
                                                      title: const Text('Male'),
                                                      leading: Radio<GenderStatus>(
                                                        value: GenderStatus.male,
                                                        groupValue: _genderStatus,
                                                        onChanged: (GenderStatus? value) {
                                                          setState(() {
                                                            _genderStatus = value;
                                                          });
                                                          if (_genderStatus != null) {
                                                            setState(() {
                                                              gender = false;
                                                            });
                                                          }
                                                          if (picked != null &&
                                                              _genderStatus != null &&
                                                              _selectedYear != null) {
                                                            var formData = UserWiseGroupRequest(
                                                              Utils().nullSafeInt(loginModel!.bkms_id),
                                                              Utils().nullSafeString(_selectedYear!.id.toString()),
                                                              Utils().changeDateFormat(
                                                                  selectedDate, Constant.defaultDateFormatWeb),
                                                              _genderStatus!,
                                                            );
                                                            BlocProvider.of<AddNewRecordBloc>(context).add(
                                                              AddNewRecordEvent.userWiseGroup(
                                                                formData,
                                                                Utils()
                                                                    .nullSafeString(loginModel!.access_token)
                                                                    .toString(),
                                                                context,
                                                              ),
                                                            );
                                                          }
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: ListTile(
                                                      title: const Text('Female'),
                                                      leading: Radio<GenderStatus>(
                                                        value: GenderStatus.female,
                                                        groupValue: _genderStatus,
                                                        onChanged: (GenderStatus? value) {
                                                          setState(() {
                                                            _genderStatus = value;
                                                          });
                                                          if (_genderStatus != null) {
                                                            setState(() {
                                                              gender = false;
                                                            });
                                                          }
                                                          if (picked != null &&
                                                              _genderStatus != null &&
                                                              _selectedYear != null) {
                                                            var formData = UserWiseGroupRequest(
                                                              Utils().nullSafeInt(loginModel!.bkms_id),
                                                              Utils().nullSafeString(_selectedYear!.id.toString()),
                                                              Utils().changeDateFormat(
                                                                  selectedDate, Constant.defaultDateFormatWeb),
                                                              _genderStatus!,
                                                            );
                                                            BlocProvider.of<AddNewRecordBloc>(context).add(
                                                              AddNewRecordEvent.userWiseGroup(
                                                                formData,
                                                                Utils()
                                                                    .nullSafeString(loginModel!.access_token)
                                                                    .toString(),
                                                                context,
                                                              ),
                                                            );
                                                          }
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            (gender)
                                                ? Padding(
                                                    padding: EdgeInsets.only(bottom: 7.2),
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(7.2),
                                                            color: const Color(0x1FEB5757),
                                                          ),
                                                          child: Padding(
                                                            padding: EdgeInsets.all(3.6),
                                                            child: Text(
                                                              "Please Select Gender!",
                                                              style: TextStyle(
                                                                  color: const Color(0xffEB5757), fontSize: 13.68),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                : SizedBox(),
                                            SizedBox(
                                              height: 14.64,
                                            ),
                                            Text(
                                              "Region",
                                              style: TextStyle(fontSize: 10.8, color: const Color(0xFF4F4F4F)),
                                            ),
                                            SizedBox(
                                              height: 7.32,
                                            ),
                                            _regionsItems != null
                                                ? Container(
                                                    height: 35,
                                                    decoration: BoxDecoration(
                                                        border: (chooseRegion)
                                                            ? Border.all(color: Colors.red)
                                                            : Border.all(color: Colors.transparent),
                                                        borderRadius: BorderRadius.circular(3.6)),
                                                    child: DropdownButtonHideUnderline(
                                                      child: DropdownButton(
                                                        hint: Text(
                                                          ' Choose Region',
                                                          style: TextStyle(
                                                              color: (chooseRegion) ? Colors.red : Colors.grey[650]),
                                                        ),
                                                        value: _selectedRegion,
                                                        onChanged: (newValue) {
                                                          setState(() {
                                                            _selectedRegion = newValue as Region;

                                                            //FOR FILL REGION WISE CENTERS
                                                            _centersItems = [];
                                                            _selectedCenter = null;

                                                            for (int v = 0; v < _regionWiseCentersItems.length; v++) {
                                                              if (_selectedRegion!.id ==
                                                                  int.parse(_regionWiseCentersItems[v]!.RegionId)) {
                                                                _centersItems!.add(_regionWiseCentersItems[v]!);
                                                              }
                                                            }
                                                            if (_selectedRegion != null) {
                                                              chooseRegion = false;
                                                            }
                                                          });
                                                        },
                                                        items: _regionsItems.map((regionItem) {
                                                          return DropdownMenuItem(
                                                            child: Text(" " + regionItem!.RegionName.trim(),
                                                                overflow: TextOverflow.ellipsis,
                                                                style: TextStyle(
                                                                  fontSize: 14.4,
                                                                )),
                                                            value: regionItem,
                                                          );
                                                        }).toList(),
                                                      ),
                                                    ),
                                                  )
                                                : const SizedBox(),
                                            SizedBox(
                                              height: 14.64,
                                            ),
                                            _centersItems != null
                                                ? Text(
                                                    "Center",
                                                    style: TextStyle(fontSize: 10.8, color: Color(0xFF4F4F4F)),
                                                  )
                                                : const SizedBox(),
                                            SizedBox(
                                              height: 7.32,
                                            ),
                                            _centersItems != null
                                                ? Container(
                                                    height: 35,
                                                    decoration: BoxDecoration(
                                                      border: (chooseCenter)
                                                          ? Border.all(color: Colors.red)
                                                          : Border.all(color: Colors.transparent),
                                                      borderRadius: BorderRadius.circular(
                                                        3.6,
                                                      ),
                                                    ),
                                                    child: DropdownButtonHideUnderline(
                                                      child: DropdownButton(
                                                        hint: Text(
                                                          ' Choose Center',
                                                          style: TextStyle(
                                                              color: (chooseCenter) ? Colors.red : Colors.grey[650]),
                                                        ),
                                                        value: _selectedCenter,
                                                        onChanged: (newValue) {
                                                          setState(() {
                                                            _selectedCenter = newValue as CenterUP;
                                                            if (_selectedCenter != null) {
                                                              chooseCenter = false;
                                                            }
                                                          });
                                                        },
                                                        items: _centersItems!.map((centerItem) {
                                                          return DropdownMenuItem(
                                                            child: Text(" " + centerItem!.CenterName.trim(),
                                                                overflow: TextOverflow.ellipsis,
                                                                style: TextStyle(
                                                                  fontSize: 14.4,
                                                                )),
                                                            value: centerItem,
                                                          );
                                                        }).toList(),
                                                      ),
                                                    ),
                                                  )
                                                : SizedBox(),
                                            (chooseCenter && _selectedRegion != null)
                                                ? Padding(
                                                    padding: EdgeInsets.only(bottom: 7.2),
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(7.2),
                                                            color: const Color(0x1FEB5757),
                                                          ),
                                                          child: Padding(
                                                            padding: EdgeInsets.all(3.6),
                                                            child: Text(
                                                              "Please enter center!",
                                                              style: TextStyle(
                                                                  color: const Color(0xffEB5757), fontSize: 13.68),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                : const SizedBox(),
                                            SizedBox(
                                              height: 7.2,
                                            ),
                                            Text(
                                              "Apartment",
                                              style: TextStyle(fontSize: 10.8, color: const Color(0xFF4F4F4F)),
                                            ),
                                            SizedBox(
                                              height: 0.732,
                                            ),
                                            Column(
                                              children: [
                                                TextField(
                                                  onChanged: (value) {},
                                                  textInputAction: TextInputAction.next,
                                                  keyboardType: TextInputType.streetAddress,
                                                  controller: _apartment,
                                                  decoration: InputDecoration(
                                                    hintText: "Please Enter Apartment",
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 14.64,
                                            ),
                                            Text(
                                              "Address",
                                              style: TextStyle(fontSize: 10.8, color: const Color(0xFF4F4F4F)),
                                            ),
                                            SizedBox(
                                              height: 0.732,
                                            ),
                                            Column(
                                              children: [
                                                TextField(
                                                  focusNode: _focusNodeHomeAddress,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      (value.isEmpty)
                                                          ? homeAddressError = true
                                                          : homeAddressError = false;
                                                    });
                                                  },
                                                  textInputAction: TextInputAction.next,
                                                  keyboardType: TextInputType.streetAddress,
                                                  controller: _homeAddress,
                                                  decoration: InputDecoration(
                                                    hintText: "Please Enter Home Address",
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 14.64,
                                            ),
                                            Text(
                                              "Country",
                                              style: TextStyle(fontSize: 10.8, color: const Color(0xFF4F4F4F)),
                                            ),
                                            SizedBox(
                                              height: 7.32,
                                            ),
                                            _countryItems != null
                                                ? DropdownButtonHideUnderline(
                                                    child: DropdownButton(
                                                      hint: Text(
                                                        ' Choose Country',
                                                        style: TextStyle(color: Colors.grey[650]),
                                                      ),
                                                      value: _selectedCountry,
                                                      onChanged: (newValue) {
                                                        setState(() {
                                                          _selectedCountry = newValue as Country;

                                                          //FOR FILL COUNTRY WISE STATES
                                                          _stateItems = [];
                                                          _selectedState = null;

                                                          if (_countryWiseStateItems != null) {
                                                            for (int v = 0; v < _countryWiseStateItems!.length; v++) {
                                                              if (_selectedCountry!.id ==
                                                                  int.parse(_countryWiseStateItems![v]!.country_id)) {
                                                                _stateItems.add(_countryWiseStateItems![v]!);
                                                              }
                                                            }
                                                          }
                                                          if (_selectedCountry != null) {
                                                            chooseCountry = false;
                                                          }
                                                        });
                                                      },
                                                      items: _countryItems.map((countryItem) {
                                                        return DropdownMenuItem(
                                                          child: Text(" " + countryItem!.country_name,
                                                              overflow: TextOverflow.ellipsis,
                                                              style: TextStyle(
                                                                fontSize: 14.4,
                                                              )),
                                                          value: countryItem,
                                                        );
                                                      }).toList(),
                                                    ),
                                                  )
                                                : const SizedBox(),
                                            SizedBox(
                                              height: 14.64,
                                            ),
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                (_stateItems != null)
                                                    ? Expanded(
                                                        child: Column(
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            (_stateItems != null)
                                                                ? Text(
                                                                    "State",
                                                                    style: TextStyle(
                                                                        fontSize: 10.8, color: const Color(0xFF4F4F4F)),
                                                                  )
                                                                : SizedBox(),
                                                            SizedBox(
                                                              height: 7.32,
                                                            ),
                                                            _stateItems != null
                                                                ? DropdownButtonHideUnderline(
                                                                    child: DropdownButton(
                                                                      hint: Text(
                                                                        ' Choose State',
                                                                        style: TextStyle(color: Colors.grey[650]),
                                                                      ),
                                                                      value: _selectedState,
                                                                      onChanged: (newValue) {
                                                                        setState(
                                                                          () {
                                                                            _selectedState = newValue as StateUP;
                                                                            if (_selectedState != null) {
                                                                              chooseState = false;
                                                                            }
                                                                          },
                                                                        );
                                                                      },
                                                                      items: _stateItems.map((stateItem) {
                                                                        return DropdownMenuItem(
                                                                          child: Text(" " + stateItem!.name.trim(),
                                                                              overflow: TextOverflow.ellipsis,
                                                                              style: TextStyle(
                                                                                fontSize: 10.8,
                                                                              )),
                                                                          value: stateItem,
                                                                        );
                                                                      }).toList(),
                                                                    ),
                                                                  )
                                                                : Container(
                                                                    height: 60,
                                                                  ),
                                                          ],
                                                        ),
                                                      )
                                                    : SizedBox(),
                                                (_stateItems != null)
                                                    ? SizedBox(
                                                        width: 54,
                                                      )
                                                    : SizedBox(),
                                                Expanded(
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        "Zip/Postal Code",
                                                        style:
                                                            TextStyle(fontSize: 10.8, color: const Color(0xFF4F4F4F)),
                                                      ),
                                                      Column(
                                                        children: [
                                                          TextField(
                                                            onChanged: (value) {
                                                              setState(
                                                                () {
                                                                  (value.isEmpty)
                                                                      ? zipCodeError = true
                                                                      : zipCodeError = false;
                                                                },
                                                              );
                                                            },
                                                            textInputAction: TextInputAction.done,
                                                            controller: _zipCode,
                                                            decoration: InputDecoration(
                                                              suffixIcon: (zipCodeError == true)
                                                                  ? Padding(
                                                                      padding: EdgeInsets.only(left: 28.8),
                                                                      child: Icon(
                                                                        Icons.warning_amber_outlined,
                                                                        color: Colors.red,
                                                                        size: 18,
                                                                      ),
                                                                    )
                                                                  : SizedBox(),
                                                            ),
                                                            focusNode: _focusNodeZipCode,
                                                          ),
                                                          (zipCodeError == true)
                                                              ? Padding(
                                                                  padding: EdgeInsets.only(bottom: 7.2),
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
                                                                            (_zipCode.text != "")
                                                                                ? "Please enter valid Zip Code!. "
                                                                                : "Please enter Zip Code!. ",
                                                                            style: TextStyle(
                                                                                color: Color(0xffEB5757),
                                                                                fontSize: 10.8),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                )
                                                              : SizedBox(),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 14.64,
                                            ),
                                            Text(
                                              "City",
                                              style: TextStyle(fontSize: 10.8, color: const Color(0xFF4F4F4F)),
                                            ),
                                            SizedBox(
                                              height: 0.732,
                                            ),
                                            Column(
                                              children: [
                                                TextField(
                                                  onChanged: (value) {
                                                    setState(() {
                                                      (value.isEmpty) ? cityError = true : cityError = false;
                                                    });
                                                  },
                                                  textInputAction: TextInputAction.next,
                                                  keyboardType: TextInputType.text,
                                                  controller: _city,
                                                  focusNode: _focusNodeCity,
                                                  decoration: InputDecoration(
                                                    hintText: "Please Enter City",
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 14.64,
                                            ),
                                            Text(
                                              "School Year",
                                              style: TextStyle(fontSize: 10.8, color: const Color(0xFF4F4F4F)),
                                            ),
                                            SizedBox(
                                              height: 7.32,
                                            ),
                                            _schoolYearsItems != null
                                                ? Container(
                                                    //    height: 35,
                                                    decoration: BoxDecoration(
                                                      border: (chooseYear)
                                                          ? Border.all(color: Colors.red)
                                                          : Border.all(color: Colors.transparent),
                                                      borderRadius: BorderRadius.circular(3.6),
                                                    ),
                                                    child: FormBuilderDropdown(
                                                      name: "schoolKey",
                                                      hint: Text(
                                                        ' Choose School Year',
                                                        style: TextStyle(
                                                            color: (chooseYear) ? Colors.red : Colors.grey[650]),
                                                      ),
                                                      //   value: _selectedYear,
                                                      onChanged: (newValue) {
                                                        setState(
                                                          () {
                                                            _selectedYear = newValue as SchoolYear;
                                                            if (_selectedYear != null) {
                                                              chooseYear = false;
                                                            }
                                                          },
                                                        );
                                                        if (picked != null &&
                                                            _genderStatus != null &&
                                                            _selectedYear != null) {
                                                          var formData = UserWiseGroupRequest(
                                                            Utils().nullSafeInt(loginModel!.bkms_id),
                                                            Utils().nullSafeString(_selectedYear!.id.toString()),
                                                            Utils().changeDateFormat(
                                                                selectedDate, Constant.defaultDateFormatWeb),
                                                            _genderStatus!,
                                                          );
                                                          BlocProvider.of<AddNewRecordBloc>(context).add(
                                                            AddNewRecordEvent.userWiseGroup(
                                                              formData,
                                                              Utils()
                                                                  .nullSafeString(loginModel!.access_token)
                                                                  .toString(),
                                                              context,
                                                            ),
                                                          );
                                                        }
                                                      },
                                                      items: _schoolYearsItems.map((school) {
                                                        return DropdownMenuItem(
                                                          child: Text(" " + school!.school_display_name,
                                                              overflow: TextOverflow.ellipsis,
                                                              style: TextStyle(
                                                                fontSize: 14.4,
                                                              )),
                                                          value: school,
                                                        );
                                                      }).toList(),
                                                    ),
                                                  )
                                                : Container(height: 60),
                                            SizedBox(
                                              height: 14.64,
                                            ),
                                            (viewWingGroup)
                                                ? Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                                                    Text(
                                                      "Wing",
                                                      style: TextStyle(fontSize: 10.8, color: Color(0xFF4F4F4F)),
                                                    ),
                                                    SizedBox(
                                                      height: 7.32,
                                                    ),
                                                    Container(
                                                      height: 35,
                                                      child: DropdownButtonHideUnderline(
                                                        child: DropdownButton(
                                                          hint: (userWing != null)
                                                              ? Text(userWing!)
                                                              : Text(
                                                                  ' Choose Wing',
                                                                  style: TextStyle(color: Colors.grey[650]),
                                                                ),
                                                          value: "select",
                                                          onChanged: null,
                                                          items: [],
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 14.64,
                                                    ),
                                                    Text(
                                                      "Group",
                                                      style: TextStyle(fontSize: 10.8, color: Color(0xFF4F4F4F)),
                                                    ),
                                                    SizedBox(
                                                      height: 7.32,
                                                    ),
                                                    Container(
                                                      height: 35,
                                                      child: DropdownButtonHideUnderline(
                                                        child: DropdownButton(
                                                          hint: (userGroup != null)
                                                              ? Text(userGroup!)
                                                              : Text(
                                                                  ' Choose Group',
                                                                  style: TextStyle(color: Colors.grey[650]),
                                                                ),
                                                          value: "select",
                                                          onChanged: null,
                                                          items: [],
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 14.64,
                                                    ),
                                                  ])
                                                : (loadingStatus == LoadingStatus.InProgress)
                                                    ? Center(
                                                        child: Padding(
                                                          padding: const EdgeInsets.all(15.0),
                                                          child: CircularProgressIndicator(),
                                                        ),
                                                      )
                                                    : SizedBox(),
                                            Text(
                                              "Major/Expected Major",
                                              style: TextStyle(fontSize: 10.8, color: const Color(0xFF4F4F4F)),
                                            ),
                                            SizedBox(
                                              height: 0.732,
                                            ),
                                            TextField(
                                              textInputAction: TextInputAction.done,
                                              keyboardType: TextInputType.text,
                                              controller: _major,
                                              decoration: InputDecoration(
                                                hintText: "Enter Major/Expected Major",
                                              ),
                                            ),
                                            SizedBox(
                                              height: 14.64,
                                            ),
                                            Text(
                                              "Undergraduate School",
                                              style: TextStyle(fontSize: 10.8, color: const Color(0xFF4F4F4F)),
                                            ),
                                            SizedBox(
                                              height: 0.732,
                                            ),
                                            TextField(
                                              textInputAction: TextInputAction.done,
                                              keyboardType: TextInputType.text,
                                              controller: _undergraduateSchool,
                                              decoration: InputDecoration(
                                                hintText: "Enter Undergraduate School",
                                              ),
                                            ),
                                            SizedBox(
                                              height: 14.64,
                                            ),
                                            Text(
                                              "Career Interest",
                                              style: TextStyle(fontSize: 10.8, color: const Color(0xFF4F4F4F)),
                                            ),
                                            SizedBox(
                                              height: 0.732,
                                            ),
                                            TextField(
                                              textInputAction: TextInputAction.done,
                                              keyboardType: TextInputType.text,
                                              controller: _careerInterest,
                                              decoration: InputDecoration(
                                                hintText: "Enter Career Interest",
                                              ),
                                            ),
                                            SizedBox(
                                              height: 14.64,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    collapsedIconColor: Colors.black,
                                    iconColor: Colors.black,
                                    initiallyExpanded: true,
                                    onExpansionChanged: (val) {
                                      setState(() {
                                        satsang = val;
                                      });
                                    },
                                    title: Text(
                                      "Family Contact Information",
                                      style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                                    ),
                                    children: [
                                      const Divider(
                                        color: Colors.black38,
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(14.4),
                                        margin: EdgeInsets.all(14.4),
                                        decoration: BoxDecoration(
                                          color: Color(0xffF3F3F3),
                                          borderRadius: BorderRadius.circular(7.2),
                                        ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.stretch,
                                          children: [
                                            Text(
                                              "FATHER",
                                              style: TextStyle(
                                                fontSize: 20,
                                              ),
                                            ),
                                            Divider(
                                              color: Colors.black,
                                            ),
                                            Text(
                                              "Name",
                                              style: TextStyle(fontSize: 10.8, color: const Color(0xFF4F4F4F)),
                                            ),
                                            SizedBox(
                                              height: 0.732,
                                            ),
                                            TextField(
                                              textInputAction: TextInputAction.done,
                                              keyboardType: TextInputType.text,
                                              controller: _fatherName,
                                              decoration: InputDecoration(
                                                hintText: "Enter Father Name",
                                              ),
                                            ),
                                            SizedBox(
                                              height: 14.64,
                                            ),
                                            Text(
                                              "Email",
                                              style: TextStyle(fontSize: 10.8, color: const Color(0xFF4F4F4F)),
                                            ),
                                            SizedBox(
                                              height: 0.732,
                                            ),
                                            TextField(
                                              onChanged: (value) {
                                                setState(() {
                                                  (value.isEmpty) ? fatherEmailError = true : fatherEmailError = false;
                                                });
                                              },
                                              textInputAction: TextInputAction.done,
                                              keyboardType: TextInputType.text,
                                              controller: _fatherEmail,
                                              focusNode: _focusNodeFatherEmail,
                                              decoration: InputDecoration(
                                                hintText: "Enter Father Email",
                                                suffixIcon: (fatherEmailError == true)
                                                    ? Padding(
                                                        padding: EdgeInsets.only(left: 28.8),
                                                        child: Icon(
                                                          Icons.warning_amber_outlined,
                                                          color: Colors.red,
                                                          size: 18,
                                                        ),
                                                      )
                                                    : const SizedBox(),
                                              ),
                                            ),
                                            (fatherEmailError == true)
                                                ? Padding(
                                                    padding: EdgeInsets.only(bottom: 7.2),
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(7.2),
                                                            color: const Color(0x1FEB5757),
                                                          ),
                                                          child: Padding(
                                                            padding: EdgeInsets.all(3.6),
                                                            child: Text(
                                                              (_fatherEmail.text != "" &&
                                                                      !Utils().validateEmail(_fatherEmail.text))
                                                                  ? "Please Enter Valid Email Address!"
                                                                  : "Please Enter an Email Address!",
                                                              style:
                                                                  TextStyle(color: Color(0xffEB5757), fontSize: 13.68),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                : const SizedBox(),
                                            SizedBox(
                                              height: 14.64,
                                            ),
                                            Text(
                                              "Cell Phone",
                                              style: TextStyle(fontSize: 10.8, color: const Color(0xFF4F4F4F)),
                                            ),
                                            SizedBox(
                                              height: 0.732,
                                            ),
                                            MaskedTextField(
                                              maxLength: 14,
                                              keyboardType: TextInputType.number,
                                              onChange: (val) {},
                                              mask: '(xxx) xxx-xxxx',
                                              textFieldController: _fatherPhone,
                                              inputDecoration: InputDecoration(
                                                hintText: "Enter Father Cell Phone",
                                              ),
                                            ),
                                            SizedBox(
                                              height: 14.64,
                                            ),
                                            Text(
                                              "MOTHER",
                                              style: TextStyle(
                                                fontSize: 20,
                                              ),
                                            ),
                                            Divider(
                                              color: Colors.black,
                                            ),
                                            Text(
                                              "Name",
                                              style: TextStyle(fontSize: 10.8, color: const Color(0xFF4F4F4F)),
                                            ),
                                            SizedBox(
                                              height: 0.732,
                                            ),
                                            TextField(
                                              textInputAction: TextInputAction.done,
                                              keyboardType: TextInputType.text,
                                              controller: _motherName,
                                              decoration: InputDecoration(
                                                hintText: "Enter Mother Name",
                                              ),
                                            ),
                                            SizedBox(
                                              height: 14.64,
                                            ),
                                            Text(
                                              "Email",
                                              style: TextStyle(fontSize: 10.8, color: const Color(0xFF4F4F4F)),
                                            ),
                                            SizedBox(
                                              height: 0.732,
                                            ),
                                            TextField(
                                              onChanged: (value) {
                                                setState(() {
                                                  (value.isEmpty) ? motherEmailError = true : motherEmailError = false;
                                                });
                                              },
                                              textInputAction: TextInputAction.done,
                                              keyboardType: TextInputType.text,
                                              controller: _motherEmail,
                                              focusNode: _focusNodeMotherEmail,
                                              decoration: InputDecoration(
                                                hintText: "Enter Mother Email",
                                                suffixIcon: (motherEmailError == true)
                                                    ? Padding(
                                                        padding: EdgeInsets.only(left: 28.8),
                                                        child: Icon(
                                                          Icons.warning_amber_outlined,
                                                          color: Colors.red,
                                                          size: 18,
                                                        ),
                                                      )
                                                    : const SizedBox(),
                                              ),
                                            ),
                                            (motherEmailError == true)
                                                ? Padding(
                                                    padding: EdgeInsets.only(bottom: 7.2),
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(7.2),
                                                            color: const Color(0x1FEB5757),
                                                          ),
                                                          child: Padding(
                                                            padding: EdgeInsets.all(3.6),
                                                            child: Text(
                                                              (_motherEmail.text != "" &&
                                                                      !Utils().validateEmail(_motherEmail.text))
                                                                  ? "Please Enter Valid Email Address!"
                                                                  : "Please Enter an Email Address!",
                                                              style:
                                                                  TextStyle(color: Color(0xffEB5757), fontSize: 13.68),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                : const SizedBox(),
                                            SizedBox(
                                              height: 14.64,
                                            ),
                                            Text(
                                              "Cell Phone",
                                              style: TextStyle(fontSize: 10.8, color: const Color(0xFF4F4F4F)),
                                            ),
                                            SizedBox(
                                              height: 0.732,
                                            ),
                                            MaskedTextField(
                                              maxLength: 14,
                                              keyboardType: TextInputType.number,
                                              onChange: (val) {},
                                              mask: '(xxx) xxx-xxxx',
                                              textFieldController: _motherPhone,
                                              inputDecoration: InputDecoration(
                                                hintText: "Enter Mother Cell Phone",
                                              ),
                                            ),
                                            SizedBox(
                                              height: 14.64,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    collapsedIconColor: Colors.black,
                                    iconColor: Colors.black,
                                    initiallyExpanded: true,
                                    onExpansionChanged: (val) {
                                      setState(() {
                                        satsang = val;
                                      });
                                    },
                                    title: Text(
                                      "Emergency Contact Information",
                                      style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                                    ),
                                    children: [
                                      const Divider(
                                        color: Colors.black38,
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(14.4),
                                        margin: EdgeInsets.all(14.4),
                                        decoration: BoxDecoration(
                                          color: Color(0xffF3F3F3),
                                          borderRadius: BorderRadius.circular(7.2),
                                        ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.stretch,
                                          children: [
                                            Text(
                                              "EMERGENCY CONTACT 1",
                                              style: TextStyle(
                                                fontSize: 20,
                                              ),
                                            ),
                                            Divider(
                                              color: Colors.black,
                                            ),
                                            Text(
                                              "Name",
                                              style: TextStyle(fontSize: 10.8, color: const Color(0xFF4F4F4F)),
                                            ),
                                            SizedBox(
                                              height: 0.732,
                                            ),
                                            TextField(
                                              textInputAction: TextInputAction.done,
                                              keyboardType: TextInputType.text,
                                              controller: _eC1Name,
                                              decoration: InputDecoration(
                                                hintText: "Enter Name",
                                              ),
                                            ),
                                            SizedBox(
                                              height: 14.64,
                                            ),
                                            Text(
                                              "Email",
                                              style: TextStyle(fontSize: 10.8, color: const Color(0xFF4F4F4F)),
                                            ),
                                            SizedBox(
                                              height: 0.732,
                                            ),
                                            TextField(
                                              textInputAction: TextInputAction.done,
                                              keyboardType: TextInputType.text,
                                              controller: _eC1Email,
                                              decoration: InputDecoration(
                                                hintText: "Enter Email",
                                              ),
                                            ),
                                            SizedBox(
                                              height: 14.64,
                                            ),
                                            Text(
                                              "Primary Number",
                                              style: TextStyle(fontSize: 10.8, color: const Color(0xFF4F4F4F)),
                                            ),
                                            SizedBox(
                                              height: 0.732,
                                            ),
                                            MaskedTextField(
                                              maxLength: 14,
                                              keyboardType: TextInputType.number,
                                              onChange: (val) {},
                                              mask: '(xxx) xxx-xxxx',
                                              textFieldController: _eC1PrimaryNumber,
                                              inputDecoration: InputDecoration(
                                                hintText: "Enter Primary Number",
                                              ),
                                            ),
                                            SizedBox(
                                              height: 14.64,
                                            ),
                                            Text(
                                              "Secondary Number",
                                              style: TextStyle(fontSize: 10.8, color: const Color(0xFF4F4F4F)),
                                            ),
                                            SizedBox(
                                              height: 0.732,
                                            ),
                                            MaskedTextField(
                                              maxLength: 14,
                                              keyboardType: TextInputType.number,
                                              onChange: (val) {},
                                              mask: '(xxx) xxx-xxxx',
                                              textFieldController: _eC1SecondaryNumber,
                                              inputDecoration: InputDecoration(
                                                hintText: "Enter Secondary Number",
                                              ),
                                            ),
                                            SizedBox(
                                              height: 14.64,
                                            ),
                                            Text(
                                              "EMERGENCY CONTACT 2",
                                              style: TextStyle(
                                                fontSize: 20,
                                              ),
                                            ),
                                            Divider(
                                              color: Colors.black,
                                            ),
                                            Text(
                                              "Name",
                                              style: TextStyle(fontSize: 10.8, color: const Color(0xFF4F4F4F)),
                                            ),
                                            SizedBox(
                                              height: 0.732,
                                            ),
                                            TextField(
                                              textInputAction: TextInputAction.done,
                                              keyboardType: TextInputType.text,
                                              controller: _eC2Name,
                                              decoration: InputDecoration(
                                                hintText: "Enter Name",
                                              ),
                                            ),
                                            SizedBox(
                                              height: 14.64,
                                            ),
                                            Text(
                                              "Email",
                                              style: TextStyle(fontSize: 10.8, color: const Color(0xFF4F4F4F)),
                                            ),
                                            SizedBox(
                                              height: 0.732,
                                            ),
                                            TextField(
                                              textInputAction: TextInputAction.done,
                                              keyboardType: TextInputType.text,
                                              controller: _eC2Email,
                                              decoration: InputDecoration(
                                                hintText: "Enter Email",
                                              ),
                                            ),
                                            SizedBox(
                                              height: 14.64,
                                            ),
                                            Text(
                                              "Primary Number",
                                              style: TextStyle(fontSize: 10.8, color: const Color(0xFF4F4F4F)),
                                            ),
                                            SizedBox(
                                              height: 0.732,
                                            ),
                                            MaskedTextField(
                                              maxLength: 14,
                                              keyboardType: TextInputType.number,
                                              onChange: (val) {},
                                              mask: '(xxx) xxx-xxxx',
                                              textFieldController: _eC2PrimaryNumber,
                                              inputDecoration: InputDecoration(
                                                hintText: "Enter Primary Number",
                                              ),
                                            ),
                                            SizedBox(
                                              height: 14.64,
                                            ),
                                            Text(
                                              "Secondary Number",
                                              style: TextStyle(fontSize: 10.8, color: const Color(0xFF4F4F4F)),
                                            ),
                                            SizedBox(
                                              height: 0.732,
                                            ),
                                            MaskedTextField(
                                              maxLength: 14,
                                              keyboardType: TextInputType.number,
                                              onChange: (val) {},
                                              mask: '(xxx) xxx-xxxx',
                                              textFieldController: _eC2SecondaryNumber,
                                              inputDecoration: InputDecoration(
                                                hintText: "Enter Secondary Number",
                                              ),
                                            ),
                                            SizedBox(
                                              height: 14.64,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    collapsedIconColor: Colors.black,
                                    iconColor: Colors.black,
                                    initiallyExpanded: true,
                                    onExpansionChanged: (val) {
                                      setState(() {
                                        satsang = val;
                                      });
                                    },
                                    title: Text(
                                      "Medical Information",
                                      style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                                    ),
                                    children: [
                                      const Divider(
                                        color: Colors.black38,
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(14.4),
                                        margin: EdgeInsets.all(14.4),
                                        decoration: BoxDecoration(
                                          color: Color(0xffF3F3F3),
                                          borderRadius: BorderRadius.circular(7.2),
                                        ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.stretch,
                                          children: [
                                            Text(
                                              "Allergies",
                                              style: TextStyle(fontSize: 10.8, color: const Color(0xFF4F4F4F)),
                                            ),
                                            SizedBox(
                                              height: 0.732,
                                            ),
                                            TextField(
                                              textInputAction: TextInputAction.done,
                                              keyboardType: TextInputType.text,
                                              controller: _allergies,
                                              decoration: InputDecoration(
                                                hintText: "Enter Allergies",
                                              ),
                                            ),
                                            SizedBox(
                                              height: 14.64,
                                            ),
                                            Text(
                                              "Medications Taken",
                                              style: TextStyle(fontSize: 10.8, color: const Color(0xFF4F4F4F)),
                                            ),
                                            SizedBox(
                                              height: 0.732,
                                            ),
                                            TextField(
                                              textInputAction: TextInputAction.done,
                                              keyboardType: TextInputType.text,
                                              controller: _medicationsTaken,
                                              decoration: InputDecoration(
                                                hintText: "Enter Medications Taken",
                                              ),
                                            ),
                                            SizedBox(
                                              height: 14.64,
                                            ),
                                            Text(
                                              "Medical Conditions",
                                              style: TextStyle(fontSize: 10.8, color: const Color(0xFF4F4F4F)),
                                            ),
                                            SizedBox(
                                              height: 0.732,
                                            ),
                                            TextField(
                                              textInputAction: TextInputAction.done,
                                              keyboardType: TextInputType.text,
                                              controller: _medicalConditions,
                                              decoration: InputDecoration(
                                                hintText: "Enter Medical Conditions",
                                              ),
                                            ),
                                            SizedBox(
                                              height: 14.64,
                                            ),
                                            Text(
                                              "Special Medical Instructions",
                                              style: TextStyle(fontSize: 10.8, color: const Color(0xFF4F4F4F)),
                                            ),
                                            SizedBox(
                                              height: 0.732,
                                            ),
                                            TextField(
                                              textInputAction: TextInputAction.done,
                                              keyboardType: TextInputType.text,
                                              controller: _specialMedicalInstructions,
                                              decoration: InputDecoration(
                                                hintText: "Enter Special Medical Instructions",
                                              ),
                                            ),
                                            SizedBox(
                                              height: 14.64,
                                            ),
                                            Text(
                                              "Notes",
                                              style: TextStyle(fontSize: 10.8, color: const Color(0xFF4F4F4F)),
                                            ),
                                            SizedBox(
                                              height: 0.732,
                                            ),
                                            TextField(
                                              textInputAction: TextInputAction.done,
                                              keyboardType: TextInputType.text,
                                              controller: _notes,
                                              decoration: InputDecoration(
                                                hintText: "Enter Notes",
                                              ),
                                            ),
                                            SizedBox(
                                              height: 14.64,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    collapsedIconColor: Colors.black,
                                    iconColor: Colors.black,
                                    initiallyExpanded: true,
                                    onExpansionChanged: (val) {
                                      setState(() {
                                        satsang = val;
                                      });
                                    },
                                    title: Text(
                                      "Satsang Information",
                                      style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                                    ),
                                    children: [
                                      const Divider(
                                        color: Colors.black38,
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(14.4),
                                        margin: EdgeInsets.all(14.4),
                                        decoration: BoxDecoration(
                                          color: Color(0xffF3F3F3),
                                          borderRadius: BorderRadius.circular(7.2),
                                        ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.stretch,
                                          children: [
                                            /*  Text(
                                              "Current Wing",
                                              style: TextStyle(
                                                  fontSize: 10.8, color: const Color(0xFF4F4F4F)),
                                            ),
                                            DropdownButton(
                                              itemHeight: null,
                                              isExpanded: true,
                                              hint: const Text('Choose Wing'),
                                              value: _selectedCurrentUserWingItem,
                                              onChanged: null,
                                              items: _currentUserWingItems.map((currentUserWingItem) {
                                                return DropdownMenuItem(
                                                  child: Text(currentUserWingItem!.wingName,
                                                      overflow: TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                        fontSize: 14.4,
                                                      )),
                                                  value: currentUserWingItem,
                                                );
                                              }).toList(),
                                            ),
                                            SizedBox(
                                              height: 14.64,
                                            ),
                                            Text(
                                              "Group",
                                              style: TextStyle(
                                                  fontSize: 10.8, color: const Color(0xFF4F4F4F)),
                                            ),
                                            DropdownButton(
                                              itemHeight: null,
                                              isExpanded: true,
                                              hint: const Text('Choose Group'),
                                              value: _selectedGroup,
                                              onChanged: null,
                                              items: _groupItems.map((groupItem) {
                                                return DropdownMenuItem(
                                                  child: Text(groupItem!.group_name,
                                                      overflow: TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                        fontSize: 14.4,
                                                      )),
                                                  value: groupItem,
                                                );
                                              }).toList(),
                                            ),
                                            SizedBox(
                                              height: 14.64,
                                            ),*/
                                            /*  Text(
                                                "Year Entered Satsang",
                                                style: TextStyle(
                                                    fontSize: 10.8, color: const Color(0xFF4F4F4F)),
                                              ),
                                              SizedBox(
                                                height: 0.732,
                                              ),
                                              TextField(
                                                textInputAction: TextInputAction.done,
                                                keyboardType: TextInputType.text,
                                                controller: _satsangYear,
                                                decoration: InputDecoration(
                                                  hintText: "Enter Satsang Year",
                                                ),
                                              ),
                                              SizedBox(
                                                height: 14.64,
                                              ),*/
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        "Primary Seva",
                                                        style:
                                                            TextStyle(fontSize: 10.8, color: const Color(0xFF4F4F4F)),
                                                      ),
                                                      SizedBox(
                                                        height: 0.732,
                                                      ),
                                                      DropdownButtonHideUnderline(
                                                        child: DropdownButton(
                                                          itemHeight: null,
                                                          isExpanded: true,
                                                          hint: const Text('Choose Seva'),
                                                          value: _selectedSevaItem,
                                                          onChanged: (newValue) {
                                                            setState(
                                                              () {
                                                                _selectedSevaItem = newValue as Seva;
                                                              },
                                                            );
                                                          },
                                                          items: _sevaItems.map((sevaItem) {
                                                            return DropdownMenuItem(
                                                              child: Text(sevaItem!.sevaName,
                                                                  overflow: TextOverflow.ellipsis,
                                                                  style: TextStyle(
                                                                    fontSize: 14.4,
                                                                  )),
                                                              value: sevaItem,
                                                            );
                                                          }).toList(),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 14.64,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 36,
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        "Secondary Seva",
                                                        style:
                                                            TextStyle(fontSize: 10.8, color: const Color(0xFF4F4F4F)),
                                                      ),
                                                      SizedBox(
                                                        height: 0.732,
                                                      ),
                                                      DropdownButtonHideUnderline(
                                                        child: DropdownButton(
                                                          itemHeight: null,
                                                          isExpanded: true,
                                                          hint: const Text('Choose Seva'),
                                                          value: _selectedSecondarySevaItem,
                                                          onChanged: (newValue) {
                                                            setState(() {
                                                              _selectedSecondarySevaItem = newValue as Seva;
                                                            });
                                                          },
                                                          items: _sevaSecondaryItems.map((sevaSecondaryItem) {
                                                            return DropdownMenuItem(
                                                              child: Text(sevaSecondaryItem!.sevaName,
                                                                  overflow: TextOverflow.ellipsis,
                                                                  style: TextStyle(
                                                                    fontSize: 14.4,
                                                                  )),
                                                              value: sevaSecondaryItem,
                                                            );
                                                          }).toList(),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 14.64,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        "Primary Wing",
                                                        style:
                                                            TextStyle(fontSize: 10.8, color: const Color(0xFF4F4F4F)),
                                                      ),
                                                      DropdownButtonHideUnderline(
                                                        child: DropdownButton(
                                                          itemHeight: null,
                                                          isExpanded: true,
                                                          hint: const Text('Choose Wing'),
                                                          value: _selectedCurrentWingItem,
                                                          onChanged: (newValue) {
                                                            setState(() {
                                                              _selectedCurrentWingItem = newValue as Wing;
                                                            });
                                                          },
                                                          items: _currentWingItems.map((currentWingItem) {
                                                            return DropdownMenuItem(
                                                              child: Text(currentWingItem!.wingName,
                                                                  overflow: TextOverflow.ellipsis,
                                                                  style: TextStyle(
                                                                    fontSize: 14.4,
                                                                  )),
                                                              value: currentWingItem,
                                                            );
                                                          }).toList(),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 36,
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        "Secondary Wing",
                                                        style:
                                                            TextStyle(fontSize: 10.8, color: const Color(0xFF4F4F4F)),
                                                      ),
                                                      DropdownButtonHideUnderline(
                                                        child: DropdownButton(
                                                          itemHeight: null,
                                                          isExpanded: true,
                                                          hint: const Text('Choose Wing'),
                                                          value: _selectedSecondaryCurrentWing,
                                                          onChanged: (newValue) {
                                                            setState(() {
                                                              _selectedSecondaryCurrentWing = newValue as Wing;
                                                            });
                                                          },
                                                          items: _currentSecondaryWingItems.map((currentSecWingItem) {
                                                            return DropdownMenuItem(
                                                              child: Text(currentSecWingItem!.wingName,
                                                                  overflow: TextOverflow.ellipsis,
                                                                  style: TextStyle(
                                                                    fontSize: 14.4,
                                                                  )),
                                                              value: currentSecWingItem,
                                                            );
                                                          }).toList(),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 14.64,
                                            ),
                                            Text(
                                              "T-Shirt size",
                                              style: TextStyle(fontSize: 10.8, color: const Color(0xFF4F4F4F)),
                                            ),
                                            DropdownButton(
                                              itemHeight: null,
                                              isExpanded: true,
                                              hint: const Text('Choose size'),
                                              value: _selectedTShirtSizeItem,
                                              onChanged: (newValue) {
                                                setState(() {
                                                  _selectedTShirtSizeItem = newValue as TShirtSize;
                                                });
                                              },
                                              items: _tShortSizeItems.map((tShirtSizeItem) {
                                                return DropdownMenuItem(
                                                  child: Text(tShirtSizeItem!.size,
                                                      overflow: TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                        fontSize: 14.4,
                                                      )),
                                                  value: tShirtSizeItem,
                                                );
                                              }).toList(),
                                            ),
                                            SizedBox(
                                              height: 14.64,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    collapsedIconColor: Colors.black,
                                    iconColor: Colors.black,
                                    initiallyExpanded: true,
                                    onExpansionChanged: (val) {
                                      setState(() {
                                        satsang = val;
                                      });
                                    },
                                    title: Text(
                                      "Social Media Information",
                                      style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                                    ),
                                    children: [
                                      const Divider(
                                        color: Colors.black38,
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(14.4),
                                        margin: EdgeInsets.all(14.4),
                                        decoration: BoxDecoration(
                                          color: Color(0xffF3F3F3),
                                          borderRadius: BorderRadius.circular(7.2),
                                        ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.stretch,
                                          children: [
                                            Text(
                                              "Facebook Account Url",
                                              style: TextStyle(fontSize: 10.8, color: const Color(0xFF4F4F4F)),
                                            ),
                                            SizedBox(
                                              height: 0.732,
                                            ),
                                            TextField(
                                              textInputAction: TextInputAction.done,
                                              keyboardType: TextInputType.text,
                                              controller: _facebook,
                                              decoration: InputDecoration(
                                                hintText: "Enter Facebook Url",
                                              ),
                                            ),
                                            SizedBox(
                                              height: 14.64,
                                            ),
                                            Text(
                                              "Twitter Account Url",
                                              style: TextStyle(fontSize: 10.8, color: const Color(0xFF4F4F4F)),
                                            ),
                                            SizedBox(
                                              height: 0.732,
                                            ),
                                            TextField(
                                              textInputAction: TextInputAction.done,
                                              keyboardType: TextInputType.text,
                                              controller: _twitter,
                                              decoration: InputDecoration(
                                                hintText: "Enter Twitter Url",
                                              ),
                                            ),
                                            SizedBox(
                                              height: 14.64,
                                            ),
                                            Text(
                                              "Snapchat Account Url",
                                              style: TextStyle(fontSize: 10.8, color: const Color(0xFF4F4F4F)),
                                            ),
                                            SizedBox(
                                              height: 0.732,
                                            ),
                                            TextField(
                                              textInputAction: TextInputAction.done,
                                              keyboardType: TextInputType.text,
                                              controller: _snapchat,
                                              decoration: InputDecoration(
                                                hintText: "Enter Snapchat Url",
                                              ),
                                            ),
                                            SizedBox(
                                              height: 14.64,
                                            ),
                                            Text(
                                              "Instagram Account Url",
                                              style: TextStyle(fontSize: 10.8, color: const Color(0xFF4F4F4F)),
                                            ),
                                            SizedBox(
                                              height: 0.732,
                                            ),
                                            TextField(
                                              textInputAction: TextInputAction.done,
                                              keyboardType: TextInputType.text,
                                              controller: _instagram,
                                              decoration: InputDecoration(
                                                hintText: "Enter Instagram Url",
                                              ),
                                            ),
                                            SizedBox(
                                              height: 14.64,
                                            ),
                                            Text(
                                              "Linkedin Account Url",
                                              style: TextStyle(fontSize: 10.8, color: const Color(0xFF4F4F4F)),
                                            ),
                                            SizedBox(
                                              height: 0.732,
                                            ),
                                            TextField(
                                              textInputAction: TextInputAction.done,
                                              keyboardType: TextInputType.text,
                                              controller: _linkedin,
                                              decoration: InputDecoration(
                                                hintText: "Enter Linkedin Url",
                                              ),
                                            ),
                                            SizedBox(
                                              height: 14.64,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 58.56,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(child: _isLoading ? Loader(loadingTxt: 'Please wait...') : Container())
                ]);
              } else {
                return Center(
                  child: Text(''),
                );
              }
            }));
  }
}
