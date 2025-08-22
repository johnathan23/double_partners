import 'package:double_partners/core/infrastructure/session/session_manager.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'locale_provider.g.dart';

@riverpod
class LocaleNotifier extends _$LocaleNotifier {
  @override
  Locale build() {
    _loadLocale();
    return state;
  }

  void setLocale(Locale locale) async {
    if (state == locale) return;
    state = locale;
    await SessionManager().setLocale(locale.languageCode);
  }

  void _loadLocale() async {
    final localeCode = await SessionManager().getLocale();
    state = Locale(localeCode);
  }
}
