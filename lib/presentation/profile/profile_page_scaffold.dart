import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/login_model.dart';
import 'package:flutter_app/models/update_profile_request_model.dart';
import 'package:flutter_app/models/user_profile_model.dart';
import 'package:flutter_app/presentation/auth/auth_bloc.dart';
import 'package:flutter_app/presentation/bloc/params_bloc.dart';
import 'package:flutter_app/presentation/bloc/params_event.dart';
import 'package:flutter_app/presentation/bloc/params_state.dart';
import 'package:flutter_app/presentation/bloc/user_profile_bloc.dart';
import 'package:flutter_app/presentation/lifecycle/lifecycle_manager.dart';
import 'package:flutter_app/presentation/login/login.dart';
import 'package:flutter_app/services/local_notification.dart';
import 'package:flutter_app/utils/util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masked_text_field/masked_text_field.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vrouter/vrouter.dart';
import '../../loader.dart';
import '../../preferences.dart';
import '../../utils/gender_status.dart';
import '../../utils/student_type.dart';
import '../homepage/home_screen.dart';

class ProfilePageScaffold extends StatefulWidget {
  static const String id = "profilePage";
  static const String path = "${HomeScreen.path}/$id";
  bool logOutButton;
  ProfilePageScaffold(this.logOutButton, {Key? key}) : super(key: key);

  @override
  _ProfilePageScaffoldState createState() => _ProfilePageScaffoldState();
}

class _ProfilePageScaffoldState extends State<ProfilePageScaffold> {
  UserProfileModel? userProfileModel;

  bool _isUserCanEdit = false;

  late List<Region?>? _regionItems;
  Region? _selectedRegion;

  List<CenterUP?> _centerItems = [];
  List<CenterUP?>? _center;
  CenterUP? _selectedCenter;

  List<Country?> _countryItems = [];
  Country? _selectedCountry;

  List<StateUP?> _stateItems = [];
  List<StateUP?> _state = [];
  StateUP? _selectedState;

  late List<Seva?>? _sevaItems;
  Seva? _selectedSevaItem;

  late List<Seva?>? _sevaSecondaryItems;
  Seva? _selectedSecondarySevaItem;

  List<SchoolYear?> _schoolYears = [];
  SchoolYear? _selectedYear;

  late List<GroupUP?>? _groupItems;
  GroupUP? _selectedGroup;

  List<Wing?>? _currentUserWingItems;
  Wing? _selectedCurrentUserWingItem;

  late List<Wing?>? _currentWingItems;
  Wing? _selectedCurrentWingItem;

  late List<Wing?>? _currentSecondaryWingItems;
  Wing? _selectedSecondaryCurrentWing;

  late List<TShirtSize?>? _tShortSizeItems;
  TShirtSize? _selectedTShirtSizeItem;

  bool personal = true;
  bool contact = true;
  bool satsang = true;
  bool edit = false;
  bool chooseRegion = false;
  bool chooseCenter = false;
  bool chooseYear = false;

  final TextEditingController _email = TextEditingController();
  late FocusNode _focusNodeEmail;
  bool? emailError;

  final TextEditingController _firstName = TextEditingController();
  late FocusNode _focusNodeFName;
  bool? fNameError;

  final TextEditingController _lastName = TextEditingController();
  late FocusNode _focusNodeLName;
  bool? lNameError;
  final TextEditingController _birthDate = TextEditingController();
  late FocusNode _focusNodeDate;
  bool birthError = false;

  final TextEditingController _homeAddress = TextEditingController();
  late FocusNode _focusNodeHomeAddress;
  bool? homeAddressError;

  final TextEditingController _apartment = TextEditingController();

  final TextEditingController _city = TextEditingController();
  late FocusNode _focusNodeCity;
  bool? cityError;

  final TextEditingController _zipCode = TextEditingController();
  late FocusNode _focusNodeZipCode;
  bool? zipCodeError;
  TextEditingController _homePhone = TextEditingController();
  TextEditingController _cellPhone = TextEditingController();

  final TextEditingController _middleName = TextEditingController();
  final TextEditingController _undergraduateSchool = TextEditingController();
  final TextEditingController _major = TextEditingController();
  final TextEditingController _careerInterest = TextEditingController();
  final TextEditingController _satsangYear = TextEditingController();
  LocalNotification localNotification = LocalNotification();

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
  final TextEditingController _fatherPhone = TextEditingController();

  final TextEditingController _motherName = TextEditingController();
  final TextEditingController _motherEmail = TextEditingController();
  final TextEditingController _motherPhone = TextEditingController();

  LoginModel? loginModel;

  bool _isLoading = false;

  void _showLoadingIndicator() {
    setState(() {
      _isLoading = true;
    });
  }

  DateTime? selectedDate;
  selectDate(DateTime apiDate) async {
    selectedDate = await showDatePicker(
      context: context,
      initialDate: apiDate,
      firstDate: DateTime(1950),
      lastDate: DateTime(2050),
    );
    if (selectedDate != null) {
      setState(() {
        _birthDate.text =
            selectedDate!.year.toString() + "-" + selectedDate!.month.toString() + "-" + selectedDate!.day.toString();
      });
    }
  }

  void _hideLoadingIndicator() {
    setState(() {
      _isLoading = false;
    });
  }

  String _strRecordId = "";

  bool _isForIndividualRecord() {
    return _strRecordId != "";
  }

  findCenter() {
    if (_selectedRegion != null) {
      _centerItems.clear();
      for (int v = 0; v < _center!.length; v++) {
        if (_selectedRegion!.id == int.parse(_center![v]!.RegionId)) {
          _centerItems.add(_center![v]!);
        }
      }
    }
  }

  findState() {
    if (_selectedCountry != null) {
      _stateItems.clear();
      for (int v = 0; v < _state.length; v++) {
        if (_selectedCountry!.id == int.parse(_state[v]!.country_id)) {
          _stateItems.add(_state[v]!);
        }
      }
    }
  }

  GenderStatus? _genderStatus;
  StudentType? _studentType;
  bool gender = false;
  bool bstKstMember = false;
  bool networkingTarget = false;

  @override
  void initState() {
    super.initState();

    _firstName.text = '';
    _middleName.text = '';
    _lastName.text = '';
    _email.text = '';

    _focusNodeEmail = FocusNode();
    _focusNodeFName = FocusNode();
    _focusNodeLName = FocusNode();
    _focusNodeDate = FocusNode();
    _focusNodeHomeAddress = FocusNode();
    _focusNodeCity = FocusNode();
    _focusNodeZipCode = FocusNode();

    final paramsBloc = BlocProvider.of<ParamsBloc>(context).state;
    if (paramsBloc is RecordIdState) {
      _strRecordId = paramsBloc.strRecordId;
    }
    //FOR ADD EMPTY RECORD-ID
    BlocProvider.of<ParamsBloc>(context).add(
      SetRecordIdValue(""),
    );

    _showLoadingIndicator();
    try {
      BlocProvider.of<UserProfileBloc>(context).add(UserProfileEvent.load(context, _strRecordId));
    } catch (e) {
      print(e);
    }
  }

  lunchUrl(String url) async {
    await launch(url);
  }

