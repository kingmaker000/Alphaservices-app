import 'dart:io';

import 'package:alpha_app/pages/login_page.dart';
import 'package:alpha_app/pages/profile_page.dart';
import 'package:alpha_app/user_credentials/image_class.dart';
import 'package:alpha_app/widgets/image_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../user_credentials/user_data.dart';

class CreateAccount extends StatefulWidget {
  //const CreateAccount({Key? key}) : super(key: key);
  static const routename = '/create-account';

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  String checkpassword='';

  Map<String,String> userDetails={'name':'','place':'','email':'','password':''};

  final GlobalKey<FormState> formkey=GlobalKey();
  //UserItem? reference;


  void submitted(BuildContext context) {
    if(!formkey.currentState!.validate()){
      return;
    }
    formkey.currentState!.save();
    Navigator.pushReplacementNamed(context, LoginPage.routename);
  }

  @override
  Widget build(BuildContext context) {
    //final reference=ModalRoute.of(context)!.settings.arguments as UserItem;
    //final updateimage= reference.profileImage;
    //final profileimage= reference.profileimage;
    final user=ModalRoute.of(context)!.settings.arguments as UserItem;

    return Scaffold(
      appBar: AppBar(
        title: Text('Create new account'),
        centerTitle: true,
        //backgroundColor: Color.fromRGBO(0, 204, 204, 2),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        //decoration: BoxDecoration(
        //  gradient: LinearGradient(colors: [Colors.white,Color.fromRGBO(0, 204, 204, 2)],begin: Alignment.topLeft,end: Alignment.bottomRight)
        //),
        child: Form(
          key: formkey,
          child: SingleChildScrollView(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(height: 10,),
                Imageinput(user),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10)/*,
                      color: Colors.grey[200]*/),
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Name'),
                      TextFormField(
                        decoration: InputDecoration(hintText: 'Ex:Raju R'),
                        validator: (value){
                          if(value!.isEmpty){
                            return 'Invalid Name';
                          }
                          return null;
                        },
                        onSaved: (value){
                          userDetails['name']=value!;
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10)/*,
                      color: Colors.grey[200]*/),
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Place'),
                      TextFormField(
                        validator: (value){
                          if(value!.isEmpty){
                            return 'Invalid place';
                          }
                          return null;
                        },
                        onSaved: (value){
                          userDetails['place']=value!;
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10)/*,
                      color: Colors.grey[200]*/),
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Email Id'),
                      TextFormField(
                        decoration: InputDecoration(hintText: 'Ex: name@domain.com'),
                        validator: (value){
                          if(value!.isEmpty){
                            return 'Please Enter Email';
                          }
                          if(!value.contains('@') || !value.endsWith('.com')){
                            return 'Please Enter a valid Email';
                          }
                          return null;
                        },
                        onSaved: (value){
                          userDetails['email']=value!;
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10)/*,
                      color: Colors.grey[200]*/),
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Password'),
                      TextFormField(
                        decoration: InputDecoration(hintText: 'atleast 8 char'),
                        obscureText: true,
                        validator: (value){
                          if(value!.length<8){
                            return 'Please enter atleast 8 char';
                          }
                          if(value.isEmpty){
                            return 'Please enter the password';
                          }
                          checkpassword=value;
                          return null;
                        },
                        onSaved: (value){
                          userDetails['password']=value!;
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10)/*,
                      color: Colors.grey[200]*/),
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Confirm Password'),
                      TextFormField(
                        decoration: InputDecoration(hintText: 'atleast 8 char'),
                        obscureText: true,
                        validator: (value){
                          if(value!.isEmpty){
                            return 'Please enter the paaword';
                          }
                          if(value!=checkpassword){
                            return 'Password doesnot match';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      submitted(context);
                    },
                    child: Text('Submit')),
                SizedBox(height: 20,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
