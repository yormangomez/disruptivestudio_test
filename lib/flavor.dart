import 'package:flutter_dotenv/flutter_dotenv.dart';

enum FlavorType {
  dev,
  stg,
  prd,
}

class Flavor {
  Flavor._internal();
  static final Flavor _instance = Flavor._internal();
  static Flavor get instance => _instance;

  FlavorType _flavor = FlavorType.dev;
  set setFlavor(FlavorType flavor) => _flavor = flavor;
  FlavorType get value => _flavor;
  bool _isPhysicalDevice = true;
  set setPhysicalDevice(bool value) => _isPhysicalDevice = value;

  bool get isPhysicalDevice {
    switch (value) {
      case FlavorType.dev:
        return _isPhysicalDevice;
      case FlavorType.stg:
        return true;
      case FlavorType.prd:
        return true;
      default:
        return true;
    }
  }

  String get api {
    switch (_flavor) {
      case FlavorType.dev:
        return '';
      case FlavorType.prd:
        return '';
      case FlavorType.stg:
        return '';
    }
  }

  String get dynamicLink {
    switch (_flavor) {
      case FlavorType.dev:
        return '';
      case FlavorType.prd:
        return '';
      case FlavorType.stg:
        return '';
    }
  }

  String get baseUrl {
    return dotenv.get("BASE_URL");
  }

  bool get showChuck {
    switch (_flavor) {
      case FlavorType.dev:
        return true;
      case FlavorType.prd:
        return false;
      case FlavorType.stg:
        return true;
    }
  }
}
