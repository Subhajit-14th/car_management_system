import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../utlis/assets/app_string.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerLazySingleton<AppString>(() => AppString());

  getIt.registerLazySingleton<Dio>(() {
    final baseUrl = getIt<AppString>().baseUrl;
    return Dio(
      BaseOptions(
        baseUrl: baseUrl,
        receiveTimeout: const Duration(seconds: 10),
        connectTimeout: const Duration(seconds: 10),
      ),
    );
  });
}
