import 'package:flutter/material.dart';
import 'package:nobetci_eczane/components/call_contact.dart';
import 'package:nobetci_eczane/models/pharmacy_model.dart';


class PharmacyCard extends StatelessWidget {
  final Pharmacy pharmacy;

  PharmacyCard({super.key, required this.pharmacy});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.primary,
      ),
      margin: const EdgeInsets.all(8),
      child: ListTile(
        title: Text(pharmacy.name, style: TextStyle(color: Theme.of(context).colorScheme.tertiary, fontSize: 18)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text('${pharmacy.address} ${pharmacy.area}/İZMİR', style: TextStyle(color: Theme.of(context).colorScheme.secondary),),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '+9${pharmacy.phoneNmuber}', 
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 16,
                      ),
                    ),
                  IconButton(
                    onPressed: () {
                      callContact(pharmacy.phoneNmuber);
                    },
                    icon: Icon(Icons.call, color: Theme.of(context).colorScheme.secondary,),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
