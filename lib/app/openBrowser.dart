import 'package:url_launcher/url_launcher.dart';

Future<void> launchPolicy(String url) async {
  final Uri uri = Uri.parse(url);
  print(await canLaunchUrl(uri));

  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    throw "Could not launch $uri";
  }
}
