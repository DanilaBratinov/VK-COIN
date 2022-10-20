import UIKit

class NC: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        guard let vc =
                storyboard?.instantiateViewController(identifier: "vc1") as? ViewController else {return}
        navigationController?.pushViewController(vc, animated: true)
    }
    func setupNavigationBar() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    }

}
