import 'package:http/http.dart' as http;
import 'dart:convert';
import '../constants/apiurl.dart';
import '../models/response_commit_model.dart';

class Repository {
  Future<List<ResponseCommitModel>> fetchCommits(
    String repoOwner,
    String repoName, {
    int page = 0,
    int size = 5,
  }) async {
    final uri = "${ApiUrlValues.apiBaseUrl}$repoOwner/$repoName/commits";
    final finalUri = uri + "?page=$page&per_page=$size&";
    final response = await http.get(Uri.parse(finalUri));

    if (response.statusCode == 200) {
      var decodedBodyUtf8 = utf8.decode(response.bodyBytes);
      List<dynamic> jsonBody = json.decode(decodedBodyUtf8) as List<dynamic>;
      return jsonBody
          .map((dynamic item) =>
              ResponseCommitModel.fromJson(item as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('Failed to load commits');
    }
  }
}
