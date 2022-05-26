import UIKit
import GPSHome
import GPSUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func startButtonTouched(_ sender: UIButton)
    {
        Module(dependencies: Dependencies())
            .createInitialScene(rootViewController: self.navigationController)
    }
}
