import 'package:echo_wifi_lock/echo_wifi_lock.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'echo_wifi_lock_method_channel.dart';

abstract class EchoWifiLockPlatform extends PlatformInterface {
  /// Constructs a EchoWifiLockPlatform.
  EchoWifiLockPlatform() : super(token: _token);

  static final Object _token = Object();

  static EchoWifiLockPlatform _instance = MethodChannelEchoWifiLock();

  /// The default instance of [EchoWifiLockPlatform] to use.
  ///
  /// Defaults to [MethodChannelEchoWifiLock].
  static EchoWifiLockPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [EchoWifiLockPlatform] when
  /// they register themselves.
  static set instance(EchoWifiLockPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String> sayHello(){
    throw UnimplementedError('sayHello() has not been implemented.');
  }

  Future<void> acquire(EchoWifiMode echoWifiMode)async{
    throw UnimplementedError('acquire() has not been implemented.');
  }

  Future<void> release()async{
    throw UnimplementedError('release() has not been implemented.');
  }

  Future<bool> isHeld()async{
    throw UnimplementedError('isHeld() has not been implemented.');
  }
}
