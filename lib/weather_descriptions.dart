const Map<int, String> WeatherDescriptionMap = {
  800: 'Clear sky', // clear sky
  801: 'Few clouds', // few clouds: 11-25%
  802: 'Scattered clouds', // scattered clouds: 25-50%
  803: 'Broken clouds', // broken clouds: 51-84%
  804: 'Overcast clouds', // overcast clouds: 85-100%

  701: 'Mist', // mist
  711: 'Smoke', // Smoke
  721: 'Haze', // Haze
  731: 'Sand whirls', // sand/ dust whirls
  741: 'Fog', // fog
  751: 'Sand', // sand
  761: 'Dust', // dust
  762: 'Volcanic ash', // volcanic ash
  771: 'Squalls', // squalls
  781: 'Tornado', // tornado

  600: 'Light snow', // light snow
  601: 'Snow', // Snow
  602: 'Heavy snow', // Heavy snow
  611: 'Sleet', // Sleet
  612: 'Light shower sleet', // Light shower sleet
  613: 'Shower sleet', // Shower sleet
  615: 'Light rain and snow', // Light rain and snow
  616: 'Rain and snow', // Rain and snow
  620: 'Light shower snow', // Light shower snow
  621: 'Shower snow', // Shower snow
  622: 'Heavy shower snow', // Heavy shower snow

  500: 'Light rain', // light rain
  501: 'Moderate rain', // moderate rain
  502: 'Heavy rain', // heavy intensity rain
  503: 'Very heavy rain', // very heavy rain
  504: 'Extreme rain', // extreme rain
  511: 'Freezing rain', // freezing rain
  520: 'Light shower rain', // light intensity shower rain
  521: 'Shower rain', // shower rain
  522: 'Heavy shower rain', // heavy intensity shower rain
  531: 'Ragged shower rain', // ragged shower rain

  300: 'Light drizzle', // light intensity drizzle
  301: 'Drizzle', // drizzle
  302: 'Heavy drizzle', // heavy intensity drizzle
  310: 'Light drizzle rain', // light intensity drizzle rain
  311: 'Drizzle rain', // drizzle rain
  312: 'Heavy drizzle rain', // heavy intensity drizzle rain
  313: 'Shower rain and drizzle', // shower rain and drizzle
  314: 'Heavy shower rain and drizzle', // heavy shower rain and drizzle
  321: 'Shower drizzle', // shower drizzle

  200: 'Thunderstorm with light rain', // thunderstorm with light rain
  201: 'Thunderstorm with rain', // thunderstorm with rain
  202: 'Thunderstorm with heavy rain', // thunderstorm with heavy rain
  210: 'Light thunderstorm', // light thunderstorm
  211: 'Thunderstorm', // thunderstorm
  212: 'Heavy thunderstorm', // heavy thunderstorm
  221: 'Ragged thunderstorm', // ragged thunderstorm
  230: 'Thunderstorm with light drizzle', // thunderstorm with light drizzle
  231: 'Thunderstorm with drizzle', // thunderstorm with drizzle
  232: 'Thunderstorm with heavy drizzle', // thunderstorm with heavy drizzle

  000: 'No description' // unknown
};

String getDescription(int id) {
  if (WeatherDescriptionMap.containsKey(id)) {
    return checkDescriptionForNull(WeatherDescriptionMap[id]);
  } else {
    return 'No description';
  }
}

String checkDescriptionForNull(String? str) {
  if (str == null) {
    return 'No description';
  } else {
    return str;
  }
}
