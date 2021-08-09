import 'package:alpha_app/pages/home_page.dart';
import 'package:alpha_app/pages/vendors_list_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:page_transition/page_transition.dart';

class HomeServiceSection extends StatelessWidget {
  //const HomeServiceSection({Key? key}) : super(key: key);

  final List<Map<String, String>> homeservicelist = [
    {
      'name': 'Installation and repair',
      'url':
          'https://indorerepairs.com/wp-content/uploads/2021/04/appliance-repair-indore-1024x576.jpg'
    },
    {
      'name': 'Professional cleaning',
      'url': 'https://sourcefed.com/wp-content/uploads/2018/08/clean.png'
    },
    {
      'name': 'Pet grooming',
      'url':
          'https://luckydawgsalongrooming.com/wp-content/uploads/2016/09/Pet-Grooming.png'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 300,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      color: Colors.white54,
      child: Column(
        children: [
          Container(
            child: Center(child: Text('Home Services',style: TextStyle(fontWeight: FontWeight.bold),),),
          ),
          GridView.builder(
            shrinkWrap: true,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                  crossAxisSpacing: 1,
                    //  mainAxisSpacing: 10
                  ),
              itemBuilder: (context,index) =>InkWell(
                onTap: (){
                  //Navigator.of(context).pushNamed(VendorsListPage.routename,arguments: homeservicelist[index]['name']);
                  Navigator.push(context, PageTransition(
                    type: PageTransitionType.rightToLeft,
                    child: VendorsListPage(homeservicelist[index]['name']),
                    childCurrent: HomePage(),curve: Curves.elasticIn
                  ));
                },
                child: Container(
                  //height: 20,
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          child: Image.network('${homeservicelist[index]['url']}'),
                        ),
                      ),
                      //SizedBox(height: 5,),
                      Center(
                        child: Text('${homeservicelist[index]['name']}',),
                      )
                    ],
                  ),
                ),
              ),
          itemCount: homeservicelist.length,),
        ],
      ),
    );
  }
}
