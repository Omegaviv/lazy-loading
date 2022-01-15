import 'package:flutter/material.dart';
import 'package:excel/excel.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';
import 'package:read_excel/screens/products_screen.dart';
import '../services/provider.dart';

class HomePage extends StatefulWidget {
   static String route='/home-page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isloading = false;
  @override
  Widget build(BuildContext context) {
    final len = 10;
    return Scaffold(
      body: Center(
        child: _isloading? CircularProgressIndicator() :  ElevatedButton(
          onPressed: ()async{
            setState(() {
              _isloading=true;
            });
           await  Provider.of<Products>(context, listen: false).getProducts().then((value){
             setState(() {
               _isloading=false;
             });
           });
           Navigator.of(context).pushNamed(ProductScreen.route);

          },
          child:Text('Load'),
        ),
      ),

    );
  }
}