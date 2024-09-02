import 'package:auto_route/auto_route.dart';
import 'package:billingapp/core/widgets/app_bar.dart';
import 'package:billingapp/database/database.dart';
import 'package:billingapp/fetcher/product/view_models/product_view_model.dart';
import 'package:billingapp/fetcher/product/views/widgets/text_field.dart'
    as app;
import 'package:billingapp/res/app_util.dart';
import 'package:billingapp/res/constant.dart';
import 'package:billingapp/res/global_object.dart';
import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nb_utils/nb_utils.dart' as nb;
import 'package:nb_utils/nb_utils.dart';

@RoutePage()
class AddProductScreen extends StatefulWidget {
  final Product? product;

  const AddProductScreen({
    super.key,
    this.product,
  });

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  TextEditingController productNameTextController = TextEditingController();
  TextEditingController productPriceTextController = TextEditingController();

  bool isUpdate = false;

  final productLocator = locator<ProductViewModel>();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    init();
    super.initState();
  }

  void init() {
    if (widget.product != null) {
      isUpdate = true;
      productNameTextController.text = widget.product!.productName.validate();
      productPriceTextController.text =
          widget.product!.price.toString().validate();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBarView(
          title: isUpdate ? "Update Product" : "Add Product",
          backgroundColor: itsPrimaryColor,
        ),
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              app.AppTextField(
                hintText: "Product Name",
                textController: productNameTextController,
                validation: (value) => validator(value),
              ),
              app.AppTextField(
                hintText: "Product Price",
                textController: productPriceTextController,
                validation: (value) => validator(value),
                textInputType: TextInputType.number,
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: nb.AppButton(
          color: itsPrimaryColor.shade200,
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 8.sp),
           onTap: () async => await addProduct(),
          text: isUpdate ? "UPDATE" : "ADD",
        ),
      ),
    );
  }

  Future<void> addProduct() async {
    if (_formKey.currentState == null || !_formKey.currentState!.validate()) {
      return;
    }
      if (isUpdate) {
        await productLocator.updateProduct(
          widget.product!.copyWith(
            productName: productNameTextController.text.validate(),
            price:
            drift.Value(int.tryParse(productPriceTextController.text) ?? 0),
          ),
          onSuccess: afterOnSuccessNavigation,
        );
        return;
      }

      Map<String, dynamic> product = {
        "price": int.tryParse(productPriceTextController.text) ?? 0,
        "name": productNameTextController.text.validate(),
      };
      await productLocator.addProduct(
          product: product, onSuccess: afterOnSuccessNavigation);



  }

  void afterOnSuccessNavigation() {
    nb.finish(context);
  }
}
