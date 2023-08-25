import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'models/page_config.dart';
import 'models/page_paths.dart';
import 'pages.dart';

class AppRouterParser extends RouteInformationParser<PageConfiguration> {
  @override
  Future<PageConfiguration> parseRouteInformation(
      RouteInformation routeInformation) {
    final uri = Uri.parse(routeInformation.location ?? '');

    if (uri.pathSegments.isEmpty) {
      return SynchronousFuture(PageConfigs.splashPageConfig);
    }

    final path = '/' + uri.pathSegments[0];

    switch (path) {
      case PagePaths.splashPagePath:
        return SynchronousFuture(PageConfigs.splashPageConfig);
      default:
        return SynchronousFuture(PageConfigs.splashPageConfig);
    }
  }

  @override
  RouteInformation restoreRouteInformation(PageConfiguration configuration) {
    switch (configuration.uiPage) {
      case Pages.splashPage:
        return const RouteInformation(location: PagePaths.splashPagePath);

      case Pages.signInScreen:
        return const RouteInformation(location: PagePaths.signInScreenPagePath);
      case Pages.flightInfoPage:
        return const RouteInformation(location: PagePaths.flightInfoPagePath);
      case Pages.signUpScreen:
        return const RouteInformation(location: PagePaths.signUpScreenPagePath);
      case Pages.dashboard:
        return const RouteInformation(location: PagePaths.dashboardPagePath);
      case Pages.complaintManagement:
        return const RouteInformation(
            location: PagePaths.complaintManagementPagePath);
      case Pages.lostLuggage:
        return const RouteInformation(location: PagePaths.lostLuggagePagePath);
      case Pages.securityScreen:
        return const RouteInformation(
            location: PagePaths.securityScreenPagePath);
      case Pages.generalComplain:
        return const RouteInformation(
            location: PagePaths.generalComplainPagePath);
      case Pages.alertScreen:
        return const RouteInformation(location: PagePaths.alertScreenPagePath);
      case Pages.otpScreen:
        return const RouteInformation(location: PagePaths.otpScreenPagePath);
      case Pages.forgotPassword:
        return const RouteInformation(
            location: PagePaths.forgotPasswordPagePath);
      case Pages.promotionScreenPage:
        return const RouteInformation(
            location: PagePaths.promotionScreenPagePath);
      case Pages.applyPromoCodeScreenPage:
        return const RouteInformation(
            location: PagePaths.applyPromoCodeScreenPagePath);
      case Pages.productDetailsScreenPage:
        return const RouteInformation(
            location: PagePaths.productDetailsScreenPagePath);
      case Pages.checkoutItemsScreenPage:
        return const RouteInformation(
            location: PagePaths.checkoutItemsScreenPagePath);
      case Pages.addToCardScreenPage:
        return const RouteInformation(
            location: PagePaths.addToCardScreenPagePath);
      case Pages.editProfile:
        return const RouteInformation(location: PagePaths.editProfilePagePath);
    }
  }
}
