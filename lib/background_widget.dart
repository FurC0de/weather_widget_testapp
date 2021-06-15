import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:octo_image/octo_image.dart';
import 'package:untitled/weather_bloc.dart';

class BackgroundWidget extends StatefulWidget {
  const BackgroundWidget({Key? key}) : super(key: key);

  @override
  _BackgroundWidgetState createState() => _BackgroundWidgetState();
}

class _BackgroundWidgetState extends State<BackgroundWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: CachedNetworkImageProvider(
              BlocProvider.of<WeatherBloc>(context).state.WeatherImageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: null /* add child content here */,
    );
  }
}

class FittedImageWidget extends StatefulWidget {
  const FittedImageWidget({Key? key}) : super(key: key);

  @override
  _FittedImageWidgetState createState() => _FittedImageWidgetState();
}

class _FittedImageWidgetState extends State<FittedImageWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: OctoImage(
        image: CachedNetworkImageProvider(
            BlocProvider.of<WeatherBloc>(context).state.WeatherImageUrl),
        errorBuilder: OctoError.icon(color: Colors.red),
        fadeInDuration: Duration(seconds: 1),
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
      ),
    );
  }
}
