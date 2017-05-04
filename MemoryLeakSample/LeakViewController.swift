import UIKit

// MARK: - Leak Pattern
class LeakViewController: UIViewController {

    var sample = LeakSample()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sample.catchViewController(vc: self)
    }
}

class LeakSample {
    
    var vc: LeakViewController? // ViewController を強参照しているためメモリリークする
    
    func catchViewController(vc: LeakViewController) {
        self.vc = vc
    }
    
}

// MARK: - No Leak Pattern
class NoLeakViewController: UIViewController {
    
    var sample = NoLeakSample()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sample.catchViewController(vc: self)
    }
}

class NoLeakSample {
    
    weak var vc: NoLeakViewController? // ViewController を弱参照しているためメモリリークしない
    
    func catchViewController(vc: NoLeakViewController) {
        self.vc = vc
    }
    
}
