import 'package:untitled/weather_abstract.dart';

enum WeatherStateEnum { notUpdated, updating, ready }

class WeatherState {
  late String WeatherImageUrl;
  WeatherStateEnum? EState;
  late Weather CurrentWeather;

  WeatherState._();

  factory WeatherState.initial() {
    final Instance = new WeatherState._();
    Instance.EState = WeatherStateEnum.notUpdated;
    Instance.WeatherImageUrl = '';
    return Instance;
  }

  factory WeatherState.partial(WeatherStateEnum state) {
    final Instance = new WeatherState._();
    Instance.EState = state;
    Instance.WeatherImageUrl = '';
    return Instance;
  }

  factory WeatherState.stated(WeatherStateEnum state, String url, Weather w) {
    final Instance = new WeatherState._();
    Instance.EState = state;
    Instance.WeatherImageUrl = url;
    Instance.CurrentWeather = w;
    return Instance;
  }
}
