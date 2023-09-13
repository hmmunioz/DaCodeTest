import 'package:dacodes_test/app/common_widgets/btn_back_widget.dart';
import 'package:dacodes_test/app/models/episode_model.dart';
import 'package:dacodes_test/app/models/season_model.dart';
import 'package:dacodes_test/app/models/serie_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dacodes_test/app/_childrens/serie/bloc/bloc.dart' as bloc;

import '../../../common_widgets/btn_back_widget.dart';

class EpisodeDetailPage extends StatelessWidget {
  const EpisodeDetailPage({
    Key? key,
    required this.serie,
    required this.season,
    required this.episode,
  }) : super(key: key);
  final SerieModel serie;
  final String season;
  final Episode episode;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => bloc.Bloc()
        ..add(bloc.GetEpisodeEvent(
          serie.title,
          int.parse(episode.episode),
          int.parse(season),
        )),
      child: _Content(
        serie: serie,
        episodeCard: episode,
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({
    Key? key,
    required this.serie,
    required this.episodeCard,
  }) : super(key: key);
  final SerieModel serie;
  final Episode episodeCard;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(serie.poster),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.7),
                  Colors.transparent,
                ],
              ),
            ),
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  leading: const ButtonBack(),
                  backgroundColor: Colors.transparent,
                  expandedHeight: size.height * 0.05,
                  pinned: true,
                  floating: true,
                  flexibleSpace: const SizedBox.shrink(),
                ),
                SliverToBoxAdapter(
                  child: BlocBuilder<bloc.Bloc, bloc.State>(
                    builder: (context, state) {
                      final resultEpisodeModel = state.model.episode;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: size.height * 0.035),
                                _TitleRow(
                                  episode: state.model.episode,
                                ),
                                SizedBox(height: size.height * 0.035),
                                _OverviewRow(
                                  episode: state.model.episode,
                                ),
                                SizedBox(height: size.height * 0.035),
                                _ReleaseDateLanguageRow(
                                  episode: resultEpisodeModel,
                                ),
                                SizedBox(height: size.height * 0.035),
                                _RatingRow(
                                  episode: resultEpisodeModel,
                                ),
                                SizedBox(height: size.height * 0.035),
                                _GenreRow(
                                  episode: resultEpisodeModel,
                                ),
                                SizedBox(height: size.height * 0.035),
                                _OriginCountryRow(
                                  episode: resultEpisodeModel,
                                ),
                                SizedBox(height: size.height * 0.035),
                                _ActorsRow(
                                  episode: resultEpisodeModel,
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TitleRow extends StatelessWidget {
  const _TitleRow({
    Key? key,
    required this.episode,
  }) : super(key: key);
  final EpisodeModel? episode;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          episode?.title ?? '',
          style: GoogleFonts.openSans(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${translate('episode')}: ${episode?.episode ?? ''}",
              style: GoogleFonts.marvel(
                fontSize: size.width * .033,
                color: Colors.white,
              ),
            ),
            Text(
              "${translate('season')}: ${episode?.season ?? ''}",
              style: GoogleFonts.marvel(
                fontSize: size.width * .033,
                color: Colors.white,
              ),
            ),
          ],
        )
      ],
    );
  }
}

class _OverviewRow extends StatelessWidget {
  const _OverviewRow({
    Key? key,
    required this.episode,
  }) : super(key: key);
  final EpisodeModel? episode;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          translate('overview'),
          style: GoogleFonts.openSans(
            fontSize: size.width * .08,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          episode?.plot ?? '',
          style: GoogleFonts.marvel(
            fontSize: size.width * .033,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class _ReleaseDateLanguageRow extends StatelessWidget {
  const _ReleaseDateLanguageRow({
    Key? key,
    required this.episode,
  }) : super(key: key);
  final EpisodeModel? episode;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              translate('releaseDate'),
              style: GoogleFonts.marvel(
                fontSize: size.height * .036,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            Text(
              episode?.released ?? '',
              style: GoogleFonts.marvel(
                fontSize: size.width * .033,
                color: Colors.white,
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              translate('language'),
              style: GoogleFonts.marvel(
                fontSize: size.height * .036,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            Text(
              episode?.language ?? '',
              style: GoogleFonts.marvel(
                fontSize: size.width * .033,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _RatingRow extends StatelessWidget {
  const _RatingRow({
    Key? key,
    required this.episode,
  }) : super(key: key);
  final EpisodeModel? episode;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              translate('rating'),
              style: GoogleFonts.marvel(
                fontSize: size.height * .036,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 8),
            const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            Text(
              episode?.ratings[0].value ?? '',
              style: GoogleFonts.marvel(
                fontSize: size.width * .033,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _GenreRow extends StatelessWidget {
  const _GenreRow({
    Key? key,
    required this.episode,
  }) : super(key: key);
  final EpisodeModel? episode;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          translate('genre'),
          style: GoogleFonts.marvel(
            fontSize: size.height * .036,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        Text(
          episode?.genre ?? '',
          style: GoogleFonts.marvel(
            fontSize: size.width * .033,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class _OriginCountryRow extends StatelessWidget {
  const _OriginCountryRow({
    Key? key,
    required this.episode,
  }) : super(key: key);
  final EpisodeModel? episode;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          translate('origin_country'),
          style: GoogleFonts.marvel(
            fontSize: size.height * .036,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        Text(
          episode?.country ?? '',
          style: GoogleFonts.marvel(
            fontSize: size.width * .033,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class _ActorsRow extends StatelessWidget {
  const _ActorsRow({
    Key? key,
    required this.episode,
  }) : super(key: key);
  final EpisodeModel? episode;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          translate('actors'),
          style: GoogleFonts.marvel(
            fontSize: size.height * .036,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        Text(
          episode?.actors ?? '',
          style: GoogleFonts.marvel(
            fontSize: size.width * .033,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
