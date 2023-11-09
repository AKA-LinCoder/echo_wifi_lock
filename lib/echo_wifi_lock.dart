
import 'echo_wifi_lock_platform_interface.dart';

class EchoWifiLock {
  Future<String?> getPlatformVersion() {
    return EchoWifiLockPlatform.instance.getPlatformVersion();
  }

  Future<String> sayHello(){
    return EchoWifiLockPlatform.instance.sayHello();
  }

  /// 锁定wifiLock
  ///
  /// acquire wifiLock
  Future<void> acquire(EchoWifiMode echoWifiMode)async{
    return EchoWifiLockPlatform.instance.acquire(echoWifiMode);
  }

  /// 释放wifiLock
  ///
  /// release wifiLock
  Future<void> release()async{
    return EchoWifiLockPlatform.instance.release();
  }

  /// 检查是否处于lock状态
  ///
  /// check isHeld
  Future<bool> isHeld()async{
    return EchoWifiLockPlatform.instance.isHeld();
  }
}


enum EchoWifiMode {
  ///这个选项表示使用完全的Wi-Fi锁定，即保持Wi-Fi连接处于活动状态，即使屏幕关闭也是如此。这对于需要保持长时间活动的Wi-Fi连接非常有用，比如文件下载或者数据同步
  ///
  ///This option indicates the use of full Wi-Fi lock, which means keeping the Wi-Fi connection active, even if the screen is off. This is useful for Wi-Fi connections that need to be kept active for long periods of time, such as file downloads or data synchronization
  wifiModeFull(1),
  ///选择这个模式会创建一个仅用于扫描Wi-Fi网络的锁定。这意味着即使屏幕关闭，Wi-Fi连接也能保持活动状态以进行网络扫描操作。这对于需要后台扫描Wi-Fi网络的应用程序非常有用，比如位置服务或Wi-Fi相关的应用程序。
  ///
  ///Selecting this mode creates a lock for scanning Wi-Fi networks only. This means that the Wi-Fi connection remains active for network scanning operations even if the screen is turned off. This is useful for applications that need to scan Wi-Fi networks in the background, such as location services or Wi-Fi related applications.
  wifiModeScanOnly(2),
  ///这个选项类似于WIFI_MODE_FULL，但它还启用了高性能模式，以提供更快的数据传输速度。这对于需要更高数据传输速度的应用非常有用，比如流媒体应用或在线游戏
  ///
  ///This option is similar to WIFI_MODE_FULL, but it also enables High Performance mode to provide faster data transfer speeds. This is useful for applications that require higher data transfer speeds, such as streaming applications or online gaming
  wifiModeFullHighPerf(3);
  final int value;
  const EchoWifiMode(this.value);
}
