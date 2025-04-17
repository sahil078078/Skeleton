// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class ConnectivityService {
  //!InternetConnectivityWorkout
  static final _connectivity = Connectivity();
  static final StreamController<bool> _connectionSteamController = StreamController<bool>.broadcast();
  static Stream<bool> get connectionStream => _connectionSteamController.stream;

  static Future<void> checkConnectivityStream() async {
    debugPrint('IIIII');
    // List<ConnectivityResult> connectivityResult = await _connectivity.checkConnectivity();
    final connectionStream = _connectivity.onConnectivityChanged;
    connectionStream.listen(
      (List<ConnectivityResult> connections) async {
        // final hasConnectionProvider = connections.every((element) => element != ConnectivityResult.none);
        // final noInternet = connections.any((connection) => connection == ConnectivityResult.none);
        final haveInternet = connections.any((e) {
          return [
            ConnectivityResult.ethernet,
            ConnectivityResult.mobile,
            ConnectivityResult.wifi,
            ConnectivityResult.bluetooth,
          ].contains(e);
        });
        debugPrint('haveInternet : $haveInternet');
        if (haveInternet) {
          final result = await InternetAddress.lookup('google.com');
          debugPrint('interNetConnectionResult : ${result.toString()}');
          if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
            _connectionSteamController.sink.add(true);
            debugPrint('emit1 : true');
          } else {
            _connectionSteamController.sink.add(false);
            debugPrint('emit2 : false');
          }
        } else {
          _connectionSteamController.sink.add(false);
          debugPrint('emit3 : false');
        }
      },
      onDone: () => debugPrint('connectivityService : onDoneCalled'),
      onError: (error) {
        debugPrint('connectivityServiceOnError : $error');
        _connectionSteamController.sink.add(false);
        debugPrint('emit4 : false');
      },
      cancelOnError: true,
    );
  }

  static Future<bool> checkInternet() async {
    try {
      final connection = await _connectivity.checkConnectivity();
      connection.forEach((element) => debugPrint("connection : ${element.name}"));

      final hasConnect = !connection.contains(ConnectivityResult.none);

      debugPrint('HAS-CONNECT : $hasConnect');

      if (hasConnect) {
        final result = await InternetAddress.lookup('google.com');
        debugPrint('interNetConnectionResult : ${result.toString()}');
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
