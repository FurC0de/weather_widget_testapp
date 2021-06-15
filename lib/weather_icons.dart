const Map<int, String> DayWeatherIconsMap = {
  800: 'clear', // clear sky
  801: 'partlycloudy', // few clouds: 11-25%
  802: 'mostlysunny', // scattered clouds: 25-50%
  803: 'mostlycloudy', // broken clouds: 51-84%
  804: 'cloudy', // overcast clouds: 85-100%

  701: 'fog', // mist
  711: 'fog', // Smoke
  721: 'haze', // Haze
  731: 'haze', // sand/ dust whirls
  741: 'fog', // fog
  751: 'haze', // sand
  761: 'haze', // dust
  762: 'haze', // volcanic ash
  771: 'haze', // squalls
  781: 'haze', // tornado

  600: 'chancesnow', // light snow
  601: 'snow', // Snow
  602: 'snow', // Heavy snow
  611: 'chancesleet', // Sleet
  612: 'sleet', // Light shower sleet
  613: 'sleet', // Shower sleet
  615: 'chancesleet', // Light rain and snow
  616: 'sleet', // Rain and snow
  620: 'chanceflurries', // Light shower snow
  621: 'flurries', // Shower snow
  622: 'flurries', // Heavy shower snow

  500: 'chancerain', // light rain
  501: 'chancerain', // moderate rain
  502: 'rain', // heavy intensity rain
  503: 'rain', // very heavy rain
  504: 'rain', // extreme rain
  511: 'snow', // freezing rain
  520: 'chancerain', // light intensity shower rain
  521: 'rain', // shower rain
  522: 'rain', // heavy intensity shower rain
  531: 'rain', // ragged shower rain

  300: 'chancerain', // light intensity drizzle
  301: 'rain', // drizzle
  302: 'rain', // heavy intensity drizzle
  310: 'chancerain', // light intensity drizzle rain
  311: 'rain', // drizzle rain
  312: 'rain', // heavy intensity drizzle rain
  313: 'rain', // shower rain and drizzle
  314: 'rain', // heavy shower rain and drizzle
  321: 'rain', // shower drizzle

  200: 'tstorms', // thunderstorm with light rain
  201: 'tstorms', // thunderstorm with rain
  202: 'tstorms', // thunderstorm with heavy rain
  210: 'chancetstorms', // light thunderstorm
  211: 'chancetstorms', // thunderstorm
  212: 'chancetstorms', // heavy thunderstorm
  221: 'chancetstorms', // ragged thunderstorm
  230: 'tstorms', // thunderstorm with light drizzle
  231: 'tstorms', // thunderstorm with drizzle
  232: 'tstorms', // thunderstorm with heavy drizzle

  000: 'unknown' // unknown
};

String dayOrNightIcon() {
  var timeNow = DateTime.now().hour;
  if ((timeNow < 6) || (timeNow > 21)) {
    return 'nt_';
  } else {
    return '';
  }
}

String getDayIcon(int id) {
  if (DayWeatherIconsMap.containsKey(id)) {
    return dayOrNightIcon() + checkIconForNull(DayWeatherIconsMap[id]);
  } else {
    return 'unknown';
  }
}

String checkIconForNull(String? str) {
  if (str == null) {
    return 'unknown';
  } else {
    return str;
  }
}
