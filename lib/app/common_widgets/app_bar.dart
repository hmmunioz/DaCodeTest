import 'package:fulltimeforce_test/app/common_widgets/dark_mode_button.dart';
import 'package:flutter/material.dart';

import 'btn_back_widget.dart';

class AppBarTest extends StatelessWidget {
  const AppBarTest({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AppBar(
      toolbarHeight: size.height * .06,
      leading: const ButtonBack(),
      title: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: size.height * 0.02,
          color: Theme.of(context).cardColor,
        ),
      ),
      centerTitle: true,
      actions: const [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: DarkModeButton(),
        )
      ],
      backgroundColor: Theme.of(context).hintColor,
    );
  }
}
