//
//  CharacterDetailTableHeaderView.swift
//  MarvelHeroes
//
//  Created by Javier Pintor on 4/1/22.
//

import UIKit


class CharacterDetailTableHeaderView: UITableViewHeaderFooterView{
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    
    func configureCell(title: String?, count: String?){
        titleLabel.text = title
        countLabel.text = count
    }
}
