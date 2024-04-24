import 'package:flutter/material.dart';
import '../models/pharmacy_model.dart';

class SearchProvider extends ChangeNotifier {
  List<Pharmacy> _allPharmacies = []; // List of all pharmacies
  List<Pharmacy> _filteredPharmacies = []; // Filtered list based on search 

  // Set the initial list of pharmacies
  void setPharmacies(List<Pharmacy> pharmacies) {
    _allPharmacies = pharmacies;
    _filteredPharmacies = List.from(pharmacies); 
    notifyListeners(); 
  }

  // Get the filtered list of pharmacies
  List<Pharmacy> get filteredPharmacies => _filteredPharmacies;

  // Search method to filter pharmacies based on a query
  void search(String query) {
    if (query.isEmpty) {
      _filteredPharmacies = List.from(_allPharmacies); // Reset to all pharmacies
    } else {
      _filteredPharmacies = _allPharmacies.where((pharmacy) {
        return pharmacy.name.toLowerCase().contains(query.toLowerCase()) ||
               pharmacy.address.toLowerCase().contains(query.toLowerCase()) ||
               pharmacy.area.toLowerCase().contains(query.toLowerCase());
      }).toList(); // Filter by search
    }
    notifyListeners(); 
  }
}