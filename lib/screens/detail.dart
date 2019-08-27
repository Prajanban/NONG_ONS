import 'package:flutter/material.dart';
import 'package:nong_ons/models/product_model.dart';

class Detail extends StatefulWidget {
  final ProductModel productModel;
  // การรับค่าจากหน้าอื่น
  Detail({Key key, this.productModel}) : super(key: key);

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  // Explicit
  ProductModel myProductModel;

  // Method
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      myProductModel = widget.productModel;
    });
  }

  Widget showName() {
    return Text('Detail of ${myProductModel.name}');
  }

  Widget showImage() {
    return Container(margin: EdgeInsets.all(20.0),
      width: MediaQuery.of(context).size.height * 0.5,
      child: Image.network(
        myProductModel.path,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget showListProduct() {
    return ListView(
      children: <Widget>[showImage(),showDetail()],
    );
  }

Widget showDetail(){
  return Container(padding: EdgeInsets.all(20.0),
    child: Text(myProductModel.detail),);
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: showName(),
      ),
      body: showListProduct(),
    );
  }
}
