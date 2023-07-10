
import SwiftyJSON
import UIKit

struct ProductModel {
    var id: Int?
    var title: String?
    var price: Double?
    var updatedPrice: Double?
    var category: String?
    var description: String?
    var image: String?
    
    init(title: String?, price: Double?, category: String?, image: String?, description: String?) {
        self.title = title
        self.price = price
        self.updatedPrice = price
        self.category = category
        self.image = image
        self.description = description
    }
    
    init(json: JSON) {
        self.id = json["id"].int
        self.title = json["title"].string
        self.price = json["price"].double
        self.updatedPrice = json["price"].double
        self.category = json["category"].string
        self.image = json["image"].string
        self.description = json["description"].string
        
    }
}

