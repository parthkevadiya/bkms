import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  Loader(
      {Key? key,
      this.opacity: 0.5,
      this.dismissibles: false,
      this.color: Colors.black,
      this.loadingTxt: 'Loading...'})
      : super(key: key);

  final double opacity;
  final bool dismissibles;
  final Color color;
  final String loadingTxt;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Opacity(
          opacity: opacity,
          child: const ModalBarrier(dismissible: false, color: Colors.black),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Theme(
                    data: ThemeData(
                        cupertinoOverrideTheme:
                            CupertinoThemeData(brightness: Brightness.dark)),
                    child: CupertinoActivityIndicator(
                      radius: 15,
                    ))),
            Container(
              margin: const EdgeInsets.only(top: 5),
              child: Text(loadingTxt,
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.7), fontSize: 18)),
            ),
          ],
        ),
      ],
    );
  }
}
