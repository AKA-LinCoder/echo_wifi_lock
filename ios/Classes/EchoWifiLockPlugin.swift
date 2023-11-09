import Flutter
import UIKit

public class EchoWifiLockPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "echo_wifi_lock", binaryMessenger: registrar.messenger())
    let instance = EchoWifiLockPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getPlatformVersion":
      result("iOS " + UIDevice.current.systemVersion)
    case "hello":
       result("")
    case "acquire":
       result(true)
    case "release":
       result(true)
    case "isHeld":
       result(true)
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
