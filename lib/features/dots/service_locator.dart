import 'package:twosome_app/core/di/init_services.dart';
import 'package:twosome_app/features/dots/data/data_sources/dot_remote_data_source.dart';
import 'package:twosome_app/features/dots/data/repositories/dot_repository_impl.dart';
import 'package:twosome_app/features/dots/domain/repositories/dot_repositories.dart';
import 'package:twosome_app/features/dots/domain/use_cases/get_dots.dart';
import 'package:twosome_app/features/dots/presentation/bloc/dots_bloc.dart';

void setupDotsFeature() {
  // Register Data Sources
  sl.registerLazySingleton<DotRemoteDataSource>(
    () => DotRemoteDataSourceImpl(sl()),
  );

  // Register Repository
  sl.registerLazySingleton<DotRepository>(() => DotRepositoryImpl(sl(), sl()));

  // Register Use cases
  sl.registerLazySingleton<GetDots>(() => GetDots(sl()));

  // Register Bloc
  sl.registerFactory<DotsBloc>(() => DotsBloc(sl()));
}
