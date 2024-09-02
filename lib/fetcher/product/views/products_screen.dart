import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:billingapp/core/widgets/app_bar.dart';
import 'package:billingapp/database/daos/product_dao.dart';
import 'package:billingapp/database/database.dart';
import 'package:billingapp/fetcher/product/view_models/product_view_model.dart';
import 'package:billingapp/res/constant.dart';
import 'package:billingapp/res/global_object.dart';
import 'package:billingapp/router/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nb_utils/nb_utils.dart';

@RoutePage()
class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  final productLocator = locator<ProductViewModel>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const AppBarView(
          backgroundColor: itsPrimaryColor,
          title: "Products",
        ),
        body: StreamBuilder(
          stream: ProductDao(appDatabase).productItems(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return _buildMessageShow();
            }

            if (snapshot.hasError) {
              return _buildMessageShow(message: snapshot.error.toString());
            }

            if (snapshot.data == null || snapshot.data!.isEmpty) {
              return _buildMessageShow(message: "Data not found!");
            }

            List<Product> products = snapshot.data!;
            log(jsonEncode(products));
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return _productItemViewBuild(products[index]);
              },
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => context.router.push(AddProductRoute()),
          child: Icon(
            Icons.add,
            color: Colors.black54,
            size: 28.sp,
          ),
        ),
      ),
    );
  }

  Widget _buildMessageShow({String? message}) {
    return Center(
      child:
          message == null ? const CircularProgressIndicator() : Text(message),
    );
  }

  Widget _productItemViewBuild(Product product) {
    return Dismissible(
      key: Key(product.id.toString()),
      confirmDismiss: (direction) async {
        return showConfirmDialog(context, "Are you sure you want to delete it?",
            onAccept: () async {
          return await productLocator.deleteProduct(product.id);
        });
      },
      background: Container(
        color: Colors.red.shade100,
        child: ListTile(
          leading:
              _leadingProduct(product.productName[0]).opacity(opacity: 0.2),
          title: Text(product.productName).opacity(opacity: 0.2),
          subtitle: Text("Rs.${product.price}").opacity(opacity: 0.2),
        ),
      ),
      child: GestureDetector(
        onDoubleTap: () => context.router.push(AddProductRoute(product: product)),
        child: ListTile(
          leading: _leadingProduct(product.productName[0]),
          title: Text(product.productName),
          subtitle: Text("Rs.${product.price}"),
        ),
      ),
    );
  }

  Widget _leadingProduct(String later) {
    return Container(
      height: 40.sp,
      width: 40.sp,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey.shade200,
      ),
      child: Center(
        child: Text(
          later.toUpperCase(),
          style: TextStyle(
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
        ),
      ),
    );
  }
}
