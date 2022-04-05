
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:lession15_futurebuilder_app/models/photos.dart';

List<Photo> parsePhoto(String responseBody) {

  var list = json.decode(responseBody) as List<dynamic>;
  List<Photo> photos = list.map((model) => Photo.fromJson(model)).toList();
  return photos;
}

Future<List<Photo>> fetchPhotos() async {
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
  if(response.statusCode == 200) {
    return compute(parsePhoto, response.body);
  } else {
    throw Exception('Not Found');
  }
}
