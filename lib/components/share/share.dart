import 'package:getx_binding_annotation/annotation.dart';
import 'package:share_plus/share_plus.dart';

@GetPut.component()
class AppShare {
  static shareText(String text) async {
    await Share.share(text);
  }

  static shareUrl(String url) async {
    await Share.shareUri(Uri.parse(url));
  }

  static shareFile({required XFile file, String? subject}) async {
    await Share.shareXFiles([file], subject: subject ?? 'Share File');
  }

  static shareFiles({required List<XFile> files, String? subject}) async {
    await Share.shareXFiles(files, subject: subject ?? 'Share File');
  }
}
