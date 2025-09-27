import 'package:flutter/material.dart';
import 'package:turbo/home/domain/router/router_transition.dart';
import 'package:turbo/home/domain/router/routs_name.dart';
import 'package:turbo/home/presentation/view/login/login_view.dart';

class AppRouter {
  Route<dynamic> onGenerateRoute(RouteSettings settings)
  {
    switch (settings.name) {
      case RoutsName.login:
       return RouterTransitions.buildMaterial(LoginView()); 
      default:return RouterTransitions.buildMaterial(Scaffold(
        body: Center(
          child: Text("No Routs"),
        ),
      ));
    }
  }
}