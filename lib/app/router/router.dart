import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:vegas/app/main.dart';
import 'package:vegas/features/home/models/place/place.dart';
import 'package:vegas/features/new_place/congratulations_screen.dart';
import 'package:vegas/features/home/view/home_screen.dart';
import 'package:vegas/features/onboarding/info_screen.dart';
import 'package:vegas/features/new_place/new_place_screen.dart';
import 'package:vegas/features/onboarding/onboarding_screen.dart';
import 'package:vegas/features/home/view/place_info_screen.dart';
import 'package:vegas/features/settings/privacy_policy_screen.dart';
import 'package:vegas/features/settings/promotion_screen.dart';
import 'package:vegas/features/settings/settings_screen.dart';
import 'package:vegas/features/settings/subscription_screen.dart';
import 'package:vegas/features/settings/terms_of_use_screen.dart';

part 'router.gr.dart';

final showPromotion = promotion != null && promotion != '';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
            page: OnboardingRoute.page,
            initial: isFirstTime! && !showPromotion),
        AutoRoute(page: InfoRoute.page),
        AutoRoute(
            page: HomeRoute.page, initial: !isFirstTime! && !showPromotion),
        AutoRoute(page: NewPlaceRoute.page),
        AutoRoute(page: CongratulationsRoute.page),
        AutoRoute(page: PlaceInfoRoute.page),
        AutoRoute(page: SettingsRoute.page),
        AutoRoute(page: PromotionRoute.page, initial: showPromotion),
        AutoRoute(page: PrivacyPolicyRoute.page),
        AutoRoute(page: TermsOfUseRoute.page),
        AutoRoute(page: SupportRoute.page),
      ];
}
