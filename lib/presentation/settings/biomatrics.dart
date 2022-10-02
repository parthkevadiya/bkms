// import 'dart:io';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_app/media_query/responsive.dart';
// import 'package:flutter_app/presentation/auth/auth_bloc.dart';
// import 'package:flutter_app/presentation/lifecycle/lifecycle_manager.dart';
// import 'package:flutter_app/services/local_notification.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class Biomatrics extends StatefulWidget {
//   const Biomatrics({Key? key}) : super(key: key);
//
//   @override
//   _BiomatricsState createState() => _BiomatricsState();
// }
//
// class _BiomatricsState extends State<Biomatrics> {
//   LocalNotification localNotification = LocalNotification();
//
//   @override
//   Widget build(BuildContext context) {
//
//
//     bool biometrics = BlocProvider.of<AuthBloc>(context).state.bio;
//     return LifecycleManager(
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text("Settings Screen"),
//         ),
//         body: Padding(
//           padding: EdgeInsets.all(
//             7.2,
//           ),
//           child: Column(
//             children: [
//               Card(
//                 elevation: 5,
//                 child: ListTile(
//                   title: Text(
//                     "Biomatric",
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                   leading: Icon(
//                     Icons.fingerprint,
//                     color: Colors.lightBlue,
//                     size: MediaQuery.of(context).size.height * 0.06,
//                   ),
//                   trailing: (Platform.isIOS)
//                       ? CupertinoSwitch(
//                           value: biometrics,
//                           onChanged: (val) {
//                             setState(
//                               () {
//                                 BlocProvider.of<AuthBloc>(context).add(
//                                   AuthEvent.setbiomatric(
//                                     (!biometrics).toString(),
//                                   ),
//                                 );
//                                 (biometrics == false)
//                                     ? localNotification
//                                         .showSwitchOnNotification()
//                                     : localNotification
//                                         .showSwitchOffNotification();
//                               },
//                             );
//                           },
//                         )
//                       : Switch(
//                           activeColor: Colors.green[500],
//                           activeTrackColor: Colors.green[200],
//                           value: biometrics,
//                           inactiveThumbColor: Colors.black,
//                           inactiveTrackColor: Colors.black45,
//                           onChanged: (val) {
//                             setState(
//                               () {
//                                 print("==>Switch : $val");
//                                 BlocProvider.of<AuthBloc>(context).add(
//                                   AuthEvent.setbiomatric(
//                                     (!biometrics).toString(),
//                                   ),
//                                 );
//                                 (biometrics == false)
//                                     ? localNotification
//                                         .showSwitchOnNotification()
//                                     : localNotification
//                                         .showSwitchOffNotification();
//                               },
//                             );
//                           },
//                         ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
