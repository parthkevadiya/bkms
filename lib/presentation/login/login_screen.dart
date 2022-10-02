import 'package:flutter/material.dart';

import 'widgets/login_scaffold.dart';

class LoginScreen extends StatelessWidget {
  // static String id = "login";
  // static String path = "/$id";

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return LoginScaffold();
      },
    );
  }
}
