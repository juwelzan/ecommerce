// ignore_for_file: non_constant_identifier_names

import 'package:ecommerce/shared/network_data/get_categories_data.dart';
import 'package:ecommerce/shared/network_data/get_product_data.dart';
import 'package:ecommerce/shared/path/paths.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

Future Init() async {
  getIt.registerLazySingleton<GetCategoriesData>(() => GetCategoriesData());
  getIt.registerLazySingleton<GetProductData>(() => GetProductData());
  getIt.registerLazySingleton<NetworkCaller>(
    () => NetworkCaller(headers: {"Content-Type": "application/json"}),
  );
}

//fgghuyjjghjfhy
