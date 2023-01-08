import 'package:flutter/material.dart';
import 'package:food_app/providers/product_provider.dart';
import 'package:food_app/screens/home_page.dart';
import 'package:food_app/screens/intro_screen.dart';
import 'package:food_app/screens/product_page.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductController>(
            create: (context) => ProductController()),
      ],
      builder: (context, _) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Food ordering System",
        initialRoute:'intro_screen',
        routes: {
          'home_page': (context) => const HomePage(),
          'intro_screen': (context) => const IntroScreen(),
          'product_page': (context) => const ProductPage(),
        },
      ),
    );
  }
}
