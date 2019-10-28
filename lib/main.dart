import 'package:flutter/material.dart';

void main() => runApp(MyFlutterApp());

class MyFlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "My First Flutter APP",
        home: SIForm());
  }
}

class SIForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SIFormState();
  }
}

class _SIFormState extends State<SIForm> {
  var _currencies = ["Dollar", "Euro", "Hrivna"];
  var _currentSelectedItem = 'Dollar';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("App Bar")),
      body: Container(
        child: ListView(
          children: <Widget>[
            getImageAsset(),
            Container(
              margin: EdgeInsets.all(5),
              child: Column(
                children: <Widget>[
                  editText("Name"),
                  editText("Last Name"),
                  Padding(
                      padding: EdgeInsets.only(top: 5, bottom: 5),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                              child: TextField(
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      labelText: "Last Name"))),
                          Container(
                            width: 10,
                          ),
                          Expanded(
                              child: DropdownButton<String>(
                            iconEnabledColor: Colors.purpleAccent,
                            items: _currencies.map((String dropDownItem) {
                              return DropdownMenuItem<String>(
                                  value: dropDownItem,
                                  child: Text(dropDownItem));
                            }).toList(),
                            onChanged: (String newValueSelected) {
                              setState(() {
                                this._currentSelectedItem = newValueSelected;
                              });
                            },
                            value: _currentSelectedItem,
                          ))
                        ],
                      ))
                ],
              ),
            ),
            Row(
              children: <Widget>[button("Ok"), button("Cancel")],
            )
          ],
        ),
      ),
    );
  }

  Widget editText(String text) {
    return Padding(
        padding: EdgeInsets.only(top: 5, bottom: 5),
        child: TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                labelText: "$text")));
  }

  Widget button(String text) {
    return Expanded(
        child: Padding(
            padding: EdgeInsets.all(10),
            child: RaisedButton(
                    onPressed: () {
//                  FirstScreen().someAction(context);
                    },
                    child: Text("$text"))));
  }

  Widget getImageAsset() {
    AssetImage assetImage = AssetImage("images/foto.jpeg");
    Image image = Image(image: assetImage, width: 200, height: 120);
    return  InkWell(
        onTap: () => {},
    child:Container(child: image, margin: EdgeInsets.all(20)));
  }
}
