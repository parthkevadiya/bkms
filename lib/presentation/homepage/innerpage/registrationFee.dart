import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:http/http.dart' as http;
import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/home_model.dart';
import 'package:flutter_app/models/login_model.dart';
import 'package:flutter_app/models/stripe_info_model.dart';
import 'package:flutter_app/presentation/bloc/params_bloc.dart';
import 'package:flutter_app/presentation/bloc/params_event.dart';
import 'package:flutter_app/presentation/bloc/params_state.dart';
import 'package:flutter_app/presentation/homepage/bloc/homepage_bloc.dart';
import 'package:flutter_app/presentation/homepage/innerpage/eventpage.dart';
import 'package:flutter_app/utils/constant.dart';
import 'package:flutter_app/utils/util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import '../../../loader.dart';
import '../../../models/remote_config.dart';
import '../../../models/user_profile_model.dart';
import '../../../preferences.dart';
// import 'package:pay/pay.dart' as pay;

class RegistrationFee extends StatefulWidget {
  static String id = "registrationFee";
  static String path = "${EventPage.path}/$id";

  const RegistrationFee({Key? key}) : super(key: key);

  @override
  _RegistrationFeeState createState() => _RegistrationFeeState();
}

class _RegistrationFeeState extends State<RegistrationFee> {
  StripeInfoModel? _stripeInfoModel;
  UserProfileModel? userProfileModel;
  ChopperClient c = ChopperClient();
  List<PaymentStateModel?>? _paymentStateItems;
  List<PaymentStateModel?>? _filteredPaymentStateItems;
  PaymentStateModel? _selectedPaymentState;

  List<PaymentCountryModel?>? _paymentCountryItems;
  PaymentCountryModel? _selectedPaymentCountry;

  List<RegistrationFeesModel?>? _registrationFeeItems;
  RegistrationFeesModel? _selectedRegistrationFee;

  TextEditingController _nameOnCard = TextEditingController();
  late FocusNode _focusNodeNameOnCard;
  bool? _nameOnCardError;

  TextEditingController _included = TextEditingController();
  late FocusNode _focusNodeIncluded;
  bool? _includedError;

  TextEditingController _cardNumber = TextEditingController();
  late FocusNode _focusNodeCardNumber;
  bool? _cardNumberError;

  TextEditingController _billing = TextEditingController();
  late FocusNode _focusNodeBilling;
  bool? _billingError;

  TextEditingController _city = TextEditingController();
  late FocusNode _focusNodeCity;
  bool? _cityError;

  TextEditingController _verification = TextEditingController();
  late FocusNode _focusNodeVerification;
  bool? _verificationError;

  TextEditingController _zipCode = TextEditingController();
  late FocusNode _focusNodeZipCode;
  bool? _zipCodeError;

  TextEditingController _expiryDate = TextEditingController();
  late FocusNode _focusNodeExpiryDate;
  bool? _expiryDateError;
  var _expMonth = '';
  var _expYear = '';
  Map<String, dynamic>? paymentIntentData;

  late MyEvent _myEventItem;
  int? _paymentMethodSelection;
  FirebaseRemoteConfig _remoteConfig = FirebaseRemoteConfig.instance;
  RemoteConfigModel? remoteConfigModel;

  stripeInitialization() async {
    var config = await _remoteConfig.getAll();
    remoteConfigModel = RemoteConfigModel.fromConfig(config);
    Stripe.publishableKey = remoteConfigModel?.publish_key ?? "";
    Stripe.merchantIdentifier = 'merchant.flutter.stripe.test';
    Stripe.urlScheme = 'flutterstripe';
    await Stripe.instance.applySettings();
  }

