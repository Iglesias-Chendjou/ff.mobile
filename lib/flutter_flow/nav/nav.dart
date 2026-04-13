import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '/backend/schema/structs/index.dart';

import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  bool showSplashImage = true;

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) => appStateNotifier.showSplashImage
          ? Builder(
              builder: (context) => Container(
                color: Colors.transparent,
                child: Image.asset(
                  'assets/images/splashScreen35134.gif',
                  fit: BoxFit.cover,
                ),
              ),
            )
          : WalkthroughWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.showSplashImage
              ? Builder(
                  builder: (context) => Container(
                    color: Colors.transparent,
                    child: Image.asset(
                      'assets/images/splashScreen35134.gif',
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              : WalkthroughWidget(),
        ),
        FFRoute(
          name: HomeWidget.routeName,
          path: HomeWidget.routePath,
          builder: (context, params) => HomeWidget(
            fromRegister: params.getParam(
              'fromRegister',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: ACatalogWidget.routeName,
          path: ACatalogWidget.routePath,
          builder: (context, params) => ACatalogWidget(),
        ),
        FFRoute(
          name: CartWidget.routeName,
          path: CartWidget.routePath,
          builder: (context, params) => CartWidget(),
        ),
        FFRoute(
          name: ProfileWidget.routeName,
          path: ProfileWidget.routePath,
          builder: (context, params) => ProfileWidget(),
        ),
        FFRoute(
          name: WalkthroughWidget.routeName,
          path: WalkthroughWidget.routePath,
          builder: (context, params) => WalkthroughWidget(),
        ),
        FFRoute(
          name: LoginWidget.routeName,
          path: LoginWidget.routePath,
          builder: (context, params) => LoginWidget(),
        ),
        FFRoute(
          name: HelpCenterWidget.routeName,
          path: HelpCenterWidget.routePath,
          builder: (context, params) => HelpCenterWidget(),
        ),
        FFRoute(
          name: HelpCenterFAQWidget.routeName,
          path: HelpCenterFAQWidget.routePath,
          builder: (context, params) => HelpCenterFAQWidget(),
        ),
        FFRoute(
          name: HelpCenterSupportWidget.routeName,
          path: HelpCenterSupportWidget.routePath,
          builder: (context, params) => HelpCenterSupportWidget(),
        ),
        FFRoute(
          name: HelpCenterPrivacyWidget.routeName,
          path: HelpCenterPrivacyWidget.routePath,
          builder: (context, params) => HelpCenterPrivacyWidget(),
        ),
        FFRoute(
          name: HelpCenterTermsWidget.routeName,
          path: HelpCenterTermsWidget.routePath,
          builder: (context, params) => HelpCenterTermsWidget(),
        ),
        FFRoute(
          name: NotificationsWidget.routeName,
          path: NotificationsWidget.routePath,
          builder: (context, params) => NotificationsWidget(),
        ),
        FFRoute(
          name: LanguagesWidget.routeName,
          path: LanguagesWidget.routePath,
          builder: (context, params) => LanguagesWidget(),
        ),
        FFRoute(
          name: PaymentWidget.routeName,
          path: PaymentWidget.routePath,
          builder: (context, params) => PaymentWidget(),
        ),
        FFRoute(
          name: SecurityWidget.routeName,
          path: SecurityWidget.routePath,
          builder: (context, params) => SecurityWidget(),
        ),
        FFRoute(
          name: AppearanceWidget.routeName,
          path: AppearanceWidget.routePath,
          builder: (context, params) => AppearanceWidget(),
        ),
        FFRoute(
          name: AboutFreshGoWidget.routeName,
          path: AboutFreshGoWidget.routePath,
          builder: (context, params) => AboutFreshGoWidget(),
        ),
        FFRoute(
          name: InviteFriendsWidget.routeName,
          path: InviteFriendsWidget.routePath,
          builder: (context, params) => InviteFriendsWidget(),
        ),
        FFRoute(
          name: AccountInformationWidget.routeName,
          path: AccountInformationWidget.routePath,
          builder: (context, params) => AccountInformationWidget(),
        ),
        FFRoute(
          name: LoginEmailWidget.routeName,
          path: LoginEmailWidget.routePath,
          builder: (context, params) => LoginEmailWidget(),
        ),
        FFRoute(
          name: RegisterWidget.routeName,
          path: RegisterWidget.routePath,
          builder: (context, params) => RegisterWidget(),
        ),
        FFRoute(
          name: ForgotPasswordWidget.routeName,
          path: ForgotPasswordWidget.routePath,
          builder: (context, params) => ForgotPasswordWidget(),
        ),
        FFRoute(
          name: ForgotPassword2Widget.routeName,
          path: ForgotPassword2Widget.routePath,
          builder: (context, params) => ForgotPassword2Widget(),
        ),
        FFRoute(
          name: ForgotPassword3Widget.routeName,
          path: ForgotPassword3Widget.routePath,
          builder: (context, params) => ForgotPassword3Widget(),
        ),
        FFRoute(
          name: MessageWidget.routeName,
          path: MessageWidget.routePath,
          builder: (context, params) => MessageWidget(),
        ),
        FFRoute(
          name: NotificatiosWidget.routeName,
          path: NotificatiosWidget.routePath,
          builder: (context, params) => NotificatiosWidget(),
        ),
        FFRoute(
          name: ReviewWidget.routeName,
          path: ReviewWidget.routePath,
          builder: (context, params) => ReviewWidget(),
        ),
        FFRoute(
          name: PaymentAddCardWidget.routeName,
          path: PaymentAddCardWidget.routePath,
          builder: (context, params) => PaymentAddCardWidget(),
        ),
        FFRoute(
          name: FavouritesWidget.routeName,
          path: FavouritesWidget.routePath,
          builder: (context, params) => FavouritesWidget(),
        ),
        FFRoute(
          name: MyAddressesWidget.routeName,
          path: MyAddressesWidget.routePath,
          builder: (context, params) => MyAddressesWidget(),
        ),
        FFRoute(
          name: MyAddressesSingleWidget.routeName,
          path: MyAddressesSingleWidget.routePath,
          builder: (context, params) => MyAddressesSingleWidget(),
        ),
        FFRoute(
          name: PromoCodesWidget.routeName,
          path: PromoCodesWidget.routePath,
          builder: (context, params) => PromoCodesWidget(),
        ),
        FFRoute(
          name: MainSearchWidget.routeName,
          path: MainSearchWidget.routePath,
          builder: (context, params) => MainSearchWidget(),
        ),
        FFRoute(
          name: CatalogSearchWidget.routeName,
          path: CatalogSearchWidget.routePath,
          builder: (context, params) => CatalogSearchWidget(),
        ),
        FFRoute(
          name: CheckoutWidget.routeName,
          path: CheckoutWidget.routePath,
          builder: (context, params) => CheckoutWidget(),
        ),
        FFRoute(
          name: PaymentMethodWidget.routeName,
          path: PaymentMethodWidget.routePath,
          builder: (context, params) => PaymentMethodWidget(),
        ),
        FFRoute(
          name: ArchiveWidget.routeName,
          path: ArchiveWidget.routePath,
          builder: (context, params) => ArchiveWidget(),
        ),
        FFRoute(
          name: ArchiveFiltersWidget.routeName,
          path: ArchiveFiltersWidget.routePath,
          builder: (context, params) => ArchiveFiltersWidget(),
        ),
        FFRoute(
          name: CheckoutSuccessWidget.routeName,
          path: CheckoutSuccessWidget.routePath,
          builder: (context, params) => CheckoutSuccessWidget(),
        ),
        FFRoute(
          name: OrdersWidget.routeName,
          path: OrdersWidget.routePath,
          builder: (context, params) => OrdersWidget(),
        ),
        FFRoute(
          name: OrdersDeliveredWidget.routeName,
          path: OrdersDeliveredWidget.routePath,
          builder: (context, params) => OrdersDeliveredWidget(),
        ),
        FFRoute(
          name: OrdersInProgress2Widget.routeName,
          path: OrdersInProgress2Widget.routePath,
          builder: (context, params) => OrdersInProgress2Widget(),
        ),
        FFRoute(
          name: OrdersInProgress1Widget.routeName,
          path: OrdersInProgress1Widget.routePath,
          builder: (context, params) => OrdersInProgress1Widget(
            fromPurchase: params.getParam(
              'fromPurchase',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: OrdersSearchWidget.routeName,
          path: OrdersSearchWidget.routePath,
          builder: (context, params) => OrdersSearchWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  name: state.name,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(
                  key: state.pageKey, name: state.name, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
