import 'package:flutter/material.dart';
import 'package:project2b/Models/Recieve.dart';
import 'package:project2b/Screen/AdminDetail.dart';
import 'package:project2b/Service/EmergenceService.dart';

class ReceivePopup extends StatefulWidget {
  int? callid;
  ReceivePopup({Key? key, required this.callid}) : super(key: key);

  @override
  _ReceivePopupState createState() => _ReceivePopupState();
}

class _ReceivePopupState extends State<ReceivePopup> {
  final TextEditingController _textField1Controller = TextEditingController();
  final TextEditingController _textField2Controller = TextEditingController();
  final TextEditingController _textField3Controller = TextEditingController();

  void _onButtonPressed() {
    // Handle button press
    print('Car Number: ${_textField1Controller.text}');
    print('Driver Phone: ${_textField2Controller.text}');
    print('Driver Name: ${_textField3Controller.text}');
    Navigator.of(context).pop(); // Close the popup
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 44, 16, 157),
                  Color.fromARGB(255, 0, 0, 0),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),
            child: Center(
              child: Text(
                'Receive Information',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextField(
                  controller: _textField1Controller,
                  decoration: InputDecoration(
                    labelText: 'Car Number',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: _textField2Controller,
                  decoration: InputDecoration(
                    labelText: 'Driver Phone',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: _textField3Controller,
                  decoration: InputDecoration(
                    labelText: 'Driver Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
                SizedBox(height: 32.0),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 44, 16, 157),
                        Color.fromARGB(255, 0, 0, 0),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: ElevatedButton(
                    onPressed: () async {
                      try {
                        final model = Recieve(
                          widget.callid,
                          this._textField1Controller.text,
                          this._textField1Controller.text,
                          this._textField1Controller.text,
                        );
                        var result = await EmergenceService.AdminReceive(model);
                        print('SAVED');
                      } catch (err) {
                        // Handle error
                      }
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ScreenDetail(callid: widget.callid);
                      }));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                    child: Text(
                      'Save',
                      style: TextStyle(
                          color: Colors.white), // Set the text color here
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
