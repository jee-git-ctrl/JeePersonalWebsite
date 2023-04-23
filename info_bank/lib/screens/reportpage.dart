import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

showReportDialog(context) {
  List<String> reason = <String>['詐騙', '騷擾', '仇恨言論', 'NSFW 內容', '洗版'];
  String? selectedValue;
  final _formKey = GlobalKey<FormState>();
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: DropdownButtonFormField2(
                    decoration: InputDecoration(
                      //Add isDense true and zero Padding.
                      //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      //Add more decoration as you want here
                      //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
                    ),
                    isExpanded: true,
                    hint: const Text(
                      '選擇理由',
                      style: TextStyle(fontSize: 14),
                    ),
                    items: reason
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ))
                        .toList(),
                    validator: (value) {
                      if (value == null) {
                        return '請選擇你的理由';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      //Do something when changing the item if you want.
                    },
                    onSaved: (value) {
                      selectedValue = value.toString();
                    },
                    buttonStyleData: const ButtonStyleData(
                      height: 60,
                      padding: EdgeInsets.only(left: 20, right: 10),
                    ),
                    iconStyleData: const IconStyleData(
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black45,
                      ),
                      iconSize: 30,
                    ),
                    dropdownStyleData: DropdownStyleData(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: const InputDecoration(hintText: '（選填）請說明理由'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    child: Text("送出"),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        );
      });
}
