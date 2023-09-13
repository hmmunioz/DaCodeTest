import 'package:dacodes_test/app/_childrens/serie/widgets/card_episode.dart';
import 'package:dacodes_test/app/models/season_model.dart';
import 'package:dacodes_test/app/models/serie_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:dacodes_test/app/_childrens/serie/bloc/bloc.dart' as bloc;
import 'package:flutter_translate/flutter_translate.dart';

import '../../../common_widgets/app_bar.dart';
import '../../../common_widgets/list_view_infinite.dart';
import '../../../common_widgets/no_result_widget.dart';

class EpisodeListPage extends StatelessWidget {
  const EpisodeListPage({
    Key? key,
    required this.seasonNumber,
    required this.serie,
  }) : super(key: key);
  final String seasonNumber;
  final SerieModel serie;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => bloc.Bloc()
        ..add(
          bloc.GetSeasonEvent(
            serie.title,
            int.parse(seasonNumber),
          ),
        ),
      child: _Content(seasonNumber: seasonNumber, serie: serie),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({
    Key? key,
    required this.seasonNumber,
    required this.serie,
  }) : super(key: key);
  final String seasonNumber;
  final SerieModel serie;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        child: AppBarDacodes(
          text: translate('episodes'),
        ),
        preferredSize: Size.fromHeight(size.height * .06),
      ),
      body: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).backgroundColor,
              Theme.of(context).cardColor,
            ],
            begin: Alignment.topLeft,
            end: Alignment.topRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: size.height * .03),
              BlocBuilder<bloc.Bloc, bloc.State>(builder: (context, state) {
                return Text(
                  translate('season') +
                      ' ' +
                      (state.model.season?.season ?? ''),
                  style: TextStyle(
                    fontSize: size.width * 0.035,
                    color: Theme.of(context).primaryColorDark,
                  ),
                );
              }),
              SizedBox(height: size.height * .02),
              BlocBuilder<bloc.Bloc, bloc.State>(
                builder: (context, state) {
                  SeasonModel? season = state.model.season;
                  if (season == null && state is bloc.LoadedSeriesState) {
                    return Center(
                      child: NoResultWidget(
                        title: translate('resultNoFound'),
                        onTap: () {
                          context.read<bloc.Bloc>().add(
                                bloc.GetSeasonEvent(
                                  serie.title,
                                  int.parse(seasonNumber),
                                ),
                              );
                        },
                      ),
                    );
                  } else if (state is bloc.ErrorState) {
                    return Center(
                      child: NoResultWidget(
                        title: translate('tryAgain'),
                        onTap: () {
                          context.read<bloc.Bloc>().add(
                                bloc.GetSeasonEvent(
                                  serie.title,
                                  int.parse(seasonNumber),
                                ),
                              );
                        },
                      ),
                    );
                  } else if (state is bloc.InitialState ||
                      state is bloc.LoadingSeriesState) {
                    return const SizedBox();
                  } else {
                    if (season != null && season.episodes.isNotEmpty) {
                      if (MediaQuery.of(context).orientation ==
                          Orientation.portrait) {
                        return PhoneList(
                          season: season,
                          serie: serie,
                          seasonNumber: seasonNumber,
                        );
                      } else {
                        return TabletList(
                          season: season,
                          serie: serie,
                          seasonNumber: seasonNumber,
                        );
                      }
                    } else {
                      return const SizedBox();
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PhoneList extends StatelessWidget {
  const PhoneList({
    Key? key,
    this.season,
    this.serie,
    this.seasonNumber = '0',
  }) : super(key: key);
  final SeasonModel? season;
  final SerieModel? serie;
  final String seasonNumber;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return season == null || serie == null
        ? const SizedBox()
        : SizedBox(
            height: size.height *
                (MediaQuery.of(context).orientation == Orientation.portrait
                    ? .80
                    : .68),
            child: RefreshIndicator(
              onRefresh: () async {
                context.read<bloc.Bloc>().add(
                      bloc.GetSeasonEvent(
                        serie?.title ?? '',
                        int.parse(seasonNumber),
                      ),
                    );
              },
              child: ListViewInfinite(
                isLastPage: true,
                loadingWidget: Padding(
                  padding: const EdgeInsets.only(
                    left: 17,
                    right: 17,
                    bottom: 25,
                  ),
                  child: Column(
                    children: const [
                      SizedBox(),
                    ],
                  ),
                ),
                children: List.generate(
                  season!.episodes.length,
                  (index) {
                    final episodeTemp = season!.episodes[index];
                    return CardEpisode(
                      seasonNumber: seasonNumber,
                      serie: serie!,
                      episode: episodeTemp,
                    );
                  },
                ),
              ),
            ),
          );
  }
}

class TabletList extends StatelessWidget {
  const TabletList({
    Key? key,
    this.season,
    this.serie,
    this.seasonNumber = '0',
  }) : super(key: key);
  final SeasonModel? season;
  final SerieModel? serie;
  final String seasonNumber;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return season == null || serie == null
        ? const SizedBox()
        : SizedBox(
            height: size.height * .68,
            child: RefreshIndicator(
              onRefresh: () async {
                context.read<bloc.Bloc>().add(
                      bloc.GetSeasonEvent(
                        serie?.title ?? '',
                        int.parse(seasonNumber),
                      ),
                    );
              },
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemCount: season!.episodes.length,
                itemBuilder: (BuildContext context, int index) {
                  final episodeTemp = season!.episodes[index];
                  return CardEpisode(
                    seasonNumber: seasonNumber,
                    serie: serie!,
                    episode: episodeTemp,
                  );
                },
              ),
            ),
          );
  }
}
