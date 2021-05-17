import 'package:basic_bank_app/model/colors.dart';
import 'package:basic_bank_app/model/customer.dart';
import 'package:basic_bank_app/screens/adminDetails.dart';
import 'package:basic_bank_app/screens/customers_list.dart';
import 'package:basic_bank_app/screens/insertCustomer.dart';
import 'package:basic_bank_app/widgets/customcard.dart';
import 'package:flutter/material.dart';
import '../dbHelper.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Customer> query = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[200],
      appBar: AppBar(
        backgroundColor: HexColor("60282f"),
        title: Text('Bank App'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.info),
              onPressed: () async {
                DBHelper db = DBHelper();
                query = await db.getCustomer();
                Navigator.of(context).pushNamed(AdminDetailsScreen.routeNamed,
                    arguments: query[0]);
              })
        ],
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                elevation: 10,
                margin: EdgeInsets.all(3),
                color: Colors.blueGrey[100],
                child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60),
                    ),
                    child: Image(
                      image: AssetImage("assets/images/bank_logo.png"),
                      height: 250,
                      width: 250,
                      fit: BoxFit.fill,
                    )),
              ),
              SizedBox(height: 20),
              Text(
                "Get started!",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 30),
              CustomCard(
                icon: Icons.account_circle,
                title: 'View All Customers',
                navpage: () async {
                  DBHelper db = DBHelper();
                  query = await db.getCustomer();
                  Navigator.of(context)
                      .pushNamed(CustomersList.routeNamed, arguments: query);
                },
              ),
              CustomCard(
                icon: Icons.add_box_rounded,
                title: 'Insert Customer',
                navpage: () {
                  Navigator.of(context).pushNamed(
                    InsertCustomer.routeNamed,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
