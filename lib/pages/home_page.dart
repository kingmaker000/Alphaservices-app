import 'package:alpha_app/dummy_data/companydata.dart';
import 'package:alpha_app/pages/login_page.dart';
import 'package:alpha_app/pages/profile_page.dart';
import 'package:alpha_app/widgets/beautysection.dart';
import 'package:alpha_app/widgets/home_service_section.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import '../widgets/categorygrid.dart';
import 'package:page_transition/page_transition.dart';
import 'package:path/path.dart';
import 'package:flutter/services.dart' show ByteData, rootBundle;
import '../presentation/my_flutter_app_icons.dart' as CustomIcons;

class HomePage extends StatefulWidget {
  //const HomePage({Key? key}) : super(key: key);
  static const routename = '/home-page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, String>> categories = [
    {
      'name': 'Automobile',
      'url': 'https://st2.depositphotos.com/3682225/11228/v/600/depositphotos_112288198-stock-illustration-automotive-repair-icon-car-service.jpg',
      'id':'1'
    },
    {
      'name': 'Home Services',
      'url':
          'https://as2.ftcdn.net/jpg/01/21/39/31/500_F_121393172_AZXVsDNoF0Kh0POlcvc5jvC3RxzrFz1F.jpg',
      'id':'2'
    },
    {
      'name': 'Beauty and Fashion',
      'url': 'https://image.shutterstock.com/image-vector/women-long-hair-style-icon-260nw-454070710.jpg',
      'id':'3'
    },
    {
      'name': 'Hair cut',
      'url': 'https://cdn4.vectorstock.com/i/thumb-large/72/33/set-barber-tools-for-men-vector-8877233.jpg',
      'id':'3'
    },
    {
      'name': 'Electronics',
      'url': 'https://www.online-tech-tips.com/wp-content/uploads/2019/12/electronic-gadgets.jpeg',
    'id':'4'
    }
  ];

  List<Widget> pages = [
    Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      child: ClipRRect(borderRadius: BorderRadius.circular(10),
        child: Image.network(
          'https://image.shutterstock.com/image-vector/special-offer-banner-vector-format-260nw-717480880.jpg',
          fit: BoxFit.cover,
        ),
      ),
    ),
    Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          'https://st.depositphotos.com/2036077/2629/i/600/depositphotos_26296093-stock-photo-3d-special-offer-word-on.jpg',
          fit: BoxFit.cover,
        ),
      ),
    ),
    Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          'https://img.freepik.com/free-vector/special-offer-sale-discount-banner_180786-46.jpg?size=626&ext=jpg',
          fit: BoxFit.cover,
        ),
      ),
    )
  ];

  @override
  Widget build(BuildContext context) {
    final dataprovider = Provider.of<CompanyData>(context);
    final catdata = dataprovider.getdata();
    return Scaffold(
      body: Container(
        //decoration: BoxDecoration(
         // gradient: LinearGradient(colors: [Colors.white,Colors.lightBlueAccent],begin: Alignment.topLeft,end: Alignment.bottomRight)
       // ),
        child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    expandedHeight: 135,//backgroundColor: Colors.blue[100],
                    pinned: true,
                    floating: false,
                    snap: false,collapsedHeight: 70,
                    flexibleSpace: FlexibleSpaceBar(
                      stretchModes: const <StretchMode>[
                        StretchMode.zoomBackground,
                        StretchMode.blurBackground,
                        StretchMode.fadeTitle,
                      ],
                      centerTitle: true,
                      background :
                          Column(
                            children: [
                              ListTile(
                                leading: Icon(Icons.location_on),
                                title: Text('Location'),
                                trailing: Icon(Icons.arrow_forward),
                                onTap: () {},
                              ),
                              /*Container(
                                width: double.infinity,
                                height: 50,
                                margin: EdgeInsets.all(10),
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border.all(width: 1, color: Colors.black54),color: Colors.white70),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        cursorColor: Colors.black54,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 15),
                                          hintText: 'Search service',
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.search),
                                      onPressed: () {},
                                    )
                                  ],
                                ),
                              ),*/
                            ],
                          ),
                      title: Container(
                        height: 30,
                        //width: double.infinity,
                        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        decoration: BoxDecoration(/*border: Border.all(width: 1,color: Colors.black87)*/color: Colors.white,borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: TextFormField(
                                cursorColor: Colors.black54,cursorWidth: 0.5,cursorHeight: 20,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                                  hintText: 'Search service',hintStyle: TextStyle(fontSize: 13),
                                ),
                              ),
                            ),
                            IconButton(alignment: Alignment.centerRight,
                                icon: Icon(Icons.search,size: 15,),
                                onPressed: () {},
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SliverList(delegate: SliverChildListDelegate([
                    // SizedBox(
                    //   height: 10,
                    // ),
                    Divider(),
                    Container(
                      height: 200,
                      //padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white54),
                      width: double.infinity,
                      margin: EdgeInsets.all(10),
                      child: PageView(
                        children: pages,
                        scrollDirection: Axis.horizontal,
                        allowImplicitScrolling: true,
                        physics: ScrollPhysics(parent: ScrollPhysics()),
                      ),
                    ),
                    Divider(),
                    CategoryGrid(categorylist: categories),
                    Divider(),
                    BeautySection(),
                    Divider(),
                    HomeServiceSection(),
                  ]))
                ],
              ),
      ),
    );
  }
}

