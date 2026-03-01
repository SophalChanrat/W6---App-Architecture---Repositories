import 'package:w6/data/repositories/app_settings/app_setting_repository.dart';
import 'package:w6/model/settings/app_settings.dart';

class AppSettingRepositoryMock extends AppSettingRepository {
  AppSettings? _settings;

  AppSettings? get setting => _settings;

  @override
  Future<AppSettings> load() async {
    return _settings ?? AppSettings(themeColor: ThemeColor.blue);
  }

  @override
  Future<void> save(AppSettings setting) async {
    _settings = setting;
  }
}
