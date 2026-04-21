import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static final ApiService _instance = ApiService._internal();
  factory ApiService() => _instance;
  ApiService._internal();

  // Android emulator uses 10.0.2.2 to reach host localhost
  // Web/desktop uses localhost directly
  String get _baseUrl {
    if (kIsWeb) return 'http://localhost:5135';
    if (Platform.isAndroid) return 'http://10.0.2.2:5135';
    return 'http://localhost:5135';
  }

  String? _token;
  String? _userId;
  DateTime? _tokenExpiry;

  String? get token => _token;
  String? get userId => _userId;
  bool get isAuthenticated =>
      _token != null &&
      _tokenExpiry != null &&
      _tokenExpiry!.isAfter(DateTime.now());

  Map<String, String> get _authHeaders => {
        'Content-Type': 'application/json',
        if (_token != null) 'Authorization': 'Bearer $_token',
      };

  // --- AUTH ---

  Future<bool> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/api/auth/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _token = data['token'];
        _tokenExpiry = DateTime.parse(data['expiresAt']);
        _userId = data['user']?['id'];
        return true;
      }
      debugPrint('Login failed: ${response.statusCode} ${response.body}');
      return false;
    } catch (e) {
      debugPrint('Login error: $e');
      return false;
    }
  }

  Future<bool> register(String email, String password, String firstName,
      String lastName, String phone) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/api/auth/register'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'password': password,
          'firstName': firstName,
          'lastName': lastName,
          'phone': phone,
        }),
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _token = data['token'];
        _tokenExpiry = DateTime.parse(data['expiresAt']);
        _userId = data['user']?['id'];
        return true;
      }
      debugPrint('Register failed: ${response.statusCode} ${response.body}');
      return false;
    } catch (e) {
      debugPrint('Register error: $e');
      return false;
    }
  }

  void logout() {
    _token = null;
    _userId = null;
    _tokenExpiry = null;
  }

  // --- PRODUCTS ---

  Future<List<Map<String, dynamic>>> fetchAvailableProducts(
      {String? zoneId}) async {
    try {
      // Auto-login with demo account if not authenticated
      if (!isAuthenticated) {
        await login('client@foodfirst.be', 'Client1234!');
      }

      final uri = zoneId != null
          ? Uri.parse('$_baseUrl/api/products/available?zone=$zoneId')
          : Uri.parse('$_baseUrl/api/products/available');

      final response = await http.get(uri, headers: _authHeaders);
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.cast<Map<String, dynamic>>();
      }
      debugPrint(
          'Products fetch failed: ${response.statusCode} ${response.body}');
      return [];
    } catch (e) {
      debugPrint('Products fetch error: $e');
      return [];
    }
  }

  // --- ORDERS ---

  Future<List<Map<String, dynamic>>> fetchMyOrders() async {
    try {
      if (!isAuthenticated) {
        await login('client@foodfirst.be', 'Client1234!');
      }

      final response = await http.get(
        Uri.parse('$_baseUrl/api/orders/mine'),
        headers: _authHeaders,
      );
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.cast<Map<String, dynamic>>();
      }
      debugPrint(
          'Orders fetch failed: ${response.statusCode} ${response.body}');
      return [];
    } catch (e) {
      debugPrint('Orders fetch error: $e');
      return [];
    }
  }

  // --- NOTIFICATIONS ---

  Future<List<Map<String, dynamic>>> fetchMyNotifications() async {
    try {
      if (!isAuthenticated) {
        await login('client@foodfirst.be', 'Client1234!');
      }

      final response = await http.get(
        Uri.parse('$_baseUrl/api/notifications/mine'),
        headers: _authHeaders,
      );
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.cast<Map<String, dynamic>>();
      }
      return [];
    } catch (e) {
      debugPrint('Notifications fetch error: $e');
      return [];
    }
  }

  // --- STORES ---

  Future<List<Map<String, dynamic>>> fetchStoreCatalog(String storeId) async {
    try {
      if (!isAuthenticated) {
        await login('client@foodfirst.be', 'Client1234!');
      }

      final response = await http.get(
        Uri.parse('$_baseUrl/api/stores/$storeId/catalog'),
        headers: _authHeaders,
      );
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.cast<Map<String, dynamic>>();
      }
      return [];
    } catch (e) {
      debugPrint('Store catalog fetch error: $e');
      return [];
    }
  }

  // --- SURPRISE BOX ---

  Future<List<Map<String, dynamic>>> fetchSurpriseBoxPlans() async {
    try {
      if (!isAuthenticated) {
        await login('client@foodfirst.be', 'Client1234!');
      }

      final response = await http.get(
        Uri.parse('$_baseUrl/api/surprise-box/plans'),
        headers: _authHeaders,
      );
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.cast<Map<String, dynamic>>();
      }
      return [];
    } catch (e) {
      debugPrint('Surprise box plans fetch error: $e');
      return [];
    }
  }
}
