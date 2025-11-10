import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class UrlLauncherUtils {
  UrlLauncherUtils._();

  static String telUrl = 'tel:+90';
  static String mailUrl = 'mailto:';

  static openCall(String? tel) async {
    if (tel == null || tel == "") return;
    if (await canLaunchUrlString('$telUrl$tel')) {
      await launchUrlString('$telUrl$tel');
    }
  }

  static openEmail(String? email) async {
    if (email == null || email == "") return;
    if (await canLaunchUrlString('$mailUrl$email')) {
      await launchUrlString('$mailUrl$email', mode: LaunchMode.externalApplication);
      //, universalLinksOnly: true,);
    }
  }

  static openUrl(String? url) async {
    if (url == null || url == "") return;
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url, mode: LaunchMode.externalApplication);
      //, universalLinksOnly: true,);
    }
  }

  static launchGoogleMaps(double lat, double long) async {
    String googleUrl = 'https://www.google.com/maps/search/?api=1&query=$lat,$long';

    if (await canLaunchUrlString(googleUrl)) {
      await launchUrlString(googleUrl, mode: LaunchMode.externalApplication);
    }
  }
}