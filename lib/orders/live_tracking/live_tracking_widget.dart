import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latlong2/latlong.dart';
import '/core/api_service.dart';
import '/core/signalr_service.dart';
import '/flutter_flow/flutter_flow_theme.dart';

class LiveTrackingWidget extends StatefulWidget {
  const LiveTrackingWidget({super.key, required this.deliveryId});

  static const String routeName = 'LiveTracking';
  static const String routePath = '/live-tracking';

  final String deliveryId;

  @override
  State<LiveTrackingWidget> createState() => _LiveTrackingWidgetState();
}

class _LiveTrackingWidgetState extends State<LiveTrackingWidget> {
  final SignalRService _signalR = SignalRService();
  final MapController _mapController = MapController();

  LatLng? _driverPosition;
  String _status = 'Connexion…';
  DateTime? _lastUpdate;

  StreamSubscription<DeliveryLocationUpdate>? _locSub;
  StreamSubscription<DeliveryStatusUpdate>? _statusSub;

  @override
  void initState() {
    super.initState();
    _bootstrap();
  }

  Future<void> _bootstrap() async {
    final api = ApiService();
    final snap = await api.fetchDeliveryTrack(widget.deliveryId);
    if (snap != null && mounted) {
      final lat = snap['currentLatitude'];
      final lng = snap['currentLongitude'];
      setState(() {
        _status = (snap['status']?.toString() ?? 'Inconnu');
        if (lat != null && lng != null) {
          _driverPosition = LatLng(
            (lat as num).toDouble(),
            (lng as num).toDouble(),
          );
        }
      });
    }

    try {
      await _signalR.connectAndJoin(widget.deliveryId);
      _locSub = _signalR.locationUpdates.listen((upd) {
        if (!mounted || upd.deliveryId != widget.deliveryId) return;
        setState(() {
          _driverPosition = LatLng(upd.latitude, upd.longitude);
          _lastUpdate = upd.at;
        });
        _mapController.move(_driverPosition!, _mapController.camera.zoom);
      });
      _statusSub = _signalR.statusUpdates.listen((upd) {
        if (!mounted || upd.deliveryId != widget.deliveryId) return;
        setState(() {
          _status = upd.status;
          _lastUpdate = upd.at;
        });
      });
    } catch (e) {
      if (!mounted) return;
      setState(() => _status = 'Connexion temps reel indisponible');
    }
  }

  @override
  void dispose() {
    _locSub?.cancel();
    _statusSub?.cancel();
    _signalR.disconnect();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Default to Bruxelles center if no position yet
    final center = _driverPosition ?? const LatLng(50.8503, 4.3517);

    return Scaffold(
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primary,
        title: Text(
          'Suivi de livraison',
          style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Stack(
        children: [
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              initialCenter: center,
              initialZoom: 14,
              minZoom: 8,
              maxZoom: 18,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'be.foodfirst.mobile',
              ),
              if (_driverPosition != null)
                MarkerLayer(
                  markers: [
                    Marker(
                      point: _driverPosition!,
                      width: 50,
                      height: 50,
                      child: const Icon(
                        Icons.delivery_dining_rounded,
                        color: Color(0xFF0DB14B),
                        size: 40,
                      ),
                    ),
                  ],
                ),
            ],
          ),
          Positioned(
            top: 16,
            left: 16,
            right: 16,
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Row(
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: _statusColor(),
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Statut : $_status',
                              style: GoogleFonts.inter(fontWeight: FontWeight.w600, fontSize: 14)),
                          if (_lastUpdate != null)
                            Text(
                              'MAJ : ${_lastUpdate!.toLocal().toString().substring(11, 19)}',
                              style: GoogleFonts.inter(fontSize: 11, color: Colors.grey[600]),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _statusColor() {
    switch (_status) {
      case 'InTransit':
      case 'PickingUp':
        return const Color(0xFFFF9800);
      case 'Delivered':
        return const Color(0xFF0DB14B);
      case 'Failed':
        return const Color(0xFFE53935);
      default:
        return Colors.grey;
    }
  }
}
