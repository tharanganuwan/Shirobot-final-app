import 'package:flutter/cupertino.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:shiro_bot/config/app_route_config.dart';

class HomeController extends ChangeNotifier {
  bool _isblutoothOn = true;
  bool get isblutoothOn => _isblutoothOn;

  String _hotCool = "cold";
  String get hotCool => _hotCool;

  String _duration = "30";
  String get duration => _duration;

  Future<void> chechBlutoothOn(BuildContext context) async {
    AppRouteConfig.pushAndRemoveUntil(
        context,
        StreamBuilder<BluetoothState>(
            stream: FlutterBlue.instance.state,
            initialData: BluetoothState.unknown,
            builder: (c, snapshot) {
              final state = snapshot.data;
              if (state == BluetoothState.on) {
                _isblutoothOn = true;
              } else {
                _isblutoothOn = false;
              }
              return SizedBox();
            }));
  }

  void sethotCool(String value) {
    _hotCool = value;
  }

  void setDuration(String value) {
    _duration = value;
  }

  late int second;
  int selectHotCold() {
    String n1 = _hotCool;

    if (n1 == "Cold") {
      second = 30;
    } else {
      second = 10;
    }
    return second;
  }

  late int due;
  int selectDuration() {
    String d = _duration;
    if (d == "30 Mins") {
      due = 30;
    } else {
      due = 60;
    }
    return due;
  }
}
