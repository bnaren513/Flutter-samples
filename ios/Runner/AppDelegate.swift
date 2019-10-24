import UIKit
import Flutter
import GoogleMaps


@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
     GeneratedPluginRegistrant.register(with: self)
      GMSServices.provideAPIKey("AIzaSyDCh-OhBJ-_x2yyAOEcAyDAcUCDg_FVT3A")
   
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
