import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var oneClickLabel: UILabel!
    @IBOutlet weak var autoClickOutlet: UIButton!
    @IBOutlet weak var buttonIcon: UIImageView!
    @IBOutlet weak var topIcon: UIImageView!
    @IBOutlet weak var transferIcon: UIImageView!
    @IBOutlet weak var marketIcon: UIImageView!
    @IBOutlet weak var button: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        if walletEngine.number == 0 {
            walletEngine.number += 0.001
        }
        
        if timerBool == true || twoTimerBool == true || threeTimerBool || fourTimerBool == true {
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        }
    }
    
    
    struct Counter {
        var coin: Float = UserDefaults.standard.float(forKey: "Taps")
        var number: Float = UserDefaults.standard.float(forKey: "Walltet")
        var numberSec: Float = UserDefaults.standard.float(forKey: "NumberSec")
    }
    
    private func addition() {
        walletEngine.coin += walletEngine.number
        countLabel.text = "\(String(format: "%.3f", walletEngine.coin))$"
        UserDefaults.standard.setValue(walletEngine.coin, forKey: "Taps")
        
        UIView.animate(withDuration: 0.4) {
            self.buttonIcon.alpha = 0.85
        }
        UIView.animate(withDuration: 0.4) {
            self.buttonIcon.alpha = 1
        }
    }
    
    var walletEngine = Counter()
    
    @IBAction func clickButton(_ sender: UIButton) {
        addition()
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
        walletEngine.coin = 0
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
        guard let vc = storyboard?.instantiateViewController(identifier: "market") as?
                MarketVC else {return}
        vc.modalPresentationStyle = .fullScreen
        
        vc.walletEngine.coin = walletEngine.coin
        vc.walletEngine.number = walletEngine.number
        vc.timerBool = timerBool
        vc.walletEngine.numberSec = walletEngine.numberSec
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
        walletEngine.coin += walletEngine.numberSec/10
        UserDefaults.standard.setValue(walletEngine.coin, forKey: "Taps")
        countLabel?.text = "\(String(format: "%.3f", walletEngine.coin))$"
    }
    
    func autoClick() {
        if self.autoClickBool == false {
            self.autoClickBool = true
            self.autoClickOutlet?.setTitle("\((String)(format: "%.3f", self.walletEngine.numberSec))/сек", for: .normal)
        } else {
            self.autoClickBool = false
            self.autoClickOutlet?.setTitle("\((String)(format: "%.3f", self.walletEngine.numberSec*60))/мин", for: .normal)
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
}
