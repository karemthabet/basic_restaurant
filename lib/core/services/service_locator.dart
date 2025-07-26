import 'package:basic_restaurant/core/services/auth_srvice.dart';
import 'package:basic_restaurant/core/services/cloud_firestore_service.dart'
    show CloudFirestoreService;
import 'package:basic_restaurant/features/auth/data/auth_repo/auth_repo.dart';
import 'package:basic_restaurant/features/auth/data/auth_repo/auth_repo_impl.dart';
import 'package:basic_restaurant/features/auth/presentation/view_model/auth_cubit/log_in_cubit/log_in_cubit.dart';
import 'package:basic_restaurant/features/auth/presentation/view_model/auth_cubit/sign_up_cubit/sign_up_cubit.dart';
import 'package:basic_restaurant/features/home/data/repositories/home_repo.dart';
import 'package:basic_restaurant/features/home/data/repositories/home_repo_impl.dart';
import 'package:basic_restaurant/features/home/presentation/cubit/home_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  getIt.registerLazySingleton(() => AuthService());
  getIt.registerLazySingleton<AuthRepo>(()=>AuthRepoImpl(getIt.get<AuthService>()));
  getIt.registerFactory(()=>SignUpCubit(getIt.get<AuthRepo>()));
  getIt.registerFactory(()=>LogInCubit(getIt.get<AuthRepo>()));

}
