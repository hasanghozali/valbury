import 'dart:async';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:app/controller/connection_controller.dart';

class MockInternetConnection extends Mock implements InternetConnection {
  final StreamController<InternetStatus> _statusController = StreamController<InternetStatus>.broadcast();
  bool _hasInternet = true;

  @override
  Future<bool> get hasInternetAccess => Future.value(_hasInternet);

  @override
  Stream<InternetStatus> get onStatusChange => _statusController.stream;

  void setConnectionStatus(InternetStatus status) {
    _hasInternet = status == InternetStatus.connected;
    _statusController.add(status);
  }

  void dispose() {
    _statusController.close();
  }
}

void main() {
  late ConnectionController connectionController;
  late MockInternetConnection mockInternetConnection;

  setUp(() {
    mockInternetConnection = MockInternetConnection();
    connectionController = ConnectionController(connection: mockInternetConnection);
    connectionController.onInit();
  });

  tearDown(() async {
    await Future.delayed(Duration.zero);
    mockInternetConnection.dispose();
    connectionController.onClose();
  });

  test('Initial state should have internet available', () {
    expect(connectionController.isInternetAvailable.value, true);
  });

  test('checkInternet should update isInternetAvailable based on connection', () async {
    mockInternetConnection.setConnectionStatus(InternetStatus.disconnected);
    await connectionController.checkInternet();
    expect(connectionController.isInternetAvailable.value, false);

    mockInternetConnection.setConnectionStatus(InternetStatus.connected);
    await connectionController.checkInternet();
    expect(connectionController.isInternetAvailable.value, true);
  });

  test('onStatusChange should update internet status', () async {
    mockInternetConnection.setConnectionStatus(InternetStatus.disconnected);
    await Future.delayed(Duration.zero);
    expect(connectionController.isInternetAvailable.value, false);

    mockInternetConnection.setConnectionStatus(InternetStatus.connected);
    await Future.delayed(Duration.zero);
    expect(connectionController.isInternetAvailable.value, true);
  });

  test('Stream should not emit after onClose', () async {
    connectionController.onClose();
    
    // Subscribe ke stream setelah onClose
    bool? lastStatus;
    connectionController.onInternetStatusChanged.listen((status) {
      lastStatus = status;
    });

    mockInternetConnection.setConnectionStatus(InternetStatus.disconnected);
    await Future.delayed(Duration.zero);

    // Seharusnya stream tidak mengirim event baru setelah di-close
    expect(lastStatus, isNull);
  });
}
