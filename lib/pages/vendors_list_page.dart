import 'package:alpha_app/widgets/vendor_items.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../dummy_data/companydata.dart';

class VendorsListPage extends StatefulWidget {
  //const VendorsListPage({Key? key}) : super(key: key);
  static const routename = '/vendors-list-page';
  final servicesection;

  VendorsListPage(this.servicesection);

  @override
  State<VendorsListPage> createState() => _VendorsListPageState();
}

class _VendorsListPageState extends State<VendorsListPage> {
  @override
  Widget build(BuildContext context) {
    //final servicesection = ModalRoute.of(context)!.settings.arguments as String;
    final _companData = Provider.of<CompanyData>(context);
    final serviceprovider = _companData.findbysection(
        widget.servicesection); //_companData.where((element) => element.section==servicesection) as Companyitem;
    return SafeArea(
        child: Scaffold(
      //backgroundColor: Color.fromRGBO(153, 205, 205, 1),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 350,
            //backgroundColor: Color.fromRGBO(0, 204, 204, 2),
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: ShaderMask(
                shaderCallback: (rect) {
                  return LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.white, Colors.transparent],
                  ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
                },
                blendMode: BlendMode.dstIn,
                child: Hero(
                  tag: serviceprovider.section,
                    child: Image.network(
                  '${serviceprovider.imageurl}',
                  fit: BoxFit.cover,
                )),
              ),
              /*Image.network('${serviceprovider.imageurl}',fit: BoxFit.cover,),*/
              title: Text('${serviceprovider.section}',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            ),
            elevation: 10,
            forceElevated: true,
            centerTitle: true,
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
              height: 50,
            ),
            Container(
              color: Colors.white30,
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              child: Text('Available Vendors', style: TextStyle(fontSize: 25)),
            ),
            //SizedBox(height: 10,),
            VendorsItem(
              vendorData: serviceprovider,
            ),
            Container(
              height: 500,
            )
          ]))
        ],
      ),
    ));
  }
}
