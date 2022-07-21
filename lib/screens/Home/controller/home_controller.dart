import 'package:flutter/cupertino.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:shiro_bot/config/app_route_config.dart';

class HomeController extends ChangeNotifier {
  bool _isblutoothOn = true;
  bool get isblutoothOn => _isblutoothOn;

  String _hotCool = "cold";
  String get hotCool => _hotCool;

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
}
