
import Foundation
import Alamofire
import SwiftyJSON
import Kingfisher

protocol HomePresenterProtocol: BasePresenterProtocol {
    
    func didFetchProducts(with products: [ProductModel])
    func showError(_ message: String)
    
}

class HomePresenter {
    weak var delegate: HomePresenterProtocol?
    
    init(delegate: HomePresenterProtocol) {
        self.delegate = delegate
    }
    
    func fetch() {
        APIManager.shared.fetchProducts { [weak self] result in
            switch result {
            case .success(let products):
                print(products)
                self?.delegate?.didFetchProducts(with: products)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

