import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class KaryakarGoshtiReportNode extends StatefulWidget {
  final String dateTitle;
  final String dateSubTitle;
  final String textSubTitle;
  final Color color;
  final double totalPercent;

  KaryakarGoshtiReportNode(
      {required this.dateTitle,
      required this.dateSubTitle,
      required this.color,
      required this.totalPercent,
      required this.textSubTitle});

  @override
  _KaryakarGoshtiReportNodeState createState() => _KaryakarGoshtiReportNodeState();
}

class _KaryakarGoshtiReportNodeState extends State<KaryakarGoshtiReportNode> {
  @override
  Widget build(BuildContext context) {
    late Color tagBackGroundColor;
    late Color tagTitleColor;
    late List<Color> clr;
    if (widget.totalPercent == 1.0) {
      tagBackGroundColor = Colors.green.shade50;
      tagTitleColor = Colors.green;
      clr = <Color>[
        Color(0xff3AE280),
        Color(0xffB0FFD2),
      ];
    } else if (widget.totalPercent < 1.0) {
      tagBackGroundColor = Colors.green.shade50;
      tagTitleColor = Colors.green;
      clr = <Color>[
        Color(0xffFFE69B),
        Color(0xffFFD1D1),
      ];
    }
    return ListView.builder(
      padding: EdgeInsets.zero,
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: 15,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListTile(
              leading: CircularPercentIndicator(
                animation: true,
                animationDuration: 1800,
                circularStrokeCap: CircularStrokeCap.round,
                startAngle: 0,
                percent: widget.totalPercent,
                center: (widget.totalPercent == 1.0)
                    ? Icon(
                        Icons.done_all,
                        color: Colors.green,
                        size: 21.6,
                      )
                    : Text(
                        (widget.totalPercent * 100).toInt().toString() + "%",
                        style: TextStyle(fontSize: 10.8),
                      ),
                backgroundColor: Colors.grey.shade300,
                radius: 39.6,
                lineWidth: 5.4,
                linearGradient: LinearGradient(
                  end: Alignment.topCenter,
                  begin: Alignment.bottomCenter,
                  colors: clr,
                ),
              ),
              title: Text(
                widget.dateTitle,
                style: TextStyle(fontSize: 16.2, color: Color(0xFF4F4F4F), fontWeight: FontWeight.bold),
              ),
              subtitle: Row(
                children: [
                  (widget.totalPercent < 1.0)
                      ? Text(widget.textSubTitle)
                      : Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7.2),
                            color: tagBackGroundColor,
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(3.6),
                            child: Text(
                              widget.dateSubTitle,
                              style: TextStyle(color: tagTitleColor, fontSize: 13.68),
                            ),
                          ),
                        ),
                ],
              ),
            ),
            Divider(
              height: 7.32,
            ),
          ],
        );
      },
    );
  }
}
