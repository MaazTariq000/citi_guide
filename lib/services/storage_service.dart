import 'package:get_storage/get_storage.dart';
import 'package:myapp/utils/storage_key.dart';

class StorageService {
  static final session = GetStorage();

  static dynamic usersession = session.read(StorageKey.usersession);
}
