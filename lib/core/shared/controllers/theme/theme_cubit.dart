import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../../network/local/cache/cache_helper.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> with WidgetsBindingObserver {
  ThemeCubit() : super(ThemeInitial()) {
    WidgetsBinding.instance.addObserver(this);
    getThemeMode();
  }

  static ThemeCubit get(BuildContext context) => BlocProvider.of(context);

  ThemeMode? mode;
  bool isDark = false;

  /// GET THEME MODE
  Future getThemeMode() async {
    final String? theme = await CacheHelper.get('theme');
    if (theme == 'dark') {
      mode = ThemeMode.dark;
      isDark = true;
    } else if (theme == 'light') {
      mode = ThemeMode.light;
      isDark = false;
    } else {
      updateThemeFromSystem();
    }
    emit(UpdateTheme());
  }

  /// GET MODE AS SYSTEM
  void updateThemeFromSystem() {
    final brightness = PlatformDispatcher.instance.platformBrightness;
    isDark = brightness == Brightness.dark;
    mode = isDark ? ThemeMode.dark : ThemeMode.light;
  }

  /// WHEN SYSTEM CHANGE THEME
  @override
  void didChangePlatformBrightness() {
    if (CacheHelper.get('theme') == 'system') {
      updateThemeFromSystem();
      emit(UpdateTheme());
      // restartApplication();
    }
  }

  /// CHANGE THEME
  Future changeTheme(String val) async {
    await CacheHelper.save('theme', val);
    await getThemeMode();
    // restartApplication();
  }
}