/*
appBar: AppBar(
        title: Text('Alpha Services'),
        backgroundColor: Color.fromRGBO(0, 204, 204, 2),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              height: 100,
              width: double.infinity,
              color: Colors.cyanAccent[200],
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 25,horizontal: 5),
                child:  Text('Menu',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),),
              ),
            ),
            Divider(),
            SizedBox(height: 10,),
            Container(
              child: Column(
                children: [
                  ListTile(leading: Icon(Icons.logout,size: 25,),title: Text('Logout',style: TextStyle(fontSize: 20),),onTap:()=> Navigator.of(context).pushReplacementNamed(LoginPage.routename),)
                ],
              ),
            )
          ],
        ),
      ),
      backgroundColor: Color.fromRGBO(153, 255, 225, 1),
* Column(
        children: [
          Container(
            width: double.infinity,
            height: 80,
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
            //color: Color.fromRGBO(153, 255, 255, 1),
            child: Text('Categories',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: Colors.black54,
            ),),
          ),
          Expanded(
            child: ListView(
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white54),
                    child: ListTile(
                      leading: Icon(Icons.settings,size: 30,),
                      title: Text('Automobile',style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'Uchen',
                      ),
                      ),
                      onTap: (){
                        Navigator.of(context).pushNamed(TypeOfServices.routename,arguments: 'Automobile');
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white54),
                    child: ListTile(
                      leading: Icon(Icons.home_outlined,size: 30,),
                      title: Text('My Sweet Home',style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'Uchen',
                      ),
                      ),
                      onTap: (){
                        Navigator.of(context).pushNamed(TypeOfServices.routename,arguments: 'My sweet home');
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white54),
                    child: ListTile(
                      leading: Icon(Icons.face,size: 30,),
                      title: Text('Beauty and Fashion',style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'Uchen',
                      ),
                      ),
                      onTap: (){
                        Navigator.of(context).pushNamed(TypeOfServices.routename,arguments: 'beauty and fashion');
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white54),
                    child: ListTile(
                      leading: Icon(Icons.mobile_friendly,size: 30,),
                      title: Text('Electronics',style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'Uchen',
                      ),
                      ),
                      onTap: (){
                        Navigator.of(context).pushNamed(TypeOfServices.routename,arguments: 'Electronics');
                      },
                    ),
                  ),
                ],
            ),
          ),
        ],
      ),*/
