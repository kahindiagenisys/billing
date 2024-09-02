import 'package:billingapp/database/database.dart';
import 'package:billingapp/database/tables_writes/product_table_writes.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class ProductViewModel with ChangeNotifier {
  Future<void> addProduct({
    required Map<String, dynamic> product,
    required Function() onSuccess,
  }) async {
    try {
      await ProductTableWrites.addProduct(product);
      onSuccess();
    } catch (e) {
      toast('Error is : $e');
    }
  }

  Future<void> updateProduct(Product product,{ required Function() onSuccess,})async{
    try {
        await ProductTableWrites.updateProduct(product);
        onSuccess();
    } catch (e) {
      toast('Error is : $e');
    }
  }


  Future<void> deleteProduct(int productId) async {
    try {
    return  await ProductTableWrites.deleteProduct(productId);
    } catch (e) {
      toast('Error is : $e');
    }
  }
}
