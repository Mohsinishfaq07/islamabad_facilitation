import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sb_myreports/core/utils/extension/extensions.dart';
import 'package:sb_myreports/features/alerts/presentation/pages/alert_screen.dart';
import 'package:sb_myreports/features/authentication/presentation/pages/forgot_password.dart';
import 'package:sb_myreports/features/authentication/presentation/pages/otp_screen.dart';
import 'package:sb_myreports/features/authentication/presentation/pages/sign_in_page.dart';
import 'package:sb_myreports/features/authentication/presentation/pages/sign_up_page.dart';
import 'package:sb_myreports/features/complaint_managemnt/presentation/pages/complaint_management.dart';
import 'package:sb_myreports/features/dashboard/presentation/pages/dashboard.dart';

import '../../features/complaint_managemnt/presentation/pages/general_complain.dart';
import '../../features/complaint_managemnt/presentation/pages/lost_luggage.dart';
import '../../features/complaint_managemnt/presentation/pages/security_screen.dart';
import '../../features/dashboard/presentation/pages/edit_profile.dart';
import '../../features/flight1/presentation/flight_info_page.dart';
import '../../features/promotion/presentation/pages/add_to_card_screen.dart';
import '../../features/promotion/presentation/pages/apply_promo_code_screen.dart';
import '../../features/promotion/presentation/pages/checkout_items_screen.dart';
import '../../features/promotion/presentation/pages/product_details_screen.dart';
import '../../features/promotion/presentation/pages/promotion_screen.dart';
import '../../features/splash/presentation/pages/splash_screen.dart';
import '../utils/enums/page_state_enum.dart';
import '../utils/globals/globals.dart';
import 'app_state.dart';
import 'pages.dart';

BuildContext?
    globalHomeContext; // doing this to pop the bottom sheet on home screen

// ignore: camel_case_types
class appRouterDelegate extends RouterDelegate<PageConfiguration>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<PageConfiguration> {
  late final AppState appState;
  final List<Page> _pages = [];
  late BackButtonDispatcher backButtonDispatcher;

  List<MaterialPage> get pages => List.unmodifiable(_pages);

  appRouterDelegate(this.appState) {
    appState.addListener(() {
      notifyListeners();
    });
  }

  @override
  Widget build(BuildContext context) {
    /// Faulty Code will need to find a way to solve it
    appState.globalErrorShow = (value) {
      context.show(message: value);
    };

    return Container(
      key: ValueKey(pages.last.name),
      child: Navigator(
        key: navigatorKeyGlobal,
        onPopPage: _onPopPage,
        pages: buildPages(),
      ),
    );
  }

  List<Page> buildPages() {
    switch (appState.currentAction.state) {
      case PageState.none:
        break;
      case PageState.addPage:
        addPage(appState.currentAction.page!);
        break;
      case PageState.remove:
        removePage(appState.currentAction.page!);
        break;

      case PageState.pop:
        pop();
        break;
      case PageState.addAll:
        break;
      case PageState.addWidget:
        pushWidget(
            appState.currentAction.widget!, appState.currentAction.page!);
        break;
      case PageState.replace:
        replace(appState.currentAction.page!);
        break;
      case PageState.replaceAll:
        replaceAll(appState.currentAction.page!);
        break;
    }
    return List.of(_pages);
  }

  void replaceAll(PageConfiguration newRoute) {
    _pages.clear();
    setNewRoutePath(newRoute);
  }

  void replace(PageConfiguration newRoute) {
    if (_pages.isNotEmpty) {
      _pages.removeLast();
    }
    addPage(newRoute);
  }

