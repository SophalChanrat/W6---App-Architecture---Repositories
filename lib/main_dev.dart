import 'package:provider/provider.dart';
import 'package:nested/nested.dart';
import 'package:w6/data/repositories/app_settings/app_setting_repository_mock.dart';
import 'package:w6/ui/states/player_state.dart';

import 'main_common.dart';
import 'data/repositories/songs/song_repository.dart';
import 'data/repositories/songs/song_repository_mock.dart';
import 'ui/states/settings_state.dart';

final AppSettingRepositoryMock appSettingRepository = AppSettingRepositoryMock();

/// Configure provider dependencies for dev environment
List<SingleChildWidget> get devProviders {
  return [
    // 1 - Inject the song repository
    Provider<SongRepository>(create: (_) => SongRepositoryMock()),
    // 2 - Inject the player repository
    ChangeNotifierProvider<PlayerState>(create: (_) => PlayerState()),
    // 3 - Inject the  app setting state
    ChangeNotifierProvider<AppSettingsState>(
        create: (_) => AppSettingsState(appSettingRepository)),
  ];
}

void main() {
  mainCommon(devProviders);
}
