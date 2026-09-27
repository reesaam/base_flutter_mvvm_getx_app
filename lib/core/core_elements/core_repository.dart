import '../../../barrels/core_barrel.dart';
import '../../barrels/shared_repositories_barrel.dart';

abstract class CoreRepository extends GetxController {}

abstract class CoreRepositoryImpl extends CoreRepository {
  AppDataRepository get appdataRepository => Get.find();
}
