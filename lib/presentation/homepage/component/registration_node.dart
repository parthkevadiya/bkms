import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/media_query/responsive.dart';
import 'package:flutter_app/utils/constant.dart';

class TimelineNode extends StatefulWidget {
  final String title;
  final String discription;
  final Color color;
  final String flag;
  final bool isLast;
  final bool canView;
  final bool canEdit;
  final String bottonText;
  final String icon;
  final Function onTap;

  TimelineNode(
      {required this.title,
      required this.discription,
      required this.color,
      required this.flag,
      required this.isLast,
      required this.canView,
      required this.canEdit,
      required this.bottonText,
      required this.icon,
      required this.onTap});

  @override
  _TimelineNodeState createState() => _TimelineNodeState();
}

class _TimelineNodeState extends State<TimelineNode> {
  @override
  Widget build(BuildContext context) {
    late Color tagBackGround;
    late Color tagTitleColor;
    late Color iconColor;
    late List<Color> clr;
    if (widget.flag == Constant.eCompleted) {
      tagBackGround = Colors.green.shade50;
      iconColor = Colors.green;
      tagTitleColor = iconColor;
      clr = <Color>[
        Color(0xffB0FFD2),
        Color(0xff3AE280),
      ];
    } else if (widget.flag == Constant.eReadyToBeCompleted) {
      tagBackGround = Colors.orange.shade50;
      iconColor = Colors.orange;
      tagTitleColor = iconColor;
      clr = <Color>[
        Color(0xffFFFAEA),
        Color(0xffFFDADA),
      ];
    } else if (widget.flag == Constant.eNotReadyYet) {
      tagBackGround = Colors.grey.shade200;
      iconColor = Colors.grey;
      tagTitleColor = iconColor;
      clr = <Color>[
        Colors.grey.shade200,
        Colors.grey.shade200,
      ];
    }
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              CircleAvatar(
                radius: 18,
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  child: Image.asset(
                    widget.icon,
                    color: iconColor,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      18,
                    ),
                    gradient: LinearGradient(
                      end: Alignment.topCenter,
                      begin: Alignment.bottomCenter,
                      colors: clr,
                    ),
                  ),
                ),
              ),
              (!widget.isLast)
                  ? Expanded(
                      child: Container(
                        width: 0,
                        decoration: DottedDecoration(shape: Shape.line, linePosition: LinePosition.left),
                      ),
                    )
                  : Container(),
            ],
          ),
          SizedBox(
            width: 10.8,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        widget.title,
                        style: TextStyle(fontSize: 12.6, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      width: 7.2,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7.2),
                        color: tagBackGround,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(3.6),
                        child: Text(
                          _getEventStatus(widget.flag),
                          style: TextStyle(color: tagTitleColor, fontSize: 12.6),
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  widget.discription,
                  style: TextStyle(fontSize: 12.6),
                ),
                (widget.flag == Constant.eReadyToBeCompleted ||
                        ((widget.canView || widget.canEdit) && widget.flag == Constant.eCompleted))
                    ? ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7.2),
                            ),
                          ),
                        ),
                        onPressed: () {
                          widget.onTap();
                        },
                        child: Text(
                          widget.bottonText,
                          style: TextStyle(fontSize: 14.4),
                        ),
                      )
                    : Container(),
                SizedBox(
                  height: 21.96,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  //region FOR GET EVENT STATUS
  String _getEventStatus(String flag) {
    String strResult = '';
    switch (flag) {
      case Constant.eNotReadyYet:
        strResult = 'Not ready yet';
        break;

      case Constant.eReadyToBeCompleted:
        strResult = 'Ready to be completed.';
        break;

      case Constant.eCompleted:
        strResult = 'Complete';
        break;
    }

    return strResult;
  }
  //endregion
}
