import 'package:auto_route/auto_route.dart';
import 'package:billingapp/core/widgets/app_bar.dart';
import 'package:billingapp/res/constant.dart';
import 'package:billingapp/router/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBarView(
          backgroundColor: itsPrimaryColor,
        ),
        body: Container(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.router.push(AddProductRoute());
          },
          child: Icon(
            Icons.add,
            color: Colors.black54,
            size: 28.sp,
          ),
        ),
      ),
    );
  }
}
