import 'package:flutter_weather_api/core/enums.dart';

class Config {
  static Flavor appFlavor = Flavor.development;

  static String get baseUrl {
    switch (appFlavor) {
      case Flavor.development:
        return 'https://api.weatherapi.com/v1/';
      case Flavor.production:
        return 'https://api.weatherapi.com/v1/';
    }
  }

  static bool get banner {
    switch (appFlavor) {
      case Flavor.development:
        return true;
      case Flavor.production:
        return false;
    }
  }
}
