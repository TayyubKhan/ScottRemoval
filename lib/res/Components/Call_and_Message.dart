import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/utilis.dart';

class Calland_message {
  Future<void> makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  Future<void> makeMessage(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'sms',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  Future<void> launchInBrowser(BuildContext context, Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Utilis.error_flushbar_message(context, 'Could not launch $url');
    }
  }
}
