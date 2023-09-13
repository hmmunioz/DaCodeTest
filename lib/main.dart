import 'package:dacodes_test/app/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app/theme/theme_notifier.dart';
import 'app/theme/theme_style.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var delegate = await LocalizationDelegate.create(
      fallbackLocale: 'es_ES', supportedLocales: ['en_US', 'es_ES']);
  await dotenv.load(fileName: ".env");
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]).then(
    (value) => runApp(
      LocalizedApp(
        delegate,
        const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatefulWidget with WidgetsBindingObserver {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  SharedPreferences? prefs;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var localizationDelegate = LocalizedApp.of(context).delegate;

    return LocalizationProvider(
      state: LocalizationProvider.of(context).state,
      child: ChangeNotifierProvider<ThemeNotifier>(
        create: (context) {
          return ThemeNotifier(ThemeMode.light);
        },
        child: Consumer<ThemeNotifier>(
          builder: (_, model, __) {
            final themModeTemp = model.getThemeMode();
            return MaterialApp(
              title: translate('dacodesTest'),
              routes: RouterClass.routes,
              localizationsDelegates: [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                localizationDelegate,
              ],
              supportedLocales: localizationDelegate.supportedLocales,
              locale: localizationDelegate.currentLocale,
              initialRoute: '/splash',
              themeMode: themModeTemp,
              theme: appThemes[0],
              darkTheme: appThemes[1],
              debugShowCheckedModeBanner: false,
            );
          },
        ),
      ),
    );
  }
}
