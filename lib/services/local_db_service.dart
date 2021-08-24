import 'package:get_storage/get_storage.dart';

class LocalDBService {
  final _box = GetStorage();
  final _language = 'language';

  String getLanguage() => _box.read(_language);
  void saveLanguage(String language) => _box.write(_language, language);
}
