import 'package:dacodes_test/app/_childrens/serie/widgets/card_serie.dart';
import 'package:dacodes_test/app/common_widgets/app_bar.dart';
import 'package:dacodes_test/app/common_widgets/no_result_widget.dart';
import 'package:dacodes_test/app/constants/assets.dart';
import 'package:dacodes_test/app/models/serie_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:dacodes_test/app/_childrens/serie/bloc/bloc.dart' as bloc;

import 'package:flutter_translate/flutter_translate.dart';

import '../../../common_widgets/search_bar.dart';

class SeriesPage extends StatelessWidget {
  const SeriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => bloc.Bloc()..add(const bloc.GetSeriesEvent('')),
      child: _Content(),
    );
  }
}

class _Content extends StatelessWidget {
  _Content({Key? key}) : super(key: key);
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        child: AppBarDacodes(
          text: translate('series'),
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: size.height * .03),
                SearchBarWidget(
                    controller: _searchController,
                    onSearch: () {
                      context
                          .read<bloc.Bloc>()
                          .add(bloc.GetSeriesEvent(_searchController.text));
                    },
                    onClear: () {
                      _searchController.clear();
                      context
                          .read<bloc.Bloc>()
                          .add(const bloc.GetSeriesEvent(''));
                    }),
                BlocBuilder<bloc.Bloc, bloc.State>(
                  builder: (context, state) {
                    SerieModel? serie = state.model.serie;

                    if (serie == null && state is bloc.LoadedSeriesState) {
                      return Center(
                        child: NoResultWidget(
                          title: translate('resultNoFound'),
                          onTap: () {
                            context
                                .read<bloc.Bloc>()
                                .add(const bloc.GetSeriesEvent(''));
                          },
                        ),
                      );
                    } else if (state is bloc.ErrorState) {
                      return Center(
                        child: NoResultWidget(
                          title: translate('tryAgain'),
                          onTap: () {
                            context
                                .read<bloc.Bloc>()
                                .add(const bloc.GetSeriesEvent(''));
                          },
                        ),
                      );
                    } else if (state is bloc.InitialState ||
                        state is bloc.LoadingSeriesState) {
                      return Container(
                        padding: const EdgeInsets.all(10),
                        child: Image.asset(AssetsUIValues.loading),
                      );
                    } else {
                      if (serie != null) {
                        return Column(
                          children: [
                            SizedBox(
                              height: size.height * .02,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: size.height * .01,
                                ),
                                child: ListTile(
                                  title: Text(
                                    translate('results'),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: size.height * .03),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: size.height * .02,
                            ),
                            CardSeries(
                              serie: serie,
                            ),
                          ],
                        );
                      } else {
                        return Container(
                          padding: const EdgeInsets.all(10),
                          child: Image.asset(AssetsUIValues.loading),
                        );
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
