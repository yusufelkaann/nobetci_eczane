class Pharmacy{
  final String name;
  final String address;
  final String area;
  final String phoneNmuber;

  Pharmacy(this.name, this.address, this.area, this.phoneNmuber);

  Pharmacy.fromJson(Map<String, dynamic> json)
      : name = json['Adi'],
        address = json['Adres'],
        area = json['Bolge'],
        phoneNmuber = json['Telefon'];
}