//
//  ViewController.swift
//  MarvelHeroes
//
//  Created by Javier Pintor on 3/1/22.
//

import UIKit

class CharactersListViewController: BaseViewController, ViewCharactersProtocol {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let marvelService = MarvelService()
    let characterCellId = "CharacterCollectionViewCell"
    let uiUtils = UIUtils()
    var charactersList: [MSCharacterLite]?
    let columnSpacing = 10
    var presenter: PresenterCharactersProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        registerCollectionViewElements()
        initModule()
    }
    
    func initModule(){
        CharactersListRouter.initModule(viewController: self)
        presenter?.viewDidLoad()
    }
    
    func loadDetail(indexPath: IndexPath){
        if indexPath.item < charactersList?.count ?? 0,
           let selectedCharacterId = charactersList![indexPath.item].id {
            presenter?.didSelectRowAt(id: selectedCharacterId)
        }else{
            print("error")
        }
    }
    
    override func orientationDidChange(){
        super.orientationDidChange()
        collectionView.reloadData()
    }
    
    func onFetchCharactersSuccess(characters: [MSCharacterLite]) {
        self.charactersList = characters
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func onFetchCharactersFailure(error: String) {
        print("error")
    }
    


}

