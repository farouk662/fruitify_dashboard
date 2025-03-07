
import 'package:get_it/get_it.dart';

import '../../features/orders/data/repos/orders_repo_impl.dart';
import '../../features/orders/domain/repos/orders_repo.dart';
import '../repos/images_repo/images_repo.dart';
import '../repos/images_repo/images_repo_impl.dart';
import '../repos/product_repo/products_repo.dart';
import '../repos/product_repo/products_repo_impl.dart';
import 'data_service.dart';
import 'firestore_service.dart';
import 'stoarage_service.dart';
import 'supabase_stoarge.dart';

final getIt = GetIt.instance;

void setupGetit() {
  getIt.registerSingleton<StoarageService>(SupabaseStoargeService());
  getIt.registerSingleton<DatabaseService>(FireStoreService());

  getIt.registerSingleton<ImagesRepo>(
      ImagesRepoImpl(getIt.get<StoarageService>()));
  getIt.registerSingleton<ProductsRepo>(
    ProductsRepoImpl(
      getIt.get<DatabaseService>(),
    ),
  );

  getIt.registerSingleton<OrdersRepo>(
      OrdersRepoImpl(getIt.get<DatabaseService>()));
}
