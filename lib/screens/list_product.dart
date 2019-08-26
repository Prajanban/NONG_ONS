import 'dart:async';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nong_ons/models/product_model.dart';

class ListProduct extends StatefulWidget {
  @override
  _ListProductState createState() => _ListProductState();
}

class _ListProductState extends State<ListProduct> {
// Explicit
// สร้าง อะเรย์
// List<String> names = ['aa','bb,'cc'];
  List<DocumentSnapshot> snapshots;
  List<ProductModel> productModels = [];
// Method

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readFireStore();
  }

  Future<void> readFireStore() async {
    Firestore firestore = Firestore.instance;
    CollectionReference collectionReference = firestore.collection('Product');
    StreamSubscription<QuerySnapshot> subscription =
        await collectionReference.snapshots().listen((dataSnapshot) {
      snapshots = dataSnapshot.documents;
      for (var mySnapshot in snapshots) {
        String name = mySnapshot.data['Name'];
        String detail = mySnapshot.data['Detail'];
        String path = mySnapshot.data['path'];
        String qrCode = mySnapshot.data['QRCode'];
        print('name = $name');

        ProductModel productModel = ProductModel(name, detail, path, qrCode);
        setState(() {
         productModels.add(productModel); 
        });
      }
    });
  }

  Widget showListViewProduct() {
    return ListView.builder(
      itemCount: productModels.length,
      itemBuilder: (BuildContext context, int index) {
        return Text(productModels[index].name);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return showListViewProduct();
  }
}
