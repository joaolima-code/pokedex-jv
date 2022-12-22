import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'connectivity_datasource.g.dart';

@Injectable(singleton: false)
class ConnectivityDriver {
  final Connectivity connectivity;

  ConnectivityDriver(this.connectivity);

  Future<bool> get isOnline async {
    var result = await connectivity.checkConnectivity();

    return result == ConnectivityResult.wifi ||
        result == ConnectivityResult.mobile;
  }
}
