//
//  CharacterDetailViewController.swift
//  MarvelHeroes
//
//  Created by Javier Pintor on 3/1/22.
//

import UIKit

class CharacterDetailsViewController: UIViewController, ViewCharacterDetailProtocol {
    
    @IBOutlet weak var detailsTableView: UITableView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    let numberIfDetailsSections = 5
    let comicsSectionIndex = 0, seriesSectionIndex = 1, storiesSectionIndex = 2, eventsSectionIndex = 3, urlsSectionIndex = 4
    let characterCellId = "CharacterDetailTableViewCell"
    let characterHeaderCellId = "CharacterDetailTableHeaderView"
    let uiUtils = UIUtils()
    var presenter: PresenterCharacterDetailProtocol?
    
    var msCharacter: MSCharacter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerTableViewElements()
        refreshUI()
    }
    
    
    func refreshUI(){
        if let character = msCharacter{
            nameLabel.text = character.name
            if let path = character.thumbnail?.path,
               let ext = character.thumbnail?.thumbnailExtension{
                imageView.sd_setImage(with: URL(string: "\(path).\(ext)"))
            }
            detailsTableView.reloadData()
        }
    }
    
}
