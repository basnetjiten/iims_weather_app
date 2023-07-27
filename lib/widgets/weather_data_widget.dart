import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherDataWidget extends StatelessWidget {
  const WeatherDataWidget({super.key, required this.weatherModel});

  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "${weatherModel.location.name},${weatherModel.location.country}",
          style: const TextStyle(fontSize: 55),
        ),
        Text(
          "${weatherModel.location.name},${weatherModel.location.localtime}",
          style: const TextStyle(fontSize: 25),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${weatherModel.current.feelslikeC} °C",
              style: const TextStyle(fontSize: 55),
            ),
            const SizedBox(
              width: 10,
            ),
            Image.network(
              'https:${weatherModel.current.condition.icon}',
              height: 55,
              width: 55,
            )
          ],
        ),


      ],
    );
  }
}
