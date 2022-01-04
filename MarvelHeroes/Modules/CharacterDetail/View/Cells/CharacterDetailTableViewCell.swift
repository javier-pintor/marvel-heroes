//
//  CharacterDetailTableViewCell.swift
//  MarvelHeroes
//
//  Created by Javier Pintor on 3/1/22.
//

import UIKit

class CharacterDetailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    
    func configureCell(title: String?){
        self.title.text = title
    }
}
