import 'package:flutter/material.dart';
import 'package:pro/providers/products.dart';
import 'package:pro/screens/home_screen.dart';
import 'package:pro/widgets/produut_details_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Products>(
      create: (ctx) {
        return Products();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: HomeScreen(),
        routes: {
          ProduutDetailsScreen.routeName: (ctx) => ProduutDetailsScreen()
        },
      ),
    );
  }
}
