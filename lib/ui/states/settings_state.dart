import 'package:flutter/widgets.dart';
import 'package:w6/data/repositories/app_settings/app_setting_repository.dart';

import '../../model/settings/app_settings.dart';

class AppSettingsState extends ChangeNotifier {
  AppSettings? _appSettings;
  final AppSettingRepository _appSettingRepository;

  AppSettingsState(this._appSettingRepository){
    init();
  }

  AppSettings? get appSettings => _appSettings;

  Future<void> init() async {
    // Might be used to load data from repository
    _appSettings = await _appSettingRepository.load();
    notifyListeners();
  }

  ThemeColor get theme => _appSettings?.themeColor ?? ThemeColor.blue;

  Future<void> changeTheme(ThemeColor themeColor) async {
    if (_appSettings == null) return;
    _appSettings = _appSettings!.copyWith(themeColor: themeColor);
    await _appSettingRepository.save(_appSettings!);
    notifyListeners();
  }
}
