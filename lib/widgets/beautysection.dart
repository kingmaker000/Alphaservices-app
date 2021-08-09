import 'package:alpha_app/pages/home_page.dart';
import 'package:alpha_app/pages/vendors_list_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:page_transition/page_transition.dart';

class BeautySection extends StatelessWidget {
  // const BeautySection({Key? key}) : super(key: key);

  List<Map<String, String>> saloonlist = [
    {
      'name': 'Woman\'s beauty service',
      'url':
          'https://5.imimg.com/data5/PI/JG/EK/GLADMIN-32956866/selection-060-500x500.png'
    },
    {
      'name': 'Men\'s saloon service',
      'url': 'https://ak.picdn.net/shutterstock/videos/26609570/thumb/1.jpg'
    }
  ];

  Widget pagebuilder(String url, String title, BuildContext context) {
    return InkWell(
      onTap: (){
        //Navigator.of(context).pushNamed(VendorsListPage.routename,arguments: title);
        Navigator.push(context, PageTransition(
          type: PageTransitionType.size,
          curve: Curves.easeOutCubic,
          alignment: Alignment.center,
          child: VendorsListPage(title),
          childCurrent: HomePage(),
          duration: Duration(seconds: 1),
          reverseDuration: Duration(seconds: 1)
        ));
      },
      child: Container(
        child: Column(
          children: [
            Expanded(
                child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    child: Image.network(
                      url,
                      fit: BoxFit.fill,
                      width: double.infinity,
                    ))),
            Container(
                decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
                width: double.maxFinite,
                child: Center(
                    child: Text(
                  '$title',
                  style: TextStyle(
                      decorationColor: Colors.black87, color: Colors.white70),
                ))),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = saloonlist
        .map((value) => pagebuilder('${value['url']}', '${value['name']}', context))
        .toList();
    return Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(5),
        height: 200,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white38),
        child: Column(
          children: [
            Text('Feel the Parlour Atmosphere from Home'),
            SizedBox(
              height: 5,
            ),
            Expanded(
              child: PageView(
                children: pages,allowImplicitScrolling: true,
                physics: ScrollPhysics(parent: ScrollPhysics()),
                scrollDirection: Axis.horizontal,
              ),
            ),
          ],
        ),
      );
  }
}
