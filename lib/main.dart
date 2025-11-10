import 'package:logger/logger.dart';
import 'bootstrap.dart';
import 'core/app_config/app_config.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  await bootstrap(
    firebaseInitialization: () async {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
    },
    flavorConfiguration: () async {
      AppConfig.configDev();
      Logger.level = Level.trace;
    },
  );
}