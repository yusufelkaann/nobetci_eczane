import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/search_provider.dart';
class PharmacySearchBar extends StatelessWidget{
  
  PharmacySearchBar({super.key});

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        
        onChanged: (value) {
          Provider.of<SearchProvider>(context, listen: false).search(value);
        },
        
        decoration: InputDecoration(
          hintText: 'Search', 
          hintStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
          ),
          suffixIcon: Icon(Icons.search, color: Theme.of(context).colorScheme.primary,),
        ),
      ),
    );
  }
}