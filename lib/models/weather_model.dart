import 'package:weather_app/models/current.dart';
import 'package:weather_app/models/location.dart';

class WeatherModel {
  //Class properties or variables
  Location location;
  Current current;

  // Default Constructor that initializes the properties
  WeatherModel({
    required this.location,
    required this.current,
  });

  /// Named Factory constructor
  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        location: Location.fromJson(json["location"]),
        current: Current.fromJson(json["current"]),
      );


  ///Converts to json data
  Map<String, dynamic> toJson() => {
        "location": location.toJson(),
        "current": current.toJson(),
      };
}


