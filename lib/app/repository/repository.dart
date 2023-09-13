import 'package:dacodes_test/app/models/episode_model.dart';
import 'package:dacodes_test/app/models/season_model.dart';
import 'package:dacodes_test/app/models/serie_model.dart';
import 'package:http/http.dart' as http;
import 'package:dacodes_test/app/utils/helper.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:convert';

import '../constants/apiurl.dart';

class Repository {
  Future<SerieModel?> getSeriesApi({String? search}) async {
    final searchTemp =
        search == '' || search == null ? 'Game of Thrones' : search;
    final url = ApiUrlValues.apiBaseUrl +
        (dotenv.env['API_KEY'] ?? '') +
        "&t=$searchTemp";
    final response =
        await http.get(Uri.parse(url), headers: await getHeaders());
    if (response.statusCode == 200) {
      var decodedBody = decodedUtf8(response.body);
      var jsonBody = json.decode(decodedBody);

      return SerieModel.fromJson(jsonBody);
    } else {
      return null;
    }
  }

  Future<SeasonModel?> getSeasonApi({
    required String search,
    required int season,
  }) async {
    final url = ApiUrlValues.apiBaseUrl +
        (dotenv.env['API_KEY'] ?? '') +
        "&t=$search&season=$season";
    final response =
        await http.get(Uri.parse(url), headers: await getHeaders());
    if (response.statusCode == 200) {
      var decodedBody = decodedUtf8(response.body);
      var jsonBody = json.decode(decodedBody);

      return SeasonModel.fromJson(jsonBody);
    } else {
      return null;
    }
  }

  Future<EpisodeModel?> getEpisodeApi({
    required String search,
    required int season,
    required int episode,
  }) async {
    final url = ApiUrlValues.apiBaseUrl +
        (dotenv.env['API_KEY'] ?? '') +
        "&t=$search&Season=$season&Episode=$episode";
    final response =
        await http.get(Uri.parse(url), headers: await getHeaders());
    if (response.statusCode == 200) {
      var decodedBody = decodedUtf8(response.body);
      var jsonBody = json.decode(decodedBody);

      return EpisodeModel.fromJson(jsonBody);
    } else {
      return null;
    }
  }
}
