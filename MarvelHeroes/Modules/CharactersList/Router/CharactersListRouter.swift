//
//  CharactersListRouter.swift
//  MarvelHeroes
//
//  Created by Javier Pintor on 4/1/22.
//

import Foundation


import UIKit

class CharactersListRouter: RouterCharactersProtocol {

    static func initModule(viewController: CharactersListViewController){
        let interactor = CharacterListInteractor()
        let router = CharactersListRouter()
        let presenter = CharacterListPresenter(interactor: interactor, view: viewController, router: router)
        viewController.presenter = presenter
        viewController.presenter?.interactor?.presenter = presenter
    }
    
    
    func pushToCharacterDetail(view: ViewCharactersProtocol, character: MSCharacter) {
        //create module
        DispatchQueue.main.async {
            if let viewController = CharacterDetailRouter.initModule(character: character){
                view.present(viewController, animated: true, completion: nil)
            }
        }
    }
    
}
