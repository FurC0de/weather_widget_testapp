class Weather {
  int id;

  String main;
  String description;

  double K_temp;
  double K_tempFeels;

  int temp = 0;
  int tempFeels = 0;

  int pressure;

  int humidity;

  double windSpeed;
  int windDirection;

  String location = '';
  String datetime = '';

  Weather(this.id, this.main, this.description, this.K_temp, this.K_tempFeels,
      this.pressure, this.humidity, this.windSpeed, this.windDirection) {
    this.temp = (K_temp - 273.15).round();
    this.tempFeels = (K_tempFeels - 273.15).round();
  }

  Weather.fromJson(Map<String, dynamic> json)
      : id = json['weather'][0]['id'],
        main = json['weather'][0]['main'],
        description = json['weather'][0]['description'],
        K_temp = json['main']['temp'],
        K_tempFeels = json['main']['feels_like'],
        pressure = json['main']['pressure'],
        humidity = json['main']['humidity'],
        windSpeed = json['wind']['speed'],
        windDirection = json['wind']['deg'] {
    this.temp = (K_temp - 273.15).round();
    this.tempFeels = (K_tempFeels - 273.15).round();
  }

  factory Weather.initial() {
    final Instance = new Weather(000, '', '', 0, 0, 0, 0, 0, 0);
    return Instance;
  }
}
