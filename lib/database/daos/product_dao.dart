import 'package:billingapp/database/database.dart';
import 'package:billingapp/database/tables/product.dart';
import 'package:billingapp/res/global_object.dart';
import 'package:drift/drift.dart';

part 'product_dao.g.dart';

@DriftAccessor(tables: [ProductTable])
class ProductDao extends DatabaseAccessor<AppDatabase> with _$ProductDaoMixin {
  ProductDao(super.db);

  Stream<List<Product>> productItems() {
    return (appDatabase.select(productTable)
    //..where((product) => product.price.isBiggerThan() )
          ..orderBy(
              [(product) => OrderingTerm(expression: product.productName)]))
        .watch();
  }
}
