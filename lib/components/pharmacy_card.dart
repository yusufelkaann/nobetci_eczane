import 'package:flutter/material.dart';
import 'package:nobetci_eczane/models/pharmacy_model.dart';

class PharmacyCard extends StatelessWidget {
  Pharmacy pharmacy;
  
  
  PharmacyCard({super.key, required this.pharmacy});

  @override
  Widget build(BuildContext context) {
    
    
    return ListTile(
        title: Text(pharmacy.name, style: TextStyle(color: Colors.red,)),
        subtitle: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 8,),
          
          Align(alignment:Alignment.centerLeft, child: Text('${pharmacy.address} ${pharmacy.area}/İZMİR')),
          Align(alignment: Alignment.centerLeft,child: Text('+9${pharmacy.phoneNmuber}'),)
        ],
      ),         
    );
  }
}