import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FlagLanguage extends StatefulWidget {
  const FlagLanguage({
    Key? key,
    this.showButton = true,
    this.flagWidth = 32.0,
  }) : super(key: key);
  final bool showButton;
  final double flagWidth;
  @override
  FLagLanguageState createState() => FLagLanguageState();
}

class FLagLanguageState extends State<FlagLanguage> {
  String? currentLocale = '';
  late SharedPreferences prefs;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _initPrefs();
    });
    super.initState();
  }

  _onChange(CountryCode countryCode) async {
    final currentLocaleTemp = countryCode.code == 'ES' ? 'es_ES' : 'en_EN';
    prefs.setString("lenguage", currentLocaleTemp);
    changeLocale(context, currentLocaleTemp);
    setState(() {});
  }

  _initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    currentLocale =
        prefs.containsKey('lenguage') ? prefs.getString('lenguage') : 'es_ES';
    changeLocale(context, currentLocale);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: CountryCodePicker(
        flagWidth: widget.flagWidth,
        hideMainText: true,
        showFlagMain: true,
        hideSearch: true,
        showDropDownButton: widget.showButton,
        onChanged: _onChange,
        initialSelection: currentLocale == 'en_EN' ? 'US' : 'ES',
        countryFilter: const ['ES', 'US'],
        showCountryOnly: true,
        showOnlyCountryWhenClosed: false,
        alignLeft: false,
      ),
    );
  }
}
