import 'package:flutter/material.dart';
import 'package:flutter_app/presentation/login/widgets/gradiant.dart';

import 'login_body.dart';

class LoginScaffold extends StatelessWidget {
  const LoginScaffold({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.redAccent.shade200,
        title: Center(
          child: GradientText(
            "LOGIN",
            gradient: LinearGradient(
                stops: [0.0, 1.0],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.orange.shade500,
                  Colors.orange.shade50,
                ]),
          ),
        ),
      ),
      body: const LoginBody(),
    );
  }
}
