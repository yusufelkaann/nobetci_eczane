// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:nobetci_eczane/components/pharmacy_search_bar.dart';
import '../models/pharmacy_model.dart';
import '../services/pharmacy_service.dart';
import '../components/pharmacy_card.dart';
import 'package:provider/provider.dart';
import '../providers/search_provider.dart';

class PharmacyPage extends StatefulWidget {
  const PharmacyPage({super.key});

  @override
  State<PharmacyPage> createState() => _PharmacyPageState();
}

class _PharmacyPageState extends State<PharmacyPage> {
  @override
  void initState() {
    super.initState();
    _loadPharmacies(); // Load pharmacies when the page initializes
  }

  void _loadPharmacies() async {
    var pharmacies = await PharmacyService().getPharmacy(); // Fetch from the service
    final searchProvider = Provider.of<SearchProvider>(context, listen: false); 
    searchProvider.setPharmacies(pharmacies); // Set initial list in the provider
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Nöbetçi Eczaneler'), 
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0), 
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, 
          children: [
            PharmacySearchBar(), 
            Expanded( 
              child: Consumer<SearchProvider>(
                builder: (context, searchProvider, child) {
                  var pharmacies = searchProvider.filteredPharmacies; // Get the filtered list

                  if (pharmacies.isEmpty) {
                    return Center(child: Text("No results found")); // Display a message if no results are found
                  }

                  return SingleChildScrollView(
                    child: Column(
                      children: pharmacies.map((pharmacy) {
                        return PharmacyCard(pharmacy: pharmacy); // Display each pharmacy
                      }).toList(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}