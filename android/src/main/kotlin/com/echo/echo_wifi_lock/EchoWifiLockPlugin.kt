package com.echo.echo_wifi_lock

import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result


import android.net.wifi.WifiManager
import android.os.Build
import android.app.Activity
import android.content.Context

import java.time.LocalDateTime
import java.time.format.DateTimeFormatter
import java.time.format.FormatStyle


/** EchoWifiLockPlugin */
class EchoWifiLockPlugin: FlutterPlugin, MethodCallHandler,ActivityAware {

  private lateinit var channel : MethodChannel
  private lateinit var context: Context
  private lateinit var activity: Activity
  private val CHANNEL = "echo_wifi_lock"
  private var wifiLock: WifiManager.WifiLock? = null

//  private var echoContext: Context? = null

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "echo_wifi_lock")
    channel.setMethodCallHandler(this)
    context = flutterPluginBinding.applicationContext

//    this.echoContext = flutterPluginBinding.applicationContext

  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    //当前手机SDK版本低于安卓3
    if (Build.VERSION.SDK_INT < Build.VERSION_CODES.CUPCAKE){
      result.error("Unsupported", "This plugin is not supported on API levels below 3", null)
      return
    }

    when (call.method) {
      "getPlatformVersion" -> {
        result.success("Android ${android.os.Build.VERSION.RELEASE}")
      }
      "hello" -> {
        val current = LocalDateTime.now()
        val formatter = DateTimeFormatter.ofLocalizedDateTime(FormatStyle.MEDIUM)
        val formatted = current.format(formatter)
        result.success("hello guest,${formatted}")
      }
      "acquire" -> {
        if (acquire(call.argument<Int>("type") ?: 0)) {
          result.success(null)
        } else {
          result.error("UNAVAILABLE", "WifiManager not present", null)
        }
      }
      "release" -> {
        if (release()) {
          result.success(true)
        } else{
          result.error("UNAVAILABLE", "Lock is already released", null)
        }
      }
      "isHeld" -> {
          result.success(isHeld())
      }
      else -> result.notImplemented()

    }

  }

  //锁定WifiLock
  private fun acquire(type:Int):Boolean{

    val manager = activity?.getSystemService(Context.WIFI_SERVICE) as WifiManager?
    if (manager==null){
      return false
    }
    /***
     * WIFI_MODE_FULL - 这个选项表示使用完全的Wi-Fi锁定，即保持Wi-Fi连接处于活动状态，即使屏幕关闭也是如此。这对于需要保持长时间活动的Wi-Fi连接非常有用，比如文件下载或者数据同步。
     *
     * WIFI_MODE_SCAN_ONLY - 选择这个模式会创建一个仅用于扫描Wi-Fi网络的锁定。这意味着即使屏幕关闭，Wi-Fi连接也能保持活动状态以进行网络扫描操作。这对于需要后台扫描Wi-Fi网络的应用程序非常有用，比如位置服务或Wi-Fi相关的应用程序。
     *
     * WIFI_MODE_FULL_HIGH_PERF - 这个选项类似于WIFI_MODE_FULL，但它还启用了高性能模式，以提供更快的数据传输速度。这对于需要更高数据传输速度的应用非常有用，比如流媒体应用或在线游戏。
     */
    wifiLock = manager?.createWifiLock(type,"Echo")
    wifiLock?.acquire()
    return true

  }

  //解锁WifiLock
  private fun release():Boolean{
    try {
        wifiLock?.release()
        return true
    } catch (e:RuntimeException){
        return false
    }
  }

  //判断是否锁定
  private fun isHeld():Boolean{
    return wifiLock?.isHeld ?: false
  }



  override fun onDetachedFromActivity() {
    TODO("Not yet implemented")
  }

  override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
    TODO("Not yet implemented")
  }

  override fun onAttachedToActivity(binding: ActivityPluginBinding) {
    activity = binding.activity;
  }

  override fun onDetachedFromActivityForConfigChanges() {
    TODO("Not yet implemented")
  }


  //系统自带方法
  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
