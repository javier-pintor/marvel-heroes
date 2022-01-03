//
//  ViewController.swift
//  MarvelHeroes
//
//  Created by Javier Pintor on 3/1/22.
//

import UIKit

class CharactersListViewController: BaseViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let marvelService = MarvelService()
    let characterCellId = "CharacterCollectionViewCell"
    let uiUtils = UIUtils()
    var charactersList: [MSCharacter]?
    let columnSpacing = 10

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        registerCollectionViewElements()
        loadInitData()
    }
    
    func loadInitData(){
        marvelService.getCharactersList(){ response in
            self.charactersList = response.data?.results
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
            
        }
    }
    
    func loadDetail(indexPath: IndexPath){
        if indexPath.item < charactersList?.count ?? 0{
            let selectedCharacter = charactersList![indexPath.item]
            
            if let next = UIStoryboard(name: "CharacterDetailsViewController", bundle: Bundle.main).instantiateViewController(withIdentifier: "\(CharacterDetailsViewController.self)") as? CharacterDetailsViewController{
                self.present(next, animated: true, completion: nil)
            }
            
            
        }
    }
    
    override func orientationDidChange(){
        super.orientationDidChange()
        collectionView.reloadData()
    }


}

