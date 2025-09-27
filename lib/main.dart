import 'package:flutter/material.dart';
import 'package:turbo/home/domain/router/app_router.dart';
import 'package:turbo/home/domain/router/routs_name.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RoutsName.login,
      onGenerateRoute:AppRouter().onGenerateRoute ,
    );
  }
}
