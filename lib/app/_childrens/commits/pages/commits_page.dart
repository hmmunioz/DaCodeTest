import 'package:fulltimeforce_test/app/common_widgets/app_bar.dart';
import 'package:fulltimeforce_test/app/common_widgets/no_result_widget.dart';
import 'package:fulltimeforce_test/app/constants/assets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:fulltimeforce_test/app/_childrens/commits/bloc/bloc.dart'
    as bloc;

import 'package:flutter_translate/flutter_translate.dart';

import '../../../constants/constants.dart';
import '../../../models/response_commit_model.dart';
import '../widgets/timelime_commit_ux.dart';

class CommitsPage extends StatelessWidget {
  const CommitsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => bloc.Bloc()
        ..add(
          const bloc.GetCommitsEvent(
            ConstantsValues.owner,
            ConstantsValues.repo,
          ),
        ),
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
        child: AppBarTest(
          text: translate('commits'),
        ),
        preferredSize: Size.fromHeight(size.height * .06),
      ),
      body: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).cardColor,
              Theme.of(context).primaryColor,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.height * .02,
                ),
                BlocBuilder<bloc.Bloc, bloc.State>(
                  builder: (context, state) {
                    List<ResponseCommitModel>? commitsResponse =
                        state.model.commits;

                    if ((commitsResponse == null || commitsResponse.isEmpty) &&
                        state is bloc.LoadedCommitsState) {
                      return Center(
                        child: NoResultWidget(
                          title: translate('resultNoFound'),
                          onTap: () {
                            context
                                .read<bloc.Bloc>()
                                .add(const bloc.GetCommitsEvent(
                                  ConstantsValues.owner,
                                  ConstantsValues.repo,
                                ));
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
                                .add(const bloc.GetCommitsEvent(
                                  ConstantsValues.owner,
                                  ConstantsValues.repo,
                                ));
                          },
                        ),
                      );
                    } else if (state is bloc.InitialState) {
                      return Container(
                        padding: const EdgeInsets.all(10),
                        child: Image.asset(AssetsUIValues.loading),
                      );
                    } else {
                      if (commitsResponse != null &&
                          commitsResponse.isNotEmpty) {
                        return CommitTimelineUx(
                          commitResponse: commitsResponse,
                          isLast: state.model.isLast,
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
