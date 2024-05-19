import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:kritik_version_2023/components/classEstablishment.dart';
import 'package:kritik_version_2023/components/establishment_data_grid.dart';
import 'package:kritik_version_2023/components/services.dart';
import 'package:http/http.dart' as http;

class ApiService {
  String establishmenApiUrl = "http://127.0.0.1:8000/api/v1/establishment/";
  String reviewsApiUrl = "http://127.0.0.1:8000/api/v1/review/";

  Future<List<Reviews>> getReviews() async {
    Response response = await get(Uri.parse(reviewsApiUrl));
    print('Status Code: ${response.statusCode}');

    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      print('Status Code: ${response.statusCode}');

      print("\n\n\n\n\n\n reviews \n\n\n\n");
      print(result);

      return result.map((e) => Reviews.fromJson(e)).toList();
    } else {
      print('Status Code: ${response.statusCode}');

      print("naay error 404");
      throw Exception(response.reasonPhrase);
    }
  }

  Future<List<Establishment>> getEstablishment() async {
    Response response = await get(Uri.parse(establishmenApiUrl));
    print('Status Code: ${response.statusCode}');

    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);

      print(result);

      return result.map((e) => Establishment.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Future<void> createReview(String reviewComment, int establishmentID) async {
    Response response = await http.post(
      Uri.parse(reviewsApiUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "review_comment": reviewComment,
        "star_rating": 5,
        "image_path": "assets/images/profilepageprofile.png",
        "user": 1,
        "establishment": establishmentID
      }),
    );

    if (response.statusCode == 201) {
      print("Successfully Added to database");
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Future<void> deleteReview(int index) async {
    final response = await http.delete(
        Uri.parse("http://127.0.0.1:8000/api/v1/review/$index/"),
        headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 204) {
      print("Review with ID $index is successfully deleted");
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Future<void> editReview(int index, String editedReview) async {
    Response response = await http.patch(
      Uri.parse("$reviewsApiUrl+$index/"),
      headers: {"content-Type": "application/json"},
      body: jsonEncode({"review_comment": editedReview}),
    );
    if (response.statusCode == 200) {
      print("successfully edited the review");
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

final establishmentProvider = Provider<ApiService>((ref) => ApiService());
final reviewsProvider = Provider<ApiService>((ref) => ApiService());

final establishmentDataProvider =
    FutureProvider<List<Establishment>>((ref) async {
  return ref.watch(establishmentProvider).getEstablishment();
});

final reviewsDataProvider = FutureProvider<List<Reviews>>((ref) async {
  return ref.watch(reviewsProvider).getReviews();
});
