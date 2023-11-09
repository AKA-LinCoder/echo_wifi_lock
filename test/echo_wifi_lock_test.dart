// import 'package:flutter_test/flutter_test.dart';
// import 'package:echo_wifi_lock/echo_wifi_lock.dart';
// import 'package:echo_wifi_lock/echo_wifi_lock_platform_interface.dart';
// import 'package:echo_wifi_lock/echo_wifi_lock_method_channel.dart';
// import 'package:plugin_platform_interface/plugin_platform_interface.dart';
//
// class MockEchoWifiLockPlatform
//     with MockPlatformInterfaceMixin
//     implements EchoWifiLockPlatform {
//
//   @override
//   Future<String?> getPlatformVersion() => Future.value('42');
//
//   @override
//   Future<String> sayHello() {
//     // TODO: implement sayHello
//     throw UnimplementedError();
//   }
// }
//
// void main() {
//   final EchoWifiLockPlatform initialPlatform = EchoWifiLockPlatform.instance;
//
//   test('$MethodChannelEchoWifiLock is the default instance', () {
//     expect(initialPlatform, isInstanceOf<MethodChannelEchoWifiLock>());
//   });
//
//   test('getPlatformVersion', () async {
//     EchoWifiLock echoWifiLockPlugin = EchoWifiLock();
//     MockEchoWifiLockPlatform fakePlatform = MockEchoWifiLockPlatform();
//     EchoWifiLockPlatform.instance = fakePlatform;
//
//     expect(await echoWifiLockPlugin.getPlatformVersion(), '42');
//   });
// }
