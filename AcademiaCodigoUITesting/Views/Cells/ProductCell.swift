//
//  KittenCell.swift
//  AcademiaCodigoUITesting
//
//  Created by jonathan Cuendet on 11/12/2019.
//  Copyright © 2019 jonathan Cuendet. All rights reserved.
//

import Foundation
import UIKit

class ProductCell: UICollectionViewCell {

    @IBOutlet var imageView: UIImageView!
    
override func awakeFromNib() {
      super.awakeFromNib()
      // Initialization code
  }

  public func loadImage(with image: UIImage){
      self.imageView.image = image
  }
    
}
