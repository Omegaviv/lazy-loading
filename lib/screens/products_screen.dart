import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:read_excel/models/product.dart';
import 'package:read_excel/widgets/product_item_view.dart';
import '../services/provider.dart';

class ProductScreen extends StatefulWidget {
  static String route = '/product-screen';

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  bool _isloading=false;
  ScrollController _controller = new ScrollController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }
  @override
  void initState() {
    
    _controller.addListener(() async {
      setState(() {
        _isloading=true;
      });
      if(_controller.position.pixels==_controller.position.maxScrollExtent){
        await Provider.of<Products>(context, listen: false).getProducts().then((_){
          setState(() {
            _isloading=false;
          });
        });
      }
    });
    
  }
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context).products;
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
      ),
  backgroundColor: Colors.grey[300],
      body: Padding (
        padding: EdgeInsets.all(10),
        child: ListView.builder(
            itemCount: _isloading? products.length+1 : products.length,
            // itemExtent: 10,
            controller: _controller,
            itemBuilder: (context, i){
              if(i==products.length){
                return CupertinoActivityIndicator();
              }
              return ProductItemView(products[i]);
            })
      ),

    );
  }
}
