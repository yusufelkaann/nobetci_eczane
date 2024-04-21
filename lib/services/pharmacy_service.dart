import '../models/pharmacy_model.dart';
import 'package:dio/dio.dart';

class PharmacyService {

  Future<List<Pharmacy>> getPharmacy() async {
    final BASE_URL = "https://openapi.izmir.bel.tr/api/ibb/nobetcieczaneler";

    final dio = Dio();
    final response = await dio.get(BASE_URL);
    if (response.statusCode != 200) {
      return Future.error("An error has occured!");  
    }

    final List list = response.data;
    final List<Pharmacy> eczaneList = 
        list.map((e) => Pharmacy.fromJson(e)).toList();

    return eczaneList;
  }
}