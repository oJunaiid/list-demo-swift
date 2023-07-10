
import Foundation
import Alamofire
import SwiftyJSON
import Kingfisher

protocol BasePresenterProtocol: AnyObject {
    func showError(_ message: String)
}

class BasePresenter {
    weak var delegate: BasePresenterProtocol?
    
    init(delegate: BasePresenterProtocol) {
        self.delegate = delegate
    }
    
    func showError(_ message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
    }
    
}
 
