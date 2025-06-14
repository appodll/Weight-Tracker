import 'package:get/get.dart';
import 'package:weighttracker/Screen/Dashboard/DashboardScreen.dart';
import 'package:weighttracker/Screen/StandartScreen/FingerprintScreen.dart';
import 'package:weighttracker/Screen/StandartScreen/IntroScreen.dart';
import 'package:weighttracker/Screen/StandartScreen/SplashScreen.dart';
import 'package:weighttracker/Screen/Weight/WeightAddScreen.dart';

final List<GetPage> Routes = [
  GetPage(
    name: "/",
    page: () => Splashscreen(),
    transition: Transition.fadeIn,
    transitionDuration: Duration(milliseconds: 300),
  ),
  GetPage(
    name: "/intro",
    page: () => IntroScreen(),
    transition: Transition.fadeIn,
    transitionDuration: Duration(milliseconds: 300),
  ),
  GetPage(
    name: "/fingerprint",
    page: () => FingerprintScreen(),
    transition: Transition.fadeIn,
    transitionDuration: Duration(milliseconds: 300),
  ),
  GetPage(
    name: "/dashboard",
    page: () => DashboardScreen(),
    transition: Transition.fadeIn,
    transitionDuration: Duration(milliseconds: 300),
  ),
  GetPage(
    name: "/weight_add",
    page: () => WeightaddScreen(),
    transition: Transition.fadeIn,
    transitionDuration: Duration(milliseconds: 300),
  ),
];
