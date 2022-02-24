import 'dart:convert';
import 'package:favoritelist/data/models/favorite_list.dart';
import 'package:http/http.dart' as http;

class FavoriteListRepository {
  final url = 'https://62179a4971e7672e538528e3.mockapi.io/items';
  Future<List<FavoriteList>> fetchList() async {
    final response = await http
        .get(Uri.parse(url));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      final list = json.map((element)=>FavoriteList.fromJson(element)).toList();
      return list;
    } else {
      throw Exception('Failed to fetch products');
    }
  }
}
