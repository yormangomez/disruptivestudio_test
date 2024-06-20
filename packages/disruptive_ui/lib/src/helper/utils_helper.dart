// ignore_for_file: deprecated_member_use

import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum LocationFormats { es, en }

enum UserType { admin, collaborator, owner }

class AppUtils {
  AppUtils._internal();
  static final AppUtils _instance = AppUtils._internal();
  static AppUtils get instance => _instance;

  String addDotsToNumber(int number) {
    String numberString = number.toString();
    String result = '';
    int count = 0;

    for (int i = numberString.length - 1; i >= 0; i--) {
      result = numberString[i] + result;
      count++;

      if (count % 3 == 0 && i != 0) {
        result = '.$result';
      }
    }

    return result;
  }

  static formatPrice(double price) => '\$ ${price.toStringAsFixed(2)}';
  static formatDate(DateTime date) => DateFormat.yMd().format(date);

  String generateLocation(LocationFormats locationFormat) {
    switch (locationFormat) {
      case LocationFormats.es:
        return "es";
      case LocationFormats.en:
        return "en";
    }
  }

  double stringToDouble(String number) {
    double newDouble = 0.0;
    String newNumber = number;
    try {
      if (number.contains(',')) {
        newNumber = number.replaceAll(',', '.');
      }
      newDouble = double.parse(newNumber);
      return newDouble;
    } catch (_) {
      return 0;
    }
  }

  /// convert String to String with 2 decimals and currency
  String stringToStringCurrency(String number) {
    return '\$ ${stringToDouble(number).toStringAsFixed(2)}';
  }

  String parseNumberFormat(String number) {
    String numberFormat =
        number.replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), ',');
    return numberFormat;
  }

  String uuidToShortString(String uuid) {
    var paramUuid = uuid.split("-");
    return paramUuid[0];
  }

  void closeKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  double jsonToDouble(dynamic value) {
    if (value != null) {
      if (value is String) {
        return double.parse(value);
      } else if (value is int) {
        return 0.0 + value;
      } else {
        return value;
      }
    } else {
      return 0.0;
    }
  }

  getDataDecode(Uint8List bodyBytes) {
    return json.decode(utf8.decode(bodyBytes));
  }

  String monthToString(DateTime dateTime) {
    String monthName = DateFormat('MMMM', 'es_ES').format(dateTime);
    String data = "${monthName.capitalize()} ${dateTime.year}";
    return data;
  }

  // Future<void> isPhysicalDevice() async {
  //   bool isPhysicalD = true;
  //   var deviceData = <String, dynamic>{};
  //   final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  //   Map<String, dynamic> readAndroidBuildData(AndroidDeviceInfo build) {
  //     return <String, dynamic>{
  //       'isPhysicalDevice': build.isPhysicalDevice,
  //     };
  //   }

  //   Map<String, dynamic> readIosDeviceInfo(IosDeviceInfo data) {
  //     return <String, dynamic>{
  //       'isPhysicalDevice': data.isPhysicalDevice,
  //     };
  //   }

  //   if (Platform.isAndroid) {
  //     deviceData = readAndroidBuildData(await deviceInfoPlugin.androidInfo);
  //   } else if (Platform.isIOS) {
  //     deviceData = readIosDeviceInfo(await deviceInfoPlugin.iosInfo);
  //   }
  //   isPhysicalD = deviceData['isPhysicalDevice'] ?? true;
  //   Flavor.instance.setPhysicalDevice = isPhysicalD;
  // }

  /*getPercentageProfileFromUser(User user) {
    if (user.firstName.isNotEmpty &&
        user.lastName.isNotEmpty &&
        user.mobile.isNotEmpty & user.email.isNotEmpty) {
      return 100.00;
    } else if (user.firstName.isNotEmpty &&
        user.lastName.isNotEmpty &&
        user.mobile.isNotEmpty) {
      return 75.00;
    } else if (user.firstName.isNotEmpty && user.lastName.isNotEmpty) {
      return 35.00;
    } else if (user.firstName.isNotEmpty) {
      return 15.00;
    } else {
      return 0.00;
    }
  }*/

  double priceToShowRegister(
      {required double lastSalePrice, required double averageSalePrice}) {
    if (lastSalePrice != 0) {
      return lastSalePrice;
    } else if (averageSalePrice != 0) {
      return averageSalePrice;
    } else {
      return 0;
    }
  }
}

extension StringCasingExtensions on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
