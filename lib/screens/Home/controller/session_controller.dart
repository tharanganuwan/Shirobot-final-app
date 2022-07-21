import 'package:flutter/widgets.dart';
import 'package:shiro_bot/constants/string_constant.dart';

class SessionController extends ChangeNotifier {
  ///
  ///
  ///
  ///
  /// Welcome Page
  ///
  ///
  ///
  ///

  String _duration = "30 Mins";
  String get duration => _duration;
  set duration(String value) {
    _duration = value;
    notifyListeners();
  }

  String _temperatureType = StringConstant.cold;
  String get temperatureType => _temperatureType;
  set temperatureType(String value) {
    _temperatureType = value;
    notifyListeners();
  }

  int _temperatureRange = 35;
  int get temperatureRange => _temperatureRange;
  set temperatureRange(int value) {
    _temperatureRange = value;
    notifyListeners();
  }

  String _oscillationMachanism = "No";
  String get oscillationMachanism => _oscillationMachanism;
  set oscillationMachanism(String value) {
    _oscillationMachanism = value;
    notifyListeners();
  }
}
