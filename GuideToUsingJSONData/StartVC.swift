
import UIKit

class StartVC: UIViewController {
    
    let article = NewsArticle()
    
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var urlImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupArticle()
    }
    
    func setupArticle() {
        article.forecast { (network, error) in
            
        }
    }
}

