import 'package:flutter/material.dart';
import 'package:w6/model/settings/app_settings.dart';

abstract class AppSettingRepository extends ChangeNotifier {
  Future<AppSettings> load();
  Future<void> save(AppSettings appSetting);
}