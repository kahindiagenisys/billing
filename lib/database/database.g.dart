// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $ProductTableTable extends ProductTable
    with TableInfo<$ProductTableTable, Product> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _productNameMeta =
      const VerificationMeta('productName');
  @override
  late final GeneratedColumn<String> productName = GeneratedColumn<String>(
      'product_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<int> price = GeneratedColumn<int>(
      'price', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, productName, price, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'Product';
  @override
  VerificationContext validateIntegrity(Insertable<Product> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('product_name')) {
      context.handle(
          _productNameMeta,
          productName.isAcceptableOrUnknown(
              data['product_name']!, _productNameMeta));
    } else if (isInserting) {
      context.missing(_productNameMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Product map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Product(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      productName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}product_name'])!,
      price: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}price']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at']),
    );
  }

  @override
  $ProductTableTable createAlias(String alias) {
    return $ProductTableTable(attachedDatabase, alias);
  }
}

class Product extends DataClass implements Insertable<Product> {
  final int id;
  final String productName;
  final int? price;
  final DateTime? createdAt;
  const Product(
      {required this.id,
      required this.productName,
      this.price,
      this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['product_name'] = Variable<String>(productName);
    if (!nullToAbsent || price != null) {
      map['price'] = Variable<int>(price);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    return map;
  }

  ProductTableCompanion toCompanion(bool nullToAbsent) {
    return ProductTableCompanion(
      id: Value(id),
      productName: Value(productName),
      price:
          price == null && nullToAbsent ? const Value.absent() : Value(price),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
    );
  }

  factory Product.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Product(
      id: serializer.fromJson<int>(json['id']),
      productName: serializer.fromJson<String>(json['productName']),
      price: serializer.fromJson<int?>(json['price']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'productName': serializer.toJson<String>(productName),
      'price': serializer.toJson<int?>(price),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
    };
  }

  Product copyWith(
          {int? id,
          String? productName,
          Value<int?> price = const Value.absent(),
          Value<DateTime?> createdAt = const Value.absent()}) =>
      Product(
        id: id ?? this.id,
        productName: productName ?? this.productName,
        price: price.present ? price.value : this.price,
        createdAt: createdAt.present ? createdAt.value : this.createdAt,
      );
  Product copyWithCompanion(ProductTableCompanion data) {
    return Product(
      id: data.id.present ? data.id.value : this.id,
      productName:
          data.productName.present ? data.productName.value : this.productName,
      price: data.price.present ? data.price.value : this.price,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Product(')
          ..write('id: $id, ')
          ..write('productName: $productName, ')
          ..write('price: $price, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, productName, price, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Product &&
          other.id == this.id &&
          other.productName == this.productName &&
          other.price == this.price &&
          other.createdAt == this.createdAt);
}

class ProductTableCompanion extends UpdateCompanion<Product> {
  final Value<int> id;
  final Value<String> productName;
  final Value<int?> price;
  final Value<DateTime?> createdAt;
  const ProductTableCompanion({
    this.id = const Value.absent(),
    this.productName = const Value.absent(),
    this.price = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  ProductTableCompanion.insert({
    this.id = const Value.absent(),
    required String productName,
    this.price = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : productName = Value(productName);
  static Insertable<Product> custom({
    Expression<int>? id,
    Expression<String>? productName,
    Expression<int>? price,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (productName != null) 'product_name': productName,
      if (price != null) 'price': price,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  ProductTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? productName,
      Value<int?>? price,
      Value<DateTime?>? createdAt}) {
    return ProductTableCompanion(
      id: id ?? this.id,
      productName: productName ?? this.productName,
      price: price ?? this.price,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (productName.present) {
      map['product_name'] = Variable<String>(productName.value);
    }
    if (price.present) {
      map['price'] = Variable<int>(price.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductTableCompanion(')
          ..write('id: $id, ')
          ..write('productName: $productName, ')
          ..write('price: $price, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ProductTableTable productTable = $ProductTableTable(this);
  late final ProductDao productDao = ProductDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [productTable];
}

typedef $$ProductTableTableCreateCompanionBuilder = ProductTableCompanion
    Function({
  Value<int> id,
  required String productName,
  Value<int?> price,
  Value<DateTime?> createdAt,
});
typedef $$ProductTableTableUpdateCompanionBuilder = ProductTableCompanion
    Function({
  Value<int> id,
  Value<String> productName,
  Value<int?> price,
  Value<DateTime?> createdAt,
});

class $$ProductTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $ProductTableTable> {
  $$ProductTableTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get productName => $state.composableBuilder(
      column: $state.table.productName,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get price => $state.composableBuilder(
      column: $state.table.price,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$ProductTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $ProductTableTable> {
  $$ProductTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get productName => $state.composableBuilder(
      column: $state.table.productName,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get price => $state.composableBuilder(
      column: $state.table.price,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$ProductTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ProductTableTable,
    Product,
    $$ProductTableTableFilterComposer,
    $$ProductTableTableOrderingComposer,
    $$ProductTableTableCreateCompanionBuilder,
    $$ProductTableTableUpdateCompanionBuilder,
    (Product, BaseReferences<_$AppDatabase, $ProductTableTable, Product>),
    Product,
    PrefetchHooks Function()> {
  $$ProductTableTableTableManager(_$AppDatabase db, $ProductTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$ProductTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$ProductTableTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> productName = const Value.absent(),
            Value<int?> price = const Value.absent(),
            Value<DateTime?> createdAt = const Value.absent(),
          }) =>
              ProductTableCompanion(
            id: id,
            productName: productName,
            price: price,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String productName,
            Value<int?> price = const Value.absent(),
            Value<DateTime?> createdAt = const Value.absent(),
          }) =>
              ProductTableCompanion.insert(
            id: id,
            productName: productName,
            price: price,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ProductTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ProductTableTable,
    Product,
    $$ProductTableTableFilterComposer,
    $$ProductTableTableOrderingComposer,
    $$ProductTableTableCreateCompanionBuilder,
    $$ProductTableTableUpdateCompanionBuilder,
    (Product, BaseReferences<_$AppDatabase, $ProductTableTable, Product>),
    Product,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ProductTableTableTableManager get productTable =>
      $$ProductTableTableTableManager(_db, _db.productTable);
}
