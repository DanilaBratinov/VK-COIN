import UIKit

class MarketVC: ViewController {

    @IBOutlet weak var onePrice: UILabel!

    @IBOutlet weak var twoPrice: UILabel!

    @IBOutlet weak var threePrice: UILabel!

    @IBOutlet weak var fourPrice: UILabel!

    @IBOutlet weak var fivePrice: UILabel!

    @IBOutlet weak var oneBack: UIImageView!
    @IBOutlet weak var twoBack: UIImageView!
    @IBOutlet weak var threeBack: UIImageView!
    @IBOutlet weak var fourBack: UIImageView!
    @IBOutlet weak var fiveBack: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        oneBackAlpha()
        twoBackAlpha()
        threeBackAlpha()
        fourBackAlpha()
        fiveBackAlpha()

        if mousePrice == 0 {
            mousePrice = 0.030
        }
        if videocardPrice == 0 {
            videocardPrice = 0.100
        }
        if rackVideocardPrice == 0 {
            rackVideocardPrice = 1.000
        }

        if superComputerPrice == 0 {
            superComputerPrice = 10.000
        }

        if serverPrice == 0 {
            serverPrice = 50.000
        }

        onePrice.text = "Купить за \(String(format: "%.3f", mousePrice))$"
        twoPrice.text = "Купить за \(String(format: "%.3f", videocardPrice))$"
        threePrice.text = "Купить за \(String(format: "%.3f", rackVideocardPrice))$"
        fourPrice.text = "Купить за \(String(format: "%.3f", superComputerPrice))$"
        fivePrice.text = "Купить за \(String(format: "%.3f", serverPrice))$"

        var checkAlpha:Timer = Timer()

        checkAlpha = Timer.scheduledTimer(timeInterval: 0.00001, target: self, selector: #selector(checkAlphaFunc), userInfo: nil, repeats: true)


    }

    @objc func checkAlphaFunc() {
        oneBackAlpha()
        twoBackAlpha()
        threeBackAlpha()
        fourBackAlpha()
        fiveBackAlpha()
    }

    var mousePrice: Float = UserDefaults.standard.float(forKey: "MousePrice")
    var videocardPrice: Float = UserDefaults.standard.float(forKey: "VideocardPrice")
    var rackVideocardPrice: Float = UserDefaults.standard.float(forKey: "RackVideocardPrice")
    var superComputerPrice: Float = UserDefaults.standard.float(forKey: "SuperComputerPrice")
    var serverPrice: Float = UserDefaults.standard.float(forKey: "ServerPrice")

    func oneBackAlpha() {
        if tapCount < mousePrice {
            oneBack.alpha = 0.5
        } else {
            oneBack.alpha = 1
        }
    }

    func twoBackAlpha() {
        if tapCount < videocardPrice {
            twoBack.alpha = 0.5
        } else {
            twoBack.alpha = 1
        }
    }

    func threeBackAlpha() {
        if tapCount < rackVideocardPrice {
            threeBack.alpha = 0.5
        } else {
            threeBack.alpha = 1
        }
    }

    func fourBackAlpha() {
        if tapCount < superComputerPrice {
            fourBack.alpha = 0.5
        } else {
            fourBack.alpha = 1
        }
    }

    func fiveBackAlpha() {
        if tapCount < serverPrice {
            fiveBack.alpha = 0.5
        } else {
            fiveBack.alpha = 1
        }
    }

    @IBAction func closeButton(_ sender: UIButton) {
        guard let vc = storyboard?.instantiateViewController(identifier: "vc1") as? ViewController else {return}
        vc.modalPresentationStyle = .fullScreen

        vc.tapCount = tapCount
        vc.number = number
        vc.timerBool = timerBool
        vc.numberSec = numberSec
        vc.twoTimerBool = twoTimerBool
        vc.threeTimerBool = threeTimerBool
        vc.fourTimerBool = fourTimerBool
        vc.autoClickBool = autoClickBool

        present(vc, animated: false, completion: nil)
    }

