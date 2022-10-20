import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var countLabel: UILabel!

    @IBOutlet weak var oneClickLabel: UILabel!

    @IBOutlet weak var autoClickOutlet: UIButton!

    @IBOutlet weak var buttonIcon: UIImageView!

    @IBOutlet weak var topIcon: UIImageView!

    @IBOutlet weak var transferIcon: UIImageView!

    @IBOutlet weak var marketIcon: UIImageView!

    @IBOutlet weak var oneOutlet: UIImageView!

    @IBOutlet weak var oneAcchive: UIView!

    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if number == 0 {
            number += 0.001
        }

        if timerBool == true || twoTimerBool == true || threeTimerBool || fourTimerBool == true{
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        }

        countLabel?.text = "\(String(format: "%.3f", tapCount))$"


        oneClickLabel?.text = "\(String(format: "%.3f", number))/клик"

        autoClick()
        oneOutlet?.alpha = 0
        oneAcchive?.alpha = 0
    }

    var tapCount:Float = UserDefaults.standard.float(forKey: "Taps")
    var number:Float = UserDefaults.standard.float(forKey: "Wallet")
    var numberSec: Float = UserDefaults.standard.float(forKey: "NumberSec")
    
    @IBAction func clickButton(_ sender: UIButton) {
        tapCount += number
        countLabel.text = "\(String(format: "%.3f", tapCount))$"
        UserDefaults.standard.setValue(tapCount, forKey: "Taps")

        UIView.animate(withDuration: 0.4) {
            self.buttonIcon.alpha = 0.85
        }
        UIView.animate(withDuration: 0.4) {
            self.buttonIcon.alpha = 1
        }
    }

    @IBAction func topButton(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5) {
            self.topIcon.alpha = 0.85
        }

        UIView.animate(withDuration: 0.5) {
            self.topIcon.alpha = 1
        }
    }

    @IBAction func transferButton(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5) {
            self.transferIcon.alpha = 0.85
        }

        UIView.animate(withDuration: 0.5) {
            self.transferIcon.alpha = 1
        }
        tapCount = 0
        aCount = 0
        guard let vc = storyboard?.instantiateViewController(identifier: "transfer") as? TransferVC else {return}
        present(vc, animated: true, completion: nil)
    }

    @IBAction func marketButton(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5) {
            self.marketIcon.alpha = 0.85
        }

        UIView.animate(withDuration: 0.5) {
            self.marketIcon.alpha = 1
        }

        guard let vc =
                storyboard?.instantiateViewController(identifier:
                "market") as? MarketVC else {return}
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

    var timer:Timer = Timer()
    var count:Int = 0
    var timerBool = UserDefaults.standard.bool(forKey: "videocard")
    var twoTimerBool = UserDefaults.standard.bool(forKey: "RackVideocard")
    var threeTimerBool = UserDefaults.standard.bool(forKey: "SuperComputer")
    var fourTimerBool = UserDefaults.standard.bool(forKey: "Server")

    @objc func timerAction() {
        tapCount += numberSec/10
        UserDefaults.standard.setValue(tapCount, forKey: "Taps")
        countLabel?.text = "\(String(format: "%.3f", tapCount))$"
        achivements()
}

    func autoClick() {
        if self.autoClickBool == false {
            self.autoClickBool = true
            self.autoClickOutlet?.setTitle("\((String)(format: "%.3f", self.numberSec))/сек", for: .normal)
        } else {
            self.autoClickBool = false
            self.autoClickOutlet?.setTitle("\((String)(format: "%.3f", self.numberSec*60))/мин", for: .normal)
    }
    }

    var autoClickBool = false
    @IBAction func autoClickButton(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5) {
            self.autoClickOutlet.alpha = 0.7
        }
        UIView.animate(withDuration: 0.5) {
            self.autoClickOutlet.alpha = 1
            self.autoClick()
        }
    }


    // Показ достижений

    var aCount = UserDefaults.standard.integer(forKey: "Achivements")
    var achiveTimer:Timer = Timer()

    @objc func closeOneAchive() {
        UIView.animate(withDuration: 0.7) {
            self.oneAcchive.alpha = 0
        }
        achiveTimer.invalidate()
    }

    func achivements() {
        if tapCount >= 1 && aCount == 0 {
            UIView.animate(withDuration: 0.7) {
                self.oneOutlet?.alpha = 1
            }
            UIView.animate(withDuration: 0.7) {
                self.oneAcchive?.alpha = 1
                self.achiveTimer = Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector(self.closeOneAchive), userInfo: nil, repeats: false)
            }
            aCount += 1
            UserDefaults.standard.setValue(aCount, forKey: "Achivements")
        }
    }

    @IBAction func dssdad(_ sender: UIButton) {
        print("Нажал")
    }
    @IBAction func oneOpenAchive(_ sender: UIButton) {
        guard let vc = storyboard?.instantiateViewController(identifier: "top") as? TopVC else {return}
        navigationController?.pushViewController(vc, animated: true)
    }
}
