import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:recast_designs_assessment/features/home/home_bindings.dart';
import 'package:recast_designs_assessment/features/home/home_page.dart';
import 'package:recast_designs_assessment/features/profile/profile_bindings.dart';
import 'package:recast_designs_assessment/features/profile/profile_page.dart';

class AppRoutes {
  static const String home = '/home';
  static const String profile = '/profile';
}

List<GetPage> getPages = [
  GetPage(
    name: AppRoutes.home,
    page: () => HomePage(),
    binding: HomeBindings(),
    transition: Transition.leftToRight,
  ),
  GetPage(
    name: AppRoutes.profile,
    page: () => ProfilePage(),
    binding: ProfileBindings(),
    transition: Transition.leftToRight,
  ),
];
