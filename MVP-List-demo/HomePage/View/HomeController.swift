

import UIKit
import Kingfisher


typealias CollectionProtocol = UICollectionViewDelegate & UICollectionViewDataSource &  UICollectionViewDelegateFlowLayout

class HomeController: BaseViewController, HomePresenterProtocol, CollectionProtocol {
    
    var presenter: HomePresenter?
    var products: [ProductModel]?
    var itemClicked: ((ProductModel) -> ())?
    
    let homeButton = UIButton()
    let cartButton = UIButton()
    let heartButton = UIButton()
    let bottomMenuButton = UIButton()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 0
        layout.collectionView?.showsHorizontalScrollIndicator = false
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .systemPink
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Product List"
        setUpCollectionView()
        presenter = HomePresenter(delegate: self)
        presenter?.fetch()
    }
    
    func didFetchProducts(with products: [ProductModel]) {
        self.products = products
        self.products = products.shuffled()
        collectionView.reloadData()
    }
    
    func showError(_ message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    private func setUpCollectionView() {
        view.addSubview(collectionView)
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(ProductCell.self, forCellWithReuseIdentifier: "ProductCell")
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 3),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -3),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
    
    // MARK: - UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as! ProductCell
        
        if let product = products?[indexPath.row] {
            cell.setUpCells(with: product)
        }
        return cell
    }
    
    // MARK: - UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat = 3
        let numberOfItemsPerRow: CGFloat = 2
        let availableWidth = collectionView.bounds.width - padding * (numberOfItemsPerRow + 1)
        let itemWidth = availableWidth / numberOfItemsPerRow
        return CGSize(width: itemWidth, height: 255)
    }
}

