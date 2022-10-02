import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LoginForm extends StatefulWidget {
  LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String _loadHTML() {
    return r'''
      <html>
        <body onload="document.forms['submit_form'].submit()">
        <form name="submit_form" /ngcontent-myn-c13="" /ngnoform=""
        method="post" action="https://ims.dev.na.baps.org/sso-v2/">
        <input /ngcontent-myn-c13="" type="hidden" name="client_id"
        value="BAB84BB7-FAB3-4A1C-B6FD-7125C9E63500"><input /_ngcontent-myn-c13=""
        type="hidden" name="client_key" value="A4EC943A-CFCC-4142-8857-E0C294ED8842">
        </form>
        </body>
      </html>
    ''';
  }

  @override
  Widget build(BuildContext context) {
    return WebView(
      onPageFinished: (url) {
        Uri redirect = Uri.parse(url);
        if (url.startsWith("https://ims.dev.na.baps.org/ems-web")) {
          final op = jsonDecode(
            jsonEncode(
              redirect.queryParameters['auth'],
            ),
          );
          String token = jsonDecode(op)["token"];
          // Map<String, dynamic> profileJason = JwtDecoder.decode(token);
          // Ram ram = Ram.fromJson(profileJason);
          // print(ram.pid);
          print("====>" + token + "<===");
          //    var formData = LoginRequestModel(token);
          //    BlocProvider.of<AuthBloc>(context).add(
          //      AuthEvent.logIn(formData),
          //    );
        }
      },
      javascriptMode: JavascriptMode.unrestricted,
      initialUrl:
          Uri.dataFromString(_loadHTML(), mimeType: 'text/html').toString(),
    );
  }
}