  @override
  initState() {
    super.initState();

    //FOR STRIPE
    stripeInitialization();

    _focusNodeNameOnCard = FocusNode();
    _focusNodeIncluded = FocusNode();
    _focusNodeCardNumber = FocusNode();
    _focusNodeBilling = FocusNode();
    _focusNodeCity = FocusNode();
    _focusNodeVerification = FocusNode();
    _focusNodeZipCode = FocusNode();
    _focusNodeExpiryDate = FocusNode();

    //TODO Just for Testing purpose
    _nameOnCardError = false;
    _cardNumberError = false;
    _billingError = false;
    _cityError = false;
    _verificationError = false;
    _zipCodeError = false;
    _expiryDateError = false;
    _nameOnCard.text = 'Admin';
    _cardNumber.text = '4242424242424242';
    _billing.text = 'Billing Address';
    _city.text = 'New York';
    _verification.text = '123';
    _zipCode.text = '88888';
    _expiryDate.text = '12/26';
    _expMonth = "12";
    _expYear = "26";

    final paramsBloc = BlocProvider.of<ParamsBloc>(context).state;
    if (paramsBloc is EventState) {
      _myEventItem = paramsBloc.myEvent;
    }

    _showLoadingIndicator();
    BlocProvider.of<HomeBloc>(context)
        .add(HomeEvent.stripeInfo(context, Utils().nullSafeString(_myEventItem.id.toString())));
  }

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
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<HomeBloc, HomeState>(
          listener: (context, state) {
            state.maybeWhen(
                eventRegistrationPayment: (eventPaymentModel) {
                  if (!eventPaymentModel.has_error) {
                    //FOR RETURN AFTER SUCCESSFULLY SUBMITTED REGISTRATION FEE
                    BlocProvider.of<ParamsBloc>(context)
                        .add(UpdateRegistrationStatusEvent(Constant.ertRegistrationFee));
                    Navigator.pop(context);
                  }
                },
                stripeInfo: (userProfileModel, stripeInfoModel) {
                  if (stripeInfoModel != null) {
                    _hideLoadingIndicator();
                    this.userProfileModel = userProfileModel;
                    this._stripeInfoModel = stripeInfoModel;

                    _registrationFeeItems = this._stripeInfoModel!.registration_fees!;

                    _paymentCountryItems = this._stripeInfoModel!.payment_country!;
                    final countryIndex = _paymentCountryItems!.indexWhere(
                        (element) => element!.id == this._stripeInfoModel!.current_country_record!.id.toString());
                    if (countryIndex >= 0) {
                      _selectedPaymentCountry = _paymentCountryItems![countryIndex]!;
                    }

                    _paymentStateItems = this._stripeInfoModel!.payment_state!;

                    _filteredPaymentStateItems = [];
                    if (_paymentCountryItems != null && _paymentStateItems != null) {
                      for (int v = 0; v < _paymentStateItems!.length; v++) {
                        if (_paymentCountryItems![countryIndex >= 0 ? countryIndex : 0]!.id ==
                            _paymentStateItems![v]!.country_id) {
                          _filteredPaymentStateItems!.add(_paymentStateItems![v]);
                        }
                      }
                    }

                    final stateIndex = _filteredPaymentStateItems!.indexWhere(
                        (element) => element!.id.toString() == this._stripeInfoModel!.current_state_record!.id);
                    if (stateIndex >= 0) {
                      _selectedPaymentState = _filteredPaymentStateItems![stateIndex]!;
                    }
                  }
                },
                orElse: () {});
          },
        ),
      ],
      child: KeyboardVisibilityBuilder(
        builder: (BuildContext, bool isKeyboardVisible) {
          return Stack(children: [
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
                                        "Registration Fee",
                                        style: TextStyle(fontSize: 28.08, fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5.856,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  Utils().nullSafeString(_myEventItem.name),
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 18,
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
                Expanded(
                  child: Stack(
                    children: [
                      ListView(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        children: [
                          SizedBox(
                            height: 10.98,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 3.6,
                              left: 18,
                              right: 18,
                              bottom: 3.6,
                            ),
                            child: Text(
                              "Details",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.2,
                                color: Colors.grey[900],
                              ),
                            ),
                          ),
                          Divider(
                            thickness: 1,
                          ),
                          Padding(
                            padding: EdgeInsets.all(18),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Fees",
                                            style: TextStyle(
                                              fontSize: 15.12,
                                              color: Colors.grey[900],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            _stripeInfoModel != null
                                                ? "\$${Utils().nullSafeInt(_stripeInfoModel!.payable_amonunt)}"
                                                : "",
                                            style: TextStyle(
                                              fontSize: 14.4,
                                              color: Colors.grey[800],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                // SizedBox(
                                //   height: 10.8,
                                // ),
                                // Divider(
                                //   thickness: 1,
                                // ),
                                // Row(
                                //   children: [
                                //     Expanded(
                                //       flex: 1,
                                //       child: Column(
                                //         crossAxisAlignment: CrossAxisAlignment.start,
                                //         children: [
                                //           Text(
                                //             "Include",
                                //             style: TextStyle(
                                //               fontSize: 15.12,
                                //               color: Colors.grey[900],
                                //             ),
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //     Expanded(
                                //       flex: 2,
                                //       child: Column(
                                //         crossAxisAlignment: CrossAxisAlignment.start,
                                //         children: [
                                //           TextField(
                                //             onChanged: (value) {
                                //               setState(() {
                                //                 //_includedError = value.isEmpty;
                                //                 _includedError = false;
                                //               });
                                //             },
                                //             textInputAction: TextInputAction.next,
                                //             keyboardType: TextInputType.text,
                                //             maxLines: 2,
                                //             minLines: 1,
                                //             focusNode: _focusNodeIncluded,
                                //             controller: _included,
                                //             decoration: InputDecoration(
                                //               border: InputBorder.none,
                                //               hintText: 'Enter included items',
                                //               counterText: '',
                                //               suffixIcon: (_includedError == true)
                                //                   ? Padding(
                                //                       padding: EdgeInsets.only(left: 28.8),
                                //                       child: Icon(
                                //                         Icons.warning_amber_outlined,
                                //                         color: Colors.red,
                                //                         size: 18,
                                //                       ),
                                //                     )
                                //                   : SizedBox(),
                                //             ),
                                //           ),
                                //           (_includedError == true)
                                //               ? Padding(
                                //                   padding: EdgeInsets.only(bottom: 7.2),
                                //                   child: Row(
                                //                     children: [
                                //                       Container(
                                //                         decoration: BoxDecoration(
                                //                           borderRadius: BorderRadius.circular(7.2),
                                //                           color: Color(0x1FEB5757),
                                //                         ),
                                //                         child: Padding(
                                //                           padding: EdgeInsets.all(3.6),
                                //                           child: Text(
                                //                             'Please enter Included details!',
                                //                             style: TextStyle(
                                //                                 color: Color(0xffEB5757),
                                //                                 fontSize: 9),
                                //                           ),
                                //                         ),
                                //                       ),
                                //                     ],
                                //                   ),
                                //                 )
                                //               : SizedBox(),
                                //         ],
                                //       ),
                                //     ),
                                //   ],
                                // ),
                              ],
                            ),
                          ),
                          Divider(
                            thickness: 1,
                            height: 0,
                          ),
                          Padding(
                            padding: EdgeInsets.all(18),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                // Row(
                                //   children: [
                                //     Text(
                                //       "Payment Method",
                                //       style: TextStyle(
                                //         fontWeight: FontWeight.bold,
                                //         fontSize: 16.2,
                                //         color: Colors.grey[900],
                                //       ),
                                //     ),
                                //   ],
                                // ),
                                // SizedBox(
                                //   height: 20,
                                // ),
                                // Row(
                                //   children: [
                                //     for (int i = 0; i <= 0; i++)
                                //       GestureDetector(
                                //           onTap: () {
                                //             setState(() {
                                //               _paymentMethodSelection = i;
                                //             });
                                //           },
                                //           child:
                                //               // Row(
                                //               //                                 children: [
                                //               //                                   (i == 0)
                                //               //                                       ?
                                //           //     Container(
                                //           //   height: 50,
                                //           //   width: 50,
                                //           //   margin: EdgeInsets.only(right: 10.8),
                                //           //   padding: EdgeInsets.all(5.4),
                                //           //   child: Image.asset(
                                //           //     "img/card.png",
                                //           //     color: (_paymentMethodSelection == Constant.pmCARD)
                                //           //         ? Color(0xff2D9CDB)
                                //           //         : Colors.grey,
                                //           //   ),
                                //           //   decoration: BoxDecoration(
                                //           //     gradient: LinearGradient(
                                //           //       end: Alignment.topCenter,
                                //           //       begin: Alignment.bottomCenter,
                                //           //       colors: <Color>[
                                //           //         Color(0xffFFFAEA),
                                //           //         Color(0xffE6F5FE),
                                //           //       ],
                                //           //     ),
                                //           //     border: Border.all(
                                //           //         width: 2.16,
                                //           //         color:
                                //           //             (_paymentMethodSelection == i) ? Color(0xff2D9CDB) : Colors.grey),
                                //           //     borderRadius: BorderRadius.circular(3.6),
                                //           //   ),
                                //           // )
                                //           //           : SizedBox(),
                                //           //       (i == 1 && Platform.isIOS)
                                //           //           ? Container(
                                //           //               height: 50,
                                //           //               width: 50,
                                //           //               margin: EdgeInsets.only(right: 10.8),
                                //           //               padding: EdgeInsets.all(5.4),
                                //           //               child: Image.asset(
                                //           //                 "img/applepay.png",
                                //           //                 color: (_paymentMethodSelection == Constant.pmAPPLY_PAY)
                                //           //                     ? Color(0xff2D9CDB)
                                //           //                     : Colors.grey,
                                //           //               ),
                                //           //               decoration: BoxDecoration(
                                //           //                 gradient: LinearGradient(
                                //           //                   end: Alignment.topCenter,
                                //           //                   begin: Alignment.bottomCenter,
                                //           //                   colors: <Color>[
                                //           //                     Color(0xffFFFAEA),
                                //           //                     Color(0xffE6F5FE),
                                //           //                   ],
                                //           //                 ),
                                //           //                 border: Border.all(
                                //           //                     width: 2.16,
                                //           //                     color: (_paymentMethodSelection == i)
                                //           //                         ? Color(0xff2D9CDB)
                                //           //                         : Colors.grey),
                                //           //                 borderRadius: BorderRadius.circular(3.6),
                                //           //               ),
                                //           //             )
                                //           //           : SizedBox(),
                                //           //       (i == 2)
                                //           //           ? Container(
                                //           //               height: 50,
                                //           //               width: 50,
                                //           //               margin: EdgeInsets.only(right: 10.8),
                                //           //               padding: EdgeInsets.all(5.4),
                                //           //               child: Image.asset(
                                //           //                 "img/gpay.png",
                                //           //                 color: (_paymentMethodSelection == Constant.pmGOOGLE_PAY)
                                //           //                     ? Color(0xff2D9CDB)
                                //           //                     : Colors.grey,
                                //           //               ),
                                //           //               decoration: BoxDecoration(
                                //           //                 gradient: LinearGradient(
                                //           //                   end: Alignment.topCenter,
                                //           //                   begin: Alignment.bottomCenter,
                                //           //                   colors: <Color>[
                                //           //                     Color(0xffFFFAEA),
                                //           //                     Color(0xffE6F5FE),
                                //           //                   ],
                                //           //                 ),
                                //           //                 border: Border.all(
                                //           //                     width: 2.16,
                                //           //                     color: (_paymentMethodSelection == i)
                                //           //                         ? Color(0xff2D9CDB)
                                //           //                         : Colors.grey),
                                //           //                 borderRadius: BorderRadius.circular(3.6),
                                //           //               ),
                                //           //             )
                                //           //           : SizedBox(),
                                //           //     ],
                                //           //   ),
                                //           ),
                                //   ],
                                // ),
                                SizedBox(
                                  height: 20,
                                ),
                                (remoteConfigModel?.publish_key == "" || _stripeInfoModel?.client_secret == null)
                                    ? Text(
                                        "Payment details not found\nPlease contact to administrator.",
                                        style: TextStyle(
                                          color: Colors.grey[600],
                                        ),
                                        textAlign: TextAlign.center,
                                      )
                                    : Container(
                                        width: double.infinity,
                                        child: ElevatedButton(
                                            style: ButtonStyle(
                                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(9),
                                                ),
                                              ),
                                            ),
                                            onPressed: () async {
                                              await initPaymentSheet(_stripeInfoModel, userProfileModel);
                                              // switch (_paymentMethodSelection) {
                                              //   case (null):
                                              //
                                              //   case (Constant.pmCARD):
                                              //     (_stripeInfoModel!.client_secret.isNotEmpty)
                                              //         ? await initPaymentSheet(_stripeInfoModel, userProfileModel)
                                              //         : null;
                                              //     break;
                                              //
                                              //   case (Constant.pmAPPLY_PAY):
                                              //     if (Stripe.instance.isApplePaySupported.value) {
                                              //       await applePayPayment(
                                              //           Utils().nullSafeString(_stripeInfoModel!.client_secret),
                                              //           Constant.stripeCountryCode,
                                              //           Utils().nullSafeString(_stripeInfoModel!.payment_type));
                                              //     } else {
                                              //       Utils().showToast('Apple Pay is not available in this device!');
                                              //     }
                                              //     break;
                                              //
                                              //   case (Constant.pmGOOGLE_PAY):
                                              //     if (Platform.isAndroid) {
                                              //       await googlePayPayment(
                                              //           Utils().nullSafeString(_stripeInfoModel!.client_secret),
                                              //           Constant.stripeCountryCode);
                                              //     } else {
                                              //       Utils()
                                              //           .showToast('Need Android device for GooglePay Payment gateway!');
                                              //     }
                                              //     break;
                                              // }
                                            },
                                            child:
                                                // (_paymentMethodSelection == Constant.pmCARD)
                                                //     ?
                                                Padding(
                                              padding: EdgeInsets.all(10.8),
                                              child: Text(
                                                "Pay",
                                                style: TextStyle(color: Colors.white, fontSize: 14.4),
                                              ),
                                            )
                                            // : (_paymentMethodSelection == Constant.pmAPPLY_PAY)
                                            //     ? Stack(alignment: Alignment.center, children: [
                                            //         /* Opacity(
                                            //           opacity: 1.0,
                                            //           child: pay.ApplePayButton(
                                            //             width: 200,
                                            //             paymentConfigurationAsset: 'apple_pay_payment_profile.json',
                                            //             paymentItems: [
                                            //               pay.PaymentItem(
                                            //                 label: 'Total',
                                            //                 amount:
                                            //                     _stripeInfoModel?.payable_amonunt.toString() ?? "0",
                                            //                 status: pay.PaymentItemStatus.final_price,
                                            //               )
                                            //             ],
                                            //             margin: const EdgeInsets.only(top: 15.0),
                                            //             onPaymentResult: onApplePayResult,
                                            //             loadingIndicator: const Center(
                                            //               child: CircularProgressIndicator(),
                                            //             ),
                                            //             childOnError:
                                            //                 Text('Apple Pay is not available in this device'),
                                            //             onError: (e) {
                                            //               Utils().showSnackBar(context,
                                            //                   'There was an error while trying to perform the payment');
                                            //             },
                                            //           ),
                                            //         ),*/
                                            //       ])
                                            //     : (_paymentMethodSelection == Constant.pmGOOGLE_PAY)
                                            //         ? Stack(alignment: Alignment.center, children: [
                                            //             /*Opacity(
                                            //               opacity: 1.0,
                                            //               child: pay.GooglePayButton(
                                            //                 width: 200,
                                            //                 paymentConfigurationAsset:
                                            //                     'google_pay_payment_profile.json',
                                            //                 paymentItems: [
                                            //                   pay.PaymentItem(
                                            //                     label: 'Total',
                                            //                     amount:
                                            //                         _stripeInfoModel?.payable_amonunt.toString() ??
                                            //                             "0",
                                            //                     status: pay.PaymentItemStatus.final_price,
                                            //                   )
                                            //                 ],
                                            //                 onPaymentResult: onGooglePayResult,
                                            //                 loadingIndicator: const Center(
                                            //                   child: CircularProgressIndicator(),
                                            //                 ),
                                            //                 onPressed: () async {
                                            //                   // 1. Add your stripe publishable key to assets/google_pay_payment_profile.json
                                            //                   // await debugChangedStripePublishableKey();
                                            //                 },
                                            //                 childOnError:
                                            //                     Text('Google Pay is not available in this device'),
                                            //                 onError: (e) {
                                            //                   Utils().showSnackBar(context,
                                            //                       'There was an error while trying to perform the payment');
                                            //                 },
                                            //               ),
                                            //             ),*/
                                            //           ])
                                            //         : SizedBox(),
                                            ),
                                      ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(child: _isLoading ? Loader(loadingTxt: 'Please wait...') : Container())
          ]);
        },
      ),
    );
  }

  //region FOR ON APPLY-PAY PAYMENT RESULT
  Future<void> onApplePayResult(paymentResult) async {
    if (_included.text.isNotEmpty) {
      final _pref = await Preferences.getInstance();
      LoginModel? loginModel = await _pref.getToken();

      try {
        //debugPrint(paymentResult.toString());
        // 1. Get Stripe token from payment result
        final token = await Stripe.instance.createApplePayToken(paymentResult);
        print(token);

        final params = PaymentMethodParams.cardFromToken(
          paymentMethodData: PaymentMethodDataCardFromToken(
            token: token.id,
          ), // TODO extract the actual token
        );
        // 3. Confirm Google pay payment method
        final paymentIntent =
            await Stripe.instance.confirmPayment(Utils().nullSafeString(_stripeInfoModel!.client_secret), params);
        //PAYMENT DONE
        /*_showLoadingIndicator();
        CardDetailsModel cardDetails = CardDetailsModel('', '', '', '');
        EventPaymentRequestModel eventPaymentRequestModel = EventPaymentRequestModel(
                Utils().nullSafeString(loginModel!.login_user_type.toString()),
                Utils().nullSafeString(loginModel.login_parent_type),
                Utils().nullSafeInt(loginModel.bkms_id),
                Utils().nullSafeString(_myEventItem.id.toString()),
                _stripeInfoModel != null? Utils().nullSafeInt(_stripeInfoModel!.payable_amonunt).toString(): "",
                _included.text,
                "${Constant.pmAPPLY_PAY}",
                Utils().nullSafeString(paymentIntent.id),
                paymentIntent.status == PaymentIntentsStatus.Succeeded
                    ? Constant.psSUCCESS
                    : Constant.psFAILURE,
                cardDetails);
        BlocProvider.of<HomeBloc>(context).add(HomeEvent.eventRegistrationPayment(context, eventPaymentRequestModel));*/
      } catch (e) {
        Utils().showSnackBar(context, 'Error: $e');
      }
    } else {
      setState(() {
        _includedError = true;
        _focusNodeIncluded.requestFocus();
      });
    }
  }

  Future<void> onGooglePayResult(paymentResult) async {
    if (_included.text.isNotEmpty) {
      final _pref = await Preferences.getInstance();
      LoginModel? loginModel = await _pref.getToken();

      try {
        // 1. Add your stripe publishable key to assets/google_pay_payment_profile.json
        debugPrint(paymentResult.toString());
        // 2. fetch Intent Client Secret from backend
        final token = paymentResult['paymentMethodData']['tokenizationData']['token'];
        final tokenJson = Map.castFrom(json.decode(token));
        print(tokenJson);

        final params = PaymentMethodParams.cardFromToken(
          paymentMethodData: PaymentMethodDataCardFromToken(
            token: tokenJson['id'],
          ), // TODO extract the actual token
        );

        // 3. Confirm Google pay payment method
        final paymentIntent = await Stripe.instance.confirmPayment(
          Utils().nullSafeString(_stripeInfoModel!.client_secret),
          params,
        );
        print(paymentIntent.status);

        //PAYMENT DONE
        /*_showLoadingIndicator();
        CardDetailsModel cardDetails = CardDetailsModel('', '', '', '');
        EventPaymentRequestModel eventPaymentRequestModel = EventPaymentRequestModel(
                Utils().nullSafeString(loginModel!.login_user_type.toString()),
                Utils().nullSafeString(loginModel.login_parent_type),
                Utils().nullSafeInt(loginModel.bkms_id),
                Utils().nullSafeString(_myEventItem.id.toString()),
                _stripeInfoModel != null? Utils().nullSafeInt(_stripeInfoModel!.payable_amonunt).toString(): "",
                _included.text,
                "${Constant.pmGOOGLE_PAY}",
                Utils().nullSafeString(paymentIntent.id),
                paymentIntent.status == PaymentIntentsStatus.Succeeded
                    ? Constant.psSUCCESS
                    : Constant.psFAILURE,
                cardDetails);
        BlocProvider.of<HomeBloc>(context).add(HomeEvent.eventRegistrationPayment(context, eventPaymentRequestModel));*/
      } catch (e) {
        Utils().showSnackBar(context, 'Error: $e');
      }
    } else {
      setState(() {
        _includedError = true;
        _focusNodeIncluded.requestFocus();
      });
    }
  }

  //region FOR GOOGLE PAY PAYMENT
  Future<void> googlePayPayment(String strClientSecret, String strCountryCode) async {
    final _pref = await Preferences.getInstance();
    LoginModel? loginModel = await _pref.getToken();

    if (_included.text.isNotEmpty) {
      _focusNodeIncluded.unfocus();
      _includedError = false;

      try {
        await Stripe.instance.initGooglePay(GooglePayInitParams(
            testEnv: true,
            merchantName: Utils().nullSafeString(loginModel!.f_name) + " " + Utils().nullSafeString(loginModel.l_name),
            countryCode: strCountryCode));

        await Stripe.instance.presentGooglePay(
          PresentGooglePayParams(clientSecret: strClientSecret),
        );

        //PAYMENT DONE
        /*_showLoadingIndicator();
        CardDetailsModel cardDetails = CardDetailsModel('', '', '', '');
        EventPaymentRequestModel eventPaymentRequestModel = EventPaymentRequestModel(
                Utils().nullSafeString(loginModel.login_user_type.toString()),
                Utils().nullSafeString(loginModel.login_parent_type),
                Utils().nullSafeInt(loginModel.bkms_id),
                Utils().nullSafeString(_myEventItem.id.toString()),
                _stripeInfoModel != null? Utils().nullSafeInt(_stripeInfoModel!.payable_amonunt).toString(): "",
                _included.text,
                "${Constant.pmGOOGLE_PAY}",
                Utils().nullSafeString(strClientSecret),
                Constant.psSUCCESS,
                cardDetails);
        BlocProvider.of<HomeBloc>(context).add(HomeEvent.eventRegistrationPayment(context, eventPaymentRequestModel));*/
      } catch (e) {
        Utils().showSnackBar(context, 'Error: $e');
      }
    } else {
      setState(() {
        _includedError = true;
        _focusNodeIncluded.requestFocus();
      });
    }
  }

  // region FOR START APPLE-PAY PAYMENT
  Future<void> applePayPayment(String strClientSecret, String strCountryCode, String strCurrency) async {
    final _pref = await Preferences.getInstance();
    LoginModel? loginModel = await _pref.getToken();

    if (_included.text.isNotEmpty) {
      _focusNodeIncluded.unfocus();
      _includedError = false;

      try {
        // 1. Present Apple Pay sheet
        await Stripe.instance.presentApplePay(
          ApplePayPresentParams(
            cartItems: [
              ApplePayCartSummaryItem(
                label: Utils().nullSafeString(_myEventItem.name),
                amount:
                    _stripeInfoModel != null ? Utils().nullSafeInt(_stripeInfoModel!.payable_amonunt).toString() : "",
              ),
            ],
            country: strCountryCode,
            currency: strCurrency,
          ),
        );

        // 2. Confirm apple pay payment
        await Stripe.instance.confirmApplePayPayment(strClientSecret);

        //PAYMENT DONE
        /*_showLoadingIndicator();
        CardDetailsModel cardDetails = CardDetailsModel('', '', '', '');
        EventPaymentRequestModel eventPaymentRequestModel = EventPaymentRequestModel(
                Utils().nullSafeString(loginModel!.login_user_type.toString()),
                Utils().nullSafeString(loginModel.login_parent_type),
                Utils().nullSafeInt(loginModel.bkms_id),
                Utils().nullSafeString(_myEventItem.id.toString()),
                _stripeInfoModel != null? Utils().nullSafeInt(_stripeInfoModel!.payable_amonunt).toString(): "",
                _included.text,
                "${Constant.pmAPPLY_PAY}",
                Utils().nullSafeString(strClientSecret),
                Constant.psSUCCESS,
                cardDetails);
        BlocProvider.of<HomeBloc>(context).add(HomeEvent.eventRegistrationPayment(context, eventPaymentRequestModel));*/
      } catch (e) {
        Utils().showSnackBar(context, 'Error: $e');
      }
    } else {
      setState(() {
        _includedError = true;
        _focusNodeIncluded.requestFocus();
      });
    }
  }

  createPaymentIntent(StripeInfoModel? stripe) async {
    try {
      Map<String, dynamic> body = {
        'amount': stripe?.payable_amonunt.toString(),
        'currency': stripe?.payment_type,
        'payment_method_types[]': 'card'
      };
      var response = await http.post(Uri.parse('https://api.stripe.com/v1/payment_intents'), body: body, headers: {
        // 'Authorization':
        //     'Bearer sk_test_51LApHcJYa07i9hKObM6M9ixnuygBXQAQgXVT4l3udXwtKobAbjI6z0xMB1ZXBT2K07mor7FzfYlIgpnnMMCxRTPc00mS8wuuAv',
        'Authorization': 'Bearer ${_stripeInfoModel?.client_secret ?? ""}',
        'Content-Type': 'application/x-www-form-urlencoded'
      });
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      }
    } catch (err) {
      Utils().showToast("${err.toString()}");
      print('err charging user: ${err.toString()}');
    }
  }

  Future<void> initPaymentSheet(StripeInfoModel? stripeInfoModel, UserProfileModel? userProfileModel) async {
    try {
      // 1. create payment intent on the server
      final paymentSheetData = await createPaymentIntent(
        stripeInfoModel,
      );

      // create some billingdetails
      final billingDetails = BillingDetails(
        name: userProfileModel?.contact_information?.f_name ?? "",
        email: userProfileModel?.contact_information?.email ?? "",
        phone: userProfileModel?.contact_information?.cell_phone ?? "",
        address: Address(
          city: userProfileModel?.contact_information?.city ?? "",
          country: userProfileModel?.contact_information?.country ?? "",
          line1: userProfileModel?.contact_information?.home_address ?? "",
          line2: '',
          state: userProfileModel?.contact_information?.state ?? "",
          postalCode: userProfileModel?.contact_information?.zip_code ?? "",
        ),
      ); // mocked data for tests
      // 2. initialize the payment sheet
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          // Main params
          paymentIntentClientSecret: paymentSheetData['client_secret'],
          merchantDisplayName: 'Flutter Stripe Store Demo',
          // Customer params
          customerId: paymentSheetData['customer'],
          customerEphemeralKeySecret: paymentSheetData['ephemeralKey'],
          // Extra params
          applePay: true,
          googlePay: true,
          style: ThemeMode.dark,
          billingDetails: billingDetails,
          // merchantCountryCode: 'DE',
        ),
      );
      await displayPaymentSheet(stripeInfoModel, billingDetails, paymentSheetData);
    } catch (e) {
      if (e is StripeException) {
        Utils().showToast("${e.error.localizedMessage}");
        print("Error from Stripe: ${e.error.localizedMessage}");
      } else {
        Utils().showToast("${e}");

        print("Unforeseen error: ${e}");
      }
      rethrow;
    }
  }

  Future<void> displayPaymentSheet(StripeInfoModel? stripe, BillingDetails bill, payment) async {
    try {
      // 3. display the payment sheet.
      await Stripe.instance.presentPaymentSheet();
      Utils().showToast("Payment successfully completed");

      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(
      //     backgroundColor: Colors.green,
      //     content: Text('Payment successfully completed'),
      //   ),
      // );
    } on Exception catch (e) {
      if (e is StripeException) {
        Utils().showToast("${e.error.localizedMessage}");
      } else {
        Utils().showToast("${e}");
      }
    }
  }
}
