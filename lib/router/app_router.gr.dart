// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:billingapp/database/database.dart' as _i6;
import 'package:billingapp/fetcher/home/views/home_screen.dart' as _i2;
import 'package:billingapp/fetcher/product/views/add_product_screen.dart'
    as _i1;
import 'package:billingapp/fetcher/product/views/products_screen.dart' as _i3;
import 'package:flutter/material.dart' as _i5;

/// generated route for
/// [_i1.AddProductScreen]
class AddProductRoute extends _i4.PageRouteInfo<AddProductRouteArgs> {
  AddProductRoute({
    _i5.Key? key,
    _i6.Product? product,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          AddProductRoute.name,
          args: AddProductRouteArgs(
            key: key,
            product: product,
          ),
          initialChildren: children,
        );

  static const String name = 'AddProductRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AddProductRouteArgs>(
          orElse: () => const AddProductRouteArgs());
      return _i1.AddProductScreen(
        key: args.key,
        product: args.product,
      );
    },
  );
}

class AddProductRouteArgs {
  const AddProductRouteArgs({
    this.key,
    this.product,
  });

  final _i5.Key? key;

  final _i6.Product? product;

  @override
  String toString() {
    return 'AddProductRouteArgs{key: $key, product: $product}';
  }
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute({List<_i4.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomeScreen();
    },
  );
}

/// generated route for
/// [_i3.ProductsScreen]
class ProductsRoute extends _i4.PageRouteInfo<void> {
  const ProductsRoute({List<_i4.PageRouteInfo>? children})
      : super(
          ProductsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProductsRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i3.ProductsScreen();
    },
  );
}
