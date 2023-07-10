
import Foundation
import Alamofire
import SwiftyJSON

class APIManager {
    static let shared = APIManager()
    
    private let baseURL = "https://fakestoreapi.com/"
    
    private init() {}
    

    func fetchProducts(completion: @escaping (Result<[ProductModel], Error>) -> Void) {
        let url = baseURL + "products"
        AF.request(url).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                let products = json.arrayValue.map { ProductModel(json: $0) }
                completion(.success(products))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

}
