import 'dart:async';
import 'package:get/get.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class ConnectionController extends GetxController {
  final InternetConnection connection;
  ConnectionController({InternetConnection? connection}) : connection = connection ?? InternetConnection();

  StreamSubscription<InternetStatus>? _connectionListener;
  var isInternetAvailable = true.obs;
  final StreamController<bool> _internetStatusController = StreamController<bool>.broadcast();

  Stream<bool> get onInternetStatusChanged => _internetStatusController.stream;

  @override
  void onInit() {
    super.onInit();
    checkInternet();

    _connectionListener = connection.onStatusChange.listen((status) {
      final connected = status == InternetStatus.connected;
      _internetStatusController.add(connected);
      Future.microtask(() => isInternetAvailable.value = connected);
    });
  }

  @override
  void onClose() {
    _connectionListener?.cancel();
    _internetStatusController.close();
    super.onClose();
  }

  Future<void> checkInternet() async {
    isInternetAvailable.value = await connection.hasInternetAccess;
    _internetStatusController.add(isInternetAvailable.value);
  }
}
