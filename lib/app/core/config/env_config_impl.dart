import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fluttergh/app/core/config/env_config.dart';

part 'env_config_impl.g.dart';

@Injectable()
class EnvConfigImpl implements EnvConfig {
  @override
  Future<void> initEnvConfig(String environment) async {
    switch (environment) {
      case EnvConfig.DEV:
        await dotenv.load(fileName: '.env');
        return;
      default:
        await dotenv.load(fileName: '.env');
        return;
    }
  }

  @override
  String get backendUrl => dotenv.get('BACKEND_URL');
}
