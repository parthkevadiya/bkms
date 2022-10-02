import 'package:flutter/material.dart';

class SabhaAttendanceReportNode extends StatefulWidget {
  const SabhaAttendanceReportNode({Key? key}) : super(key: key);

  @override
  _SabhaAttendanceReportNodeState createState() => _SabhaAttendanceReportNodeState();
}

class _SabhaAttendanceReportNodeState extends State<SabhaAttendanceReportNode> {
  bool _isChecked = false;
  List<Map<String, String>> _attendance = [
    {
      "image":
          "https://img.favpng.com/8/15/14/buddhist-temple-computer-icons-buddhism-clip-art-png-favpng-5G49CGTVYT3KMugQvTYG2kUDG.jpg",
      "name": "Parth kevadiya",
      "email": "p@gmail.com",
    },
    {
      "image":
          "https://img.favpng.com/8/15/14/buddhist-temple-computer-icons-buddhism-clip-art-png-favpng-5G49CGTVYT3KMugQvTYG2kUDG.jpg",
      "name": "Raj Patel",
      "email": "r@gmail.com",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: (_attendance.length == 0)
          ? Padding(
              padding: EdgeInsets.only(left: 25.2, right: 25.2, top: 10.8),
              child: Container(
                padding: EdgeInsets.all(7.2),
                decoration: BoxDecoration(
                  color: Color(0xFFF3F3F3),
                  borderRadius: BorderRadius.circular(5.4),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.not_interested,
                      size: 14.4,
                    ),
                    SizedBox(
                      width: 7.2,
                    ),
                    Text(
                      "No record found.",
                      style: TextStyle(fontSize: 12.6),
                    )
                  ],
                ),
              ),
            )
          : ListView.builder(
              padding: EdgeInsets.zero,
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: _attendance.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(left: 14.4),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isChecked = true;
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                            right: 10.8,
                          ),
                          padding: EdgeInsets.all(
                            1.62,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3.6),
                            border: Border.all(color: (_isChecked) ? Colors.green : Colors.grey, width: 1.44),
                          ),
                          child: Icon(
                            Icons.done,
                            color: (_isChecked) ? Colors.green : Colors.white,
                            size: 10.8,
                          ),
                        ),
                      ),
                      /*   Container(
                        width: 21.6,
                        height: ScreenSize.height * 0.030,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: (_isChecked == true)
                                  ? Colors.green
                                  : Colors.grey,
                              width: 1.44),
                          borderRadius: BorderRadius.all(
                            Radius.circular(3.6),
                          ),
                        ),
                        child: Checkbox(
                          value: _isChecked,
                          tristate: true,
                          checkColor: Colors.green,
                          fillColor: MaterialStateProperty.all(Colors.white),
                          onChanged: (bool? value) {
                            setState(() {
                              _isChecked = value ?? false;
                              print(_isChecked);
                            });
                          },
                        ),
                      ),*/
                      Flexible(
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 10.8, bottom: 7.2, right: 7.2),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundImage: NetworkImage(_attendance[index]["image"].toString()),
                                    radius: 27,
                                  ),
                                  SizedBox(
                                    width: 12.6,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        _attendance[index]["name"].toString(),
                                        style: TextStyle(
                                            fontSize: 16.2, color: Color(0xFF4F4F4F), fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        _attendance[index]["email"].toString(),
                                        style: TextStyle(color: Color(0xFF828282), fontSize: 13.68),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              height: 7.32,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
