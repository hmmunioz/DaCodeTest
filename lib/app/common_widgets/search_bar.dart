import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';

class SearchBarWidget extends StatelessWidget {
  final TextEditingController controller;

  final VoidCallback onSearch;
  final VoidCallback onClear;

  const SearchBarWidget({
    Key? key,
    required this.controller,
    required this.onSearch,
    required this.onClear,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(16),
      ),
      margin: EdgeInsets.symmetric(horizontal: size.width * .07),
      padding: EdgeInsets.only(left: size.width * .05),
      height: size.height * .055,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              style: TextStyle(
                color: Theme.of(context).primaryColorLight,
                fontSize: size.width * .03,
              ),
              controller: controller,
              decoration: InputDecoration(
                hintText: translate('search'),
                hintStyle: TextStyle(color: Theme.of(context).primaryColorDark),
                border: InputBorder.none,
              ),
              onSubmitted: (value) {
                onSearch();
              },
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.search,
              color: Theme.of(context).primaryColorDark,
              size: size.width * .05,
            ),
            onPressed: onSearch,
          ),
        ],
      ),
    );
  }
}
