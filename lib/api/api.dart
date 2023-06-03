import 'dart:convert';
import 'package:flutter_marvel_api/domain/models/character_modal.dart';
import 'package:http/http.dart' as http;

class Api {
  static Future<List<Character>> getCharacters(url) async {
    const String ts = '3000';
    const String key =
        '8072b16fa11b4cffa374d6fa410d2b5d&hash=a82ab7a344ec4e386b26d9d6b63ff2d6';
    const String limit = '100';
    final api = Uri.parse('$url?limit=$limit&ts=$ts&apikey=$key');
    // final api = Uri.parse(
    //     'https://gateway.marvel.com/v1/public/characters?nameStartsWith=wolverin&ts=3000&apikey=8072b16fa11b4cffa374d6fa410d2b5d&hash=a82ab7a344ec4e386b26d9d6b63ff2d6');
    final headers = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      //'Authorization': 'Bearer $token',
    };
    var response = await http.get(api, headers: headers);
    var responseData = json.decode(response.body);
    List<Character> characterList = [];
    for (var character in responseData['data']['results']) {
      Character jsonCharacter = Character(
        name: character['name'],
        description: character['description'],
        thumbnail: character['thumbnail'],
      );
      characterList.add(jsonCharacter);
    }
    return characterList;
  }
}
