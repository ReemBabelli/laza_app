import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:laza_app/core/api/api_consumer.dart';
import 'package:laza_app/core/api/dio_consumer.dart';
import 'package:laza_app/core/network/network_info.dart';
import 'package:laza_app/core/theme/cubit/theme_cubit.dart';
import 'package:laza_app/core/theme/data/local/theme_local_data_source.dart';
import 'package:laza_app/core/theme/data/theme_repository_imp/theme_repository_imp.dart';
import 'package:laza_app/core/theme/domain/repositories/repository.dart';
import 'package:laza_app/core/theme/domain/use_cases/cache_theme_use_case.dart';
import 'package:laza_app/core/theme/domain/use_cases/get_cached_theme_use_case.dart';
import 'package:laza_app/features/auth/data/data_sources/user_local_data_source.dart';
import 'package:laza_app/features/auth/data/data_sources/user_remote_data_source.dart';
import 'package:laza_app/features/auth/data/repositories_imp/user_repository_imp.dart';
import 'package:laza_app/features/auth/domain/repositories/user_repository.dart';
import 'package:laza_app/features/auth/domain/use_cases/code_checking_use_case.dart';
import 'package:laza_app/features/auth/domain/use_cases/get_profile_use_case.dart';
import 'package:laza_app/features/auth/domain/use_cases/is_exist_in_cart_use_case.dart';
import 'package:laza_app/features/auth/domain/use_cases/is_exist_in_wishlist_use_case.dart';
import 'package:laza_app/features/auth/domain/use_cases/mail_confirming_use_case.dart';
import 'package:laza_app/features/auth/domain/use_cases/new_password_use_case.dart';
import 'package:laza_app/features/auth/domain/use_cases/sign_in_with_email_use_case.dart';
import 'package:laza_app/features/auth/domain/use_cases/sign_out_use_case.dart';
import 'package:laza_app/features/auth/domain/use_cases/sign_up_use_case.dart';
import 'package:laza_app/features/products/data/data_sources/products_local_data_source.dart';
import 'package:laza_app/features/products/data/data_sources/products_remote_data_source.dart';
import 'package:laza_app/features/products/data/repositories/product_repository_imp.dart';
import 'package:laza_app/features/products/domain/repositories/product_repository.dart';
import 'package:laza_app/features/products/domain/use_cases/add_review_use_case.dart';
import 'package:laza_app/features/products/domain/use_cases/add_to_cart_use_case.dart';
import 'package:laza_app/features/products/domain/use_cases/add_to_wish_list_use_case.dart';
import 'package:laza_app/features/products/domain/use_cases/delete_review_use_case.dart';
import 'package:laza_app/features/products/domain/use_cases/get_product_by_id_use_case.dart';
import 'package:laza_app/features/products/domain/use_cases/get_products_use_case.dart';
import 'package:laza_app/features/products/domain/use_cases/is_exist_in_comments_use_case.dart';
import 'package:laza_app/features/products/domain/use_cases/search_for_product_use_case.dart';
import 'package:laza_app/features/products/presentation/manager/product_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/auth/presentation/manager/auth_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => AuthBloc(
        signUpUseCase: sl(),
        signInWithEmailUseCase: sl(),
        signOutUseCase: sl(),
        confirmMailUseCase: sl(),
        codeCheckingUseCase: sl(),
        newPasswordUseCase: sl(),
        getProfileUseCase: sl(),
      ));

  sl.registerLazySingleton(() => SignInWithEmailUseCase(repository: sl()));
  sl.registerLazySingleton(() => SignUpUseCase(repository: sl()));
  sl.registerLazySingleton(() => SignOutUseCase(repository: sl()));
  sl.registerLazySingleton(() => ConfirmMailUseCase(repository: sl()));
  sl.registerLazySingleton(() => CodeCheckingUseCase(repository: sl()));
  sl.registerLazySingleton(() => NewPasswordUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetProfileUseCase(repository: sl()));

  sl.registerLazySingleton<UserRepository>(
      () => UserRepositoryImp(remoteDataSource: sl(), localDataSource: sl(),networkInfo: sl()));

  sl.registerLazySingleton<UserRemoteDataSource>(
      () => UserRemoteDataSourceImp(api: sl()));

  sl.registerLazySingleton<UserLocalDataSource>(
      () => UserLocalDataSourceImp(sharedPreferences: sl()));

  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(dio: sl()));

  Dio dio = Dio();
  sl.registerLazySingleton(() => dio);

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

  //////////////////////////////////////////////////////////////////////////////

  sl.registerFactory(
    () => ProductBloc(
      getProductByIdUseCase: sl(),
      getProductsAndBrandsUseCase: sl(),
      addReviewUseCase: sl(),
      addToWishListUseCase: sl(),
      addToCartUseCase: sl(),
      isExistInCartUseCase: sl(),
      isExistInWishlistUseCase: sl(),
      deleteReviewUseCase: sl(),
      isExistInCommentsUseCase: sl(),
      searchForProductUseCase: sl(),
    ),
  );

  sl.registerLazySingleton(() => GetProductByIdUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetProductsAndBrandsUseCase(repository: sl()));
  sl.registerLazySingleton(() => AddReviewUseCase(repository: sl()));
  sl.registerLazySingleton(() => AddToWishListUseCase(repository: sl()));
  sl.registerLazySingleton(() => AddToCartUseCase(repository: sl()));
  sl.registerLazySingleton(() => IsExistInCartUseCase(repository: sl()));
  sl.registerLazySingleton(() => IsExistInWishlistUseCase(repository: sl()));
  sl.registerLazySingleton(() => IsExistInCommentsUseCase(repository: sl()));
  sl.registerLazySingleton(() => DeleteReviewUseCase(repository: sl()));
  sl.registerLazySingleton(() => SearchForProductUseCase(repository: sl()));

  sl.registerLazySingleton<ProductRepository>(() => ProductRepositoryImp(
      remoteDataSource: sl(),
      userLocalDataSource: sl(),
      localDataSource: sl(),
    networkInfo: sl(),
  ),

  );

  sl.registerLazySingleton<ProductRemoteDataSource>(
      () => ProductRemoteDataSourceImp(api: sl()));

  sl.registerLazySingleton<ProductLocalDataSource>(
      () => ProductLocalDataSourceImp(sharedPreferences: sl()));

  //////////////////////////////////////////////////////////////////////////////

  sl.registerFactory(() =>
      ThemeCubit(getCachedThemeUseCase: sl(), cacheThemeUseCase: sl()));

  sl.registerLazySingleton(() => GetCachedThemeUseCase(repository: sl()));
  sl.registerLazySingleton(() => CacheThemeUseCase(repository: sl()));

  sl.registerLazySingleton<ThemeRepository>(
      () => ThemeRepositoryImp(localeDataSource: sl()));

  sl.registerLazySingleton<ThemeLocaleDataSource>(
      () => ThemeLocaleDataSourceImp(sharedPreferences: sl()));

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImp(sl()));

  sl.registerLazySingleton(() => InternetConnectionChecker());

}
