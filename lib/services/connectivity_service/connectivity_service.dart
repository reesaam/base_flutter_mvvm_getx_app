import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import '../../barrels/annotations_barrel.dart';
import '../../barrels/core_barrel.dart';
import '../../barrels/core_elements_barrel.dart';
import '../../barrels/core_resources_barrel.dart';

@GetPut.service()
class AppConnectionService extends CoreService {
  static AppConnectionService get to => Get.find();

  InternetConnection get internetConnection => InternetConnection();
  Connectivity get connectivity => Connectivity();

  Future<bool> checkInternet() async => await internetConnection.hasInternetAccess.timeout(AppDefaults.timeOutConnection);

  Future<InternetStatus> checkInternetStatus() async => await internetConnection.internetStatus;

  void internetListener({Function? function}) =>
      internetConnection.onStatusChange.listen((status) {}).onData((data) => function == null ? data : function());

  Future<List<ConnectivityResult>> checkConnection() async => await connectivity.checkConnectivity();

  void connectionListener({Function? function}) =>
      connectivity.onConnectivityChanged.listen((status) {}).onData((data) => function == null ? data : function());
}
