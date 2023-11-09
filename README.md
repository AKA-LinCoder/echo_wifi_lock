# echo_wifi_lock

wifi锁

在熄屏模式下，许多设备会进入省电模式，导致一些网络连接被暂停以节省电力。在大多数情况下，Wi-Fi 连接也会被暂停或断开，这取决于设备的操作系统和设置。

在 Android 上，使用 WifiLock 来确保在熄屏时维持 Wi-Fi 连接。

在 iOS 上，熄屏通常不会导致 Wi-Fi 断开，但系统可能会对网络连接进行管理以节省电力。确保你的应用在后台运行时有足够的权限，以保持 Wi-Fi连接

wifi lock

In screen-off mode, many devices go into power-saving mode, causing some network connections to be suspended to save power. In most cases, Wi-Fi connections are also suspended or disconnected, depending on the device's operating system and settings.

On Android, WifiLock is used to ensure that the Wi-Fi connection is maintained when the screen is off.

On iOS, screen off doesn't usually cause Wi-Fi to disconnect, but the system may manage the network connection to save power. Make sure your apps run in the background with enough permissions to maintain a Wi-Fi connection!

## Getting Started
import 'package:echo_wifi_lock/echo_wifi_lock.dart';


## Usage 简单使用

```dart
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:echo_wifi_lock/echo_wifi_lock.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _echoWifiLockPlugin = EchoWifiLock();

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          children: [
            ElevatedButton(onPressed: ()async{
              await _echoWifiLockPlugin.acquire(EchoWifiMode.wifiModeFull);
            }, child: const Text('acquire wifiLock')),
            const SizedBox(height: 20,),
            ElevatedButton(onPressed: ()async{
              var res =  await _echoWifiLockPlugin.isHeld();
              if (kDebugMode) {
                print("isHeld:$res");
              }
            }, child: const Text('check isHeld')),
            const SizedBox(height: 20,),
            ElevatedButton(onPressed: ()async{
              await _echoWifiLockPlugin.release();
            }, child: const Text('release wifiLock')),
          ],
        ),
      ),
    );
  }
}


```