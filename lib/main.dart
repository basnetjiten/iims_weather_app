import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';
import 'package:weather_app/widgets/weather_data_widget.dart';
import 'package:weather_app/widgets/weather_forecast_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late TextEditingController _userInputTextEditingController;
  Future<WeatherModel>_fetchData(){
    return WeatherService.fetchWeatherData(
        userQuery: _userInputTextEditingController.text);
  }
  @override
  void initState() {
    super.initState();
    _userInputTextEditingController = TextEditingController();


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: TextFormField(
          controller: _userInputTextEditingController,
          onFieldSubmitted: (data) {
            setState(() {
              _fetchData();
            });
          },
        ),
      ),
      body: Center(
        child: Column(
          children: [
            FutureBuilder(
              future:_fetchData() ,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return WeatherDataWidget(
                    weatherModel: snapshot.data!,
                  );
                } else {
                  return const Text('No Data');
                }
              },
            ),
            FutureBuilder(
              future: WeatherService.fetchForecastWeatherData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 200,
                        width: double.maxFinite,
                        child: WeatherForecastWidget(
                          weatherForecastModel: snapshot.data!,
                        ),
                      ),
                    ],
                  );
                } else {
                  return const Text('No Data');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
