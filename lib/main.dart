import 'package:alpha_app/dummy_data/companydata.dart';
import 'package:alpha_app/pages/home_page.dart';
import 'package:alpha_app/pages/profile_page.dart';
import 'package:alpha_app/pages/tab_screen.dart';
import 'package:alpha_app/pages/types_of_services.dart';
import 'package:alpha_app/pages/vendors_list_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './pages/login_page.dart';
import './pages/create_account.dart';
import './pages/profile_page.dart';

void main(){
  runApp(AlphaApp());
}

class AlphaApp extends StatelessWidget {
  const AlphaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (cntx) =>CompanyData(),
        child: MaterialApp(
      theme: ThemeData(
        backgroundColor: Colors.blue[200],
        fontFamily: 'Oswald',
      ),
      routes:{
        LoginPage.routename:(cntx) => LoginPage(),
        CreateAccount.routename:(cntx)=> CreateAccount(),
        HomePage.routename:(cntx) => HomePage(),
        //TypesOfServices.routename:(cntx) => TypesOfServices(),
        //VendorsListPage.routename:(cntx) =>VendorsListPage(),
        ProfilePage.routename:(cntx) =>ProfilePage(),
        TabScreen.routename: (cntx) =>TabScreen()
      },
      home: LoginPage()//TabScreen(),

    )
    );
  }
}
