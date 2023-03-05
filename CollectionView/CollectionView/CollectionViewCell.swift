//
//  CollectionViewCell.swift
//  CollectionView
//
//  Created by Rhytthm Mahajan on 09/02/23.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var text: UILabel!
    
    func configure(with text:String?){
        if let text = text {
            self.text.text = text
        }
    }
    
}
