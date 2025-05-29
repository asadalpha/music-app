import 'package:flutter/material.dart';
import '../models/service_model.dart';
import '../services/firestore_services.dart';

class ServiceViewModel extends ChangeNotifier {
  final FirestoreService _firestoreService = FirestoreService();
  List<Service> _services = [];
  bool _isLoading = true;

  List<Service> get services => _services;
  bool get isLoading => _isLoading;

  Future<void> fetchServices() async {
    _isLoading = true;
    notifyListeners();

    print("Fetching services...");

    try {
      _services = await _firestoreService.getServices();
      print("Services fetched: ${_services.length}");
    } catch (e) {
      print("Error fetching services: $e");
    }

    _isLoading = false;
    notifyListeners();
  }
}
