import 'package:billingapp/database/database.dart';
import 'package:billingapp/res/global_object.dart';
import 'package:drift/drift.dart';

class ProductTableWrites {
  static Future addProduct(Map<String, dynamic> product) async {
    return await appDatabase.into(appDatabase.productTable).insert(
          ProductTableCompanion(
            productName: Value(product['name']),
            price: Value(product['price']),
          ),
        );
  }

  static Future updateProduct(Product product) async {
    return appDatabase.update(appDatabase.productTable).replace(
          ProductTableCompanion(
            id: Value(product.id),
            productName: Value(product.productName),
            price: Value(product.price),
          ),
        );
  }

  static Future deleteProduct(int productId) async {
    return (appDatabase.delete(appDatabase.productTable)
          ..where((product) => product.id.equals(productId)))
        .go();
  }
}
