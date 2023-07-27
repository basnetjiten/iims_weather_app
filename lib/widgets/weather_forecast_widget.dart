import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/models/weather_forecast_model.dart';

class WeatherForecastWidget extends StatelessWidget {
  const WeatherForecastWidget({super.key, required this.weatherForecastModel});

  final WeatherForecastModel weatherForecastModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.maxFinite,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount:
              weatherForecastModel.forecast.forecastday.first.hour.length,
          itemBuilder: (context, index) {
            final hour =
                weatherForecastModel.forecast.forecastday.first.hour[index];

            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Card(
                    color: Colors.grey.shade100,
                    child: Center(
                      child: SizedBox(
                        height: 100,
                        width: 200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('${hour.feelslikeC}°C'),
                            Image.network(
                              'https:${hour.condition.icon}',
                              height: 55,
                              width: 55,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Text(formatDateString(hour.time)),
                ],
              ),
            );
          }),
    );
  }

  String formatDateString(String dateTimeString) {
    final format = DateFormat('EEEE, MMMM d, y hh:mm a');
    final dateTime = DateTime.parse(dateTimeString);
    return format.format(dateTime);
  }
}
