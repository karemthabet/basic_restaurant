import 'package:basic_restaurant/core/services/cloud_firestore_service.dart'
    show CloudFirestoreService;
import 'package:basic_restaurant/features/home/data/repositories/home_repo.dart';
import 'package:basic_restaurant/features/home/data/repositories/home_repo_impl.dart';
import 'package:basic_restaurant/features/home/presentation/cubit/home_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setupServiceLocator() {
  getIt.registerLazySingleton<CloudFirestoreService>(
    () => CloudFirestoreService(),
  );
  getIt.registerLazySingleton<HomeRepo>(
    () =>
        HomeRepoImpl(cloudFirestoreService: getIt.get<CloudFirestoreService>()),
  );
  getIt.registerFactory(() => HomeCubit(getIt.get<HomeRepo>()));
}
