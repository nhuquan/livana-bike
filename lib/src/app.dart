import 'package:flutter/material.dart';
import 'bike/bike_catalog.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.purple,
        ),
        home: Catalog());
  }
}
