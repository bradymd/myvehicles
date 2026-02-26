import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

    // Set up method channel for file attribute management
    let controller = window?.rootViewController as! FlutterViewController
    let channel = FlutterMethodChannel(
      name: "com.myvehicles/file_attributes",
      binaryMessenger: controller.binaryMessenger
    )

    channel.setMethodCallHandler { (call: FlutterMethodCall, result: @escaping FlutterResult) in
      if call.method == "setBackupAttribute" {
        guard let args = call.arguments as? [String: Any],
              let path = args["path"] as? String,
              let shouldBackup = args["shouldBackup"] as? Bool else {
          result(FlutterError(code: "INVALID_ARGUMENTS", message: "Missing path or shouldBackup", details: nil))
          return
        }

        self.setBackupAttribute(path: path, shouldBackup: shouldBackup, result: result)
      } else {
        result(FlutterMethodNotImplemented)
      }
    }

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  private func setBackupAttribute(path: String, shouldBackup: Bool, result: @escaping FlutterResult) {
    var url = URL(fileURLWithPath: path)

    do {
      var resourceValues = URLResourceValues()
      resourceValues.isExcludedFromBackup = !shouldBackup
      try url.setResourceValues(resourceValues)
      result(true)
    } catch {
      result(FlutterError(
        code: "SET_ATTRIBUTE_FAILED",
        message: "Failed to set backup attribute: \(error.localizedDescription)",
        details: nil
      ))
    }
  }
}
