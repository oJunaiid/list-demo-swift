

import UIKit

class ProductCell: UICollectionViewCell {
    
    var productImage = UIImageView()
    let productName = UILabel()
    let categoryLine = UILabel()
    let productPrice = UILabel()
    let likeButton = UIButton()
    let addButtonView = UIView()
    let addToCart = UIButton()
    
    var product: ProductModel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpView()
        setUpAutoLayoutConstraints()
    }
    
    func setUpView() {
        
        self.backgroundColor = .white
        self.layer.cornerRadius = 15
        contentView.addSubview(productImage)
        contentView.addSubview(productPrice)
        contentView.addSubview(likeButton)
        contentView.addSubview(productName)
        contentView.addSubview(addButtonView)
        contentView.addSubview(categoryLine)
        contentView.addSubview(addToCart)
        
        productImage.translatesAutoresizingMaskIntoConstraints = false
        productImage.contentMode = .scaleAspectFit
        
        productName.font = UIFont.systemFont(ofSize: 14)
        productName.numberOfLines = 1
        productName.translatesAutoresizingMaskIntoConstraints = false
        
        categoryLine.textColor = .lightGray
        categoryLine.font = UIFont.systemFont(ofSize: 10)
        categoryLine.translatesAutoresizingMaskIntoConstraints = false
        
        productPrice.textColor = .black
        productPrice.font = UIFont.systemFont(ofSize: 14)
        productPrice.translatesAutoresizingMaskIntoConstraints = false
        
        addButtonView.translatesAutoresizingMaskIntoConstraints = false
        addButtonView.backgroundColor = .black
        addButtonView.layer.cornerRadius = 10
        addButtonView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner]
        
        likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
        likeButton.tintColor = .lightGray
        likeButton.translatesAutoresizingMaskIntoConstraints = false
        
        addToCart.setImage(UIImage(systemName: "plus"), for: .normal)
        addToCart.translatesAutoresizingMaskIntoConstraints = false
        addToCart.tintColor = .white
        
    }
    
    func setUpAutoLayoutConstraints() {
        NSLayoutConstraint.activate([
            productImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            productImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            productImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            productImage.heightAnchor.constraint(equalToConstant: 130),
            
            productName.topAnchor.constraint(equalTo: productImage.bottomAnchor, constant: 4),
            productName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            productName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 4),
            
            categoryLine.topAnchor.constraint(equalTo: productName.bottomAnchor, constant: 1),
            categoryLine.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            
            productPrice.topAnchor.constraint(equalTo: categoryLine.bottomAnchor, constant: 4),
            productPrice.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            
            addButtonView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            addButtonView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            addButtonView.heightAnchor.constraint(equalToConstant: 40),
            addButtonView.widthAnchor.constraint(equalToConstant: 40),
            
            likeButton.topAnchor.constraint(equalTo: productPrice.bottomAnchor, constant: 5),
            likeButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            
            addToCart.centerXAnchor.constraint(equalTo: addButtonView.centerXAnchor),
            addToCart.centerYAnchor.constraint(equalTo: addButtonView.centerYAnchor),
        ])
    }
    
    func setUpCells(with product: ProductModel) {
        self.product = product
        productName.text = product.title
        productPrice.text = "$\(product.price ?? 00)"
        categoryLine.text = product.category
        
        if let url = URL(string: product.image ?? "") {
            productImage.kf.setImage(with: url)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

