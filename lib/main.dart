import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:read_excel/screens/products_screen.dart';
import 'package:read_excel/services/provider.dart';

import './screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Products(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
        routes: {
          HomePage.route : (ctx)=> HomePage(),
          ProductScreen.route: (ctx)=>ProductScreen(),
        },
      ),
    );
  }
}

