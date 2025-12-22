import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import '../../core/core_elements/core_component.dart';
import '../../core/core_resources/defaults.dart';

@GetPut.component()
class AppConnectionChecker extends CoreComponent {
  static AppConnectionChecker get to => Get.find();

  get internetConnection => InternetConnection();
  get connectivity => Connectivity();

  Future<bool> checkInternet() async => await internetConnection.hasInternetAccess.timeout(AppDefaults.timeOutConnection);

  Future<InternetStatus> checkInternetStatus() async => await internetConnection.internetStatus;

  internetListener({Function? function}) =>
      internetConnection.onStatusChange.listen((status) {}).onData((data) => function == null ? data : function());

  Future<ConnectivityResult> checkConnection() async => await connectivity.checkConnectivity();

  connectionListener({Function? function}) =>
      connectivity.onConnectivityChanged.listen((status) {}).onData((data) => function == null ? data : function());
}
