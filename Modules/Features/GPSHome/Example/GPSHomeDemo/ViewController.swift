import UIKit
import GPSHome
import GPSUI

class ViewController: GPSUI.ViewController {

    override func viewDidLoad()
    {
        super.viewDidLoad()
        hidesNavigationBarWhenPushed = true
    }

    @IBAction func startButtonTouched(_ sender: UIButton)
    {
        Module(dependencies: Dependencies())
            .createInitialScene(rootViewController: self.navigationController)
    }
}
