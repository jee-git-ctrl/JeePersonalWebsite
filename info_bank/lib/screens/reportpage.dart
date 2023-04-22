import 'package:flutter/material.dart';

showReportDialog(context) {
  List<String> list = <String>['詐騙', '騷擾', '仇恨言論', 'NSFW 內容', 'spam'];
  return showDialog(
      context: context,
      builder: (context) => AlertDialog(
            content: Stack(
              children: <Widget>[
                Positioned(
                  right: -40.0,
                  top: -40.0,
                  child: InkResponse(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: CircleAvatar(
                      child: Icon(Icons.close),
                      backgroundColor: Colors.red,
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      child: TextFormField(),
                    ),
                    Container(
                      child: TextFormField(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        child: Text("送出"),
                        onPressed: () {},
                      ),
                    )
                  ],
                ),
              ],
            ),
          ));
}
