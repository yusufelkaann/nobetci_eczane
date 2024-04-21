// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../models/pharmacy_model.dart';
import '../services/pharmacy_service.dart';
import '../components/pharmacy_card.dart';

class PharmacyPage extends StatefulWidget {
  const PharmacyPage({super.key});

  @override
  State<PharmacyPage> createState() => _PharmacyPageState();
}

class _PharmacyPageState extends State<PharmacyPage> {
  
  List<Pharmacy> _pharmacies = [];

  _getPharmacies() async {
    _pharmacies = await PharmacyService().getPharmacy();
    setState(() {});
  }
  @override
  void initState() {
    _getPharmacies();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Nöbetçi Eczaneler'),
        ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if(_pharmacies.isNotEmpty)
              Column(
                children: _pharmacies.map((pharmacy) {
                  return Column(
                    children: [
                      PharmacyCard(pharmacy: pharmacy),
                    ]
                  ,);
                },
              ).toList(),
            ),
          ],
        ),
      ),
    );
  }
}