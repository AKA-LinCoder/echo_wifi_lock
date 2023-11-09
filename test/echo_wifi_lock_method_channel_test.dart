import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:echo_wifi_lock/echo_wifi_lock_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelEchoWifiLock platform = MethodChannelEchoWifiLock();
  const MethodChannel channel = MethodChannel('echo_wifi_lock');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
