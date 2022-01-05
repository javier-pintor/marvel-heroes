//
//  CharacterDetailRouter.swift
//  MarvelHeroes
//
//  Created by Javier Pintor on 4/1/22.
//

import UIKit


class CharacterDetailRouter: RouterCharacterDetailProtocol {
    
    static func initModule(character: MSCharacter) -> UIViewController? {
        
        if let viewController = UIStoryboard(name: "CharacterDetailsViewController", bundle: Bundle.main).instantiateViewController(withIdentifier: "\(CharacterDetailsViewController.self)") as? CharacterDetailsViewController{
            
            let interactor = CharacterDetailInteractor(character: character)
            let router = CharacterDetailRouter()
            let presenter = CharacterDetailPresenter(interactor: interactor, view: viewController, router: router)
            
            viewController.msCharacter = character
            viewController.presenter = presenter
            
            return viewController
        }
        return nil
    }
    

    
    
}
