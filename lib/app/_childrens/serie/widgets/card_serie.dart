import 'package:dacodes_test/app/_childrens/serie/pages/serie_detail_page.dart';
import 'package:dacodes_test/app/models/serie_model.dart';
import 'package:flutter/material.dart';

import '../../../utils/helper.dart';

class CardSeries extends StatelessWidget {
  const CardSeries({Key? key, required this.serie}) : super(key: key);
  final SerieModel serie;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: size.width * .8,
          child: Text(
            "${serie.title} (${serie.year})",
            style: TextStyle(
              color: Theme.of(context).primaryColorDark,
              fontSize: size.width * .045,
            ),
          ),
        ),
        SizedBox(
          height: size.height * .02,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              gotoPage(
                context,
                SerieDetailPage(
                  serie: serie,
                ),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SizedBox(
                height: size.height * .5,
                width: size.width * .6,
                child: Image.network(
                  serie.poster,
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
