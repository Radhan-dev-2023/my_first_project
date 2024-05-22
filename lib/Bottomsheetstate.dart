import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Album.dart';
import 'currency.dart';

class BottomSheetState with ChangeNotifier{

  Future<Album> fetchAlbum() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

    if (response.statusCode == 200) {
      return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<Eur> fetchEur() async {
    final response = await http
        .get(Uri.parse("https://api.coindesk.com/v1/bpi/currentprice.json"));
    if (response.statusCode == 200) {
      return Eur.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Failed to load album');
    }
  }
}
