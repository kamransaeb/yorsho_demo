import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'core/app_bloc_observer/app_bloc_observer.dart';
import 'data/authentication/repositories/authentication_repository.dart';
import 'features/app/presentation/pages/app_page.dart';
import 'injector/injector.dart';
import 'package:path_provider/path_provider.dart';

Future<void> bootstrap({
  AsyncCallback? firebaseInitialization,
  AsyncCallback? flavorConfiguration,
}) async {
  //await runZonedGuarded(() async {

  WidgetsFlutterBinding.ensureInitialized();

  await firebaseInitialization?.call();
  await flavorConfiguration?.call();

  Injector.init();
  await Injector.instance.allReady();
  Bloc.observer = AppBlocObserver();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory:
    HydratedStorageDirectory((await getApplicationDocumentsDirectory()).path),
  );
  final authenticationRepository = Injector.instance.get<AuthenticationRepository>();
  await authenticationRepository.isLoggedIn();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
          (value) => runApp(
          const AppPage()));

  //}, (error, stack) {
  // Injector.instance<CrashlyticsService>().recordException(error, stack);
  //});
}
