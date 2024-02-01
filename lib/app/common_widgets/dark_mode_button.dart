import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme/theme_notifier.dart';

class DarkModeButton extends StatefulWidget {
  const DarkModeButton({
    Key? key,
    this.sizeIcon = .07,
  }) : super(key: key);
  final double sizeIcon;
  @override
  DarkModeButtonState createState() => DarkModeButtonState();
}

class DarkModeButtonState extends State<DarkModeButton> {
  _onChange() {
    Provider.of<ThemeNotifier>(context, listen: false).setThemeMode(null);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: _onChange,
      child: Icon(
        Icons.dark_mode,
        color: Theme.of(context).cardColor,
        size: size.width * widget.sizeIcon,
      ),
    );
  }
}
