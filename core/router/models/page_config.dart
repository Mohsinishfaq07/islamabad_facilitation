import 'package:sb_myreports/core/router/models/page_keys.dart';
import 'package:sb_myreports/core/router/models/page_paths.dart';

import '../pages.dart';

class PageConfigs {
  static PageConfiguration splashPageConfig = const PageConfiguration(
      key: PageKeys.splashPageKey,
      path: PagePaths.splashPagePath,
      uiPage: Pages.splashPage);

  static PageConfiguration signInScreenPageConfig = const PageConfiguration(
      key: PageKeys.signInScreenPageKey,
      path: PagePaths.signInScreenPagePath,
      uiPage: Pages.signInScreen);

  static PageConfiguration signUpScreenPageConfig = const PageConfiguration(
      key: PageKeys.signUpScreenPageKey,
      path: PagePaths.signUpScreenPagePath,
      uiPage: Pages.signUpScreen);

  static PageConfiguration otpScreenPageConfig = const PageConfiguration(
      key: PageKeys.otpScreenPageKey,
      path: PagePaths.otpScreenPagePath,
      uiPage: Pages.otpScreen);

  static PageConfiguration forgotPasswordPageConfig = const PageConfiguration(
      key: PageKeys.forgotPasswordPageKey,
      path: PagePaths.forgotPasswordPagePath,
      uiPage: Pages.forgotPassword);

  static PageConfiguration dashboardPageConfig = const PageConfiguration(
      key: PageKeys.dashboardPageKey,
      path: PagePaths.dashboardPagePath,
      uiPage: Pages.dashboard);

  static PageConfiguration complaintManagementPageConfig =
      const PageConfiguration(
          key: PageKeys.complaintManagementPageKey,
          path: PagePaths.complaintManagementPagePath,
          uiPage: Pages.complaintManagement);
  static PageConfiguration lostLuggagePageConfig = const PageConfiguration(
      key: PageKeys.lostLuggagePageKey,
      path: PagePaths.lostLuggagePagePath,
      uiPage: Pages.lostLuggage);

  static PageConfiguration securityScreenPageConfig = const PageConfiguration(
      key: PageKeys.securityScreenPageKey,
      path: PagePaths.securityScreenPagePath,
      uiPage: Pages.securityScreen);

  static PageConfiguration generalComplainPageConfig = const PageConfiguration(
      key: PageKeys.generalComplainPageKey,
      path: PagePaths.generalComplainPagePath,
      uiPage: Pages.generalComplain);
  static PageConfiguration alertScreenPageConfig = const PageConfiguration(
      key: PageKeys.alertScreenPageKey,
      path: PagePaths.alertScreenPagePath,
      uiPage: Pages.alertScreen);
  static PageConfiguration flightInfoPageConfig = const PageConfiguration(
      key: PageKeys.flightInfoPageKey,
      path: PagePaths.flightInfoPagePath,
      uiPage: Pages.flightInfoPage);
  static PageConfiguration promotionScreenPageConfig = const PageConfiguration(
      key: PageKeys.promotionScreenPageKey,
      path: PagePaths.promotionScreenPagePath,
      uiPage: Pages.promotionScreenPage);
  static PageConfiguration applyPromoCodeScreenPageConfig =
      const PageConfiguration(
          key: PageKeys.applyPromoCodeScreenPageKey,
          path: PagePaths.applyPromoCodeScreenPagePath,
          uiPage: Pages.applyPromoCodeScreenPage);
  static PageConfiguration productDetailsScreenPageConfig =
      const PageConfiguration(
          key: PageKeys.productDetailsScreenPageKey,
          path: PagePaths.productDetailsScreenPagePath,
          uiPage: Pages.productDetailsScreenPage);
  static PageConfiguration addToCardScreenPageConfig = const PageConfiguration(
      key: PageKeys.addToCardScreenPageKey,
      path: PagePaths.addToCardScreenPagePath,
      uiPage: Pages.addToCardScreenPage);
  static PageConfiguration checkoutItemsScreenPageConfig =
      const PageConfiguration(
          key: PageKeys.checkoutItemsScreenPageKey,
          path: PagePaths.checkoutItemsScreenPagePath,
          uiPage: Pages.checkoutItemsScreenPage);
  static PageConfiguration editProfilePageConfig = const PageConfiguration(
      key: PageKeys.editProfilePageKey,
      path: PagePaths.editProfilePagePath,
      uiPage: Pages.editProfile);
}
