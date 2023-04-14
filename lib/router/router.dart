import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:gotaxi/router/router.gr.dart';

@AutoRouterConfig(replaceInRouteName: "Route")
class AppRouter extends $AppRouter {

  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: SMSCodeScreenRoute.page),
    AutoRoute(page: SmsScreenFormRoute.page),
    AutoRoute(page: RegisterPassengerRoute.page),
    AutoRoute(page: TabBoxRoute.page),
    AutoRoute(page: MainPageRoute.page, path: '/'),
  ];
}