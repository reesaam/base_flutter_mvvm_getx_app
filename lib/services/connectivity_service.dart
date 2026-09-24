import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import '../barrels/annotations_barrel.dart';
import '../barrels/core_barrel.dart';
import '../barrels/core_elements_barrel.dart';
import '../barrels/core_resources_barrel.dart';

@GetPut.service()
class AppConnectionService extends CoreService {
  AppConnectionService({InternetConnection? internetConnection, Connectivity? connectivity})
    : _internetConnection = internetConnection ?? InternetConnection(),
      _connectivity = connectivity ?? Connectivity();

  static AppConnectionService get to => Get.find();

  final InternetConnection _internetConnection;
  final Connectivity _connectivity;

  StreamSubscription<InternetStatus>? _internetSubscription;
  StreamSubscription<List<ConnectivityResult>>? _connectionSubscription;

  final Rx<InternetStatus> internetStatus = InternetStatus.disconnected.obs;
  final RxList<ConnectivityResult> connectionTypes = <ConnectivityResult>[].obs;

  Stream<InternetStatus> get onInternetStatus => _internetConnection.onStatusChange;
  Stream<List<ConnectivityResult>> get onConnectivityChanged => _connectivity.onConnectivityChanged;

  @override
  void onInitFunction() {
    _internetSubscription = _internetConnection.onStatusChange.listen((status) => internetStatus.value = status);
    _connectionSubscription = _connectivity.onConnectivityChanged.listen(connectionTypes.assignAll);
    unawaited(_seedStatus());
  }

  Future<void> _seedStatus() async {
    internetStatus.value = await _internetConnection.internetStatus;
    connectionTypes.assignAll(await _connectivity.checkConnectivity());
  }

  @override
  void onCloseFunction() {
    _internetSubscription?.cancel();
    _connectionSubscription?.cancel();
    _internetSubscription = null;
    _connectionSubscription = null;
  }

  Future<bool> checkInternet() async => await _internetConnection.hasInternetAccess.timeout(AppDefaults.timeOutConnection);

  Future<InternetStatus> checkInternetStatus() async => await _internetConnection.internetStatus;

  Future<List<ConnectivityResult>> checkConnection() async => await _connectivity.checkConnectivity();
}
