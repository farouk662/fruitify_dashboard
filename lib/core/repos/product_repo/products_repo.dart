import 'package:dartz/dartz.dart';
import 'package:fruitify_dashboard/core/errors/failures.dart';

import '../../../features/add_product/domain/entities/product_entity.dart';

abstract class ProductsRepo {
  Future<Either<Failure, void>> addProduct(ProductEntity addProductInputEntity);
}
