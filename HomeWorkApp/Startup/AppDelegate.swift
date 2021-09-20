import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    private var appConfiguration: AppConfigurationProtocol?
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        appConfiguration = AppConfiguration(window: window)
        appConfiguration?.startInitialScene()
        return true
    }
}
