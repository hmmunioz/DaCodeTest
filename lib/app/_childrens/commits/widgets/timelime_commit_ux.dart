import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:fulltimeforce_test/app/_childrens/commits/pages/commit_detail_page.dart';
import 'package:fulltimeforce_test/app/constants/assets.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fulltimeforce_test/app/_childrens/commits/bloc/bloc.dart'
    as bloc;
import '../../../common_widgets/card_skeleton.dart';
import '../../../common_widgets/list_view_infinite.dart';
import '../../../models/response_commit_model.dart';

import '../../../utils/helper.dart';

class CommitTimeline extends StatelessWidget {
  final List<ResponseCommitModel> commitResponse;
  final bool isLast;
  const CommitTimeline(
      {Key? key, required this.commitResponse, required this.isLast})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * .85,
      width: size.width * .95,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .55,
        child: RefreshIndicator(
          onRefresh: () async {
            context.read<bloc.Bloc>().add(bloc.ReloadCommitsEvent());
          },
          child: ListViewInfinite(
            onLoadingMore: () {
              context.read<bloc.Bloc>().add(bloc.GetMoreCommitsEvent());
            },
            loadingWidget: Row(
              children: [
                Container(
                  width: size.width * .4,
                ),
                const Expanded(
                  child: CardSkeleton(),
                )
              ],
            ),
            isLastPage: isLast,
            children: List.generate(
              commitResponse.length,
              (index) {
                var commitResponseItem = commitResponse[index];
                return TimelineTile(
                  alignment: TimelineAlign.manual,
                  lineXY: 0.34,
                  isFirst: index == 0,
                  isLast: index == commitResponse.length - 1,
                  indicatorStyle: IndicatorStyle(
                    width: size.width * .075,
                    height: size.height * .07,
                    color: Colors.white,
                    indicator: Image.asset(
                      AssetsUIValues.timeline,
                      height: 80,
                      width: 80,
                    ),
                  ),
                  startChild: _LeftChild(
                    date: formatDateString(
                      commitResponseItem.commit.author.date,
                    ),
                  ),
                  endChild: _RightChild(
                    commitMessage: commitResponseItem.commit.message,
                    userName: commitResponseItem.commit.author.name,
                    userEmail: commitResponseItem.commit.author.email,
                    imageUrl: commitResponseItem.author.avatarUrl,
                    profileUrl: commitResponseItem.author.htmlUrl,
                    commitUrl: commitResponseItem.htmlUrl,
                  ),
                  beforeLineStyle: const LineStyle(
                    color: Colors.white,
                    thickness: 3,
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _RightChild extends StatelessWidget {
  const _RightChild({
    Key? key,
    required this.userName,
    required this.commitMessage,
    required this.profileUrl,
    required this.commitUrl,
    required this.userEmail,
    required this.imageUrl,
  }) : super(key: key);

  final String userName;
  final String commitMessage;
  final String userEmail;
  final String imageUrl;
  final String profileUrl;
  final String commitUrl;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      color: Colors.blueGrey,
      alignment: Alignment.center,
      child: Column(
        children: [
          Row(
            children: [
              _DataProfile(
                profileUrl: profileUrl,
                userName: userName,
                urlImage: imageUrl,
              ),
              _CommitInfo(
                commitMessage: commitMessage,
                userEmail: userEmail,
              )
            ],
          ),
          SizedBox(
            height: size.height * .01,
          ),
          _ButtonGoToBrowser(
            url: commitUrl,
          ),
        ],
      ),
      constraints: BoxConstraints(
        minHeight: size.height * .13,
      ),
    );
  }
}

class _LeftChild extends StatelessWidget {
  const _LeftChild({
    Key? key,
    required this.date,
  }) : super(key: key);

  final String date;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      child: Text(
        date,
        style: TextStyle(
          fontSize: size.width * .031,
          color: Theme.of(context).hintColor,
        ),
      ),
    );
  }
}

class _CommitInfo extends StatelessWidget {
  const _CommitInfo({
    Key? key,
    required this.commitMessage,
    required this.userEmail,
  }) : super(key: key);

  final String commitMessage;
  final String userEmail;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(5),
      width: size.width * .25,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            commitMessage,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: size.height * .015,
                decoration: TextDecoration.underline),
          ),
          SizedBox(
            height: size.height * .01,
          ),
          Text(
            userEmail,
            style: TextStyle(
              color: Theme.of(context).primaryColorLight,
              fontSize: size.height * .012,
            ),
          ),
        ],
      ),
    );
  }
}

class _DataProfile extends StatelessWidget {
  const _DataProfile({
    Key? key,
    required this.userName,
    required this.profileUrl,
    required this.urlImage,
  }) : super(key: key);

  final String userName;

  final String profileUrl;

  final String urlImage;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CommitDetailPage(
                  urlCommit: profileUrl,
                ),
              ),
            );
          },
          child: Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
                width: 2,
              ),
            ),
            child: ClipOval(
              child: CachedNetworkImage(
                imageUrl: urlImage,
                width: 40,
                height: 40,
                fit: BoxFit.contain,
                placeholder: (context, url) => Container(
                  width: 40,
                  height: 40,
                  child: const Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 2.0,
                    ),
                  ),
                  padding: const EdgeInsets.all(5),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
        ),
        SizedBox(
          height: size.height * .01,
        ),
        Container(
          padding: const EdgeInsets.all(5),
          width: size.width * .22,
          child: Text(
            userName,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: size.height * .013,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}

class _ButtonGoToBrowser extends StatelessWidget {
  const _ButtonGoToBrowser({
    Key? key,
    required this.url,
  }) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: Colors.grey,
      height: size.height * .02,
      alignment: Alignment.center,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CommitDetailPage(
                urlCommit: url,
              ),
            ),
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.open_in_browser,
              size: size.height * .014,
            ),
            SizedBox(
              width: size.width * .01,
            ),
            Text(
              translate("open"),
              style: TextStyle(
                fontSize: size.height * .012,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
