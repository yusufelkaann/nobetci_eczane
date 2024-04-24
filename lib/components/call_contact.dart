import 'package:url_launcher/url_launcher_string.dart';

//function to call the pharmacy using url_launcher package
void callContact(String phoneNmuber) async {
  final url = 'tel:$phoneNmuber';
  if (await canLaunchUrlString(url)) {
    await launchUrlString(url);
  } else {
    print('Could not launch $url');
  }
}