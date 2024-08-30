import 'package:drift/drift.dart';

@DataClassName("Product")
class ProductTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get productName => text()();

  IntColumn get price => integer().nullable()();

  DateTimeColumn get createdAt => dateTime().nullable()();

  @override
  String? get tableName => "Product";
}
