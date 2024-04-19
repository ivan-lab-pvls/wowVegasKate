// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    CongratulationsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CongratulationsScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    InfoRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const InfoScreen(),
      );
    },
    NewPlaceRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const NewPlaceScreen()),
      );
    },
    OnboardingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OnboardingScreen(),
      );
    },
    PlaceInfoRoute.name: (routeData) {
      final args = routeData.argsAs<PlaceInfoRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PlaceInfoScreen(
          key: args.key,
          place: args.place,
        ),
      );
    },
    PrivacyPolicyRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PrivacyPolicyScreen(),
      );
    },
    PromotionRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PromotionScreen(),
      );
    },
    SettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsScreen(),
      );
    },
    SupportRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SupportScreen(),
      );
    },
    TermsOfUseRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TermsOfUseScreen(),
      );
    },
  };
}

/// generated route for
/// [CongratulationsScreen]
class CongratulationsRoute extends PageRouteInfo<void> {
  const CongratulationsRoute({List<PageRouteInfo>? children})
      : super(
          CongratulationsRoute.name,
          initialChildren: children,
        );

  static const String name = 'CongratulationsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [InfoScreen]
class InfoRoute extends PageRouteInfo<void> {
  const InfoRoute({List<PageRouteInfo>? children})
      : super(
          InfoRoute.name,
          initialChildren: children,
        );

  static const String name = 'InfoRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NewPlaceScreen]
class NewPlaceRoute extends PageRouteInfo<void> {
  const NewPlaceRoute({List<PageRouteInfo>? children})
      : super(
          NewPlaceRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewPlaceRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OnboardingScreen]
class OnboardingRoute extends PageRouteInfo<void> {
  const OnboardingRoute({List<PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PlaceInfoScreen]
class PlaceInfoRoute extends PageRouteInfo<PlaceInfoRouteArgs> {
  PlaceInfoRoute({
    Key? key,
    required Place place,
    List<PageRouteInfo>? children,
  }) : super(
          PlaceInfoRoute.name,
          args: PlaceInfoRouteArgs(
            key: key,
            place: place,
          ),
          initialChildren: children,
        );

  static const String name = 'PlaceInfoRoute';

  static const PageInfo<PlaceInfoRouteArgs> page =
      PageInfo<PlaceInfoRouteArgs>(name);
}

class PlaceInfoRouteArgs {
  const PlaceInfoRouteArgs({
    this.key,
    required this.place,
  });

  final Key? key;

  final Place place;

  @override
  String toString() {
    return 'PlaceInfoRouteArgs{key: $key, place: $place}';
  }
}

/// generated route for
/// [PrivacyPolicyScreen]
class PrivacyPolicyRoute extends PageRouteInfo<void> {
  const PrivacyPolicyRoute({List<PageRouteInfo>? children})
      : super(
          PrivacyPolicyRoute.name,
          initialChildren: children,
        );

  static const String name = 'PrivacyPolicyRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PromotionScreen]
class PromotionRoute extends PageRouteInfo<void> {
  const PromotionRoute({List<PageRouteInfo>? children})
      : super(
          PromotionRoute.name,
          initialChildren: children,
        );

  static const String name = 'PromotionRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingsScreen]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SupportScreen]
class SupportRoute extends PageRouteInfo<void> {
  const SupportRoute({List<PageRouteInfo>? children})
      : super(
          SupportRoute.name,
          initialChildren: children,
        );

  static const String name = 'SupportRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TermsOfUseScreen]
class TermsOfUseRoute extends PageRouteInfo<void> {
  const TermsOfUseRoute({List<PageRouteInfo>? children})
      : super(
          TermsOfUseRoute.name,
          initialChildren: children,
        );

  static const String name = 'TermsOfUseRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
