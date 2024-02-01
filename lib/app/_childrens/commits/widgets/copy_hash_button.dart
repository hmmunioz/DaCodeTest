import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CopyHashButton extends StatelessWidget {
  final String textToCopy;
  final IconData icon;

  const CopyHashButton({
    Key? key,
    required this.textToCopy,
    this.icon = Icons.copy, // El ícono por defecto es un ícono de copia
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        icon,
        size: 12,
      ),
      onPressed: () {
        Clipboard.setData(ClipboardData(text: textToCopy));
        const snackBar = SnackBar(content: Text('Copied to clipboard!'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      tooltip: 'Copy to clipboard',
    );
  }
}