  @override
  Widget build(BuildContext context) {
    // bool biometrics = BlocProvider.of<AuthBloc>(context).state.bio;
    return LifecycleManager(
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
                      setState(() {
                        this.userProfileModel = userProfileModel;
                        _isUserCanEdit = userProfileModel.is_edit;

                        if (userProfileModel.contact_information != null) {
                          _firstName.text = userProfileModel.contact_information?.f_name ?? "";
                          _middleName.text = userProfileModel.contact_information?.m_name ?? "";
                          _lastName.text = userProfileModel.contact_information?.l_name ?? "";
                          _birthDate.text = userProfileModel.contact_information?.date_of_birth ?? "";
                          _email.text = userProfileModel.contact_information?.email ?? "";
                          _homeAddress.text = userProfileModel.contact_information?.home_address ?? "";
                          _apartment.text = userProfileModel.contact_information?.apartment ?? "";
                          _city.text = userProfileModel.contact_information?.city ?? "";
                          _zipCode.text = userProfileModel.contact_information?.zip_code ?? "";
                          _homePhone.text = userProfileModel.contact_information?.homePhone ?? "";
                          _cellPhone.text = userProfileModel.contact_information?.cellPhone ?? "";
                        }

                        if (userProfileModel.satsang_information != null) {
                          _undergraduateSchool.text = userProfileModel.satsang_information!.undergraduate_school;
                          _genderStatus = userProfileModel.satsang_information!.gender;
                          _studentType = userProfileModel.satsang_information!.student_type;
                          _major.text = userProfileModel.satsang_information!.major_expected_major;
                          _careerInterest.text = userProfileModel.satsang_information!.career_interest;
                          bstKstMember = userProfileModel.satsang_information?.bstKstMember ?? false;
                          networkingTarget = userProfileModel.satsang_information?.networkingTarget ?? false;
                        }
                        if (userProfileModel.medical_information != null) {
                          _allergies.text = userProfileModel.medical_information!.allergies ?? "";
                          _medicationsTaken.text = userProfileModel.medical_information!.medication_taken ?? "";
                          _medicalConditions.text = userProfileModel.medical_information!.medical_conditions ?? "";
                          _specialMedicalInstructions.text =
                              userProfileModel.medical_information!.special_medical_instructions ?? "";
                          _notes.text = userProfileModel.medical_information!.notes ?? "";
                        }

                        if (userProfileModel.social_media_information != null) {
                          _facebook.text = userProfileModel.social_media_information!.facebook_id ?? "";
                          _twitter.text = userProfileModel.social_media_information!.twitter_id ?? "";
                          _snapchat.text = userProfileModel.social_media_information!.snapchat_id ?? "";
                          _instagram.text = userProfileModel.social_media_information!.instagram_id ?? "";
                          _linkedin.text = userProfileModel.social_media_information!.linkedin_id ?? "";
                        }

                        if (userProfileModel.emergency_contact_information != null) {
                          _eC1Name.text = userProfileModel.emergency_contact_information!.emergency_contact1_name ?? "";
                          _eC1Email.text =
                              userProfileModel.emergency_contact_information!.emergency_contact1_email ?? "";
                          _eC1PrimaryNumber.text =
                              userProfileModel.emergency_contact_information!.emergencyContact1PriPhone ?? "";
                          _eC1SecondaryNumber.text =
                              userProfileModel.emergency_contact_information!.emergencyContact1SecPhone ?? "";
                          _eC2Name.text = userProfileModel.emergency_contact_information!.emergency_contact2_name ?? "";
                          _eC2Email.text =
                              userProfileModel.emergency_contact_information!.emergency_contact2_email ?? "";
                          _eC2PrimaryNumber.text =
                              userProfileModel.emergency_contact_information!.emergencyContact2PriPhone ?? "";
                          _eC2SecondaryNumber.text =
                              userProfileModel.emergency_contact_information!.emergencyContact2SecPhone ?? "";
                        }

                        if (userProfileModel.family_contact_information != null) {
                          _fatherName.text = userProfileModel.family_contact_information!.father_name ?? "";
                          _fatherEmail.text = userProfileModel.family_contact_information!.father_email ?? "";
                          _fatherPhone.text = userProfileModel.family_contact_information!.fatherCellPhone ?? "";
                          _motherName.text = userProfileModel.family_contact_information!.mother_name ?? "";
                          _motherEmail.text = userProfileModel.family_contact_information!.mother_email ?? "";
                          _motherPhone.text = userProfileModel.family_contact_information!.motherCellPhone ?? "";
                        }

                        _regionItems = userProfileModel.region;
                        final regionIndex = _regionItems!.indexWhere(
                            (element) => element!.id.toString() == userProfileModel.contact_information!.region_id);
                        if (regionIndex >= 0) {
                          _selectedRegion = _regionItems![regionIndex]!;
                        }
                        _center = userProfileModel.center;
                        if (_selectedRegion != null) {
                          for (int v = 0; v < _center!.length; v++) {
                            if (_selectedRegion!.id == int.parse(_center![v]!.RegionId)) {
                              _centerItems.add(_center![v]!);
                            }
                          }
                        }

                        final centerIndex = _centerItems.indexWhere(
                            (element) => element!.id.toString() == userProfileModel.contact_information!.center_id);
                        if (centerIndex >= 0) {
                          _selectedCenter = _centerItems[centerIndex]!;
                        }

                        _countryItems = userProfileModel.country;
                        final countryIndex = _countryItems.indexWhere(
                            (element) => element!.id.toString() == userProfileModel.contact_information!.country);
                        if (countryIndex >= 0) {
                          _selectedCountry = _countryItems[countryIndex];
                        }

                        _state = userProfileModel.state;
                        if (_selectedCountry != null) {
                          for (int v = 0; v < _state.length; v++) {
                            if (_selectedCountry!.id == int.parse(_state[v]!.country_id)) {
                              _stateItems.add(_state[v]!);
                            }
                          }
                        }

                        final stateIndex = _stateItems.indexWhere(
                            (element) => element!.id.toString() == userProfileModel.contact_information!.state);
                        if (stateIndex >= 0) {
                          _selectedState = _stateItems[stateIndex]!;
                        }

                        _schoolYears = userProfileModel.school_year;
                        final schoolIndex = _schoolYears.indexWhere(
                            (element) => element!.id.toString() == userProfileModel.satsang_information!.school_year);
                        if (schoolIndex >= 0) {
                          _selectedYear = _schoolYears[schoolIndex]!;
                        }

                        _sevaItems = userProfileModel.seva;
                        final sevaIndex = _sevaItems!.indexWhere(
                            (element) => element!.id.toString() == userProfileModel.satsang_information!.primary_seva);
                        if (sevaIndex >= 0) {
                          _selectedSevaItem = _sevaItems![sevaIndex]!;
                        }

                        _sevaSecondaryItems = userProfileModel.seva;
                        final sevaSecondaryIndex = _sevaSecondaryItems!.indexWhere((element) =>
                            element!.id.toString() == userProfileModel.satsang_information!.secondary_seva);
                        if (sevaSecondaryIndex >= 0) {
                          _selectedSecondarySevaItem = _sevaSecondaryItems![sevaSecondaryIndex]!;
                        }

                        _currentUserWingItems = userProfileModel.wing;
                        final wingUserIndex = _currentUserWingItems!.indexWhere(
                            (element) => element!.id.toString() == userProfileModel.satsang_information!.current_wing);
                        if (wingUserIndex >= 0) {
                          _selectedCurrentUserWingItem = _currentUserWingItems![wingUserIndex]!;
                        }

                        _groupItems = userProfileModel.group;
                        final groupIndex = _groupItems!.indexWhere(
                            (element) => element!.id.toString() == userProfileModel.satsang_information!.group);
                        if (wingUserIndex >= 0) {
                          _selectedGroup = _groupItems![groupIndex]!;
                        }

                        _currentWingItems = userProfileModel.wing;
                        final wingIndex = _currentWingItems!.indexWhere((element) =>
                            element!.id.toString() == userProfileModel.satsang_information!.primary_seva_wing);
                        if (wingIndex >= 0) {
                          _selectedCurrentWingItem = _currentWingItems![wingIndex]!;
                        }

                        _currentSecondaryWingItems = userProfileModel.wing;
                        final wingSecIndex = _currentSecondaryWingItems!.indexWhere((element) =>
                            element!.id.toString() == userProfileModel.satsang_information!.secondary_seva_wing);
                        if (wingSecIndex >= 0) {
                          _selectedSecondaryCurrentWing = _currentSecondaryWingItems![wingSecIndex]!;
                        }

                        _tShortSizeItems = userProfileModel.tishirtsize;
                        final tShirtSizeIndex = _tShortSizeItems!.indexWhere((element) =>
                            element!.id.toString() == userProfileModel.satsang_information!.t_shirt_size_id);
                        if (tShirtSizeIndex >= 0) {
                          _selectedTShirtSizeItem = _tShortSizeItems![tShirtSizeIndex]!;
                        }
                      });
                    } else {
                      _hideLoadingIndicator();
                    }
                  },
                  orElse: () {});
            },
          ),
          BlocListener<UpdateProfileBloc, UpdateProfileState>(
            listener: (context, state) {
              state.maybeWhen(
                  empty: () {
                    _hideLoadingIndicator();
                  },
                  load: (updateProfileModel) {
                    if (updateProfileModel != null) {
                      setState(
                        () {
                          _hideLoadingIndicator();
                          edit = false;
                        },
                      );
                    }
                  },
                  orElse: () {});
            },
          ),
          BlocListener<DeactivateUserBloc, DeactivateUserState>(
            listener: (context, state) {
              state.maybeWhen(empty: () {
                _hideLoadingIndicator();
              }, deactivate: (deactivateUserModel) {
                if (deactivateUserModel != null) {
                  _hideLoadingIndicator();
                  if (_isForIndividualRecord()) {
                    BlocProvider.of<ParamsBloc>(context).add(SetDeActivateStatusValue(true));
                    Navigator.pop(context);
                  } else {
                    setState(
                      () {
                        _redirectToLogin(context);
                      },
                    );
                  }
                }
              }, orElse: () {
                // _hideLoadingIndicator();
              });
            },
          ),
        ],
        child: FutureBuilder<Preferences>(
          future: Preferences.getInstance(),
          builder: (BuildContext context, AsyncSnapshot<Preferences> snapshot) {
            if (snapshot.hasData) {
              loginModel = snapshot.data!.getToken();
              return Stack(children: [
                Column(
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
                          padding: EdgeInsets.only(left: 14.4, right: 14.4, bottom: 14.4),
                          child: Column(
                            children: [
                              (edit == true)
                                  ? Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        CupertinoButton(
                                          padding: EdgeInsets.zero,
                                          minSize: 20,
                                          onPressed: () {
                                            edit = false;
                                            setState(() {
                                              _isUserCanEdit = userProfileModel!.is_edit;
                                              _email.text = userProfileModel!.contact_information!.email;
                                              _firstName.text = userProfileModel!.contact_information!.f_name;
                                              _middleName.text = userProfileModel!.contact_information!.m_name;
                                              _lastName.text = userProfileModel!.contact_information!.l_name;
                                              _birthDate.text = userProfileModel!.contact_information!.date_of_birth;
                                              _homeAddress.text = userProfileModel!.contact_information!.home_address;
                                              _city.text = userProfileModel!.contact_information!.city;
                                              _zipCode.text = userProfileModel!.contact_information!.zip_code;
                                              _homePhone.text = userProfileModel!.contact_information!.home_phone;
                                              _cellPhone.text = userProfileModel!.contact_information!.cell_phone;
                                              _undergraduateSchool.text =
                                                  userProfileModel!.satsang_information!.undergraduate_school;
                                              _major.text = userProfileModel!.satsang_information!.major_expected_major;
                                              _careerInterest.text =
                                                  userProfileModel!.satsang_information!.career_interest;
                                              _allergies.text = userProfileModel!.medical_information!.allergies ?? "";
                                              _medicationsTaken.text =
                                                  userProfileModel!.medical_information!.medication_taken ?? "";
                                              _medicalConditions.text =
                                                  userProfileModel!.medical_information!.medical_conditions ?? "";
                                              _specialMedicalInstructions.text =
                                                  userProfileModel!.medical_information!.special_medical_instructions ??
                                                      "";
                                              _notes.text = userProfileModel!.medical_information!.notes ?? "";
                                              _facebook.text =
                                                  userProfileModel!.social_media_information!.facebook_id ?? "";
                                              _twitter.text =
                                                  userProfileModel!.social_media_information!.twitter_id ?? "";
                                              _snapchat.text =
                                                  userProfileModel!.social_media_information!.snapchat_id ?? "";
                                              _instagram.text =
                                                  userProfileModel!.social_media_information!.instagram_id ?? "";
                                              _linkedin.text =
                                                  userProfileModel!.social_media_information!.linkedin_id ?? "";
                                              _eC1Name.text = userProfileModel!
                                                      .emergency_contact_information!.emergency_contact1_name ??
                                                  "";
                                              _eC1Email.text = userProfileModel!
                                                      .emergency_contact_information!.emergency_contact1_email ??
                                                  "";
                                              _eC1PrimaryNumber.text = userProfileModel!
                                                      .emergency_contact_information!.emergency_contact1_pri_phone ??
                                                  "";
                                              _eC1SecondaryNumber.text = userProfileModel!
                                                      .emergency_contact_information!.emergency_contact1_sec_phone ??
                                                  "";
                                              _eC2Name.text = userProfileModel!
                                                      .emergency_contact_information!.emergency_contact2_name ??
                                                  "";
                                              _eC2Email.text = userProfileModel!
                                                      .emergency_contact_information!.emergency_contact2_email ??
                                                  "";
                                              _eC2PrimaryNumber.text = userProfileModel!
                                                      .emergency_contact_information!.emergency_contact2_pri_phone ??
                                                  "";
                                              _eC2SecondaryNumber.text = userProfileModel!
                                                      .emergency_contact_information!.emergency_contact2_sec_phone ??
                                                  "";
                                              _fatherName.text =
                                                  userProfileModel!.family_contact_information!.father_name ?? "";
                                              _fatherEmail.text =
                                                  userProfileModel!.family_contact_information!.father_email ?? "";
                                              _fatherPhone.text =
                                                  userProfileModel!.family_contact_information!.father_cellphone ?? "";
                                              _motherName.text =
                                                  userProfileModel!.family_contact_information!.mother_name ?? "";
                                              _motherEmail.text =
                                                  userProfileModel!.family_contact_information!.mother_email ?? "";
                                              _motherPhone.text =
                                                  userProfileModel!.family_contact_information!.mother_cellphone ?? "";

                                              _regionItems = userProfileModel!.region;
                                              final regionIndex = _regionItems!.indexWhere((element) =>
                                                  element!.id.toString() ==
                                                  userProfileModel!.contact_information!.region_id);
                                              if (regionIndex >= 0) {
                                                _selectedRegion = _regionItems![regionIndex]!;
                                              } else {
                                                _selectedRegion = null;
                                              }
                                              _center = userProfileModel!.center;
                                              if (_selectedRegion != null) {
                                                for (int v = 0; v < _center!.length; v++) {
                                                  if (_selectedRegion!.id == int.parse(_center![v]!.RegionId)) {
                                                    _centerItems.add(_center![v]!);
                                                  }
                                                }
                                              }

                                              final centerIndex = _centerItems.indexWhere((element) =>
                                                  element!.id.toString() ==
                                                  userProfileModel!.contact_information!.center_id);
                                              if (centerIndex >= 0) {
                                                _selectedCenter = _centerItems[centerIndex]!;
                                              } else {
                                                _selectedCenter = null;
                                              }

                                              _countryItems = userProfileModel!.country;
                                              final countryIndex = _countryItems.indexWhere((element) =>
                                                  element!.id.toString() ==
                                                  userProfileModel!.contact_information!.country);
                                              if (countryIndex >= 0) {
                                                _selectedCountry = _countryItems[countryIndex];
                                              } else {
                                                _selectedCountry = null;
                                              }

                                              _state = userProfileModel!.state;
                                              if (_selectedCountry != null) {
                                                for (int v = 0; v < _state.length; v++) {
                                                  if (_selectedCountry!.id == int.parse(_state[v]!.country_id)) {
                                                    _stateItems.add(_state[v]!);
                                                  }
                                                }
                                              }

                                              final stateIndex = _stateItems.indexWhere((element) =>
                                                  element!.id.toString() ==
                                                  userProfileModel!.contact_information!.state);
                                              if (stateIndex >= 0) {
                                                _selectedState = _stateItems[stateIndex]!;
                                              } else {
                                                _selectedState = null;
                                              }

                                              _sevaItems = userProfileModel!.seva;
                                              final sevaIndex = _sevaItems!.indexWhere((element) =>
                                                  element!.id.toString() ==
                                                  userProfileModel!.satsang_information!.primary_seva);
                                              if (sevaIndex >= 0) {
                                                _selectedSevaItem = _sevaItems![sevaIndex]!;
                                              } else {
                                                _selectedSevaItem = null;
                                              }

                                              _schoolYears = userProfileModel!.school_year;
                                              final schoolIndex = _schoolYears.indexWhere((element) =>
                                                  element!.id.toString() ==
                                                  userProfileModel!.satsang_information!.school_year);
                                              if (schoolIndex >= 0) {
                                                _selectedYear = _schoolYears[schoolIndex]!;
                                              } else {
                                                _selectedYear = null;
                                              }

                                              _currentWingItems = userProfileModel!.wing;
                                              final wingIndex = _currentWingItems!.indexWhere((element) =>
                                                  element!.id.toString() ==
                                                  userProfileModel!.satsang_information!.primary_seva_wing);
                                              if (wingIndex >= 0) {
                                                _selectedCurrentWingItem = _currentWingItems![wingIndex]!;
                                              } else {
                                                _selectedCurrentWingItem = null;
                                              }

                                              _currentSecondaryWingItems = userProfileModel!.wing;
                                              final wingSecIndex = _currentSecondaryWingItems!.indexWhere((element) =>
                                                  element!.id.toString() ==
                                                  userProfileModel!.satsang_information!.secondary_seva_wing);
                                              if (wingSecIndex >= 0) {
                                                _selectedSecondaryCurrentWing =
                                                    _currentSecondaryWingItems![wingSecIndex]!;
                                              } else {
                                                _selectedSecondaryCurrentWing = null;
                                              }

                                              _tShortSizeItems = userProfileModel!.tishirtsize;
                                              final tShirtSizeIndex = _tShortSizeItems!.indexWhere((element) =>
                                                  element!.id.toString() ==
                                                  userProfileModel!.satsang_information!.t_shirt_size_id);
                                              if (tShirtSizeIndex >= 0) {
                                                _selectedTShirtSizeItem = _tShortSizeItems![tShirtSizeIndex]!;
                                              } else {
                                                _selectedTShirtSizeItem = null;
                                              }

                                              fNameError = false;
                                              lNameError = false;
                                              homeAddressError = false;
                                              cityError = false;
                                              zipCodeError = false;
                                              emailError = false;
                                              chooseRegion = false;
                                              chooseCenter = false;
                                            });
                                          },
                                          child: Text(
                                            "Cancel",
                                            style: TextStyle(
                                              fontSize: 16.2,
                                            ),
                                          ),
                                        ),
                                        CupertinoButton(
                                          padding: EdgeInsets.zero,
                                          minSize: 20,
                                          onPressed: () {
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
                                            if (selectedDate == null && _birthDate.text.isEmpty) {
                                              setState(() {
                                                birthError = true;
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
                                            if (_email.text.isEmpty && !Utils().validateEmail(_email.text)) {
                                              setState(() {
                                                emailError = true;
                                              });
                                            }
                                            if (_email.text.isNotEmpty) {
                                              _focusNodeEmail.unfocus();
                                              emailError = false;
                                              if (_firstName.text.isNotEmpty) {
                                                _focusNodeFName.unfocus();
                                                fNameError = false;
                                                if (_lastName.text.isNotEmpty) {
                                                  _focusNodeLName.unfocus();
                                                  lNameError = false;
                                                  if (_birthDate.text.isNotEmpty) {
                                                    _focusNodeDate.unfocus();
                                                    birthError = false;
                                                    if (_selectedRegion != null) {
                                                      if (_selectedCenter != null) {
                                                        if (_genderStatus != null) {
                                                          if (_selectedYear != null) {
                                                            var contactInformation = ContactInformationUP(
                                                              _firstName.text,
                                                              _middleName.text.isEmpty ? null : _middleName.text,
                                                              _lastName.text,
                                                              _email.text,
                                                              _birthDate.text,
                                                              "",
                                                              "",
                                                              _selectedRegion != null
                                                                  ? Utils()
                                                                      .nullSafeString(_selectedRegion!.id.toString())
                                                                  : "",
                                                              _selectedCenter != null
                                                                  ? Utils()
                                                                      .nullSafeString(_selectedCenter!.id.toString())
                                                                  : "",
                                                              _homeAddress.text.isEmpty ? null : _homeAddress.text,
                                                              _apartment.text.isEmpty ? null : _apartment.text,
                                                              _city.text.isEmpty ? null : _city.text,
                                                              _selectedState != null
                                                                  ? Utils()
                                                                      .nullSafeString(_selectedState!.id.toString())
                                                                  : "",
                                                              _selectedCountry != null
                                                                  ? _selectedCountry!.id.toString().toString()
                                                                  : "",
                                                              _zipCode.text.toUpperCase().isEmpty
                                                                  ? null
                                                                  : _zipCode.text,
                                                              _homePhone.text.isEmpty ? null : _homePhone.text,
                                                              _cellPhone.text.isEmpty ? null : _homePhone.text,
                                                              "",
                                                              "",
                                                            );

                                                            var familyContactInformation = FamilyContactInformationUP(
                                                              _fatherName.text.isEmpty ? null : _fatherName.text,
                                                              _fatherPhone.text.isEmpty ? null : _fatherPhone.text,
                                                              _fatherEmail.text.isEmpty ? null : _fatherEmail.text,
                                                              _motherName.text.isEmpty ? null : _motherName.text,
                                                              _motherPhone.text.isEmpty ? null : _motherPhone.text,
                                                              _motherEmail.text.isEmpty ? null : _motherEmail.text,
                                                            );
                                                            var emergencyContactInformation =
                                                                EmergencyContactInformationUP(
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

                                                            var medicalInformation = MedicalInformationUP(
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

                                                            var satsangInformation = SatsangInformationUP(
                                                              _selectedTShirtSizeItem != null
                                                                  ? Utils().nullSafeString(
                                                                      _selectedTShirtSizeItem!.id.toString())
                                                                  : null,
                                                              userProfileModel!.satsang_information!.current_wing !=
                                                                      null
                                                                  ? userProfileModel!.satsang_information!.current_wing
                                                                      .toString()
                                                                  : null,
                                                              _selectedCurrentUserWingItem != null
                                                                  ? _selectedCurrentUserWingItem!.wingName
                                                                  : null,
                                                              _satsangYear.text.isEmpty ? null : _satsangYear.text,
                                                              _selectedYear != null
                                                                  ? Utils().nullSafeString(_selectedYear!.id.toString())
                                                                  : null,
                                                              _genderStatus!,
                                                              userProfileModel!.satsang_information!.group != null
                                                                  ? userProfileModel!.satsang_information!.group
                                                                      .toString()
                                                                  : null,
                                                              userProfileModel!.satsang_information!.sub_group != null
                                                                  ? userProfileModel!.satsang_information!.sub_group
                                                                      .toString()
                                                                  : null,
                                                              _selectedCurrentWingItem != null
                                                                  ? Utils().nullSafeString(
                                                                      _selectedCurrentWingItem!.id.toString())
                                                                  : null,
                                                              _selectedSecondaryCurrentWing != null
                                                                  ? Utils().nullSafeString(
                                                                      _selectedSecondaryCurrentWing!.id.toString())
                                                                  : null,
                                                              _selectedSevaItem != null
                                                                  ? Utils()
                                                                      .nullSafeString(_selectedSevaItem!.id.toString())
                                                                  : null,
                                                              _selectedSecondarySevaItem != null
                                                                  ? Utils().nullSafeString(
                                                                      _selectedSecondarySevaItem!.id.toString())
                                                                  : null,
                                                              _undergraduateSchool.text.isEmpty
                                                                  ? null
                                                                  : _undergraduateSchool.text,
                                                              _studentType,
                                                              userProfileModel!
                                                                          .satsang_information!.major_expected_major !=
                                                                      null
                                                                  ? userProfileModel!
                                                                      .satsang_information!.major_expected_major
                                                                      .toString()
                                                                  : null,
                                                              userProfileModel!.satsang_information!.career_interest !=
                                                                      null
                                                                  ? userProfileModel!
                                                                      .satsang_information!.career_interest
                                                                      .toString()
                                                                  : null,
                                                              (bstKstMember) ? "1" : "0",
                                                              (networkingTarget) ? "1" : "0",
                                                              "",
                                                              [],
                                                              [],
                                                              [],
                                                            );

                                                            var socialMediaInformation = SocialMediaInformationUP(
                                                              _facebook.text.isEmpty ? null : _facebook.text,
                                                              _twitter.text.isEmpty ? null : _twitter.text,
                                                              _instagram.text.isEmpty ? null : _instagram.text,
                                                              _snapchat.text.isEmpty ? null : _snapchat.text,
                                                              _linkedin.text.isEmpty ? null : _linkedin.text,
                                                            );

                                                            var formData = UpdateProfileRequestModel(
                                                              Utils().nullSafeInt(loginModel!.bkms_id),
                                                              _strRecordId,
                                                              Utils().nullSafeString(
                                                                  loginModel!.login_user_type.toString()),
                                                              Utils().nullSafeString(loginModel!.login_parent_type),
                                                              Utils().nullSafeString(loginModel!.role),
                                                              contactInformation,
                                                              familyContactInformation,
                                                              emergencyContactInformation,
                                                              medicalInformation,
                                                              satsangInformation,
                                                              socialMediaInformation,
                                                            );
                                                            _showLoadingIndicator();
                                                            BlocProvider.of<UpdateProfileBloc>(context).add(
                                                              UpdateProfileEvent.updateProfile(
                                                                  formData,
                                                                  Utils()
                                                                      .nullSafeString(loginModel!.access_token)
                                                                      .toString(),
                                                                  context),
                                                            );
                                                          } else {
                                                            setState(() {
                                                              chooseYear = true;
                                                            });
                                                            // Scrollable.ensureVisible(
                                                            //     _formKey.currentState!.fields["schoolKey"]!.context,
                                                            //     alignmentPolicy:
                                                            //         ScrollPositionAlignmentPolicy.keepVisibleAtStart);
                                                            Utils().showToast('Please choose school year!');
                                                            // FocusScope.of(context).requestFocus(_focusNodeDate);
                                                            //  _focusNodeDate.requestFocus();
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
                                                    birthError = true;
                                                    Utils().showToast('Please select birth date!');

                                                    _focusNodeDate.requestFocus();
                                                  }
                                                } else {
                                                  lNameError = true;
                                                  Utils().showToast('Please enter last name!');

                                                  _focusNodeLName.requestFocus();
                                                }
                                              } else {
                                                fNameError = true;
                                                Utils().showToast('Please enter first name!');

                                                _focusNodeFName.requestFocus();
                                              }
                                            } else {
                                              emailError = true;
                                              Utils().showToast('Please enter email!');
                                              _focusNodeEmail.requestFocus();
                                            }
                                          },
                                          child: Text(
                                            "Done",
                                            style: TextStyle(fontSize: 16.2, fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    )
                                  : GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          edit = true;
                                          _centerItems = [];
                                          _center = [];
                                          _regionItems = [];
                                          _stateItems = [];
                                          _state = [];
                                          _centerItems = [];
                                          _sevaItems = [];
                                          _schoolYears = [];
                                          _currentWingItems = [];
                                          _currentSecondaryWingItems = [];
                                          _tShortSizeItems = [];

                                          _regionItems = userProfileModel!.region;
                                          final regionIndex = _regionItems!.indexWhere((element) =>
                                              element!.id.toString() ==
                                              userProfileModel!.contact_information!.region_id);
                                          if (regionIndex >= 0) {
                                            _selectedRegion = _regionItems![regionIndex]!;
                                          }
                                          _center = userProfileModel!.center;
                                          if (_selectedRegion != null) {
                                            for (int v = 0; v < _center!.length; v++) {
                                              if (_selectedRegion!.id == int.parse(_center![v]!.RegionId)) {
                                                _centerItems.add(_center![v]!);
                                              }
                                            }
                                          }

                                          final centerIndex = _centerItems.indexWhere((element) =>
                                              element!.id.toString() ==
                                              userProfileModel!.contact_information!.center_id);
                                          if (centerIndex >= 0) {
                                            _selectedCenter = _centerItems[centerIndex]!;
                                          }

                                          _countryItems = userProfileModel!.country;
                                          final countryIndex = _countryItems.indexWhere((element) =>
                                              element!.id.toString() == userProfileModel!.contact_information!.country);
                                          if (countryIndex >= 0) {
                                            _selectedCountry = _countryItems[countryIndex];
                                          }

                                          _state = userProfileModel!.state;
                                          if (_selectedCountry != null) {
                                            for (int v = 0; v < _state.length; v++) {
                                              if (_selectedCountry!.id == int.parse(_state[v]!.country_id)) {
                                                _stateItems.add(_state[v]!);
                                              }
                                            }
                                          }

                                          final stateIndex = _stateItems.indexWhere((element) =>
                                              element!.id.toString() == userProfileModel!.contact_information!.state);
                                          if (stateIndex >= 0) {
                                            _selectedState = _stateItems[stateIndex]!;
                                          }

                                          _sevaItems = userProfileModel!.seva;
                                          final sevaIndex = _sevaItems!.indexWhere((element) =>
                                              element!.id.toString() ==
                                              userProfileModel!.satsang_information!.primary_seva);
                                          if (sevaIndex >= 0) {
                                            _selectedSevaItem = _sevaItems![sevaIndex]!;
                                          }

                                          _schoolYears = userProfileModel!.school_year;
                                          final schoolIndex = _schoolYears.indexWhere((element) =>
                                              element!.id.toString() ==
                                              userProfileModel!.satsang_information!.school_year);
                                          if (schoolIndex >= 0) {
                                            _selectedYear = _schoolYears[schoolIndex]!;
                                          }

                                          _currentWingItems = userProfileModel!.wing;
                                          final wingIndex = _currentWingItems!.indexWhere((element) =>
                                              element!.id.toString() ==
                                              userProfileModel!.satsang_information!.primary_seva_wing);
                                          if (wingIndex >= 0) {
                                            _selectedCurrentWingItem = _currentWingItems![wingIndex]!;
                                          }

                                          _currentSecondaryWingItems = userProfileModel!.wing;
                                          final wingSecIndex = _currentSecondaryWingItems!.indexWhere((element) =>
                                              element!.id.toString() ==
                                              userProfileModel!.satsang_information!.secondary_seva_wing);
                                          if (wingSecIndex >= 0) {
                                            _selectedSecondaryCurrentWing = _currentSecondaryWingItems![wingSecIndex]!;
                                          }

                                          _tShortSizeItems = userProfileModel!.tishirtsize;
                                          final tShirtSizeIndex = _tShortSizeItems!.indexWhere((element) =>
                                              element!.id.toString() ==
                                              userProfileModel!.satsang_information!.t_shirt_size_id);
                                          if (tShirtSizeIndex >= 0) {
                                            _selectedTShirtSizeItem = _tShortSizeItems![tShirtSizeIndex]!;
                                          }
                                        });
                                      },
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          _isUserCanEdit
                                              ? edit
                                                  ? SizedBox()
                                                  : (personal == true || contact == true || satsang == true)
                                                      ? Row(
                                                          children: [
                                                            (widget.logOutButton)
                                                                ? CupertinoButton(
                                                                    padding: EdgeInsets.zero,
                                                                    minSize: 20,
                                                                    onPressed: () {
                                                                      setState(
                                                                        () {
                                                                          Navigator.pop(context);
                                                                        },
                                                                      );
                                                                    },
                                                                    child: Row(
                                                                      children: [
                                                                        Icon(
                                                                          Icons.arrow_back_ios,
                                                                          size: 18,
                                                                          color: Colors.lightBlue,
                                                                        ),
                                                                        Text(
                                                                          "Back",
                                                                          style: TextStyle(fontSize: 16.2),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  )
                                                                : SizedBox(),
                                                          ],
                                                        )
                                                      : SizedBox()
                                              : SizedBox(),
                                          Row(children: [
                                            Icon(
                                              Icons.edit,
                                              color: Colors.blue,
                                              size: 18,
                                            ),
                                            Text(
                                              " Edit",
                                              style: TextStyle(
                                                fontSize: 14.4,
                                                color: Colors.blue,
                                              ),
                                            ),
                                          ]),
                                        ],
                                      ),
                                    ),
                              // (!widget.logOutButton)
                              //         ? GestureDetector(
                              //             onTap: () {
                              //               _confirmLogoutDialog(context);
                              //             },
                              //             child: Row(
                              //               mainAxisAlignment: MainAxisAlignment.end,
                              //               children: [
                              //                 Padding(
                              //                   padding: const EdgeInsets.only(top: 5),
                              //                   child: Text(
                              //                     "LogOut ",
                              //                     style: TextStyle(
                              //                       color: Colors.red,
                              //                       fontSize: 16.2,
                              //                     ),
                              //                   ),
                              //                 ),
                              //                 Icon(
                              //                   Icons.logout,
                              //                   color: Colors.red,
                              //                   size: 16.2,
                              //                 ),
                              //               ],
                              //             ),
                              //           )
                              //         :
                              // (widget.logOutButton)
                              //     ? Row(
                              //         children: [
                              //           CupertinoButton(
                              //             onPressed: () {
                              //               setState(
                              //                 () {
                              //                   Navigator.pop(context);
                              //                 },
                              //               );
                              //             },
                              //             child: Row(
                              //               children: [
                              //                 Icon(
                              //                   Icons.arrow_back_ios,
                              //                   size: 21.6,
                              //                   color: Colors.lightBlue,
                              //                 ),
                              //                 Text(
                              //                   "Back",
                              //                   style: TextStyle(fontSize: 16.2),
                              //                 ),
                              //               ],
                              //             ),
                              //           ),
                              //         ],
                              //       )
                              //     : SizedBox(),
                              SizedBox(
                                height: 10,
                              ),
                              ListTile(
                                title: IntrinsicHeight(
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        children: [
                                          CircleAvatar(
                                            backgroundColor: Colors.blueGrey[50],
                                            child: Padding(
                                              padding: const EdgeInsets.all(5.0),
                                              child: (_firstName.text.isEmpty)
                                                  ? Text("")
                                                  : Text(
                                                      _firstName.text.characters.first.toUpperCase(),
                                                      style: const TextStyle(
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 500,
                                                          color: Colors.blueGrey),
                                                    ),
                                            ),
                                            radius: 25.2,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 14.4,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                _firstName.text + " " + _lastName.text,
                                                style: TextStyle(fontSize: 25.2, fontWeight: FontWeight.bold),
                                                softWrap: true,
                                              ),
                                            ),
                                            Text(
                                              _email.text,
                                              style: TextStyle(color: const Color(0xFF828282), fontSize: 13.68),
                                            ),
                                            SizedBox(
                                              height: 5.856,
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                // GestureDetector(
                                                //   onTap: () {
                                                //     showDialog(
                                                //       context: context,
                                                //       builder: (BuildContext context) {
                                                //         return CupertinoAlertDialog(
                                                //           title: Center(
                                                //             child: Text(
                                                //               'Are You Sure ?',
                                                //               style: TextStyle(fontSize: 14.4),
                                                //             ),
                                                //           ),
                                                //           content: Text(
                                                //             "Deactivating ${_firstName.text + " " + _lastName.text} will remove you from the BKMS database and prevent you from logging into the BKMS app.",
                                                //             style: TextStyle(fontSize: 13.68),
                                                //           ),
                                                //           actions: [
                                                //             CupertinoButton(
                                                //               child: Text(
                                                //                 "Cancel",
                                                //                 style: TextStyle(fontSize: 13.68),
                                                //               ),
                                                //               onPressed: () {
                                                //                 Navigator.pop(context);
                                                //               },
                                                //             ),
                                                //             CupertinoButton(
                                                //               child: Text(
                                                //                 "Deactivate",
                                                //                 style: TextStyle(
                                                //                     fontSize: 13.68,
                                                //                     color: Colors.red[500]),
                                                //               ),
                                                //               onPressed: () async {
                                                //                 Navigator.pop(context);
                                                //                 _showLoadingIndicator();
                                                //                 var formData = DeactivateUserRequestModel(
                                                //                     Utils().nullSafeString(
                                                //                       loginModel!.login_user_type.toString(),
                                                //                     ),
                                                //                     Utils()
                                                //                         .nullSafeString(loginModel!.login_parent_type),
                                                //                     Utils().nullSafeInt(loginModel!.bkms_id),
                                                //                     _strRecordId);
                                                //                 BlocProvider.of<DeactivateUserBloc>(context).add(
                                                //                   DeactivateUserEvent.deactivateUser(
                                                //                       formData,
                                                //                       Utils()
                                                //                           .nullSafeString(loginModel!.access_token)
                                                //                           .toString(),
                                                //                       context),
                                                //                 );
                                                //               },
                                                //             ),
                                                //           ],
                                                //         );
                                                //       },
                                                //     );
                                                //   },
                                                //   child: Row(
                                                //     children: [
                                                //       Icon(
                                                //         Icons.not_interested,
                                                //         size: 14.4,
                                                //         color: Colors.red[500],
                                                //       ),
                                                //       Text(
                                                //         " Deactivate",
                                                //         style: TextStyle(
                                                //             fontSize: 13.68, color: Colors.red[500]),
                                                //       ),
                                                //     ],
                                                //   ),
                                                // ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        padding: EdgeInsets.zero,
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
                                      "Email",
                                      style: TextStyle(fontSize: 10.8, color: const Color(0xFF4F4F4F)),
                                    ),
                                    (edit)
                                        ? Column(
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
                                          )
                                        : Text(
                                            _email.text,
                                            style: TextStyle(
                                              fontSize: 16.2,
                                            ),
                                          ),
                                    SizedBox(
                                      height: 14.64,
                                    ),
                                    Text(
                                      "First Name",
                                      style: TextStyle(fontSize: 10.8, color: const Color(0xFF4F4F4F)),
                                    ),
                                    (edit)
                                        ? Column(
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
                                          )
                                        : Text(
                                            _firstName.text,
                                            style: TextStyle(
                                              fontSize: 16.2,
                                            ),
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
                                    (edit)
                                        ? TextField(
                                            textInputAction: TextInputAction.next,
                                            keyboardType: TextInputType.name,
                                            controller: _middleName,
                                            decoration: InputDecoration(
                                              hintText: "Please Enter Middle Name",
                                            ),
                                          )
                                        : Text(
                                            _middleName.text,
                                            style: TextStyle(
                                              fontSize: 16.2,
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
                                    (edit)
                                        ? Column(
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
                                          )
                                        : Text(
                                            _lastName.text,
                                            style: TextStyle(
                                              fontSize: 16.2,
                                            ),
                                          ),
                                    SizedBox(
                                      height: 14.64,
                                    ),
                                    SizedBox(
                                      height: 0.732,
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
                                                color: (birthError != null && birthError) ? Colors.red : Colors.grey,
                                              ),
                                            ),
                                          )),
                                      onPressed: () {
                                        if (edit) {
                                          DateTime apiDate = DateTime.parse(_birthDate.text);
                                          selectDate(apiDate);
                                        }
                                      },
                                      child: (selectedDate != null)
                                          ? Text(Utils().changeDateFormat(selectedDate!, "dd MMMM yyyy"))
                                          : (_birthDate.text.isEmpty)
                                              ? Text("Select Birth Date")
                                              : Text(Utils()
                                                  .changeDateFormat(DateTime.parse(_birthDate.text), "dd MMMM yyyy")),
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
                                                      style: TextStyle(color: const Color(0xffEB5757), fontSize: 13.68),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        : const SizedBox(),
                                    Text(
                                      "Apartment",
                                      style: TextStyle(fontSize: 10.8, color: const Color(0xFF4F4F4F)),
                                    ),
                                    SizedBox(
                                      height: 0.732,
                                    ),
                                    (edit)
                                        ? Column(
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
                                          )
                                        : Text(
                                            _apartment.text,
                                            style: TextStyle(
                                              fontSize: 16.2,
                                            ),
                                          ),
                                    SizedBox(
                                      height: 14.64,
                                    ),
                                    Text(
                                      "Region",
                                      style: TextStyle(fontSize: 10.8, color: const Color(0xFF4F4F4F)),
                                    ),
                                    SizedBox(
                                      height: 0.732,
                                    ),
                                    (edit)
                                        ? Container(
                                            decoration: BoxDecoration(
                                              border: (chooseRegion)
                                                  ? Border.all(color: Colors.red)
                                                  : Border.all(color: Colors.transparent),
                                              borderRadius: BorderRadius.circular(3.6),
                                            ),
                                            child: DropdownButton(
                                              itemHeight: null,
                                              menuMaxHeight: 400,
                                              isExpanded: true,
                                              hint: Text(
                                                'Choose Region',
                                                style: TextStyle(color: (chooseRegion) ? Colors.red : Colors.black),
                                              ),
                                              value: _selectedRegion,
                                              onChanged: (newValue) {
                                                setState(
                                                  () {
                                                    _selectedRegion = newValue as Region;
                                                    _selectedCenter = null;
                                                    findCenter();
                                                  },
                                                );
                                              },
                                              items: _regionItems!.map((regionItem) {
                                                return DropdownMenuItem(
                                                  child: Text(
                                                    regionItem!.RegionName.trim(),
                                                    overflow: TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      fontSize: 16.2,
                                                    ),
                                                  ),
                                                  value: regionItem,
                                                );
                                              }).toList(),
                                            ),
                                          )
                                        : Text(
                                            _selectedRegion != null ? _selectedRegion!.RegionName.trim() : "",
                                            style: TextStyle(
                                              fontSize: 16.2,
                                            ),
                                          ),
                                    SizedBox(
                                      height: 14.64,
                                    ),
                                    Text(
                                      "Center",
                                      style: TextStyle(fontSize: 10.8, color: const Color(0xFF4F4F4F)),
                                    ),
                                    SizedBox(
                                      height: 0.732,
                                    ),
                                    (edit)
                                        ? Container(
                                            decoration: BoxDecoration(
                                              border: (chooseCenter)
                                                  ? Border.all(color: Colors.red)
                                                  : Border.all(color: Colors.transparent),
                                              borderRadius: BorderRadius.circular(3.6),
                                            ),
                                            child: DropdownButton(
                                              menuMaxHeight: 500,
                                              itemHeight: null,
                                              isExpanded: true,
                                              hint: Text(
                                                'Choose Center',
                                                style: TextStyle(color: (chooseCenter) ? Colors.red : Colors.black),
                                              ),
                                              value: _selectedCenter,
                                              onChanged: (newValue) {
                                                setState(() {
                                                  _selectedCenter = newValue as CenterUP;
                                                });
                                              },
                                              items: _centerItems.map((regionItem) {
                                                return DropdownMenuItem(
                                                  child: Text(regionItem!.CenterName.trim(),
                                                      overflow: TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                        fontSize: 16.2,
                                                      )),
                                                  value: regionItem,
                                                );
                                              }).toList(),
                                            ),
                                          )
                                        : Text(
                                            _selectedCenter != null ? _selectedCenter!.CenterName.trim() : "",
                                            style: TextStyle(
                                              fontSize: 16.2,
                                            ),
                                          ),
                                    SizedBox(
                                      height: 7.2,
                                    ),
                                    Text(
                                      "Home Address",
                                      style: TextStyle(fontSize: 10.8, color: const Color(0xFF4F4F4F)),
                                    ),
                                    SizedBox(
                                      height: 0.732,
                                    ),
                                    (edit)
                                        ? Column(
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
                                                  suffixIcon: (homeAddressError == true)
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
                                              (homeAddressError == true)
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
                                                                "Please enter Home Address!",
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
                                          )
                                        : Text(
                                            _homeAddress.text,
                                            style: TextStyle(
                                              fontSize: 16.2,
                                            ),
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
                                    (edit)
                                        ? Column(
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
                                                  suffixIcon: (cityError == true)
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
                                              (cityError == true)
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
                                                                "Please enter City!",
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
                                          )
                                        : Text(
                                            _city.text,
                                            style: TextStyle(
                                              fontSize: 16.2,
                                            ),
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
                                    (edit)
                                        ? DropdownButton(
                                            itemHeight: null,
                                            isExpanded: true,
                                            hint: Text(
                                              ' Choose Country',
                                            ),
                                            value: _selectedCountry,
                                            onChanged: (newValue) {
                                              setState(() {
                                                _selectedCountry = newValue as Country;
                                                _selectedState = null;
                                                findState();
                                              });
                                            },
                                            items: _countryItems.map((countryItem) {
                                              return DropdownMenuItem(
                                                child: Text(" " + countryItem!.country_name,
                                                    overflow: TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      fontSize: 16.2,
                                                    )),
                                                value: countryItem,
                                              );
                                            }).toList(),
                                          )
                                        : Text(
                                            _selectedCountry != null ? _selectedCountry!.country_name.trim() : "",
                                            style: TextStyle(
                                              fontSize: 16.2,
                                            ),
                                          ),
                                    SizedBox(
                                      height: 14.64,
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
                                                "State",
                                                style: TextStyle(fontSize: 10.8, color: const Color(0xFF4F4F4F)),
                                              ),
                                              (edit)
                                                  ? /*TextField(
                                                            controller: _state,
                                                          )*/
                                                  DropdownButton(
                                                      menuMaxHeight: 600,
                                                      itemHeight: null,
                                                      isExpanded: true,
                                                      hint: const Text('Choose State'),
                                                      value: _selectedState,
                                                      onChanged: (newValue) {
                                                        setState(() {
                                                          _selectedState = newValue as StateUP;
                                                        });
                                                      },
                                                      items: _stateItems.map((stateItem) {
                                                        return DropdownMenuItem(
                                                          child: Text(stateItem!.name.trim(),
                                                              overflow: TextOverflow.ellipsis,
                                                              style: TextStyle(
                                                                fontSize: 16.2,
                                                              )),
                                                          value: stateItem,
                                                        );
                                                      }).toList(),
                                                    )
                                                  : Text(
                                                      _selectedState != null ? _selectedState!.name.trim() : "",
                                                      style: TextStyle(
                                                        fontSize: 16.2,
                                                      ),
                                                    ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 54,
                                        ),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Zip Code",
                                                style: TextStyle(fontSize: 10.8, color: const Color(0xFF4F4F4F)),
                                              ),
                                              (edit)
                                                  ? Column(
                                                      children: [
                                                        TextField(
                                                          onChanged: (value) {
                                                            setState(() {
                                                              (value.isEmpty)
                                                                  ? zipCodeError = true
                                                                  : zipCodeError = false;
                                                            });
                                                          },
                                                          textInputAction: TextInputAction.done,
                                                          controller: _zipCode,
                                                          decoration: InputDecoration(
                                                            hintText: "Please Enter Zip Code",
                                                            suffixIcon: (zipCodeError == true)
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
                                                                        color: const Color(0x1FEB5757),
                                                                      ),
                                                                      child: Padding(
                                                                        padding: EdgeInsets.all(3.6),
                                                                        child: Text(
                                                                          "Please enter Zip Code!",
                                                                          style: TextStyle(
                                                                              color: const Color(0xffEB5757),
                                                                              fontSize: 10.8),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              )
                                                            : const SizedBox(),
                                                      ],
                                                    )
                                                  : Text(
                                                      _zipCode.text,
                                                      style: TextStyle(
                                                        fontSize: 16.2,
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
                                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                                      Expanded(
                                        flex: 2,
                                        child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Home Phone",
                                                style: TextStyle(fontSize: 10.8, color: const Color(0xFF4F4F4F)),
                                              ),
                                              SizedBox(
                                                height: 0.732,
                                              ),
                                              (edit)
                                                  ? Column(
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
                                                    )
                                                  : Text(
                                                      _homePhone.text,
                                                      style: TextStyle(
                                                        fontSize: 16.2,
                                                      ),
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
                                                style: TextStyle(fontSize: 10.8, color: const Color(0xFF4F4F4F)),
                                              ),
                                              SizedBox(
                                                height: 0.732,
                                              ),
                                              (edit)
                                                  ? Column(
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
                                                    )
                                                  : Text(
                                                      _cellPhone.text,
                                                      style: TextStyle(
                                                        fontSize: 16.2,
                                                      ),
                                                    ),
                                              SizedBox(
                                                height: 14.64,
                                              ),
                                            ]),
                                      ),
                                    ]),
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
                                    (edit)
                                        ? TextField(
                                            textInputAction: TextInputAction.done,
                                            keyboardType: TextInputType.text,
                                            controller: _fatherName,
                                            decoration: InputDecoration(
                                              hintText: "Enter Father Name",
                                            ),
                                          )
                                        : Text(
                                            _fatherName.text,
                                            style: TextStyle(
                                              fontSize: 16.2,
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
                                    (edit)
                                        ? TextField(
                                            textInputAction: TextInputAction.done,
                                            keyboardType: TextInputType.text,
                                            controller: _fatherEmail,
                                            decoration: InputDecoration(
                                              hintText: "Enter Father Email",
                                            ),
                                          )
                                        : Text(
                                            _fatherEmail.text,
                                            style: TextStyle(
                                              fontSize: 16.2,
                                            ),
                                          ),
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
                                    (edit)
                                        ? MaskedTextField(
                                            maxLength: 14,
                                            keyboardType: TextInputType.number,
                                            onChange: (val) {},
                                            mask: '(xxx) xxx-xxxx',
                                            textFieldController: _fatherPhone,
                                            inputDecoration: InputDecoration(
                                              hintText: "Enter Father Cell Phone",
                                            ),
                                          )
                                        : Text(
                                            _fatherPhone.text,
                                            style: TextStyle(
                                              fontSize: 16.2,
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
                                    (edit)
                                        ? TextField(
                                            textInputAction: TextInputAction.done,
                                            keyboardType: TextInputType.text,
                                            controller: _motherName,
                                            decoration: InputDecoration(
                                              hintText: "Enter Mother Name",
                                            ),
                                          )
                                        : Text(
                                            _motherName.text,
                                            style: TextStyle(
                                              fontSize: 16.2,
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
                                    (edit)
                                        ? TextField(
                                            textInputAction: TextInputAction.done,
                                            keyboardType: TextInputType.text,
                                            controller: _motherEmail,
                                            decoration: InputDecoration(
                                              hintText: "Enter Mother email",
                                            ),
                                          )
                                        : Text(
                                            _motherEmail.text,
                                            style: TextStyle(
                                              fontSize: 16.2,
                                            ),
                                          ),
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
                                    (edit)
                                        ? MaskedTextField(
                                            maxLength: 14,
                                            keyboardType: TextInputType.number,
                                            onChange: (val) {},
                                            mask: '(xxx) xxx-xxxx',
                                            textFieldController: _motherPhone,
                                            inputDecoration: InputDecoration(
                                              hintText: "Enter Mother Cell Phone",
                                            ),
                                          )
                                        : Text(
                                            _motherPhone.text,
                                            style: TextStyle(
                                              fontSize: 16.2,
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
                                    (edit)
                                        ? TextField(
                                            textInputAction: TextInputAction.done,
                                            keyboardType: TextInputType.text,
                                            controller: _eC1Name,
                                            decoration: InputDecoration(
                                              hintText: "Enter Name",
                                            ),
                                          )
                                        : Text(
                                            _eC1Name.text,
                                            style: TextStyle(
                                              fontSize: 16.2,
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
                                    (edit)
                                        ? TextField(
                                            textInputAction: TextInputAction.done,
                                            keyboardType: TextInputType.text,
                                            controller: _eC1Email,
                                            decoration: InputDecoration(
                                              hintText: "Enter Email",
                                            ),
                                          )
                                        : Text(
                                            _eC1Email.text,
                                            style: TextStyle(
                                              fontSize: 16.2,
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
                                    (edit)
                                        ? MaskedTextField(
                                            maxLength: 14,
                                            keyboardType: TextInputType.number,
                                            onChange: (val) {},
                                            mask: '(xxx) xxx-xxxx',
                                            textFieldController: _eC1PrimaryNumber,
                                            inputDecoration: InputDecoration(
                                              hintText: "Enter Primary Number",
                                            ),
                                          )
                                        : Text(
                                            _eC1PrimaryNumber.text,
                                            style: TextStyle(
                                              fontSize: 16.2,
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
                                    (edit)
                                        ? MaskedTextField(
                                            maxLength: 14,
                                            keyboardType: TextInputType.number,
                                            onChange: (val) {},
                                            mask: '(xxx) xxx-xxxx',
                                            textFieldController: _eC1SecondaryNumber,
                                            inputDecoration: InputDecoration(
                                              hintText: "Enter Secondary Number",
                                            ),
                                          )
                                        : Text(
                                            _eC1SecondaryNumber.text,
                                            style: TextStyle(
                                              fontSize: 16.2,
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
                                    (edit)
                                        ? TextField(
                                            textInputAction: TextInputAction.done,
                                            keyboardType: TextInputType.text,
                                            controller: _eC2Name,
                                            decoration: InputDecoration(
                                              hintText: "Enter Name",
                                            ),
                                          )
                                        : Text(
                                            _eC2Name.text,
                                            style: TextStyle(
                                              fontSize: 16.2,
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
                                    (edit)
                                        ? TextField(
                                            textInputAction: TextInputAction.done,
                                            keyboardType: TextInputType.text,
                                            controller: _eC2Email,
                                            decoration: InputDecoration(
                                              hintText: "Enter Email",
                                            ),
                                          )
                                        : Text(
                                            _eC2Email.text,
                                            style: TextStyle(
                                              fontSize: 16.2,
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
                                    (edit)
                                        ? MaskedTextField(
                                            maxLength: 14,
                                            keyboardType: TextInputType.number,
                                            onChange: (val) {},
                                            mask: '(xxx) xxx-xxxx',
                                            textFieldController: _eC2PrimaryNumber,
                                            inputDecoration: InputDecoration(
                                              hintText: "Enter Primary Number",
                                            ),
                                          )
                                        : Text(
                                            _eC2PrimaryNumber.text,
                                            style: TextStyle(
                                              fontSize: 16.2,
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
                                    (edit)
                                        ? MaskedTextField(
                                            maxLength: 14,
                                            keyboardType: TextInputType.number,
                                            onChange: (val) {},
                                            mask: '(xxx) xxx-xxxx',
                                            textFieldController: _eC2SecondaryNumber,
                                            inputDecoration: InputDecoration(
                                              hintText: "Enter Secondary Number",
                                            ),
                                          )
                                        : Text(
                                            _eC2SecondaryNumber.text,
                                            style: TextStyle(
                                              fontSize: 16.2,
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
                                    (edit)
                                        ? TextField(
                                            textInputAction: TextInputAction.done,
                                            keyboardType: TextInputType.text,
                                            controller: _allergies,
                                            decoration: InputDecoration(
                                              hintText: "Enter Allergies",
                                            ),
                                          )
                                        : Text(
                                            _allergies.text,
                                            style: TextStyle(
                                              fontSize: 16.2,
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
                                    (edit)
                                        ? TextField(
                                            textInputAction: TextInputAction.done,
                                            keyboardType: TextInputType.text,
                                            controller: _medicationsTaken,
                                            decoration: InputDecoration(
                                              hintText: "Enter Medications Taken",
                                            ),
                                          )
                                        : Text(
                                            _medicationsTaken.text,
                                            style: TextStyle(
                                              fontSize: 16.2,
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
                                    (edit)
                                        ? TextField(
                                            textInputAction: TextInputAction.done,
                                            keyboardType: TextInputType.text,
                                            controller: _medicalConditions,
                                            decoration: InputDecoration(
                                              hintText: "Enter Medical Conditions",
                                            ),
                                          )
                                        : Text(
                                            _medicalConditions.text,
                                            style: TextStyle(
                                              fontSize: 16.2,
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
                                    (edit)
                                        ? TextField(
                                            textInputAction: TextInputAction.done,
                                            keyboardType: TextInputType.text,
                                            controller: _specialMedicalInstructions,
                                            decoration: InputDecoration(
                                              hintText: "Enter Special Medical Instructions",
                                            ),
                                          )
                                        : Text(
                                            _specialMedicalInstructions.text,
                                            style: TextStyle(
                                              fontSize: 16.2,
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
                                    (edit)
                                        ? TextField(
                                            textInputAction: TextInputAction.done,
                                            keyboardType: TextInputType.text,
                                            controller: _notes,
                                            decoration: InputDecoration(
                                              hintText: "Enter Notes",
                                            ),
                                          )
                                        : Text(
                                            _notes.text,
                                            style: TextStyle(
                                              fontSize: 16.2,
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
                                    Text(
                                      "T-Shirt size",
                                      style: TextStyle(fontSize: 10.8, color: const Color(0xFF4F4F4F)),
                                    ),
                                    (edit)
                                        ? DropdownButton(
                                            menuMaxHeight: 500,
                                            itemHeight: null,
                                            isExpanded: true,
                                            hint: const Text('Choose size'),
                                            value: _selectedTShirtSizeItem,
                                            onChanged: (newValue) {
                                              setState(() {
                                                _selectedTShirtSizeItem = newValue as TShirtSize;
                                              });
                                            },
                                            items: _tShortSizeItems!.map((tShirtSizeItem) {
                                              return DropdownMenuItem(
                                                child: Text(tShirtSizeItem!.size,
                                                    overflow: TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      fontSize: 16.2,
                                                    )),
                                                value: tShirtSizeItem,
                                              );
                                            }).toList(),
                                          )
                                        : Text(
                                            _selectedTShirtSizeItem != null ? _selectedTShirtSizeItem!.size : "",
                                            style: TextStyle(
                                              fontSize: 16.2,
                                            ),
                                          ),
                                    SizedBox(
                                      height: 14.64,
                                    ),
                                    Text(
                                      "Year Entered Satsang",
                                      style: TextStyle(fontSize: 10.8, color: const Color(0xFF4F4F4F)),
                                    ),
                                    SizedBox(
                                      height: 0.732,
                                    ),
                                    (edit)
                                        ? TextField(
                                            textInputAction: TextInputAction.done,
                                            keyboardType: TextInputType.text,
                                            controller: _satsangYear,
                                            decoration: InputDecoration(
                                              hintText: "Enter Satsang Year",
                                            ),
                                          )
                                        : Text(
                                            _satsangYear.text,
                                            style: TextStyle(
                                              fontSize: 16.2,
                                            ),
                                          ),
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
                                      child: (edit)
                                          ? Row(
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
                                                          if (_genderStatus != null) {
                                                            gender = false;
                                                          }
                                                        });
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
                                                          if (_genderStatus != null) {
                                                            gender = false;
                                                          }
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          : (_genderStatus != null)
                                              ? Text(
                                                  (_genderStatus!.index == 0) ? "Male" : "Female",
                                                )
                                              : Text(""),
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
                                                      style: TextStyle(color: const Color(0xffEB5757), fontSize: 13.68),
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
                                      "School Year",
                                      style: TextStyle(fontSize: 10.8, color: const Color(0xFF4F4F4F)),
                                    ),
                                    SizedBox(
                                      height: 0.732,
                                    ),
                                    (edit)
                                        ? DropdownButton(
                                            itemHeight: null,
                                            isExpanded: true,
                                            hint: const Text('Choose School Year'),
                                            value: _selectedYear,
                                            onChanged: (newValue) {
                                              setState(() {
                                                _selectedYear = newValue as SchoolYear;
                                              });
                                            },
                                            items: _schoolYears.map((yearItem) {
                                              return DropdownMenuItem(
                                                child: Text(yearItem!.school_display_name,
                                                    overflow: TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      fontSize: 16.2,
                                                    )),
                                                value: yearItem,
                                              );
                                            }).toList(),
                                          )
                                        : Text(
                                            _selectedYear != null ? _selectedYear!.school_display_name : "",
                                            style: TextStyle(
                                              fontSize: 16.2,
                                            ),
                                          ),
                                    SizedBox(
                                      height: 14.64,
                                    ),
                                    Text(
                                      "Current Wing",
                                      style: TextStyle(fontSize: 10.8, color: const Color(0xFF4F4F4F)),
                                    ),
                                    (edit)
                                        ? DropdownButton(
                                            itemHeight: null,
                                            isExpanded: true,
                                            hint: const Text('Choose Wing'),
                                            value: _selectedCurrentUserWingItem,
                                            onChanged: null,
                                            /* (newValue) {
                                                setState(() {
                                                  _selectedCurrentUserWingItem = newValue as Wing;
                                                });
                                              },*/
                                            items: _currentUserWingItems!.map((currentUserWingItem) {
                                              return DropdownMenuItem(
                                                child: Text(currentUserWingItem!.wingName,
                                                    overflow: TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      fontSize: 16.2,
                                                    )),
                                                value: currentUserWingItem,
                                              );
                                            }).toList(),
                                          )
                                        : Text(
                                            _selectedCurrentUserWingItem != null
                                                ? _selectedCurrentUserWingItem!.wingName
                                                : "",
                                            style: TextStyle(
                                              fontSize: 16.2,
                                            ),
                                          ),
                                    SizedBox(
                                      height: 14.64,
                                    ),
                                    Text(
                                      "Group",
                                      style: TextStyle(fontSize: 10.8, color: const Color(0xFF4F4F4F)),
                                    ),
                                    (edit)
                                        ? DropdownButton(
                                            itemHeight: null,
                                            isExpanded: true,
                                            hint: const Text('Choose Group'),
                                            value: _selectedGroup,
                                            onChanged: null,
                                            /* (newValue) {
                                                setState(() {
                                                  _selectedCurrentUserWingItem = newValue as Wing;
                                                });
                                              },*/
                                            items: _groupItems!.map((groupItem) {
                                              return DropdownMenuItem(
                                                child: Text(groupItem!.group_name,
                                                    overflow: TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      fontSize: 16.2,
                                                    )),
                                                value: groupItem,
                                              );
                                            }).toList(),
                                          )
                                        : Text(
                                            _selectedGroup != null ? _selectedGroup!.group_name : "",
                                            style: TextStyle(
                                              fontSize: 16.2,
                                            ),
                                          ),
                                    SizedBox(
                                      height: 14.64,
                                    ),
                                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                                      Expanded(
                                        flex: 4,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Primary Seva",
                                              style: TextStyle(fontSize: 10.8, color: const Color(0xFF4F4F4F)),
                                            ),
                                            SizedBox(
                                              height: 0.732,
                                            ),
                                            (edit)
                                                ? DropdownButton(
                                                    menuMaxHeight: 600,
                                                    itemHeight: null,
                                                    isExpanded: true,
                                                    hint: const Text('Choose Seva'),
                                                    value: _selectedSevaItem,
                                                    onChanged: (newValue) {
                                                      setState(() {
                                                        _selectedSevaItem = newValue as Seva;
                                                      });
                                                    },
                                                    items: _sevaItems!.map((sevaItem) {
                                                      return DropdownMenuItem(
                                                        child: Text(sevaItem!.sevaName,
                                                            overflow: TextOverflow.ellipsis,
                                                            style: TextStyle(
                                                              fontSize: 16.2,
                                                            )),
                                                        value: sevaItem,
                                                      );
                                                    }).toList(),
                                                  )
                                                : Text(
                                                    _selectedSevaItem != null ? _selectedSevaItem!.sevaName : "",
                                                    style: TextStyle(
                                                      fontSize: 16.2,
                                                    ),
                                                  ),
                                            SizedBox(
                                              height: 14.64,
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      Expanded(
                                        flex: 4,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Secondary Seva",
                                              style: TextStyle(fontSize: 10.8, color: const Color(0xFF4F4F4F)),
                                            ),
                                            SizedBox(
                                              height: 0.732,
                                            ),
                                            (edit)
                                                ? DropdownButton(
                                                    menuMaxHeight: 600,
                                                    itemHeight: null,
                                                    isExpanded: true,
                                                    hint: const Text('Choose Seva'),
                                                    value: _selectedSecondarySevaItem,
                                                    onChanged: (newValue) {
                                                      setState(() {
                                                        _selectedSecondarySevaItem = newValue as Seva;
                                                      });
                                                    },
                                                    items: _sevaSecondaryItems!.map((sevaSecondaryItem) {
                                                      return DropdownMenuItem(
                                                        child: Text(sevaSecondaryItem!.sevaName,
                                                            overflow: TextOverflow.ellipsis,
                                                            style: TextStyle(
                                                              fontSize: 16.2,
                                                            )),
                                                        value: sevaSecondaryItem,
                                                      );
                                                    }).toList(),
                                                  )
                                                : Text(
                                                    _selectedSecondarySevaItem != null
                                                        ? _selectedSecondarySevaItem!.sevaName
                                                        : "",
                                                    style: TextStyle(
                                                      fontSize: 16.2,
                                                    ),
                                                  ),
                                            SizedBox(
                                              height: 14.64,
                                            )
                                          ],
                                        ),
                                      ),
                                    ]),
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
                                                style: TextStyle(fontSize: 10.8, color: const Color(0xFF4F4F4F)),
                                              ),
                                              (edit)
                                                  ? DropdownButton(
                                                      menuMaxHeight: 500,
                                                      itemHeight: null,
                                                      isExpanded: true,
                                                      hint: const Text('Choose Wing'),
                                                      value: _selectedCurrentWingItem,
                                                      onChanged: (newValue) {
                                                        setState(() {
                                                          _selectedCurrentWingItem = newValue as Wing;
                                                        });
                                                      },
                                                      items: _currentWingItems!.map((currentWingItem) {
                                                        return DropdownMenuItem(
                                                          child: Text(currentWingItem!.wingName,
                                                              overflow: TextOverflow.ellipsis,
                                                              style: TextStyle(
                                                                fontSize: 16.2,
                                                              )),
                                                          value: currentWingItem,
                                                        );
                                                      }).toList(),
                                                    )
                                                  : Text(
                                                      _selectedCurrentWingItem != null
                                                          ? _selectedCurrentWingItem!.wingName
                                                          : "",
                                                      style: TextStyle(
                                                        fontSize: 16.2,
                                                      ),
                                                    ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 30,
                                        ),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Secondary Wing",
                                                style: TextStyle(fontSize: 10.8, color: const Color(0xFF4F4F4F)),
                                              ),
                                              (edit)
                                                  ? DropdownButton(
                                                      menuMaxHeight: 500,
                                                      itemHeight: null,
                                                      isExpanded: true,
                                                      hint: const Text('Choose Wing'),
                                                      value: _selectedSecondaryCurrentWing,
                                                      onChanged: (newValue) {
                                                        setState(() {
                                                          _selectedSecondaryCurrentWing = newValue as Wing;
                                                        });
                                                      },
                                                      items: _currentSecondaryWingItems!.map((currentSecWingItem) {
                                                        return DropdownMenuItem(
                                                          child: Text(currentSecWingItem!.wingName,
                                                              overflow: TextOverflow.ellipsis,
                                                              style: TextStyle(
                                                                fontSize: 16.2,
                                                              )),
                                                          value: currentSecWingItem,
                                                        );
                                                      }).toList(),
                                                    )
                                                  : Text(
                                                      _selectedSecondaryCurrentWing != null
                                                          ? _selectedSecondaryCurrentWing!.wingName
                                                          : "",
                                                      style: TextStyle(
                                                        fontSize: 16.2,
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
                                      "Undergraduate School",
                                      style: TextStyle(fontSize: 10.8, color: const Color(0xFF4F4F4F)),
                                    ),
                                    SizedBox(
                                      height: 0.732,
                                    ),
                                    (edit)
                                        ? TextField(
                                            textInputAction: TextInputAction.done,
                                            keyboardType: TextInputType.text,
                                            controller: _undergraduateSchool,
                                            decoration: InputDecoration(
                                              hintText: "Enter Undergraduate School",
                                            ),
                                          )
                                        : Text(
                                            _undergraduateSchool.text,
                                            style: TextStyle(
                                              fontSize: 16.2,
                                            ),
                                          ),
                                    SizedBox(
                                      height: 14.64,
                                    ),
                                    Text(
                                      "Student Type",
                                      style: TextStyle(fontSize: 10.8, color: const Color(0xFF4F4F4F)),
                                    ),
                                    SizedBox(
                                      height: 0.732,
                                    ),
                                    (edit)
                                        ? Row(
                                            children: <Widget>[
                                              Expanded(
                                                flex: 5,
                                                child: ListTile(
                                                  title: const Text('Commuter'),
                                                  leading: Radio<StudentType>(
                                                    value: StudentType.commuter,
                                                    groupValue: _studentType,
                                                    onChanged: (StudentType? value) {
                                                      setState(() {
                                                        _studentType = value;
                                                        if (_studentType != null) {
                                                          gender = false;
                                                        }
                                                      });
                                                    },
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 4,
                                                child: ListTile(
                                                  title: const Text('Away'),
                                                  leading: Radio<StudentType>(
                                                    value: StudentType.away,
                                                    groupValue: _studentType,
                                                    onChanged: (StudentType? value) {
                                                      setState(() {
                                                        _studentType = value;
                                                      });
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        : (_studentType != null)
                                            ? Text(
                                                (_studentType!.index == 0) ? "Commuter" : "Away",
                                              )
                                            : Text(""),
                                    SizedBox(
                                      height: 14.64,
                                    ),
                                    Text(
                                      "Major/Expected Major",
                                      style: TextStyle(fontSize: 10.8, color: const Color(0xFF4F4F4F)),
                                    ),
                                    SizedBox(
                                      height: 0.732,
                                    ),
                                    (edit)
                                        ? TextField(
                                            textInputAction: TextInputAction.done,
                                            keyboardType: TextInputType.text,
                                            controller: _major,
                                            decoration: InputDecoration(
                                              hintText: "Enter Major/Expected Major",
                                            ),
                                          )
                                        : Text(
                                            _major.text,
                                            style: TextStyle(
                                              fontSize: 16.2,
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
                                    (edit)
                                        ? TextField(
                                            textInputAction: TextInputAction.done,
                                            keyboardType: TextInputType.text,
                                            controller: _careerInterest,
                                            decoration: InputDecoration(
                                              hintText: "Enter Career Interest",
                                            ),
                                          )
                                        : Text(
                                            _careerInterest.text,
                                            style: TextStyle(
                                              fontSize: 16.2,
                                            ),
                                          ),
                                    SizedBox(
                                      height: 14.64,
                                    ),
                                    Row(
                                      children: [
                                        Checkbox(
                                          onChanged: (edit)
                                              ? (val) {
                                                  setState(() {
                                                    bstKstMember = val!;
                                                  });
                                                }
                                              : null,
                                          value: bstKstMember,
                                        ),
                                        Expanded(
                                          child: Text(
                                            "BST/KST Member",
                                          ),
                                        ),
                                        Checkbox(
                                          onChanged: (edit)
                                              ? (val) {
                                                  setState(() {
                                                    networkingTarget = val!;
                                                  });
                                                }
                                              : null,
                                          value: networkingTarget,
                                        ),
                                        Expanded(
                                          child: Text(
                                            "Networking Individual",
                                          ),
                                        ),
                                      ],
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
                                    (edit)
                                        ? TextField(
                                            textInputAction: TextInputAction.done,
                                            keyboardType: TextInputType.text,
                                            controller: _facebook,
                                            decoration: InputDecoration(
                                              hintText: "Enter Facebook Url",
                                            ),
                                          )
                                        : (_facebook.text.isNotEmpty)
                                            ? GestureDetector(
                                                onTap: () {
                                                  lunchUrl(_facebook.text);
                                                },
                                                child: Text(
                                                  _facebook.text,
                                                  style: TextStyle(
                                                    fontSize: 16.2,
                                                  ),
                                                ),
                                              )
                                            : Text(""),
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
                                    (edit)
                                        ? TextField(
                                            textInputAction: TextInputAction.done,
                                            keyboardType: TextInputType.text,
                                            controller: _twitter,
                                            decoration: InputDecoration(
                                              hintText: "Enter Twitter Url",
                                            ),
                                          )
                                        : (_twitter.text.isNotEmpty)
                                            ? GestureDetector(
                                                onTap: () {
                                                  lunchUrl(_twitter.text);
                                                },
                                                child: Text(
                                                  _twitter.text,
                                                  style: TextStyle(
                                                    fontSize: 16.2,
                                                  ),
                                                ),
                                              )
                                            : Text(""),
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
                                    (edit)
                                        ? TextField(
                                            textInputAction: TextInputAction.done,
                                            keyboardType: TextInputType.text,
                                            controller: _snapchat,
                                            decoration: InputDecoration(
                                              hintText: "Enter Snapchat Url",
                                            ),
                                          )
                                        : (_snapchat.text.isNotEmpty)
                                            ? GestureDetector(
                                                onTap: () {
                                                  lunchUrl(_snapchat.text);
                                                },
                                                child: Text(
                                                  _snapchat.text,
                                                  style: TextStyle(
                                                    fontSize: 16.2,
                                                  ),
                                                ),
                                              )
                                            : Text(""),
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
                                    (edit)
                                        ? TextField(
                                            textInputAction: TextInputAction.done,
                                            keyboardType: TextInputType.text,
                                            controller: _instagram,
                                            decoration: InputDecoration(
                                              hintText: "Enter Instagram Url",
                                            ),
                                          )
                                        : (_instagram.text.isNotEmpty)
                                            ? GestureDetector(
                                                onTap: () {
                                                  lunchUrl(_instagram.text);
                                                },
                                                child: Text(
                                                  _instagram.text,
                                                  style: TextStyle(
                                                    fontSize: 16.2,
                                                  ),
                                                ),
                                              )
                                            : Text(""),
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
                                    (edit)
                                        ? TextField(
                                            textInputAction: TextInputAction.done,
                                            keyboardType: TextInputType.text,
                                            controller: _linkedin,
                                            decoration: InputDecoration(
                                              hintText: "Enter Linkedin Url",
                                            ),
                                          )
                                        : (_linkedin.text.isNotEmpty)
                                            ? GestureDetector(
                                                onTap: () {
                                                  lunchUrl(_linkedin.text);
                                                },
                                                child: Text(
                                                  _linkedin.text,
                                                  style: TextStyle(
                                                    fontSize: 16.2,
                                                  ),
                                                ),
                                              )
                                            : Text(""),
                                    SizedBox(
                                      height: 14.64,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 21.96,
                          ),
                          (widget.logOutButton || edit)
                              ? SizedBox()
                              : GestureDetector(
                                  onTap: () {
                                    _confirmLogoutDialog(context);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 18,
                                      right: 18,
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.circular(
                                          5,
                                        ),
                                      ),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "Logout",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16.2,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                          SizedBox(
                            height: 73.2,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(child: _isLoading ? Loader(loadingTxt: 'Please wait...') : Container())
              ]);
            } else {
              return const Center(
                child: Text(''),
              );
            }
          },
        ),
      ),
    );
  }

  //region REDIRECT TO LOGIN WHILE TOKEN IS EXPIRED
  void _redirectToLogin(BuildContext context) {
    BlocProvider.of<AuthBloc>(context).add(const AuthEvent.logOut());
    VRouter.of(context).to(Login.path, isReplacement: true);
  }

  //region SHOW CONFIRMATION DIALOG FOR LOGOUT
  Future<void> _confirmLogoutDialog(BuildContext buildContext) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: const Text('Logout'),
          content: SingleChildScrollView(
            child: Column(
              children: const <Widget>[
                Text("Are you sure, You want to Logout?"),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Yes'),
              onPressed: () {
                Navigator.of(context).pop();
                _redirectToLogin(buildContext);
              },
            ),
            TextButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
//endregion
}
