import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class BluetoothController extends ChangeNotifier {
  BluetoothState bluetoothState = BluetoothState.UNKNOWN;
  FlutterBluetoothSerial _bluetooth = FlutterBluetoothSerial.instance;
  BluetoothConnection connection;
  int deviceState;
  bool isDisconnecting = false;
  bool get isConnected => connection != null && connection.isConnected;
  List<BluetoothDevice> devicesList = [];
  BluetoothDevice device;
  bool connected = false;
  bool isButtonUnavailable = false;

  BluetoothService() {}

  void changeDevice(BluetoothDevice device) {
    this.device = device;
    notifyListeners();
  }

  BluetoothDevice getDevice() {
    return this.device;
  }

  void disposeBluetooth() {
    // Avoid memory leak and disconnect
    if (isConnected) {
      isDisconnecting = true;
      connection.dispose();
      connection = null;
    }
  }

  void initBluetooth() {
    FlutterBluetoothSerial.instance.state.then((state) {
      bluetoothState = state;
    });

    deviceState = 0; // neutral

    enableBluetooth();

    FlutterBluetoothSerial.instance
        .onStateChanged()
        .listen((BluetoothState state) {
      bluetoothState = state;
      if (bluetoothState == BluetoothState.STATE_OFF) {
        isButtonUnavailable = true;
      }
      getPairedDevices();
    });
  }

  Future<void> enableBluetooth() async {
    bluetoothState = BluetoothState.fromUnderlyingValue(
        await (FlutterBluetoothSerial.instance.state as FutureOr<int>));

    if (bluetoothState == BluetoothState.STATE_OFF) {
      await FlutterBluetoothSerial.instance.requestEnable();
      await getPairedDevices();
      return true;
    } else {
      await getPairedDevices();
    }
    return false;
  }

  Future<void> getPairedDevices() async {
    List<BluetoothDevice> devices = [];

    try {
      devices = await _bluetooth.getBondedDevices();
    } on PlatformException {
      print("Error");
    }
    devicesList = devices;
  }

  void connect() async {
    isButtonUnavailable = true;
    if (device == null) {
    } else {
      if (!isConnected) {
        await BluetoothConnection.toAddress(device.address).then((_connection) {
          print('Connected to the device');
          connection = _connection;
          connected = true;

          connection.input.listen(null).onDone(() {
            if (isDisconnecting) {
              print('Disconnecting locally!');
            } else {
              print('Disconnected remotely!');
            }
          });
        }).catchError((error) {
          print('Cannot connect, exception occurred');
          print(error);
        });
        isButtonUnavailable = false;
      }
    }
  }

  void disconnect() async {
    isButtonUnavailable = true;
    deviceState = 0;

    await connection.close();

    if (!connection.isConnected) {
      connected = false;
      isButtonUnavailable = false;
    }
  }

  void sendOnMessageToBluetooth([String value = '']) async {
    connection.output.add(ascii.encode(value));
    await connection.output.allSent;
  }

  void sendOffMessageToBluetooth([String value = '']) async {
    connection.output.add(ascii.encode(value));
    await connection.output.allSent;
  }
}
