import 'package:alpha_app/pages/vendors_list_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../dummy_data/companydata.dart';
import 'package:flutter/animation.dart';

class TypesOfServices extends StatefulWidget {
  //const TypesOfServices({Key? key}) : super(key: key);
  static const routename = '/types-of-services';
  final id_data;

  TypesOfServices(this.id_data);

  @override
  _TypesOfServicesState createState() => _TypesOfServicesState();
}

class _TypesOfServicesState extends State<TypesOfServices> with SingleTickerProviderStateMixin{

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );
  @override
  void initState() {
    // TODO: implement initState
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }


  @override
  Widget build(BuildContext context) {
    //final id_data =ModalRoute.of(context)!.settings.arguments;
    final companies = Provider.of<CompanyData>(context).getdata();
    final servicetypes =
    companies.where((element) => element.id == widget.id_data).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text('Types of Services'),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
        //backgroundColor: Color.fromRGBO(0, 204, 204, 2),
      ),
      //backgroundColor: Color.fromRGBO(153, 205, 205, 1),
      body: ListView.separated(
        itemCount: servicetypes.length,
        itemBuilder: (contex, index) =>
            ScaleTransition(
              scale: _animation,
              child: Container(
                margin: EdgeInsets.all(10),
                height: 50,
                child: ListTile(
                  leading: Hero(
                      tag: servicetypes[index].section,
                      child: ClipRRect(
                        child: Image.network('${servicetypes[index].imageurl}'),
                        borderRadius: BorderRadius.circular(8),
                      )),
                  title: Text('${servicetypes[index].section}'),
                  onTap: () {
                    //Navigator.of(context).pushNamed(VendorsListPage.routename,
                    //  arguments: servicetypes[index].section);
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) =>
                            VendorsListPage(servicetypes[index].section)));
                  },
                ),
              ),
            ),
        separatorBuilder: (context, index) => Divider(),
      ),
    );
  }
}
