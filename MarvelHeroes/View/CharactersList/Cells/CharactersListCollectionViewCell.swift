//
//  CharactersListCollectionViewCell.swift
//  MarvelHeroes
//
//  Created by Javier Pintor on 3/1/22.
//

import UIKit
import SDWebImage

class CharactersListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    
    func configureCell(character: MSCharacter){
        nameLabel.text = character.name
        
        if let path = character.thumbnail?.path,
           let ext = character.thumbnail?.thumbnailExtension{
            imageView.sd_setImage(with: URL(string: "\(path).\(ext)"))
        }
    }
}
