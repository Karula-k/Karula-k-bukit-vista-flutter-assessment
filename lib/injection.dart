import 'package:bukit_vista_flutter_assessment/data/datasources/json_reader_helper.dart';
import 'package:bukit_vista_flutter_assessment/data/datasources/local_data_source.dart';
import 'package:bukit_vista_flutter_assessment/data/repositories/guest_repostiory_impl.dart';
import 'package:bukit_vista_flutter_assessment/domain/repositories/guest_repository.dart';
import 'package:bukit_vista_flutter_assessment/domain/usecase/get_guest_data.dart';
import 'package:bukit_vista_flutter_assessment/domain/usecase/get_list_guest_data.dart';
import 'package:bukit_vista_flutter_assessment/presentation/provider/guest_data_provider.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void init() {
  //provider
  locator.registerFactory(() =>
      GetDataProvider(getGuestData: locator(), getGuestListData: locator()));

  //usecase
  locator.registerLazySingleton(() => GetGuestData(locator()));
  locator.registerLazySingleton(() => GetGuestListData(locator()));

  //repository
  locator.registerLazySingleton<GuestRepository>(
      () => GuestRepositoryImpl(localDataSources: locator()));

  //datsources
  locator.registerLazySingleton<LocalDataSources>(
      () => LocalDataSourcesImpl(helper: locator()));

  //external
  locator.registerLazySingleton(() => JsonReaderHelper());
}
