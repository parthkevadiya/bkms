import 'package:flutter/material.dart';

class SabhaQuectionReportNode extends StatefulWidget {
  const SabhaQuectionReportNode({Key? key}) : super(key: key);

  @override
  _SabhaQuectionReportNodeState createState() => _SabhaQuectionReportNodeState();
}

class _SabhaQuectionReportNodeState extends State<SabhaQuectionReportNode> {
  String both = "both";
  String yes = "yes";
  String no = "no";
  double voterTotal = 0.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Was at least one group sabha/hangout held?",
          style: TextStyle(
            fontSize: 16.2,
            color: Colors.grey[700],
            fontWeight: FontWeight.bold,
          ),
        ),
        Divider(
          thickness: 1,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  both = yes;
                });
              },
              child: Container(
                margin: EdgeInsets.only(right: 7.2),
                padding: EdgeInsets.all(1.44),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: (both == yes) ? Colors.blue : Colors.grey, width: 1.44),
                ),
                child: Icon(
                  Icons.done,
                  color: (both == yes) ? Colors.blue : Colors.grey,
                  size: 10.8,
                ),
              ),
            ),
            Text(
              "Yes",
              style: TextStyle(fontSize: 14.4, color: (both == yes) ? Colors.blue : Colors.grey),
            ),
          ],
        ),
        SizedBox(
          height: 7.32,
        ),
        Row(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  both = no;
                });
              },
              child: Container(
                margin: EdgeInsets.only(right: 7.2),
                padding: EdgeInsets.all(1.44),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: (both == no) ? Colors.blue : Colors.grey, width: 1.44),
                ),
                child: Icon(
                  Icons.done,
                  color: (both == no) ? Colors.blue : Colors.grey,
                  size: 10.8,
                ),
              ),
            ),
            Text(
              "No",
              style: TextStyle(fontSize: 14.4, color: (both == no) ? Colors.blue : Colors.grey),
            ),
          ],
        ),
        SizedBox(
          height: 29.28,
        ),
      ],
    );
  }
}
