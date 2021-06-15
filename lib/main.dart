import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/weather_bloc.dart';
import 'package:untitled/weather_state.dart';
import 'package:untitled/weather_widget.dart';

String publicUrl = '';

//final _weatherBloc = WeatherBloc();

void main() {
  runApp(TestingApp_I());
}

class TestingApp_I extends StatelessWidget {
  const TestingApp_I({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WeatherBloc>(
      create: (BuildContext context) => WeatherBloc(),
      child: MaterialApp(
        title: 'Weather widget test app',
        theme: ThemeData.dark().copyWith(
          textTheme: TextTheme(
            bodyText1: TextStyle(
              fontFamily: 'Raleway',
              fontSize: 36,
              color: Colors.white70,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        home: HomeView(),
        routes: {
          '/second': (context) => SecondPage(),
        },
      ),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Testing App I',
          style: TextStyle(
            fontFamily: 'Raleway',
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Weather widget',
              style: TextStyle(
                fontFamily: 'Raleway',
                fontSize: 56,
                fontWeight: FontWeight.w600,
                color: Colors.white70,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text(
                'Open',
                style: TextStyle(
                  fontFamily: 'Raleway',
                  fontSize: 20,
                  color: Colors.white70,
                ),
              ),
              onPressed: () {
                //String bgUrl = makePexelsGetRequest('dark rain clouds');
                BlocProvider.of<WeatherBloc>(context).OnUpdate();
                Navigator.pushNamed(
                  context,
                  '/second',
                  //arguments: SecondPageArgs(weatherLiteral),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class LoadingWidgetA extends StatelessWidget {
  const LoadingWidgetA() : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("loading_type_a.gif"),
          fit: BoxFit.none,
        ),
      ),
    );
  }
}

class SecondPage extends StatefulWidget {
  SecondPage() : super();

  @override
  State<StatefulWidget> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    //final args = ModalRoute.of(context)!.settings.arguments as SecondPageArgs;
    return Scaffold(
      body: BlocBuilder<WeatherBloc, WeatherState>(
        bloc: BlocProvider.of<WeatherBloc>(context),
        builder: (context, WeatherState state) {
          return Stack(
            children: <Widget>[
              new LoadingWidgetA(),
              if (state.EState == WeatherStateEnum.ready) WeatherWidget(),
            ],
          );

          /*
          if (state.EState == WeatherStateEnum.ready) {
            return new FittedImageWidget();
          } else if (state.EState == WeatherStateEnum.notUpdated) {
            return new Text('Not updated');
          } else {
            return new LoadingWidgetA();
          }*/
        },
      ),
    );
  }
}
