import UIKit
import GPSTabBar

class ViewController: UIViewController {

    private lazy var featureBuilder = FeatureBuilder()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func startButtonTouched(_ sender: UIButton) {
        featureBuilder.startModule().createInitialScene(rootViewController: self)
    }
}
