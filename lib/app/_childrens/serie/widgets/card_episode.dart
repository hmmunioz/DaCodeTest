import 'package:dacodes_test/app/models/serie_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../models/season_model.dart';
import '../../../utils/helper.dart';
import '../pages/episode_detail_page.dart';

class CardEpisode extends StatelessWidget {
  const CardEpisode({
    Key? key,
    required this.seasonNumber,
    required this.serie,
    required this.episode,
  }) : super(key: key);
  final String seasonNumber;
  final SerieModel serie;
  final Episode episode;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        gotoPage(
          context,
          EpisodeDetailPage(
            serie: serie,
            season: seasonNumber,
            episode: episode,
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: size.width * .015),
        color: Colors.white.withOpacity(0.2),
        child: ListTile(
          title: Text(
            "${translate('episode')} ${episode.episode}:\n${episode.title}",
            style: GoogleFonts.marvel(
              fontSize: size.height * 0.025,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                episode.released,
                style: TextStyle(
                  fontSize: size.width * 0.025,
                ),
              ),
              Row(
                children: [
                  Text(
                    episode.imdbRating == 'N/A'
                        ? episode.imdbRating
                        : '${episode.imdbRating}/10',
                    style: TextStyle(
                      fontSize: size.width * .03,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: size.height * .03,
                  ),
                ],
              ),
            ],
          ),
          trailing: GestureDetector(
            onTap: () {
              gotoPage(
                context,
                EpisodeDetailPage(
                  serie: serie,
                  season: seasonNumber,
                  episode: episode,
                ),
              );
            },
            child: Transform(
              transform: Matrix4.identity()..scale(0.8),
              child: Chip(
                backgroundColor:
                    Theme.of(context).highlightColor.withOpacity(0.8),
                label: Text(
                  translate('view'),
                  style: TextStyle(
                    fontSize: size.width * 0.035,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
