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