    @IBAction func byOneButton(_ sender: UIButton) {
        if tapCount >= mousePrice {
            tapCount -= mousePrice
            number += 0.001
            mousePrice *= 1.3
            onePrice.text = "Купить за \(String(format: "%.3f", mousePrice))$"

            UserDefaults.standard.setValue(tapCount, forKey: "Taps")
            
            UserDefaults.standard.setValue(mousePrice, forKey: "MousePrice")
            UserDefaults.standard.setValue(number, forKey: "Wallet")

            oneBackAlpha()
            twoBackAlpha()
            threeBackAlpha()
            fourBackAlpha()
            fiveBackAlpha()
        }
    }

    @IBAction func byTwoButton(_ sender: UIButton) {
        if tapCount >= videocardPrice {
            tapCount -= videocardPrice
            timerBool = true
            videocardPrice *= 1.3
            twoPrice.text = "Купить за \(String(format: "%.3f", videocardPrice))$"
            numberSec += 0.003

            UserDefaults.standard.setValue(tapCount, forKey: "Taps")

            UserDefaults.standard.setValue(numberSec, forKey: "NumberSec")
            UserDefaults.standard.setValue(timerBool, forKey: "videocard")
            UserDefaults.standard.setValue(videocardPrice, forKey: "VideocardPrice")

            oneBackAlpha()
            twoBackAlpha()
            threeBackAlpha()
            fourBackAlpha()
            fiveBackAlpha()
        }
    }

    @IBAction func buThreeButton(_ sender: UIButton) {
        if tapCount >= rackVideocardPrice {
            tapCount -= rackVideocardPrice
            twoTimerBool = true
            rackVideocardPrice *= 1.3
            threePrice.text = "Купить за \(String(format: "%.3f", rackVideocardPrice))$"
            numberSec += 0.01

            UserDefaults.standard.setValue(tapCount, forKey: "Taps")

            UserDefaults.standard.setValue(twoTimerBool, forKey: "rackVideocard")
            UserDefaults.standard.setValue(numberSec, forKey: "NumberSec")
            UserDefaults.standard.setValue(rackVideocardPrice, forKey: "RackVideocardPrice")

            oneBackAlpha()
            twoBackAlpha()
            threeBackAlpha()
            fourBackAlpha()
            fiveBackAlpha()
        }
    }

    @IBAction func byFourButton(_ sender:  UIButton) {
        if tapCount >= superComputerPrice {
            tapCount -= superComputerPrice
            threeTimerBool = true
            superComputerPrice *= 1.3
            fourPrice.text = "Купить за \(String(format: "%.3f", superComputerPrice))$"
            numberSec += 0.03

            UserDefaults.standard.setValue(tapCount, forKey: "Taps")

            UserDefaults.standard.setValue(threeTimerBool, forKey: "SuperComputer")
            UserDefaults.standard.setValue(numberSec, forKey: "NumberSec")
            UserDefaults.standard.setValue(superComputerPrice, forKey: "SuperComputerPrice")

            oneBackAlpha()
            twoBackAlpha()
            threeBackAlpha()
            fourBackAlpha()
            fiveBackAlpha()
        }
    }

    @IBAction func byFiveButton(_ sender: UIButton) {
        if tapCount >= serverPrice {
            tapCount -= serverPrice
            fourTimerBool = true
            serverPrice *= 1.3
            fivePrice.text = "Купить за \(String(format: "%.3f", serverPrice))"
            numberSec += 0.1

            UserDefaults.standard.setValue(tapCount, forKey: "Taps")

            UserDefaults.standard.setValue(fourTimerBool, forKey: "Server")
            UserDefaults.standard.setValue(numberSec, forKey: "NumberSec")
            UserDefaults.standard.setValue(serverPrice, forKey: "ServerPrice")
        }
    }
}

