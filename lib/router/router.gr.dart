// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;
import 'package:gotaxi/global_blocs/app_bloc/view/app.dart' as _i1;
import 'package:gotaxi/global_blocs/login_cubit/view/otp.dart' as _i2;
import 'package:gotaxi/global_blocs/login_cubit/view/sms_code_form.dart' as _i3;
import 'package:gotaxi/presentation/passenger/register_passager/register_passanger.dart'
    as _i4;
import 'package:gotaxi/presentation/passenger/tabbox/home_page.dart' as _i5;

abstract class $AppRouter extends _i6.RootStackRouter {
  $AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    MainPageRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.MainPage(),
      );
    },
    SMSCodeScreenRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.SMSCodeScreen(),
      );
    },
    SmsScreenFormRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.SmsScreenForm(),
      );
    },
    RegisterPassengerRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.RegisterPassenger(),
      );
    },
    TabBoxRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.TabBox(),
      );
    },
  };
}

/// generated route for
/// [_i1.MainPage]
class MainPageRoute extends _i6.PageRouteInfo<void> {
  const MainPageRoute({List<_i6.PageRouteInfo>? children})
      : super(
          MainPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainPageRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i2.SMSCodeScreen]
class SMSCodeScreenRoute extends _i6.PageRouteInfo<void> {
  const SMSCodeScreenRoute({List<_i6.PageRouteInfo>? children})
      : super(
          SMSCodeScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'SMSCodeScreenRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i3.SmsScreenForm]
class SmsScreenFormRoute extends _i6.PageRouteInfo<void> {
  const SmsScreenFormRoute({List<_i6.PageRouteInfo>? children})
      : super(
          SmsScreenFormRoute.name,
          initialChildren: children,
        );

  static const String name = 'SmsScreenFormRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i4.RegisterPassenger]
class RegisterPassengerRoute extends _i6.PageRouteInfo<void> {
  const RegisterPassengerRoute({List<_i6.PageRouteInfo>? children})
      : super(
          RegisterPassengerRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterPassengerRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i5.TabBox]
class TabBoxRoute extends _i6.PageRouteInfo<void> {
  const TabBoxRoute({List<_i6.PageRouteInfo>? children})
      : super(
          TabBoxRoute.name,
          initialChildren: children,
        );

  static const String name = 'TabBoxRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}
