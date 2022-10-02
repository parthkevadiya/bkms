import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_app/presentation/bloc/bloc.dart';
import 'package:flutter_app/presentation/lifecycle/local_auth_api.dart';
import 'package:flutter_app/presentation/login/widgets/reset_password.dart';
import 'package:flutter_app/utils/failure.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:move_to_background/move_to_background.dart';
import 'package:uni_links/uni_links.dart';
import 'package:vrouter/vrouter.dart';

import '../../preferences.dart';

class LifecycleManager extends StatefulWidget {
  final Widget child;

  const LifecycleManager({Key? key, required this.child}) : super(key: key);

  @override
  _LifecycleManagerState createState() => _LifecycleManagerState();
}

class _LifecycleManagerState extends State<LifecycleManager> with WidgetsBindingObserver {
  bool stateStatus = true;

  StreamSubscription? _sub;

  var check;
  String? resetPasswordDeepLink;
  int count = 0;

  Future<void> initUniLinks() async {
    _sub = linkStream.listen((String? link) {
      if (link != null) {
        resetPasswordDeepLink = link;
        // if (state == AppLifecycleState.inactive && stateStatus) stateStatus = false;
        resume();
      }
    }, onError: (err) {});
  }

  // Future<String?> initUniLinks() async {
  //   // Platform messages may fail, so we use a try/catch PlatformException.
  //   try {
  //     final initialLink = await getInitialLink();
  //     // Parse the link and warn the user, if it is not correct,
  //     // but keep in mind it could be `null`.
  //     return initialLink;
  //   } on PlatformException {
  //     // Handle exception by warning the user their action did not succeed
  //     // return?
  //   }
  // }

  @override
  void initState() {
    WidgetsBinding.instance!.addObserver(this);
    super.initState();
    initUniLinks();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    _sub?.cancel();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // initUniLinks().then(
    //   (value) => this.setState(
    //     () {
    //       resetPasswordDeepLink = value;
    if (state == AppLifecycleState.inactive && stateStatus) stateStatus = false;
    resume();
    //     },
    //   ),
    // );
  }

  resume() async {
    if (resetPasswordDeepLink != null) {
      count++;
      if (count == 1) {
        BlocProvider.of<ParamsBloc>(context).add(SetDeepLinkValue(resetPasswordDeepLink!));
        VRouter.of(context).to(ResetPassword.path, isReplacement: true);
      }
    } else {
      bool isAvailable = await LocalAuthApi.hasBiometrics();
      final _pref = await Preferences.getInstance();
      bool bio = _pref.getBioMatric();
      if (isAvailable && bio) {
        if (Platform.isIOS && stateStatus == false) {
          final authenticated = await LocalAuthApi.authenticate();
          check = authenticated.fold(
            (l) => InternalFailure(),
            (r) => r,
          );
        } else {
          final authenticated = await LocalAuthApi.authenticate();
          check = authenticated.fold(
            (l) => InternalFailure(),
            (r) => r,
          );
        }
        if (check == false) {
          if (Platform.isAndroid) {
            MoveToBackground.moveTaskToBack();
          }
        }
      }
    }
  }
}
