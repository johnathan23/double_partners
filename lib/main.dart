import 'package:double_partners/config/constants/app_constants.dart';
import 'package:double_partners/config/router/app_router.dart';
import 'package:double_partners/config/theme/app_theme.dart';
import 'package:double_partners/core/infrastructure/session/session_manager.dart';
import 'package:double_partners/firebase_options.dart';
import 'package:double_partners/l10n/app_localizations.dart';
import 'package:double_partners/share/helpers/custom_scroll_behavior.dart';
import 'package:double_partners/share/providers/locale_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();
  _setPreferredOrientations();
  _initSharedPreferences();
  _initFirebase();

  runApp(ProviderScope(child: const MyApp()));
}

void _setPreferredOrientations() {
  if (!kIsWeb) return;
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}

void _initSharedPreferences() async {
  final session = SessionManager();
  await session.init();
}

void _initFirebase() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  print('projectId: ${Firebase.app().options.projectId}');
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Locale locale = ref.watch(localeNotifierProvider);
    return MaterialApp.router(
      title: kAppName,
      theme: AppTheme.light,
      routerConfig: ref.watch(routerProvider),
      scrollBehavior: CustomScrollBehavior(),
      locale: locale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
