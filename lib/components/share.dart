import 'package:share_plus/share_plus.dart';

import '../barrels/annotations_barrel.dart';
import '../barrels/core_barrel.dart';
import '../barrels/core_elements_barrel.dart';

@GetPut.component()
class AppShare extends CoreComponent {
  static AppShare get to => Get.find();

  shareText(String text) async {
    await Share.share(text);
  }

  shareUrl(String url) async {
    await Share.shareUri(Uri.parse(url));
  }

  shareFile({required XFile file, String? subject}) async {
    await Share.shareXFiles([file], subject: subject ?? 'Share File');
  }

  shareFiles({required List<XFile> files, String? subject}) async {
    await Share.shareXFiles(files, subject: subject ?? 'Share File');
  }
}
