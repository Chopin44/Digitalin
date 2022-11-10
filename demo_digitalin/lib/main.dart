import 'package:flutter/material.dart';
import 'package:demo_digitalin/Screens/Home_page.dart';
import 'package:demo_digitalin/Screens/update_product.dart';

void main()
{
  runApp(const demo_digitalin());
}
class demo_digitalin extends StatelessWidget {
  const demo_digitalin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {
          HomePage.id : (context)=>const HomePage(),
          UpdateProduct.id  :(context) =>  UpdateProduct()
        },
        initialRoute: HomePage.id,
    );
    
  }
}