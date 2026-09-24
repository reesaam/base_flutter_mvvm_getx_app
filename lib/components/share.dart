import 'package:share_plus/share_plus.dart';

import '../barrels/annotations_barrel.dart';
import '../barrels/core_barrel.dart';
import '../barrels/core_elements_barrel.dart';
import '../barrels/services_barrel.dart';

@GetPut.component()
class AppShare extends CoreComponent {
  static AppShare get to => Get.find();

  shareText(String text) async {
    await Share.share(text);
  }

  /// Shares version/OS/model so support emails include the same facts as crash reports.
  Future<void> shareSupportInfo() async {
    await AppDeviceInfoService.to.ensureReady();
    await Share.share(AppDeviceInfoService.to.summary);
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
