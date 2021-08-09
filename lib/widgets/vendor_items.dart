import 'package:alpha_app/dummy_data/companydata.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class VendorsItem extends StatefulWidget {
  //const VendorsItem({Key? key}) : super(key: key);
  final Companyitem vendorData;

  VendorsItem({required this.vendorData});

  @override
  _VendorsItemState createState() => _VendorsItemState();
}

class _VendorsItemState extends State<VendorsItem> with SingleTickerProviderStateMixin {
  final String imgurl='https://static.thenounproject.com/png/2366460-200.png';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      color: Colors.white54,
      margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: ListView.separated(itemBuilder: (context,index) =>Container(
          //height: 300,
          margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Column(
            children: [
              ListTile(
                leading: CircleAvatar(child: Image.network(imgurl),),
                title: Text('${widget.vendorData.vendors['vendor${index+1}']!['name']}'),
                subtitle: Text('${widget.vendorData.vendors['vendor${index+1}']!['place']}, ${widget.vendorData.vendors['vendor${index+1}']!['state']}'),
                trailing: Container(
                  child: Column(
                    children: [
                      Icon(Icons.call),
                      Text('${widget.vendorData.vendors['vendor${index+1}']!['contact']}',style: TextStyle(fontSize: 10),)
                    ],
                  ),
                ),
              ),
              //Divider(),
              Container(
                //height: 30,
                width: double.infinity,
                child: TextButton(onPressed: (){}, child: Text('Book Service',style: TextStyle(color: Colors.black),)),
              )
            ],
          ),
        ),
        itemCount: widget.vendorData.vendors.length,
        separatorBuilder: (context,index)=> Divider(),
      ),
    );
  }
}
