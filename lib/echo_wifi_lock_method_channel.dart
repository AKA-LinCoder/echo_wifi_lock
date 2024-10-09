import 'package:echo_wifi_lock/echo_wifi_lock.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'echo_wifi_lock_platform_interface.dart';

/// An implementation of [EchoWifiLockPlatform] that uses method channels.
class MethodChannelEchoWifiLock extends EchoWifiLockPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('echo_wifi_lock');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<String> sayHello() async {
    final result = await methodChannel.invokeMethod<String>('hello');
    return result ?? 'hi';
  }

  @override
  Future<void> acquire(EchoWifiMode echoWifiMode) async {
    await methodChannel.invokeMethod('acquire', {'type': echoWifiMode.value});
    // return result??false;
  }

  @override
  Future<void> release() async {
    await methodChannel.invokeMethod('release');
  }

  @override
  Future<bool> isHeld() async {
    final result = await methodChannel.invokeMethod<bool>('isHeld');
    return result ?? false;
  }
}
