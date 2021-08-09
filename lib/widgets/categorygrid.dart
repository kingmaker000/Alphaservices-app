import 'package:alpha_app/pages/home_page.dart';
import 'package:alpha_app/pages/types_of_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:page_transition/page_transition.dart';

class CategoryGrid extends StatelessWidget {
  //const CategoryGrid({Key? key}) : super(key: key);
  List<Map<String, String>> categorylist = [];

  CategoryGrid({required this.categorylist});

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.grey[400],
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(5),
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white54,
      ),
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 0,
            mainAxisSpacing: 0,
          ),
          itemCount: categorylist.length,
          itemBuilder: (context, index) => InkWell(
                onTap: () {
                  //Navigator.of(context).pushNamed(TypesOfServices.routename,arguments: categorylist[index]['id']);
                  Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.rightToLeft,
                        //alignment: Alignment.center,
                        curve: Curves.easeOutCubic,
                        child: TypesOfServices(categorylist[index]['id']!),
                        childCurrent: Text(HomePage.routename),
                          duration: Duration(milliseconds: 500),
                          reverseDuration: Duration(milliseconds: 500)
                      ));
                },
                child: Container(
                  //padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  //margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(
                    width: 2,
                  )),
                  child: ClipRRect(
                    child: GridTile(
                      child: Image.network(
                        '${categorylist[index]['url']}',
                        fit: BoxFit.cover,
                      ),
                      footer: GridTileBar(
                        title: Text(
                          '${categorylist[index]['name']}',
                          style: TextStyle(
                              fontSize: 11, fontWeight: FontWeight.bold),
                        ),
                        backgroundColor: Colors.black54,
                      ),
                    ),
                  ),
                ),
              )),
    );
  }
}
