import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:untitled/weather_abstract.dart';

const pexelsUrlPrefix = 'https://api.pexels.com/v1';
const pexelsApiKey = '563492ad6f9170000100000138d0fce6f7fe4481933dfa07c9487248';

const owmUrlPrefix = 'http://api.openweathermap.org/data/2.5';
const owmApiKey = '962e708441eccf3e90ee697f83205fcd';

const getlocUrlPrefix = 'https://ipinfo.io';
const getlocApiKey = '93e2935910b2d4';

Future<String> makePexelsGetRequest(String weatherTag) async {
  final url = Uri.parse(
      '$pexelsUrlPrefix/search?query=$weatherTag&per_page=1&size=small');
  final headers = {
    HttpHeaders.authorizationHeader: pexelsApiKey,
  };

  final response = await get(url, headers: headers);
  Map<String, dynamic> parsed = jsonDecode(response.body);
  return parsed["photos"][0]["src"]["large2x"].toString();
}

Future<Weather> makeOwmGetRequest() async {
  DateTime now = DateTime.now();
  final loc_url = Uri.parse('$getlocUrlPrefix?token=$getlocApiKey');
  final loc_response = await get(loc_url);
  print('[loc] Status code: ${loc_response.statusCode}');
  Map<String, dynamic> loc_parsed = jsonDecode(loc_response.body);
  String location = '${loc_parsed['city']}, ${loc_parsed['country']}';
  print('[loc] Location: $location');

  final url = Uri.parse(
      '$owmUrlPrefix/weather?q=${loc_parsed['city']}&appid=$owmApiKey');
  final response = await get(url);
  print('[owm] Status code: ${response.statusCode}');
  //print('[owm] Body: ${response.body}');
  Map<String, dynamic> parsed = jsonDecode(response.body);

  final w = Weather.fromJson(parsed);
  w.location = location;

  String formattedDate = DateFormat('kk:mm - EEEE, dd MMMM').format(now);
  w.datetime = formattedDate;
  print('[owm] Weather: ${w.description}');
  return w;
}
