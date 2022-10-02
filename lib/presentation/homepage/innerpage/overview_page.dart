import 'package:flutter/material.dart';
import 'package:flutter_app/models/event_detail.dart';
import 'package:flutter_app/models/home_model.dart';

class OverView extends StatefulWidget {
  final MyEvent _myEventItem;
  EventDetailModel? eventDetailModel;
  OverView(this._myEventItem, this.eventDetailModel);

  @override
  _OverViewState createState() => _OverViewState();
}

class _OverViewState extends State<OverView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 219.6,
            margin: EdgeInsets.all(10),
            child: widget.eventDetailModel == null
                ? Center(child: CircularProgressIndicator())
                : widget.eventDetailModel!.image != null
                    ? Image.network(widget.eventDetailModel!.image!)
                    : null,
          ),
          Container(
            margin: EdgeInsets.all(10.8),
            child: (widget.eventDetailModel == null)
                ? Text("No Detail Found")
                : (widget.eventDetailModel!.description == null)
                    ? Text("No Detail Found")
                    : Text(
                        widget.eventDetailModel!.description ?? "",
                        style: TextStyle(
                          fontSize: 16.2,
                          color: Colors.grey[600],
                        ),
                      ),
          ),
          SizedBox(
            height: 51.24,
          )
        ],
      ),
    );
  }
}
