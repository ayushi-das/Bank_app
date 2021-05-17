import 'package:basic_bank_app/model/colors.dart';

import '../model/customer.dart';
import 'package:flutter/material.dart';
import '../dbHelper.dart';

class InsertCustomer extends StatefulWidget {
  static const routeNamed = '/transactionDetails';

  @override
  _InsertCustomerState createState() => _InsertCustomerState();
}

class _InsertCustomerState extends State<InsertCustomer> {
  final GlobalKey<FormState> _formStateKey = GlobalKey<FormState>();

  String _customerName = '';
  double _customerBalance = 0.0;

  final _employeeNameController = TextEditingController();
  final _employeeBalanceController = TextEditingController();

  DBHelper db;

  @override
  void initState() {
    db = DBHelper();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[200],
      appBar: AppBar(
        backgroundColor: HexColor("60282f"),
        title: Text('Add a new customer'),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Form(
                  key: _formStateKey,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding:
                            EdgeInsets.only(left: 10, right: 10, bottom: 10),
                        child: TextFormField(
                          onSaved: (value) {
                            _customerName = value;
                          },
                          keyboardType: TextInputType.name,
                          controller: _employeeNameController,
                          decoration: InputDecoration(
                            focusedBorder: new UnderlineInputBorder(
                                borderSide: new BorderSide(
                                    color: Colors.brown[900],
                                    width: 2,
                                    style: BorderStyle.solid)),
                            hintText: "Name",
                            fillColor: Colors.white,
                            labelStyle: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(left: 10, right: 10, bottom: 10),
                        child: TextFormField(
                          onSaved: (value) {
                            _customerBalance = double.parse(value);
                          },
                          keyboardType: TextInputType.name,
                          controller: _employeeBalanceController,
                          decoration: InputDecoration(
                            focusedBorder: new UnderlineInputBorder(
                                borderSide: new BorderSide(
                                    color: Colors.blue,
                                    width: 2,
                                    style: BorderStyle.solid)),
                            hintText: "Intial Balance",
                            fillColor: Colors.white,
                            labelStyle: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                RaisedButton(
                  onPressed: () async {
                    _formStateKey.currentState.save();
                    db.insertCustomer(Customer(
                        id: null,
                        name: _customerName,
                        balance: _customerBalance));
                    _employeeNameController.text = '';
                    _employeeBalanceController.text = 0.0.toString();
                    Navigator.pop(context);
                    SnackBar(content: Text("Added sucessfully"));
                  },
                  color: Colors.brown[900],
                  child: Text('ADD', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