  /// This method adds pages based on the PageConfig received
  /// [Input]: [PageConfiguration]
  void addPage(PageConfiguration pageConfig) {
    final shouldAddPage =
        _pages.isEmpty || (_pages.last.name != pageConfig.path);

    if (shouldAddPage) {
      switch (pageConfig.uiPage) {
        case Pages.splashPage:
          _addPageData(const SplashScreen(), pageConfig);
          break;

        case Pages.signInScreen:
          _addPageData(const SignInScreen(), pageConfig);
          break;
        case Pages.editProfile:
          _addPageData(const EditProfile(), pageConfig);
          break;
        case Pages.signUpScreen:
          _addPageData(const SignUpScreen(), pageConfig);
          break;
        case Pages.dashboard:
          _addPageData(const Dashboard(), pageConfig);
          break;
        case Pages.complaintManagement:
          _addPageData(const ComplaintManagement(), pageConfig);
          break;
        case Pages.lostLuggage:
          _addPageData(const LostLuggage(), pageConfig);
          break;
        case Pages.securityScreen:
          _addPageData(const SecurityScreen(), pageConfig);
          break;
        case Pages.generalComplain:
          _addPageData(const GeneralComplain(), pageConfig);
          break;
        case Pages.alertScreen:
          _addPageData(const AlertScreen(), pageConfig);
          break;
        case Pages.flightInfoPage:
          _addPageData(const FlightInfoPage(), pageConfig);
          break;
        case Pages.otpScreen:
          _addPageData(const OtpScreen(), pageConfig);
          break;
        case Pages.forgotPassword:
          _addPageData(const ForgotPassword(), pageConfig);
          break;
        case Pages.promotionScreenPage:
          _addPageData(const PromotionScreen(), pageConfig);
          break;
        case Pages.applyPromoCodeScreenPage:
          _addPageData(const ApplyPromoCodeScreen(), pageConfig);
          break;
        case Pages.productDetailsScreenPage:
          _addPageData(const ProductDetailsScreen(), pageConfig);
          break;
        case Pages.checkoutItemsScreenPage:
          _addPageData(const CheckoutItemsScreen(), pageConfig);
          break;

        case Pages.addToCardScreenPage:
          _addPageData(const AddToCardScreen(), pageConfig);
          break;
      }
    }
  }

  void _addPageData(Widget child, PageConfiguration pageConfig) {
    _pages.add(
      _createPage(child, pageConfig),
    );
  }

  void pushWidget(Widget child, PageConfiguration newRoute) {
    _addPageData(child, newRoute);
  }

  MaterialPage _createPage(Widget child, PageConfiguration pageConfig) {
    return MaterialPage(
        child: child,
        key: ValueKey(pageConfig.key),
        name: pageConfig.path,
        arguments: pageConfig);
  }

  bool _onPopPage(Route<dynamic> route, result) {
    final didPop = route.didPop(result);

    if (!didPop) {
      return false;
    }
    if (canPop()) {
      pop();
      return true;
    } else {
      return false;
    }
  }

  void pop() {
    if (globalHomeContext != null) {
      Navigator.of(globalHomeContext!).pop();
      globalHomeContext = null;
      return;
    }
    if (canPop()) {
      _removePage(_pages.last as MaterialPage);
    } else {
      // if (_pages.last.name != PagePaths.authWrapperPagePath) {
      //   _homeViewModel.onBottomNavTap(0);
      // }
    }
  }

  void removePage(PageConfiguration page) {
    if (_pages.isNotEmpty) {
      int index = _pages.indexWhere((element) => element.name == page.path);
      if (index != -1) {
        _pages.removeAt(index);
      }
    }
  }

  void _removePage(MaterialPage page) {
    _pages.remove(page);
  }

  bool canPop() {
    return _pages.length > 1;
  }

  @override
  Future<bool> popRoute() {
    if (canPop()) {
      _removePage(_pages.last as MaterialPage);
      return Future.value(true);
    }
    return Future.value(false);
  }

  @override
  Future<void> setNewRoutePath(PageConfiguration configuration) {
    final shouldAddPage =
        _pages.isEmpty || (_pages.last.name != configuration.path);

    if (!shouldAddPage) {
      return SynchronousFuture(null);
    }
    _pages.clear();
    addPage(configuration);

    return SynchronousFuture(null);
  }

  @override
  GlobalKey<NavigatorState>? get navigatorKey => navigatorKeyGlobal;
}
