//
//  CollectionScreenViewController.swift
//  AcademiaCodigoUITesting
//
//  Created by jonathan Cuendet on 11/12/2019.
//  Copyright © 2019 jonathan Cuendet. All rights reserved.
//

import UIKit
class GalleryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet var collectionView: UICollectionView!
    var products: [Product] = []

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as! ProductCell

        cell.loadImage(with: setImage(from: products[indexPath.row].url))
        cell.accessibilityIdentifier = "cell_\(indexPath.row)"
        return cell
    }

    override func viewDidLoad() {
        collectionView.accessibilityIdentifier = "gallery_collection_view"
        collectionView.register(UINib.init(nibName: "ProductCell", bundle: nil), forCellWithReuseIdentifier: "ProductCell")


        ProductService.shared.getImages(subCategoryID: 2) { (Result) in
            DispatchQueue.main.async {
                switch Result {
                case .success(let productLists):

                    self.products = productLists
                    self.collectionView.reloadData()
                
                case .failure(let error):
                    print(error)
                }
            }

        }
        super.viewDidLoad()
    }


    func setImage(from url: String) -> UIImage {
        guard let imageURL = URL(string: url) else {
            return UIImage(named: "logo")!
        }
        guard let imageData = try? Data(contentsOf: imageURL) else { return   UIImage(named: "logo")! }
        let image = UIImage(data: imageData)
        return image!
    }
}

