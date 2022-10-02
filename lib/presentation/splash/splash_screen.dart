import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/media_query/responsive.dart';
import 'package:flutter_app/models/remote_config.dart';
import 'package:flutter_app/presentation/bloc/bloc.dart';
import 'package:flutter_app/presentation/homepage/home.dart';
import 'package:flutter_app/presentation/login/login.dart';
import 'package:flutter_app/presentation/login/widgets/reset_password.dart';
import 'package:flutter_app/utils/login_status.dart';
import 'package:flutter_app/utils/util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uni_links/uni_links.dart';
import 'package:vrouter/vrouter.dart';
import '../auth/auth_bloc.dart';

class SplashPage extends StatefulWidget {
  static String path = "/";

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  String? resetPasswordDeepLink;
  bool authenticated = false;
  RemoteConfigModel? remoteConfigModel;
  LoadingStatus _loadingStatus = LoadingStatus.Initialized;

  Future<String?> initUniLinks() async {
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      final initialLink = await getInitialLink();
      // Parse the link and warn the user, if it is not correct,
      // but keep in mind it could be `null`.
      return initialLink;
    } on PlatformException {
      // Handle exception by warning the user their action did not succeed
      // return?
    }
  }

  @override
  void initState() {
    initUniLinks().then(
      (value) => this.setState(
        () {
          resetPasswordDeepLink = value;
        },
      ),
    );
    //  BlocProvider.of<AuthBloc>(context).add(AuthEvent.fetchRemoteConfig());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return MultiBlocListener(
          listeners: [
            BlocListener<AuthBloc, AuthState>(
              listener: (context, state) async {
                if (resetPasswordDeepLink == null || resetPasswordDeepLink == '') {
                  state.maybeWhen(
                      loginSuccess: (loadingStatus, isLoggedIn) {
                        if (remoteConfigModel != null && remoteConfigModel!.base_url.isNotEmpty) {
                          VRouter.of(context).to(Home.path, isReplacement: true);
                        }
                      },
                      error: (loadingStatus, message) {
                        VRouter.of(context).to(Login.path, isReplacement: true);
                      },
                      fetchRemoteConfig: (l, remoteValue) {
                        if (l == LoadingStatus.Done) {
                          setState(() {
                            remoteConfigModel = remoteValue;
                            _loadingStatus = l;
                          });
                        }
                      },
                      loading: (l) {
                        if (l == LoadingStatus.InProgress) {
                          setState(() {
                            _loadingStatus = l;
                          });
                        }
                      },
                      fetchRemoteConfigNull: (l) {
                        if (l == LoadingStatus.Error) {
                          setState(() {
                            _loadingStatus = l;
                          });
                        }
                      },
                      orElse: () {});
                } else {
                  BlocProvider.of<ParamsBloc>(context)
                      .add(SetDeepLinkValue(Utils().nullSafeString(resetPasswordDeepLink)));
                  VRouter.of(context).to(ResetPassword.path, isReplacement: true);
                }
              },
            ),
          ],
          child: SplashScreen(remoteConfigModel: remoteConfigModel, load: _loadingStatus),
        );
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  RemoteConfigModel? remoteConfigModel;
  LoadingStatus load;
  SplashScreen({
    this.remoteConfigModel,
    required this.load,
    Key? key,
  }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 100),
                child: Column(
                  children: [
                    Image(
                      image: AssetImage("img/god.png"),
                      key: Key("SplashText"),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "B A P S",
                      style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              (widget.load == LoadingStatus.Error)
                  ? Column(
                      children: [
                        IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            BlocProvider.of<AuthBloc>(context).add(
                              AuthEvent.load(),
                            );
                          },
                          icon: Icon(
                            Icons.refresh,
                            size: 30,
                          ),
                        ),
                        Text("Refresh"),
                      ],
                    )
                  : Center(
                      child: CupertinoActivityIndicator(
                      radius: 15,
                    )),
            ],
          ),
        ),
      ),
    );
  }
}
