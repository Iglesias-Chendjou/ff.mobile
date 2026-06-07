import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:signalr_netcore/signalr_client.dart';
import 'api_service.dart';

class DeliveryLocationUpdate {
  final String deliveryId;
  final double latitude;
  final double longitude;
  final DateTime at;
  DeliveryLocationUpdate(this.deliveryId, this.latitude, this.longitude, this.at);
}

class DeliveryStatusUpdate {
  final String deliveryId;
  final String status;
  final DateTime at;
  DeliveryStatusUpdate(this.deliveryId, this.status, this.at);
}

class SignalRService {
  static final SignalRService _instance = SignalRService._internal();
  factory SignalRService() => _instance;
  SignalRService._internal();

  HubConnection? _hub;
  String? _currentDeliveryId;

  final StreamController<DeliveryLocationUpdate> _locationCtrl =
      StreamController<DeliveryLocationUpdate>.broadcast();
  final StreamController<DeliveryStatusUpdate> _statusCtrl =
      StreamController<DeliveryStatusUpdate>.broadcast();

  Stream<DeliveryLocationUpdate> get locationUpdates => _locationCtrl.stream;
  Stream<DeliveryStatusUpdate> get statusUpdates => _statusCtrl.stream;

  String get _hubUrl {
    final base = kIsWeb
        ? 'http://localhost:5135'
        : (Platform.isAndroid ? 'http://10.0.2.2:5135' : 'http://localhost:5135');
    return '$base/hubs/delivery';
  }

  Future<void> connectAndJoin(String deliveryId) async {
    final api = ApiService();
    if (!api.isAuthenticated) {
      await api.login('client@foodfirst.be', 'Client1234!');
    }
    final token = api.token ?? '';

    if (_hub != null && _currentDeliveryId == deliveryId) return;

    if (_hub != null) {
      await _leaveAndStop();
    }

    final options = HttpConnectionOptions(accessTokenFactory: () async => token);
    _hub = HubConnectionBuilder().withUrl(_hubUrl, options: options).build();

    _hub!.on('LocationUpdated', (args) {
      if (args == null || args.isEmpty) return;
      final m = args.first as Map<String, dynamic>;
      _locationCtrl.add(DeliveryLocationUpdate(
        m['deliveryId']?.toString() ?? '',
        (m['latitude'] as num).toDouble(),
        (m['longitude'] as num).toDouble(),
        DateTime.tryParse(m['at']?.toString() ?? '') ?? DateTime.now(),
      ));
    });

    _hub!.on('StatusChanged', (args) {
      if (args == null || args.isEmpty) return;
      final m = args.first as Map<String, dynamic>;
      _statusCtrl.add(DeliveryStatusUpdate(
        m['deliveryId']?.toString() ?? '',
        m['status']?.toString() ?? '',
        DateTime.tryParse(m['at']?.toString() ?? '') ?? DateTime.now(),
      ));
    });

    await _hub!.start();
    await _hub!.invoke('JoinDeliveryGroup', args: [deliveryId]);
    _currentDeliveryId = deliveryId;
    debugPrint('SignalR connected and joined delivery-$deliveryId');
  }

  Future<void> _leaveAndStop() async {
    try {
      final did = _currentDeliveryId;
      if (did != null) {
        await _hub?.invoke('LeaveDeliveryGroup', args: <Object>[did]);
      }
      await _hub?.stop();
    } catch (e) {
      debugPrint('SignalR stop error: $e');
    }
    _hub = null;
    _currentDeliveryId = null;
  }

  Future<void> disconnect() => _leaveAndStop();
}
