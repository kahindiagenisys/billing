import 'package:auto_route/auto_route.dart';
import 'package:billingapp/router/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          initial: true,
          page: HomeRoute.page,
        ),
        AutoRoute(
          page: ProductsRoute.page,
        ),
        AutoRoute(
          page: AddProductRoute.page,
        )
      ];
}
