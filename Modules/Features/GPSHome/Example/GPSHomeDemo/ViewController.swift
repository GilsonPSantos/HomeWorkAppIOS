import UIKit
import GPSHome

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func startButtonTouched(_ sender: UIButton) {
        let coordinator = Module(dependencies: Dependencies()).createCoordinator(rootViewController: nil)
        coordinator.start()
        coordinator.rootViewController?.modalPresentationStyle = .fullScreen
        self.present(coordinator.rootViewController ?? UIViewController(), animated: true)
    }
}
