import 'package:basic_bank_app/screens/adminDetails.dart';
import 'package:basic_bank_app/screens/customer_details.dart';
import 'package:basic_bank_app/screens/customers_list.dart';

import 'package:basic_bank_app/screens/insertCustomer.dart';
import 'package:google_fonts/google_fonts.dart';

import './screens/home_screen.dart';
import 'package:flutter/material.dart';

import 'model/colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sparks Foundation Bank',
      theme: ThemeData(
          primaryColor: Colors.black,
          accentColor: Colors.black38,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: GoogleFonts.paprika().fontFamily),
      routes: {
        '/': (ctx) => HomeScreen(),
        CustomersList.routeNamed: (ctx) => CustomersList(),
        InsertCustomer.routeNamed: (ctx) => InsertCustomer(),
        AdminDetailsScreen.routeNamed: (ctx) => AdminDetailsScreen(),
        CustomerDetailsScreen.routeNamed: (ctx) => CustomerDetailsScreen(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => HomeScreen());
      },
    );
  }
}
