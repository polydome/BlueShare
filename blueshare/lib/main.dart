import 'package:blueshare/connection_page.dart';
import 'package:blueshare/devices_page.dart';
import 'package:flutter/material.dart';

import 'bluetooth_device.dart';
import 'connection_status.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  final BluetoothDevice mockDevice = const BluetoothDevice(
      name: "Mi True Wireless EBs Basic 2", address: "53:1B:22:05:13:5B");

  final BluetoothDevice mockDeviceTwo = const BluetoothDevice(
      name: "Mi True Wireless EBs Basic 2",
      address: "53:1B:22:05:13:5B",
      isShared: true);

  final status = ConnectionStatus.connected;

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BlueShare',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Scaffold(
          body: ConnectionPage(
              status: status,
              device: mockDevice,
          ),
        ),
        '/devices': (context) => Scaffold(
          body: DevicesPage(
                status: status,
                device: mockDevice,
                devicesStream: Stream.value(List.of([
                  mockDevice,
                  mockDeviceTwo,
                  mockDevice,
                  mockDevice,
                  mockDevice,
                  mockDevice
                ])),
              ),
        )
      },
      theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xff334575),
          colorScheme: const ColorScheme.dark(
              background: Color(0xff334575),
              onBackground: Color.fromARGB(128, 0x45, 0x5d, 0x8b)),
          canvasColor: Color(0xff334575),
          textTheme: Typography.whiteMountainView.copyWith(
              headline1: Typography.whiteMountainView.headline1!.copyWith(
                  fontWeight: FontWeight.w300,
                  fontSize: 28,
                  color: Colors.white),
              headline2: Typography.whiteMountainView.headline2!.copyWith(
                  fontWeight: FontWeight.w300,
                  fontSize: 22,
                  color: Colors.white),
              headline5: Typography.whiteMountainView.headline5!.copyWith(
                fontWeight: FontWeight.w300,
                fontSize: 16,
                color: Colors.white,
              ))),
    );
  }
}
