import 'package:auto_route/auto_route_annotations.dart';
import 'package:ideabuilder/ui/views/login/login_view.dart';
import 'package:ideabuilder/ui/views/signup/signup_view.dart';
import 'package:ideabuilder/ui/views/startup//startup_view.dart';
import 'package:ideabuilder/ui/views/home/home_view.dart';

// auto_route package allows you to define your routes and then generates the code to handle routing
@MaterialAutoRouter()
class $Router {
  @initial
  StartupView startupViewRoute;
  SignUpView signUpView;
  LoginView loginView;
  HomeView homeViewRoute;
}
