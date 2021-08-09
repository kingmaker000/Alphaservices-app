import 'package:alpha_app/pages/booking_page.dart';
import 'package:alpha_app/pages/home_page.dart';
import 'package:alpha_app/pages/profile_page.dart';
import 'package:flutter/material.dart';

class TabScreen extends StatefulWidget {
  //const TabScreen({Key? key}) : super(key: key);
  static const routename='/tabscreen';


  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<Map<String,Widget>> pages=[];
  int selectedindex=0;

  @override
  void initState() {
    pages=[{'page':HomePage()},{'page':BookingPage()},{'page':ProfilePage()}];
    super.initState();
  }

  void _onItemTab(BuildContext context,int index){
    print(index);
    setState(() {
      selectedindex=index;
    });
    //Navigator.of(context).pushReplacement();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //backgroundColor: Color.lerp(Colors.blue, Colors.white, 1),
        body: pages[selectedindex]['page'],
        bottomNavigationBar:  Theme(
          data: Theme.of(context).copyWith(
            // sets the background color of the `BottomNavigationBar`
              canvasColor: Colors.blue,
              // sets the active color of the `BottomNavigationBar` if `Brightness` is light
              primaryColor: Colors.red,
              textTheme: Theme
                  .of(context)
                  .textTheme
                  .copyWith(caption: new TextStyle(color: Colors.yellow))),
          child: BottomNavigationBar(
            items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.book_online), label: 'Bookings'),
            BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Profile'),
          ],
            onTap: (ind) =>_onItemTab(context,ind),
            type: BottomNavigationBarType.shifting,
            unselectedItemColor: Colors.white,
            selectedItemColor: Colors.black,
            currentIndex: selectedindex,
          ),
        ),
      ),
    );
  }
}
