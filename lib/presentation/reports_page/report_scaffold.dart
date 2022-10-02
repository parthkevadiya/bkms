// import 'package:flutter/material.dart';
// import 'package:flutter_app/media_query/responsive.dart';
// import 'package:flutter_app/presentation/reports_page/inner_page/karyakar_goshti_report.dart';
// import 'package:flutter_app/presentation/reports_page/inner_page/networking_report.dart';
// import 'package:flutter_app/presentation/reports_page/inner_page/sabha_report.dart';
// import 'package:percent_indicator/percent_indicator.dart';
// import 'package:vrouter/vrouter.dart';
//
// class ReportScaffold extends StatefulWidget {
//   const ReportScaffold({Key? key}) : super(key: key);
//
//   @override
//   _ReportScaffoldState createState() => _ReportScaffoldState();
// }
//
// class _ReportScaffoldState extends State<ReportScaffold> {
//   @override
//   Widget build(BuildContext context) {
//
//
//     return SafeArea(
//       child: Column(
//         children: [
//           Container(
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 end: Alignment.topCenter,
//                 begin: Alignment.bottomCenter,
//                 colors: <Color>[
//                   Color(0xffFFFAEA),
//                   Color(0xffE6F5FE),
//                 ],
//               ),
//             ),
//             child: SafeArea(
//               left: false,
//               bottom: false,
//               right: false,
//               child: Padding(
//                 padding: EdgeInsets.only(
//                     top: 18,
//                     left: 14.4,
//                     right: 14.4,
//                     bottom: 25.2),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Expanded(
//                       child: Text(
//                         "Reports",
//                         style: TextStyle(
//                             fontSize: 28.8,
//                             fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             child: ListView(
//               physics: BouncingScrollPhysics(),
//               padding: EdgeInsets.only(top: 21.96),
//               children: [
//                 GestureDetector(
//                   behavior: HitTestBehavior.opaque,
//                   onTap: () {
//                     VRouter.of(context).to(SabhaReport.id);
//                   },
//                   child: Padding(
//                     padding: EdgeInsets.only(
//                       left: 18,
//                       right: 18,
//                       bottom: 3.6,
//                     ),
//                     child: Row(
//                       children: [
//                         Expanded(
//                           child: Row(
//                             children: [
//                               Flexible(
//                                 child: Text(
//                                   "Sabha",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                               ),
//                               SizedBox(
//                                 width: 3.6,
//                               ),
//                               Container(
//                                 padding: EdgeInsets.symmetric(
//                                     horizontal: 9,
//                                     vertical: 5.124),
//                                 decoration: BoxDecoration(
//                                   color: Colors.grey[300],
//                                   borderRadius: BorderRadius.circular(
//                                       18),
//                                 ),
//                                 child: Text(
//                                   "21",
//                                   style: TextStyle(
//                                       fontSize: 10.8,
//                                       color: Colors.grey[600]),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Icon(Icons.arrow_forward_ios),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Divider(),
//                 Padding(
//                   padding: EdgeInsets.only(
//                       left: 3.6,
//                       right: 3.6),
//                   child: Column(
//                     children: [
//                       ListTile(
//                         leading: CircularPercentIndicator(
//                           animation: true,
//                           animationDuration: 1800,
//                           circularStrokeCap: CircularStrokeCap.round,
//                           startAngle: 0,
//                           percent: 0.72,
//                           center: Text(
//                             "72%",
//                             style: TextStyle(
//                                 color: Colors.orange,
//                                 fontSize: 10.8),
//                           ),
//                           backgroundColor: Colors.grey.shade300,
//                           radius: 39.6,
//                           lineWidth: 5.4,
//                           linearGradient: LinearGradient(
//                             end: Alignment.topCenter,
//                             begin: Alignment.bottomCenter,
//                             colors: <Color>[
//                               Color(0xffFFE69B),
//                               Color(0xffFFD1D1),
//                             ],
//                           ),
//                         ),
//                         title: Text(
//                           "February 13,2021",
//                           style: TextStyle(
//                               fontSize: 16.2,
//                               color: Color(0xFF4F4F4F),
//                               fontWeight: FontWeight.bold),
//                         ),
//                         subtitle: Text(
//                           "San Jose",
//                           style: TextStyle(
//                               color: Color(0xFF828282),
//                               fontSize: 13.68),
//                         ),
//                       ),
//                       Divider(
//                         height: 0,
//                         indent: 18,
//                         endIndent: 18,
//                       ),
//                       ListTile(
//                         leading: CircularPercentIndicator(
//                           animation: true,
//                           animationDuration: 1800,
//                           circularStrokeCap: CircularStrokeCap.round,
//                           startAngle: 0,
//                           percent: 1.00,
//                           center: Icon(
//                             Icons.done_all,
//                             color: Color(0xff45e588),
//                             size: 21.6,
//                           ),
//                           backgroundColor: Colors.grey.shade300,
//                           radius: 39.6,
//                           lineWidth: 5.4,
//                           linearGradient: LinearGradient(
//                             end: Alignment.topCenter,
//                             begin: Alignment.bottomCenter,
//                             colors: <Color>[
//                               Color(0xff3AE280),
//                               Color(0xffB0FFD2),
//                             ],
//                           ),
//                         ),
//                         title: Text(
//                           "February 06,2021",
//                           style: TextStyle(
//                               fontSize: 16.2,
//                               color: Color(0xFF4F4F4F),
//                               fontWeight: FontWeight.bold),
//                         ),
//                         subtitle: Row(
//                           children: [
//                             Expanded(
//                               child: Row(
//                                 children: [
//                                   Flexible(
//                                     child: Text(
//                                       "San Jose",
//                                       style: TextStyle(
//                                           color: Color(0xFF828282),
//                                           fontSize: 13.68),
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     width: 7.2,
//                                   ),
//                                   Container(
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(
//                                           7.2),
//                                       color: Colors.green[50],
//                                     ),
//                                     child: Padding(
//                                       padding:
//                                           EdgeInsets.all(3.6),
//                                       child: Text(
//                                         "Complete",
//                                         style: TextStyle(
//                                             color: Colors.green,
//                                             fontSize: 13.68),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Divider(
//                         indent: 18,
//                         endIndent: 18,
//                       ),
//                       GestureDetector(
//                         // behavior: HitTestBehavior.opaque,
//                         onTap: () {
//                           VRouter.of(context).to(SabhaReport.id);
//                         },
//                         child: Padding(
//                           padding: EdgeInsets.only(left: 18),
//                           child: Row(
//                             children: [
//                               Expanded(
//                                 child: Row(
//                                   children: [
//                                     Flexible(
//                                       child: Text(
//                                         "+" + "21" + " more",
//                                         style: TextStyle(
//                                             fontSize: 13.68),
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       width: 7.2,
//                                     ),
//                                     Icon(
//                                       Icons.arrow_forward_ios,
//                                       size: 14.4,
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 21.96,
//                 ),
//                 GestureDetector(
//                   behavior: HitTestBehavior.opaque,
//                   onTap: () {
//                     VRouter.of(context).to(NetworkReport.id);
//                   },
//                   child: Padding(
//                     padding: EdgeInsets.only(
//                       top: 3.6,
//                       left: 18,
//                       right: 18,
//                       bottom: 3.6,
//                     ),
//                     child: Row(
//                       children: [
//                         Expanded(
//                           child: Row(
//                             children: [
//                               Flexible(
//                                 child: Text(
//                                   "Networking",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                               ),
//                               SizedBox(
//                                 width: 3.6,
//                               ),
//                               Container(
//                                 padding: EdgeInsets.symmetric(
//                                     horizontal: 9,
//                                     vertical: 5.124),
//                                 decoration: BoxDecoration(
//                                   color: Colors.grey[300],
//                                   borderRadius: BorderRadius.circular(
//                                       18),
//                                 ),
//                                 child: Text(
//                                   "1",
//                                   style: TextStyle(
//                                       fontSize: 10.8,
//                                       color: Colors.grey[600]),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Icon(Icons.arrow_forward_ios),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Divider(),
//                 Padding(
//                   padding: EdgeInsets.only(
//                       left: 3.6,
//                       right: 3.6),
//                   child: Column(
//                     children: [
//                       ListTile(
//                         leading: CircularPercentIndicator(
//                           animation: true,
//                           animationDuration: 1800,
//                           circularStrokeCap: CircularStrokeCap.round,
//                           startAngle: 0,
//                           percent: 0.72,
//                           center: Text(
//                             "72%",
//                             style: TextStyle(
//                                 color: Colors.orange,
//                                 fontSize: 10.8),
//                           ),
//                           backgroundColor: Colors.grey.shade300,
//                           radius: 39.6,
//                           lineWidth: 5.4,
//                           linearGradient: LinearGradient(
//                             end: Alignment.topCenter,
//                             begin: Alignment.bottomCenter,
//                             colors: <Color>[
//                               Color(0xffFFE69B),
//                               Color(0xffFFD1D1),
//                             ],
//                           ),
//                         ),
//                         title: Text(
//                           "Diwali",
//                           style: TextStyle(
//                               fontSize: 16.2,
//                               color: Color(0xFF4F4F4F),
//                               fontWeight: FontWeight.bold),
//                         ),
//                         subtitle: Text(
//                           "San Jose",
//                           style: TextStyle(
//                               color: Color(0xFF828282),
//                               fontSize: 13.68),
//                         ),
//                       ),
//                       Divider(
//                         indent: 18,
//                         endIndent: 18,
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 14.64,
//                 ),
//                 GestureDetector(
//                   behavior: HitTestBehavior.opaque,
//                   onTap: () {
//                     VRouter.of(context).to(KaryakarGoshtiReport.id);
//                   },
//                   child: Padding(
//                     padding: EdgeInsets.only(
//                       top: 3.6,
//                       left: 18,
//                       right: 18,
//                       bottom: 3.6,
//                     ),
//                     child: Row(
//                       children: [
//                         Expanded(
//                           child: Row(
//                             children: [
//                               Flexible(
//                                 child: Text(
//                                   "Karyakar Goshti",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Icon(Icons.arrow_forward_ios),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Divider(),
//                 Padding(
//                   padding: EdgeInsets.only(
//                       left: 3.6,
//                       right: 3.6),
//                   child: Column(
//                     children: [
//                       ListTile(
//                         leading: CircularPercentIndicator(
//                           animation: true,
//                           animationDuration: 1800,
//                           circularStrokeCap: CircularStrokeCap.round,
//                           startAngle: 0,
//                           percent: 1.0,
//                           center: Icon(
//                             Icons.done_all,
//                             color: Color(0xff45e588),
//                             size: 21.6,
//                           ),
//                           backgroundColor: Colors.grey.shade300,
//                           radius: 39.6,
//                           lineWidth: 5.4,
//                           linearGradient: LinearGradient(
//                             end: Alignment.topCenter,
//                             begin: Alignment.bottomCenter,
//                             colors: <Color>[
//                               Color(0xff3AE280),
//                               Color(0xffB0FFD2),
//                             ],
//                           ),
//                         ),
//                         title: Text(
//                           "January",
//                           style: TextStyle(
//                               fontSize: 16.2,
//                               color: Color(0xFF4F4F4F),
//                               fontWeight: FontWeight.bold),
//                         ),
//                         subtitle: Row(
//                           children: [
//                             Expanded(
//                               child: Row(
//                                 children: [
//                                   Flexible(
//                                     child: Text(
//                                       "San Jose",
//                                       style: TextStyle(
//                                           color: Color(0xFF828282),
//                                           fontSize: 13.68),
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     width: 7.2,
//                                   ),
//                                   Container(
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(
//                                           7.2),
//                                       color: Colors.green[50],
//                                     ),
//                                     child: Padding(
//                                       padding:
//                                           EdgeInsets.all(3.6),
//                                       child: Text(
//                                         "Complete",
//                                         style: TextStyle(
//                                             color: Colors.green,
//                                             fontSize: 13.68),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Divider(
//                         height: 0,
//                         indent: 18,
//                         endIndent: 18,
//                       ),
//                       ListTile(
//                         leading: CircularPercentIndicator(
//                           animation: true,
//                           animationDuration: 1800,
//                           circularStrokeCap: CircularStrokeCap.round,
//                           startAngle: 0,
//                           percent: 1.00,
//                           center: Icon(
//                             Icons.done_all,
//                             color: Color(0xff45e588),
//                             size: 21.6,
//                           ),
//                           backgroundColor: Colors.grey.shade300,
//                           radius: 39.6,
//                           lineWidth: 5.4,
//                           linearGradient: LinearGradient(
//                             end: Alignment.topCenter,
//                             begin: Alignment.bottomCenter,
//                             colors: <Color>[
//                               Color(0xff3AE280),
//                               Color(0xffB0FFD2),
//                             ],
//                           ),
//                         ),
//                         title: Text(
//                           "December",
//                           style: TextStyle(
//                               fontSize: 16.2,
//                               color: Color(0xFF4F4F4F),
//                               fontWeight: FontWeight.bold),
//                         ),
//                         subtitle: Row(
//                           children: [
//                             Expanded(
//                               child: Row(
//                                 children: [
//                                   Flexible(
//                                     child: Text(
//                                       "San Jose",
//                                       style: TextStyle(
//                                           color: Color(0xFF828282),
//                                           fontSize: 13.68),
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     width: 7.2,
//                                   ),
//                                   Container(
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(
//                                           7.2),
//                                       color: Colors.green[50],
//                                     ),
//                                     child: Padding(
//                                       padding:
//                                           EdgeInsets.all(3.6),
//                                       child: Text(
//                                         "Complete",
//                                         style: TextStyle(
//                                             color: Colors.green,
//                                             fontSize: 13.68),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Divider(
//                         indent: 18,
//                         endIndent: 18,
//                       ),
//                       GestureDetector(
//                         //behavior: HitTestBehavior.opaque,
//                         onTap: () {
//                           VRouter.of(context).to(KaryakarGoshtiReport.id);
//                         },
//                         child: Padding(
//                           padding: EdgeInsets.only(left: 18),
//                           child: Row(
//                             children: [
//                               Expanded(
//                                 child: Row(
//                                   children: [
//                                     Flexible(
//                                       child: Text(
//                                         "+" + "21" + " more",
//                                         style: TextStyle(
//                                             fontSize: 13.68),
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       width: 7.2,
//                                     ),
//                                     Icon(
//                                       Icons.arrow_forward_ios,
//                                       size: 14.4,
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         7.32,
//                       )
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
