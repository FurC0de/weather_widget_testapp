import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/weather_bloc.dart';
import 'package:untitled/weather_descriptions.dart';

class WeatherDescriptionWidget extends StatefulWidget {
  const WeatherDescriptionWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => WeatherDescriptionWidgetState();
}

class WeatherDescriptionWidgetState extends State<WeatherDescriptionWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      value: 0.0,
      duration: const Duration(milliseconds: 150),
      reverseDuration: const Duration(milliseconds: 75),
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget? child) {
        return FadeScaleTransition(
            animation: _controller,
            child: Visibility(
              visible: _controller.value > 0,
              child: _WeatherDescriptionWidgetDialog(onExit: () {
                _controller.animateTo(0.0);
              }),
            ));
      },
    );
  }

  void show() {
    _controller.animateTo(1.0);
  }
}

class _WeatherDescriptionWidgetDialog extends StatelessWidget {
  const _WeatherDescriptionWidgetDialog({required VoidCallback this.onExit});
  final VoidCallback onExit;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: <Widget>[
          ConstrainedBox(
            constraints: new BoxConstraints(
              minHeight: 5.0,
              minWidth: 5.0,
              maxHeight: 600.0,
              maxWidth: 600.0,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(32),
              child: BackdropFilter(
                filter: new ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  width: 500,
                  height: 500,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(120, 50, 50, 50),
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Current temperature is ${BlocProvider.of<WeatherBloc>(context).state.CurrentWeather.temp}°',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Raleway',
                            color: Colors.white,
                            fontSize: 34),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        'Feels like ${BlocProvider.of<WeatherBloc>(context).state.CurrentWeather.tempFeels}°',
                        style: TextStyle(
                            fontFamily: 'Raleway',
                            color: Colors.white54,
                            fontSize: 20),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 40),
                      Text(
                        'Conditions:',
                        style: TextStyle(
                            fontFamily: 'Raleway',
                            color: Colors.white54,
                            fontSize: 16),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        '${getDescription(BlocProvider.of<WeatherBloc>(context).state.CurrentWeather.id)}',
                        style: TextStyle(
                            fontFamily: 'Raleway',
                            color: Colors.white,
                            fontSize: 28),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Text(
                                'Wind',
                                style: TextStyle(
                                    fontFamily: 'Raleway',
                                    color: Colors.white.withAlpha(180),
                                    fontSize: 14),
                              ),
                              Image.asset(
                                'assets/wind_icon_small.png',
                              ),
                              Text(
                                '${BlocProvider.of<WeatherBloc>(context).state.CurrentWeather.windSpeed.round()} m/s',
                                style: TextStyle(
                                    fontFamily: 'Raleway',
                                    color: Colors.white,
                                    fontSize: 16),
                              ),
                            ],
                          ),
                          SizedBox(width: 50),
                          Column(
                            children: [
                              Text(
                                'Humidity',
                                style: TextStyle(
                                    fontFamily: 'Raleway',
                                    color: Colors.white.withAlpha(180),
                                    fontSize: 14),
                              ),
                              Image.asset(
                                'assets/humidity_icon_small.png',
                              ),
                              Text(
                                '${BlocProvider.of<WeatherBloc>(context).state.CurrentWeather.humidity} %',
                                style: TextStyle(
                                    fontFamily: 'Raleway',
                                    color: Colors.white,
                                    fontSize: 16),
                              ),
                            ],
                          ),
                          SizedBox(width: 50),
                          Column(
                            children: [
                              Text(
                                'Pressure',
                                style: TextStyle(
                                    fontFamily: 'Raleway',
                                    color: Colors.white.withAlpha(180),
                                    fontSize: 14),
                              ),
                              Image.asset(
                                'assets/pressure_icon_small.png',
                              ),
                              Text(
                                '${BlocProvider.of<WeatherBloc>(context).state.CurrentWeather.windSpeed.round()} hPa',
                                style: TextStyle(
                                    fontFamily: 'Raleway',
                                    color: Colors.white,
                                    fontSize: 16),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            right: 0.0,
            child: GestureDetector(
              onTap: () {
                onExit();
              },
              child: Align(
                alignment: Alignment.topRight,
                child: CircleAvatar(
                  radius: 14.0,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.close, color: Colors.red),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/*
class _WeatherDescriptionWidgetState extends State<WeatherDescriptionWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.black45, Colors.black26]),
          color: Colors.black54.withAlpha(40),
          borderRadius: BorderRadius.circular(32)),
    );
  }
}
*/
