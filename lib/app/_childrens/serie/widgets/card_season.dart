import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../models/serie_model.dart';
import '../../../utils/helper.dart';
import '../pages/episode_list_page.dart';

class CardSeason extends StatelessWidget {
  const CardSeason({
    Key? key,
    required this.seasonNumber,
    required this.serie,
  }) : super(key: key);
  final String seasonNumber;
  final SerieModel serie;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        gotoPage(
          context,
          EpisodeListPage(
            serie: serie,
            seasonNumber: seasonNumber,
          ),
        );
      },
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: LinearGradient(
            colors: [
              Theme.of(context).highlightColor,
              Theme.of(context).primaryColor,
            ],
            begin: Alignment.topLeft,
            end: Alignment.topRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              translate('season'),
              style: GoogleFonts.marvel(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).primaryColorDark,
                decoration: TextDecoration.underline,
              ),
            ),
            Text(
              seasonNumber,
              style: GoogleFonts.marvel(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).primaryColorDark,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
