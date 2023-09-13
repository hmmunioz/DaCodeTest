import 'package:dacodes_test/app/common_widgets/btn_back_widget.dart';
import 'package:dacodes_test/app/common_widgets/card_slider.dart';
import 'package:dacodes_test/app/models/serie_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:google_fonts/google_fonts.dart';

class SerieDetailPage extends StatelessWidget {
  const SerieDetailPage({
    Key? key,
    required this.serie,
  }) : super(key: key);
  final SerieModel serie;
  @override
  Widget build(BuildContext context) {
    return _Content(
      serie: serie,
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({
    Key? key,
    required this.serie,
  }) : super(key: key);
  final SerieModel serie;
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: size.height * 0.5,
                        margin: const EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 24,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 10,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.network(
                            serie.poster,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: size.height * 0.035),
                            _OverviewRow(
                              serie: serie,
                            ),
                            SizedBox(height: size.height * 0.035),
                            _ReleaseDateLanguageRow(
                              serie: serie,
                            ),
                            SizedBox(height: size.height * 0.035),
                            if (serie.ratings.isNotEmpty)
                              _RatingRow(
                                serie: serie,
                              ),
                            if (serie.ratings.isNotEmpty)
                              SizedBox(height: size.height * 0.035),
                            _GenreRow(
                              serie: serie,
                            ),
                            SizedBox(height: size.height * 0.035),
                            _OriginCountryRow(
                              serie: serie,
                            ),
                            SizedBox(height: size.height * 0.035),
                            _ActorsRow(
                              serie: serie,
                            ),
                            SizedBox(
                              height: size.height * 0.035,
                            ),
                            _SeasonsRow(
                              serie: serie,
                            ),
                            SizedBox(
                              height: size.height * 0.035,
                            ),
                          ],
                        ),
                      ),
                    ],
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

class _OverviewRow extends StatelessWidget {
  const _OverviewRow({
    Key? key,
    required this.serie,
  }) : super(key: key);
  final SerieModel serie;
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
          serie.plot,
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
    required this.serie,
  }) : super(key: key);
  final SerieModel serie;
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
              serie.released,
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
              serie.language,
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
    required this.serie,
  }) : super(key: key);
  final SerieModel serie;
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
              serie.ratings[0].value,
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
    required this.serie,
  }) : super(key: key);
  final SerieModel serie;
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
          serie.genre,
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
    required this.serie,
  }) : super(key: key);
  final SerieModel serie;
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
          serie.country,
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
    required this.serie,
  }) : super(key: key);
  final SerieModel serie;
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
          serie.actors,
          style: GoogleFonts.marvel(
            fontSize: size.width * .033,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class _SeasonsRow extends StatelessWidget {
  const _SeasonsRow({
    Key? key,
    required this.serie,
  }) : super(key: key);
  final SerieModel serie;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${translate('seasons')}: ${serie.totalSeasons}",
          style: GoogleFonts.marvel(
            fontSize: size.height * .036,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        SizedBox(
          height: size.height * 0.01,
        ),
        CardSlider(
          serie: serie,
        ),
      ],
    );
  }
}
