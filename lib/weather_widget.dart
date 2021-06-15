import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/weather_bloc.dart';
import 'package:untitled/background_widget.dart';
import 'package:untitled/weather_icons.dart';
import 'package:untitled/wetherdesc_widget.dart';

import 'fadin_widget.dart';

final ColorGradient = new List<Color>.from([Colors.black, Colors.white]);

class WeatherWidget extends StatefulWidget {
  const WeatherWidget({Key? key}) : super(key: key);

  @override
  _WeatherWidgetState createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget> {
  GlobalKey<WeatherDescriptionWidgetState> _myKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        FadeIn(
          duration: Duration(seconds: 3),
          child: FittedImageWidget(),
        ),
        FadeIn(
          duration: Duration(seconds: 3),
          child: BackdropFilter(
            filter: new ImageFilter.blur(sigmaX: 0.1, sigmaY: 0.1),
            child: new Container(
              decoration:
                  new BoxDecoration(color: Colors.black54.withOpacity(0.25)),
            ),
          ),
        ),
        FadeIn(
          duration: Duration(seconds: 1),
          child: Center(
            child: Container(
              width: 600,
              padding: EdgeInsets.all(30),
              alignment: Alignment.centerLeft,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(32),
                child: BackdropFilter(
                  filter: new ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.all(30),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.black45, Colors.black26]),
                        color: Colors.black54.withAlpha(40),
                        borderRadius: BorderRadius.circular(32)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //SizedBox(height: 100),
                        Text(
                          '${BlocProvider.of<WeatherBloc>(context).state.CurrentWeather.location}',
                          style: TextStyle(
                              fontFamily: 'Raleway',
                              color: Colors.white,
                              fontSize: 42),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          '${BlocProvider.of<WeatherBloc>(context).state.CurrentWeather.datetime}',
                          style: TextStyle(
                              fontFamily: 'Raleway',
                              color: Colors.white,
                              fontSize: 18),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: 100),
                        Text(
                          '${BlocProvider.of<WeatherBloc>(context).state.CurrentWeather.temp}°',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Raleway',
                              color: Colors.white,
                              fontSize: 120),
                          textAlign: TextAlign.left,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'weather_icons/${getDayIcon(BlocProvider.of<WeatherBloc>(context).state.CurrentWeather.id)}.png',
                              scale: 2,
                            ),
                            Text(
                              '${BlocProvider.of<WeatherBloc>(context).state.CurrentWeather.main}',
                              style: TextStyle(
                                  fontFamily: 'Raleway',
                                  color: Colors.white,
                                  fontSize: 36),
                              textAlign: TextAlign.left,
                            ),
                            IconButton(
                              onPressed: () => {
                                _myKey.currentState?.show(),
                              },
                              icon: Image.asset(
                                'assets/description_button.png',
                                width: 20,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        WeatherDescriptionWidget(
          key: _myKey,
        )
      ],
    );
  }
}
