import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

    //ADICIONANDO A API
    GMSServices.provideAPIKey("AIzaSyDwCs-IN58OuPxx5NSWvLknS7uLghl8yhc")
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
