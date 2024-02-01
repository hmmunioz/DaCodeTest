import 'package:flutter_translate/flutter_translate.dart';
import 'package:fulltimeforce_test/app/constants/utils_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../common_widgets/app_bar.dart';
import '../../../theme/theme_notifier.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class CommitDetailPage extends StatefulWidget {
  const CommitDetailPage({Key? key, required this.urlCommit}) : super(key: key);
  final String urlCommit;
  @override
  CommitDetailPageState createState() => CommitDetailPageState();
}

class CommitDetailPageState extends State<CommitDetailPage>
    with WidgetsBindingObserver {
  late SharedPreferences prefs;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _initPrefs();
    });
    super.initState();
  }

  @override
  void didChangePlatformBrightness() {
    if (mounted) {
      _changeDarkMode();
      super.didChangePlatformBrightness();
    }
  }

  _changeDarkMode() {
    var brightness = SchedulerBinding.instance.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    if (isDarkMode) {
      if (prefs.getString('themeMode') == 'light') {
        Provider.of<ThemeNotifier>(context, listen: false)
            .setThemeMode(ThemeMode.dark);
      }
    } else if (!isDarkMode && prefs.getString('themeMode') == 'dark') {
      Provider.of<ThemeNotifier>(context, listen: false)
          .setThemeMode(ThemeMode.dark);
    }
  }

  _initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    _changeDarkMode();
    setState(() {});
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ResponsiveBreakpoints.builder(
      breakpoints: UtilsScreen.breakpoints,
      child: Scaffold(
        appBar: PreferredSize(
          child: AppBarTest(
            text: translate('commits'),
          ),
          preferredSize: Size.fromHeight(size.height * .06),
        ),
        backgroundColor: Colors.white,
        body: InAppWebView(
          initialUrlRequest: URLRequest(
              url: Uri.parse(
            widget.urlCommit,
          )),
          initialOptions: InAppWebViewGroupOptions(
            crossPlatform: InAppWebViewOptions(
                javaScriptEnabled: true, cacheEnabled: false),
            android: AndroidInAppWebViewOptions(
                useHybridComposition: true, thirdPartyCookiesEnabled: true),
            ios: IOSInAppWebViewOptions(sharedCookiesEnabled: true),
          ),
        ),
      ),
    );
  }
}
