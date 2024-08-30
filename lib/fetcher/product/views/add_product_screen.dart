import 'package:auto_route/auto_route.dart';
import 'package:billingapp/core/widgets/app_bar.dart';
import 'package:billingapp/fetcher/product/views/widgets/text_field.dart';
import 'package:billingapp/res/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nb_utils/nb_utils.dart' as nb;

@RoutePage()
class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  TextEditingController productNameTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const AppBarView(
          title: "Add Product",
          backgroundColor: itsPrimaryColor,
        ),
        body: Column(
          children: [
            AppTextField(
              hintText: "Product Name",
              textController: productNameTextController,
            ),
            AppTextField(
              hintText: "Product Price",
              textController: productNameTextController,
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: nb.AppButton(
          color: itsPrimaryColor.shade200,
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 8.sp),
          onTap: () {},
          text: "Save",
        ),
      ),
    );
  }
}
