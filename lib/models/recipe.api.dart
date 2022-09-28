import 'dart:convert';
import 'package:food_recipe/models/recipe.dart';
import 'package:http/http.dart' as http;

class RecipeApi {
  static Future<List<Recipe>> getRecipe() async {
    var uri = Uri.http(
      'yummly2.p.rapidapi.com',
      '/feeds/list',
      {"limit": "24", "start": "0"},
    );

    final response = await http.get(uri, headers: {
      "X-RapidAPI-Key": "012f051f75mshea9e76199cd1dddp163caejsn34a9bfa73844",
      "X-RapidAPI-Host": "yummly2.p.rapidapi.com",
      "useQueryString": "true"
    });

    Map data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data['feed']) {
      _temp.add(i['content']['details']);
    }

    return Recipe.recipesFromSnapshot(_temp);
  }
}
