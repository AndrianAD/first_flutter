import 'dart:math';

import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FirstScreenState();
  }

  void someAction(BuildContext context, String message) {
    var alertDialog = AlertDialog(
      title: Text(message),
      content: Text("This is text message"),
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }
}

class _FirstScreenState extends State<Form> {
  var _currencies = ["Dollar", "Euro", "Hrivna"];
  var _currentSelectedItem = 'Dollar';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          alignment: Alignment.center,
          color: Colors.white30,
          margin: EdgeInsets.only(top: 100),
          child: Column(
            children: <Widget>[
              Text(
                generateNumber(),
                style: TextStyle(decoration: TextDecoration.none, fontSize: 20),
                textDirection: TextDirection.ltr,
              ),
              Button(),
              DropdownButton<String>(
                iconEnabledColor: Colors.purpleAccent,
                items: _currencies.map((String dropDownItem) {
                  return DropdownMenuItem<String>(
                      value: dropDownItem, child: Text(dropDownItem));
                }).toList(),
                onChanged: (String newValueSelected) {
                  setState(() {
                    this._currentSelectedItem = newValueSelected;
                  });
                },
                value: _currentSelectedItem,
              )
            ],
          )),
    );
  }
}

String generateNumber() {
  return "Your Random Number is: ${Random().nextInt(10)}";
}

List<String> getListItems() {
  return List<String>.generate(100, (counter) => "Item $counter");
}

Widget getListView() {
  var list = getListItems();
  var listView = ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return ListTile(
            onTap: () {
              debugPrint("${list[index]} was cliked");
            },
            title: Text(list[index]));
      });
  return listView;
}

class Button extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        color: Colors.purpleAccent,
        elevation: 6,
        onPressed: () {
          FirstScreen().someAction(context,"some text");
        },
        child: Text("Click"),
      ),
    );
  }
}
