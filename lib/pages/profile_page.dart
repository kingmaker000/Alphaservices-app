import 'dart:io';
import 'dart:math';
import 'package:alpha_app/pages/create_account.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../user_credentials/image_class.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import '../user_credentials/image_class.dart';


class ProfilePage extends StatefulWidget {
  //const ProfilePage({Key? key}) : super(key: key);
  static const routename = '/profile-page';

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final String url =
      'https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png';
  UserItem user=new UserItem();
  //File? profileImage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    //final  UserItem user=UserClass().getUser(index);
    //UserItem user=UserItem(profileImage: urlToFile() as File, index: 0);
    return Container(
      height: MediaQuery.of(context).size.height,
      // decoration: BoxDecoration(
      //   gradient: LinearGradient(
      //       colors: [Colors.blue, Colors.white],
      //       begin: Alignment.topLeft,
      //       end: Alignment.bottomRight)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
                border: Border.all(width: 1),
                borderRadius: BorderRadius.circular(20)),
            child: ClipRRect(borderRadius: BorderRadius.circular(20),
                child: user.profileImage==null? Image.network(url,fit: BoxFit.cover,):Image.file(
              user.profileImage!,
              fit: BoxFit.cover,
              width: double.infinity,
            )
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Name of customer',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.all(10),
            height: 200,
            // decoration: BoxDecoration(
            //   gradient: LinearGradient(begin: Alignment.topLeft,end: Alignment.bottomRight,colors: [Colors.white,Colors.teal])
            //),
            color: Colors.white24,
            child: ListView(
              children: [
                ListTile(
                  leading: Icon(Icons.call),
                  title: Text('contact number'),
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.mail),
                  title: Text('Email Id'),
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.location_on),
                  title: Text('Address'),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
              height: 30,
              width: double.infinity,
              margin: EdgeInsets.all(10),
              child: OutlinedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(CreateAccount.routename,
                      arguments: user).then((value) {setState(() {

                      });});
                },
                child: Text(
                  'Edit Profile',
                  style: TextStyle(color: Colors.black),
                ),
              )),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
