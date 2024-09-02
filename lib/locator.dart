import 'package:billingapp/database/database.dart';
import 'package:billingapp/fetcher/product/view_models/product_view_model.dart';
import 'package:billingapp/res/global_object.dart';

void setUp() {
  locator.registerSingleton<AppDatabase>(appDatabase);
  locator.registerLazySingleton<ProductViewModel>(() => ProductViewModel());

}
