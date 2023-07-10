
import Foundation
import Alamofire
import SwiftyJSON
import Kingfisher

protocol HomePresenterProtocol: BasePresenterProtocol {
    
    func didFetchProducts(with products: [ProductModel])
    func showError(_ message: String)
    
}

class HomePresenter: BasePresenter {
    
    weak var homeDelegate: HomePresenterProtocol?
    
    init(homeDelegate: HomePresenterProtocol) {
        super.init(delegate: homeDelegate)
        self.homeDelegate = homeDelegate
    }
    
    func fetch() {
        self.showLoading()
        APIManager.shared.fetchProducts { [weak self] result in
            self?.hideLoading()
            switch result {
            case .success(let products):
                print(products)
                self?.homeDelegate?.didFetchProducts(with: products)
            case .failure(let error):
                self?.delegate?.showError("Something went wrong!!")
                print(error.localizedDescription)
            }
        }
    }
}

