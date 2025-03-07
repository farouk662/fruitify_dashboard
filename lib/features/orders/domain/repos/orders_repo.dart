import 'package:dartz/dartz.dart';
import '../../../../core/enums/order_enum.dart';
import '../../../../core/errors/failures.dart';
import '../entities/data/models/order_entity.dart';

abstract class OrdersRepo {
  Stream<Either<Failure, List<OrderEntity>>> fetchOrders();

  Future<Either<Failure, void>> updateOrder(
      {required OrderStatusEnum status, required String orderID});
}
