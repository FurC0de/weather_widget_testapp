const Map<int, String> DayWeatherImageMap = {
  800: 'clear sky nature morning atmosphere', // clear sky
  801: 'cloudy clear sky atmosphere', // few clouds: 11-25%
  802: 'scattered clouds sky atmosphere', // scattered clouds: 25-50%
  803: 'cloudy sky atmosphere', // broken clouds: 51-84%
  804: 'cloudy sky atmosphere', // overcast clouds: 85-100%

  701: 'mist', // mist
  711: 'smoke weather', // Smoke
  721: 'haze nature', // Haze
  731: 'sand storm', // sand/ dust whirls
  741: 'fog', // fog
  751: 'sand storm', // sand
  761: 'sand storm', // dust
  762: 'volcanic ash', // volcanic ash
  771: 'storm clouds', // squalls
  781: 'tornado', // tornado

  600: 'snowing', // light snow
  601: 'snowing', // Snow
  602: 'snowstorm', // Heavy snow
  611: 'sleet', // Sleet
  612: 'sleet', // Light shower sleet
  613: 'sleet', // Shower sleet
  615: 'snowing', // Light rain and snow
  616: 'snowing', // Rain and snow
  620: 'snowing', // Light shower snow
  621: 'snowstorm', // Shower snow
  622: 'snowstorm', // Heavy shower snow

  500: 'light raining dark', // light rain
  501: 'chancerain', // moderate rain
  502: 'heavy rain', // heavy intensity rain
  503: 'heavy rain', // very heavy rain
  504: 'storm rain', // extreme rain
  511: 'rain', // freezing rain
  520: 'heavy rain', // light intensity shower rain
  521: 'heavy rain', // shower rain
  522: 'heavy rain', // heavy intensity shower rain
  531: 'heavy rain', // ragged shower rain

  300: 'drizzle', // light intensity drizzle
  301: 'drizzle', // drizzle
  302: 'heavy rain', // heavy intensity drizzle
  310: 'heavy rain', // light intensity drizzle rain
  311: 'heavy rain', // drizzle rain
  312: 'heavy rain', // heavy intensity drizzle rain
  313: 'heavy rain', // shower rain and drizzle
  314: 'heavy rain', // heavy shower rain and drizzle
  321: 'heavy rain', // shower drizzle

  200: 'thunderstorm dark', // thunderstorm with light rain
  201: 'thunderstorm raining', // thunderstorm with rain
  202: 'thunderstorm raining', // thunderstorm with heavy rain
  210: 'thunderstorm', // light thunderstorm
  211: 'thunderstorm', // thunderstorm
  212: 'thunderstorm', // heavy thunderstorm
  221: 'ragged thunderstorm ', // ragged thunderstorm
  230: 'thunderstorm', // thunderstorm with light drizzle
  231: 'thunderstorm', // thunderstorm with drizzle
  232: 'thunderstorm', // thunderstorm with heavy drizzle

  000: 'unknown' // unknown
};

String dayOrNightTag() {
  var timeNow = DateTime.now().hour;
  if ((timeNow < 6) || (timeNow > 21)) {
    return ' night';
  } else {
    return '';
  }
}

String getDayImage(int id) {
  if (DayWeatherImageMap.containsKey(id)) {
    return checkImageForNull(DayWeatherImageMap[id]) + dayOrNightTag();
  } else {
    return 'unknown';
  }
}

String checkImageForNull(String? str) {
  if (str == null) {
    return 'unknown';
  } else {
    return str;
  }
}
