import 'package:bloc/bloc.dart';
import 'package:untitled/weather_abstract.dart';
import 'package:untitled/weather_event.dart';
import 'package:untitled/weather_state.dart';
import 'package:untitled/weather_tags.dart';
import 'httpop.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherState.initial());

  void OnUpdate() {
    add(UpdateEvent());
  }

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is UpdateEvent) {
      yield WeatherState.partial(WeatherStateEnum.updating);
      print('[Waiting] UpdateEvent');
      await Future.delayed(Duration(milliseconds: 500));
      Weather CurrentWeather = await makeOwmGetRequest();
      print(getDayImage(CurrentWeather.id));
      String Url = await makePexelsGetRequest(getDayImage(CurrentWeather.id));
      yield WeatherState.stated(WeatherStateEnum.ready, Url, CurrentWeather);
      print('Received: ${state.WeatherImageUrl}');
    }
  }
}
